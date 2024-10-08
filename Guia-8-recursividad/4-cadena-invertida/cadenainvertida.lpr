program cadenainvertida;
type
    st = string[16];

function carInvertidos(cad : st; num : byte) : st ;

begin
    if num = 1 then
        carInvertidos := cad[1]
    else
        carInvertidos := cad[num] + carInvertidos(cad, num - 1);
end;

function invertir(cad : st) : st;
var tam : byte;
begin
    tam := length(cad);
    invertir := carInvertidos(cad, tam)
end;


var
    cad : st;
begin
    writeln(invertir('animal'));

    readln();
end.
{
 Ej 4) Escribir un subprograma recursivo que retorne una cadena de caracteres
recibida como parametro con su contenido invertido.
Ejemplo: ‘lamina’ -> ‘animal’
}
