program parcial;
type
    st3 = string[3];
    st12 = string[12];
    persona = record
        apellido : st12;
        cat : st3;
        cant : byte;
        prop : char;
    end;
    tMat = array[1..32, 1..6] of persona;
    tCod = Array[1..3] of st3;
    tPrecio = array[1..3] of real;
    tNoProp = record
        apellido : st12;
        piso : byte;
    end;
    TVnoProp = array[1..32] of tNoProp;

function cantOcup(edi: tMat; piso, j: byte): byte;
var val: byte;
begin
    if j = 0 then
        val := 0
    else
        if edi[piso, j].cant <> 0 then
            val := 1 + cantOcup(edi, piso, j - 1)
        else
            val := 0 + cantOcup(edi, piso, j - 1);
    cantOcup := val;
end;

function cantPisos(edi: tMat; pisos, dep: byte) : byte;
var total : byte;
begin
    if pisos <> 1 then
        total := cantOcup(edi, pisos, dep) + cantOcup(edi, pisos - 1, dep);
    cantPisos := total;
end;

function cantProp(categ: st3; edi: tMat; piso, i, dep, j: byte): byte;
var val, pertenece: byte;
begin
    if edi[i,j].cat = categ then
        pertenece := 1
    else
        pertenece := 0;

    if i <> 1 then
    begin
        if j <> 1 then
            val := pertenece + cantProp(categ, edi, piso, i, dep, j - 1)
        else
            val := pertenece + cantProp(categ, edi, piso, i - 1, dep, dep);
    end
    else
        if j <> 1 then
            val := pertenece + cantProp(categ, edi, piso, i , dep , j - 1)
        else
            val := pertenece;
    cantProp := val;
end;

function buscarCat(categ: st3; vCod: tCod; nCateg: byte): byte;
var i: byte;
begin
    i := 1;
    while (i < nCateg) and (vCod[i] <> categ) do
        i := i + 1;
    if vCod[i] = categ then
        buscarCat := i;
end;

function precio(categ: st3; cant: byte; vCod: tCod; vPrecio: tPrecio; nCateg: byte) : real;
var pos : byte;
begin
    pos := buscarCat(categ, vCod, nCateg);
    precio := 0.9 * vPrecio[pos] * cant;
end;

function totalAbonar(categ: st3; edi: tMat; piso, dep: byte;
                        vCod: tCod; vPrecio: tPrecio; nCateg: byte) : real;
var cant: byte;
begin
    cant := cantProp(categ, edi, piso, piso, dep, dep);
    totalAbonar := precio(categ, cant, vCod, vPrecio, nCateg);
end;

procedure leerArchivo(var edi: tMat; var pisos: byte);
var arch : text;
    piso, dep: byte;
    car : char;
begin
    assign(arch, 'ocupantes.txt'); reset(arch);
    readln(arch, pisos);
    while not eof(arch) do
    begin
        read(arch, piso, dep);
        with edi[pisos, dep] do
        begin
            read(arch, apellido);
            read(arch, car);
            while car = ' ' do
                read(arch, car);
            readln(arch, cat, cant, prop);
            cat := car + cat;
            //readln(arch, apellido, cat, cant, prop);
        end;
    end;
    close(arch);
end;

procedure leerCateg(var vCod: Tcod; var vPrecio : Tprecio; var nCateg: byte);
var arch: text;
begin
    assign(arch,'categorias.txt'); reset(arch);
    while not eof(arch) do
    begin
        nCateg := nCateg + 1;
        readln(arch, vCod[nCateg], vPrecio[nCateg]);
    end;
    close(arch);
end;

procedure genVnoProp(dep: byte; var vec: TVnoProp; var n: byte;
                        edi: tMat; pisos: byte);
var i, j: byte;
begin
    n := 0;
    for i:=1 to pisos do
    begin
        if edi[i, dep].prop = 'N' then
        begin
            n := n + 1;
            vec[n].apellido := edi[i, dep].apellido;
            vec[n]. piso := i;
        end;
    end;
end;

procedure writeVec(vec: TVnoProp; n: byte);
var i: byte;
begin
    for i:=1 to n do
        writeln('(', vec[i].apellido,',',vec[i].piso,')');
end;

var
  edi : tMat;
  pisos, dep, nCateg: byte;
  vCod : Tcod;
  vPrecio : Tprecio;
  x : byte;
  vNoProp : TVnoProp;
  nNoProp : byte;
  categ : st3;

begin
    leerArchivo(edi, pisos);
    writeln(cantPisos(edi,pisos,dep),' pisos');
    writeln('Ingrese categ a buscar cuanto pagan (PRE/STD/ECO');
    readln(categ);
    leerCateg(vCod, vPrecio, nCateg);
    writeln(totalAbonar(categ, edi, pisos, dep, vCod, vPrecio, nCateg));
    writeln('Ingrese numero de dpto para buscar a los no duenios');
    readln(x);
    genVnoProp(x, vNoProp, nNoprop, edi, pisos);
    writeVec(vNoProp, nNoProp);
end.

