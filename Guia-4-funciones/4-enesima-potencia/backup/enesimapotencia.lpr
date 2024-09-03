program enesimapotencia;
function potencia(numero, pot : word) : word;
var acum : word;
    i : byte;
begin
    acum := 1;
    for i:=1 to pot do
        acum := acum * numero;
    potencia := acum;
end;

    var num, pot : word;

begin
    writeln('Ingrese el numero y la potencia que desea calcular');
    readln(num, potencia);
    writeln(num, '^', pot,' = ', potencia(num, pot));
    readln();
end.
{
 Ej 4) Desarrollar una función que calcule la potencia n-ésima de un número X ( Xn ).
}

