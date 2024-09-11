program maximocomundenominador;

function mcd(num1, num2 : integer) : byte;
var
    i : byte;
    max : integer;
    res : byte;
begin
    res := 1;
    max := abs(num1);
    if abs(num2) > max then
        max := abs(num2);

    for i:=1 to max do
    begin
        if (num1 MOD i = 0) and (num2 MOD i = 0)then
            res := i;
    end;
    mcd := res;
end;

var
    num1, num2 : integer;
begin
    repeat
        writeln('De que numeros quiere hallar el maximo comun divisor? (doble cero para salir)');
        writeln('Ingrese el numero 1:');
        readln(num1);
        writeln('Ingrese el numero 2:');
        readln(num2);
        writeln('El mcd entre', num1,' y ',num2,' es ', mcd(num1, num2));

    until (num1 = 0) and (num2 = 0);
end.

{
 Ej 18) Desarrollar la Función MCD que devuelve el máximo común divisor entre dos números
}
