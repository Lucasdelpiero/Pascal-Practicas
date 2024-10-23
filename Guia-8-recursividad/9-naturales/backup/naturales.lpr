program naturales;

function crec(x: word) : word;
var val,ant: word;
begin
    // Me quedo con el ultimo digito
    if x > 10 then
        val := x mod 10
    else
        val := x;
    // A la funcion llamo de nuevo quitandole el ultimo digito
    if x > 10 then
        ant := crec(x div 10)
    else
        ant := val;

    // Comparo con el digito anterior y si el anterior no es menor devuelve cero
    // Cero significa "desordenado" y si hay 1 desordenado, se considera desordenado
    if (ant <= val) and (ant <> 0) then
        crec := val
    else
        crec := 0;
end;

function esCreciente(x: word): boolean;
var valor: word;
begin
    valor := crec(x);
    if valor <> 0 then
        esCreciente := true
    else
        esCreciente := false
end;

var x, num : word;
begin
    repeat
        writeln('Ingrese X o un cero para salir');
        readln(x);
        if x <> 0 then
        begin
            if esCreciente(x) then
                writeln(x,' esta ordenado de forma creciente')
            else
                writeln(x, ' NO esta ordenado de forma creciente');
        end;
    until x = 0;

    readln();
end.
{
    Primero hay que desarmar los numeros en sus decenas
    Segundo hay que poder comparar todos para que asi pueda hacer algo
}

{
 Ej 9) Implementar un procedimiento o función recursiva que determine si los dígitos
 de un número natural están dispuestos de forma creciente, esto es,
si N = dm dm-1 …..d2 d1 y para todo i: 1 <= i <= m, verifica que d i >= d i+1
}
