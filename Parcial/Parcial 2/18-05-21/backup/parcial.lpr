program parcial;
type
    st3 = string[3];
    tLanz = array[1..10] of real;
    tComp = record
        cod : st3;
        intentos : tLanz;
        cantintentos : byte;
    end;
    tLista = Array[1..30] of tComp;
    tVecSM = Array[1..30] of st3;

function masLanz(lista: tLista; nLista: byte): byte; // error devuelve cant intentos en vez de pos
var pos : byte;   // error aca
begin
    if nLista = 1 then
        pos := lista[1].cantIntentos
    else
        pos := masLanz(lista, nLista - 1);

    if lista[pos].cantIntentos > lista[nLista].cantIntentos then
        masLanz := pos
    else
        masLanz := nLista;
end;

function suma(lanz: tLanz; n: byte): real;
begin
    if n = 0 then
        suma := 0
    else
        suma := lanz[n] + suma(lanz, n - 1);
end;

function promDist(comp: tComp): real;
var total : real;
begin
    total := suma(comp.intentos, comp.cantIntentos);
    promDist := total / comp.cantIntentos;
end;

function promMayClanz(lista: tLista; nLista: byte) : real;
var indice : byte;
begin
    indice := masLanz(lista, nLista);
    promMayClanz := promDist(lista[indice]);
end;

function menorDistPos(lista: tLista; nLista : byte) : byte;
var i , pos : byte;
    minDist : real;
begin
    minDist := lista[1].intentos[1];
    pos := 1;
    for i:= 2 to nLista do
    begin
        if lista[i].intentos[1] < minDist then
        begin
            pos := i;
            minDist := lista[i].intentos[1];
        end;
    end;

    menorDistPos := pos;
end;

function pos(cod: st3; lista: tLista; nLista: byte): byte;
var i : byte;
begin
    i := 1; // error aca
    while(i < nLista) and (cod <> lista[i].cod) do
        i := i + 1;
    if cod = lista[i].cod then
        pos := i
    else
        pos := 0;
end;

procedure insertar(cod: st3; dist:real; var lista: tLista; var nLista: byte);
var indice : byte;
begin
    indice := pos(cod, lista, nLista);
    if indice = 0 then
    begin
        nLista := nLista + 1;
        lista[nLista].cod := cod;
        lista[nLista].intentos[1]:= dist;
        lista[nLista].cantIntentos := 1;   // error aca
    end
    else
        begin
            lista[indice].cantIntentos := lista[indice].cantIntentos + 1; // error aca
            lista[indice].intentos[lista[indice].cantIntentos] := dist;  // error aca
        end;
end;

procedure leerArchivo(var lista: tLista; var nLista: byte);
var arch : text;
    cod : st3;
    dist : real;
begin
    assign(arch, 'text.txt'); reset(arch);
    nLista := 0;
    while not eof(arch) do
    begin
        readln(arch, cod, dist);
        insertar(cod, dist, lista, nLista);
    end;
    close(arch);
end;

procedure genVec(var vec : tVecSM; var nVec: byte; lista: tLista; nLista: byte; x: real);
var i, j: byte;
begin
    nVec := 0;
    for i:=1 to nLista do
    begin
        j := 1;
        while (j < lista[i].cantIntentos) and (x > lista[i].intentos[j]) do
            j := j + 1;
        if lista[i].intentos[j] > x then      // mal aca
        begin
            nVec := nVec + 1;
            vec[nVec] := lista[i].cod;
        end;
    end;
end;

procedure mostrarVec(vec: tVecSM; n: byte);
begin
    if n > 1 then
        mostrarVec(vec, n - 1);
    writeln(vec[n]); // Falta esto en los num reales
end;

var
    lista : tLista;
    nLista, menorPos, nVec : byte;
    x : real;
    vecSupM : TvecSM;

begin
    leerArchivo(lista, nLista);
    writeln('Promedio: ', promMayClanz(lista,nLista):0:2); // Falta limitar decimales en reales
    menorPos := menorDistPos(lista, nLista);
    // error al llamar a pos en vez de a menorPos
    // Falta limitar los decimales en el numero real
    writeln(lista[menorPos].cod,' obtuvo ',lista[menorPos].intentos[1]:0:2,' en el primer lanzamiento');
    writeln('Ingrese x a superar');
    readln(x);
    genVec(vecSupM, nVec, lista, nLista, x);
    mostrarVec(vecSupM, nvec);

    readln();
end.

