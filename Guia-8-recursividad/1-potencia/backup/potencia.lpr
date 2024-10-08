program potenciaenesima;

function potencia(x, n: integer): real;
begin
    if n = 1 then
        potencia := x
    else
        if n > 1 then
            potencia := x * potencia(x, n - 1)
    else
        if n < -1 then
            potencia := (1 / x) * potencia(x, n + 1)
    else
        if n = -1 then
            potencia := (1 / x)
    else
        potencia := 0;
end;

begin
    writeln(potencia(64,-2):0:16);

    readln();
end.

{
 Ej 1) La siguiente función calcula la potencia n-ésima de un número X ( X n )
en forma iterativa, siendo n y X enteros. Se pide:
a) Desarrollarla en forma recursiva.
b) Considerar n negativo.
function potencia(X,n: integer): integer; (* X elevado a n *)
var
    i: integer;
    mult: integer;
begin
    mult := 1; (* inicialización *)
    for i := 1 to n do
        mult := mult * X; (* hacemos "n" veces "X*X" *)
    potencia := mult;
end;
}
