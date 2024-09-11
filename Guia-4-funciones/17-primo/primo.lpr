program primo;

function esPrimo(num : integer) : boolean;
var resultado : boolean;
begin
    resultado := true;
    if (num <= 3) and (num >= -3) then
        resultado := true
    else
        if (num MOD 2 = 0) or (num MOD 3 = 0) then
            resultado := false;
    esPrimo := resultado;
end;

var
    num : integer;
begin
    repeat
        writeln('Que numero quiere saber si es primo (cero para salir)');
        readln(num);
        if esPrimo(num) then
            writeln(num ,' es primo')
        else
          writeln(num, ' no es primo');

    until num = 0 ;
end.

{
 Ej 17) Mediante una función booleana informar si un número es primo
}
