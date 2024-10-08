program arreglosenteros;
type
    vE = array[1..8] of integer;
const
    vConst : vE = (1,4,8,4,6,9,3,2);

function suma(vec: vE; vl: byte) : integer;
begin
    if vl = 1 then
        suma := vec[1]
    else
        suma := vec[vl] + suma(vec, vl - 1);
end;

procedure ordenInverso(vec: vE; vl: byte);
begin
    if vl = 1 then
        writeln(vec[1])
    else
        begin
            write(vec[vl]',');
            ordenInverso(vec, vl - 1);
        end;
end;

function maximo(vec: vE; vl: byte): integer;
var aux : integer;
begin
    if vl = 1 then
        maximo := vec[1]
    else
    begin
        aux := maximo(vec, vl - 1);
        if aux > vec[vl] then
            maximo := aux
        else
            maximo := vec[vL];
    end;
end;


function promedio(vec: vE; vl: byte): real;
begin
    promedio := suma(vec, vl) / vl;
end;

var
    vec : vE;
    vl: byte;
begin
    vec := vConst;
    vl := 8;
    writeln('Suma: ', suma(vec, vl));
    ordenInverso(vec, vl);
    writeln('Maximo: ', maximo(vec, vl));
    writeln('Promedio: ', promedio(vec, vl):0:2);

    readln();
end.

{
 Ej 5) Sea V un arreglo de enteros, mediante procesos recursivos se pide:
a) Calcular e informar la suma de sus elementos.
b) Mostrar sus elementos.
c) Mostrarlos en orden inverso.
d) Obtener el máximo de sus elementos.
e) Obtener el promedio
}

