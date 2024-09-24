program javalina;
type
    st16 = String[16];
    vLan = Array[1..32] of word;
    vNom = Array[1..32] of st16;

procedure writeVec(vecN : vNom; vecPrim, vecSeg : vLan ; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
    begin
        write(vecN[i],' ', vecPrim[i], ' ', vecSeg[i]);
        writeln();
    end;
end;

procedure writeVecN(vecN : vNom; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
    begin
        write(vecN[i]);
        if i < vL then
            write(', ');
    end;
    writeln();
end;

procedure leerArchivo(var vecNom : vNom; var vecPrim, vecSeg : vLan; var vL : byte);
var
    arch : text;
    i : byte;
    nombre : st16;
    prim, seg : word;
begin
    assign(arch, 'text.txt');
    reset(arch);
    i := 0;
    while not eof(arch) do
    begin
        i := i + 1;
        readln(arch, nombre);
        readln(arch, prim);
        readln(arch, seg);
        vecNom[i] := nombre;
        vecPrim[i] := prim;
        vecSeg[i] := seg;
    end;
    vl := i;
    close(arch);
end;
// a)
function superaron(vecPrim , vecSeg : vLan; vL : byte) : byte;
var i, total : byte;
begin
    total := 0;
    for i:=1 to vL do
    if vecSeg[i] > vecPrim[i] then
        total := total + 1;
    superaron := total;
end;

// b)
function mejorMarca(vecNom : vNom ;vecPrim, vecSeg : vLan; vL : byte) : st16;
var i : byte;
    mejor : st16;
    mPuntaje : word;
begin
    mPuntaje := 0;
    mejor := '';
    for i:=1 to vL do
    begin
        if vecPrim[i] > mPuntaje then
        begin
            mPuntaje := vecPrim[i];
            mejor := vecNom[i];
        end;
        if vecSeg[i] > mPuntaje then
        begin
            mPuntaje := vecSeg[i];
            mejor := vecNom[i];
        end;
    end;
    mejorMarca := mejor;
end;

// c)
procedure infoMarca(nombre : st16 ;vecNom : vNom; vecPrim, vecSeg : vLan; vL : byte);
var i : byte;
begin
    i := 1;
    while (i < vL) and (vecNom[i] <> nombre) do
        i := i + 1;
    if vecNom[i] = nombre then
        writeln('c) ',vecNom[i],' ',vecPrim[i],' ', vecSeg[i])
    else
        writeln('c) No se encontro al atleta');
end;

// d)
procedure paseSemis(limiteSemis : word ;vecNom : vNom; vecPrim, vecSeg : vLan; vL : byte;
                        var vecSemNom : vNom;var vecSemL : byte);

var i : byte;
begin
    vecSemL := 0;
    for i:= 1 to vL do
    begin
        if (vecPrim[i] + vecSeg[i]) > limiteSemis then
        begin
            vecSemL := vecSeml + 1;
            vecSemNom[vecSemL] := vecNom[i]
        end;
    end;

end;

var

    nombre : st16;
    limiteSemis : word;
    vecPrim, vecSeg : vLan;
    vecNom , vecSemNom: vNom;
    vecL, vecSemL: byte;
begin
    leerArchivo(vecNom, vecPrim, vecSeg, vecL);
    writeVec(vecNom, vecPrim, vecSeg, vecL);
    writeln('================================================================================');
    writeln('a) ',superaron(vecPrim, vecSeg, vecL), ' atletas superaron su primer lanzamiento');
    writeln('b) El de mejor marca fue ', mejorMarca(VecNom, vecPrim, vecSeg, vecL));
    repeat
        writeln('c) Ingrese el nombre del atleta a saber la marca o presione "0" para salir');
        readln(nombre);
        if nombre <> '0'  then
            infoMarca(nombre, vecNom, vecPrim, vecSeg, vecL);
    until nombre = '0' ;
    writeln('d) Ingrese valor a superar sumando ambos lanzamientos para pasar a semis');
    readln(limiteSemis);
    paseSemis(limiteSemis, vecNom, vecPrim, vecSeg, vecL, vecSemNom, vecSemL);
    writeln('d) Todos los participantes son: ');
    writeVecN(vecNom, vecL);
    writeln('d) En semis estan:');
    writeVecN(vecSemNom, vecSemL);

    readln();
end.
{
[Carlos, Juan, Yia]    N
[20, 30, 40,50,60,40]   N*2 - 1 Y N*2
}

{
Ej 11) De una competencia de atletismo se tienen los siguientes datos del lanzamiento de jabalina:
• Nombre del competidor (ordenado ascendentemente por este dato)
• 1º lanzamiento
• 2º lanzamiento
Se pide:
a) Cuántos competidores superaron con el 2º lanzamiento el 1º.
b) Nombre del atleta que registró la mejor marca.
c) Dado el Nombre de un atleta, informar la marca que realizó en ambos lanzamientos.
d) Generar un nuevo arreglo con los participantes que pasaron a la semifinal (aquellos que superaron
una marca X establecida en el 1º ó 2º lanzamiento). Mostrar ambos arreglos.
}
