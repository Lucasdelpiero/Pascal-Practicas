program simplificacion;

function mcd(num1, num2 : integer) : integer;
var
    i : word;
    max : word;
    res : word;
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

procedure simplificar(var num : integer;var denom : integer);
var denomComun : integer;
begin
    denomComun := mcd(num, denom);
    num := num  DIV denomComun;
    denom := denom DIV denomComun;
end;

var
    num, denom : integer;
begin
    repeat
        writeln('Que fraccion quiere simplificar (doble uno para salir)');
        writeln('Ingrese el numerador:');
        readln(num);
        writeln('Ingrese el denominador:');
        readln(denom);
        writeln('La fraccion ', num, '/',denom, ' simplificada es:');
        simplificar(num, denom);
        writeln(num,'/', denom);


    until (num = 1) and (denom = 1);
end.

{
 Ej 18) Desarrollar la Función MCD que devuelve el máximo común divisor entre dos números
}
