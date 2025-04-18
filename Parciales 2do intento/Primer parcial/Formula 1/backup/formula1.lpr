program formula1;
const
    MAX = 32;
type
    st16 = string[16];
    vs = array[1..MAX] of st16;
    vb = array[1..MAX] of byte;
    vr = array[1..MAX] of real;

procedure iniVb(var vec: vb; vn: byte);
var i: byte;
begin
    for i:= 1 to vn do
        vec[i] := 0;
end;

procedure iniVr(var vec: vr; vn: byte);
var i: byte;
begin
    for i:=1 to vn do
        vec[i] := 0;
end;

procedure iniVs(var vec: vs; vn: byte);
var i: byte;
begin
    for i:=1 to vn do
        vec[i] := '';
end;

function buscarNom(nombre: st16; vNom: vs; vN: byte): byte;
var
    i: byte;
begin
    i:= 1;
    while (i < vn) and (nombre <> vNom[i]) do
        i:= i + 1;

    if nombre = vNom[i] then
        buscarNom := i
    else
        buscarNom := 0;
end;

procedure leerArchivo(var vNom: vs; var vEsc, vVueltas: vb; var vProm: vr; var vn: byte);
var
    arch: text;
    i, pos, esc: byte;
    nom: st16;
    tiempo: real;

begin
    iniVs(vNom, MAX); iniVr(vProm, MAX); iniVb(vEsc, MAX); iniVb(vVueltas, MAX);
    vn := 0;

    assign(arch,'datos.txt'); reset(arch);
    while not eof(arch) do
    begin
        readln(arch, nom, esc, tiempo);
        pos := buscarNom(nom, vNom, vn);
        if pos <> 0 then
        begin
            vProm[pos] := vProm[pos] + tiempo;
            vVueltas[pos] := vVueltas[pos] + 1;
        end
        else
            begin
                vn := vn + 1;
                vNom[vn] := nom;
                vEsc[vn] := esc;
                vProm[vn] := tiempo;
                vVueltas[vn] := 1;
            end;
    end;

    for i:=1 to vn do
        vProm[i] := vProm[i] / vVueltas[i];

    close(arch);
end;

procedure informeVueltas(vEsc, vVueltas: vb; vn: byte);
var
    i: byte;
    vAux: vB;
begin
    iniVb(vAux, vn); // Sin esto da error
    for i:= 1 to vn do
        vAux[vEsc[i]] := vAux[vEsc[i]] + vVueltas[i];

    for i:= 1 to 4 do
    begin
        case i of
        1: write('Mercedes: ');
        2: write('McLaren: ');
        3: write('Ferrari: ');
        4: write('Williams: ');
        end;
        write(vAux[i],'   ');
    end;
    writeln();

end;

function primP(vNom: vs; vProm: vr; vVueltas: vb; vn: byte):st16;
var
    i, masRap: byte;
    menorT: real;
begin
    masRap:= 1;
    menorT:= vProm[1];

    for i:=2 to vn do
    begin
        if (vProm[i] < menorT) or ((vProm[i] = menorT) and (vVueltas[i] > vVueltas[masRap])) then
        begin
            masRap:= i;
            menorT:= vProm[i];
        end;
    end;

    primP:= vNom[masRap];

end;

function menorAx(esc: byte; x: real; vEsc: vb; vProm: vr; vn: byte): boolean;
var i: byte;
    cumple: boolean;

begin
    cumple:= true;
    i:= 1;

    while (i < vn) and cumple do
    begin
        if (esc = vEsc[i]) and (vProm[i] > x) then
            cumple:= false;
        i:= i + 1;
    end;

    menorAx:= cumple;
end;

procedure informeMenorAx(vEsc: vb; vProm: vr; vn: byte);
var
    x: real;
    esc: byte;
begin
    writeln('Ingrese tiempo a no superar (T) y escuderia (E)');
    readln(x, esc);
    writeln(menorAx(esc,x,vEsc,vProm,vN));
end;

var
    vNom: vs;
    vEsc, vVueltas: vb;
    vProm: vr;
    vn: byte;

begin
    leerArchivo(vNom, vEsc, vVueltas, vProm, vn);
    informeVueltas(vEsc, vVueltas, vn);
    writeln('El mas rapido es: ', primP(vNom, vProm, vVueltas, vn));
    informeMenorAx(vEsc, vProm, vn);

    readln();
end.

