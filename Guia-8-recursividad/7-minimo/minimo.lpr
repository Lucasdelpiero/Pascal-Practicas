program minimo;
type
    m3 = Array[1..3,1..3] of real;
const
    matriz : m3 = ((1,3,5),(1,5,6),(17,-6,3));

function minimo(m: m3; cF, cA, fF, fA: byte; min : real) : real;
var val: real;
begin
    val := m[fA, cA];
    if val < min then
        min := val;
    if cA - 1 < 1 then
        if fA - 1 < 1 then
            minimo := min
        else
               minimo := minimo(m, cF, cF, fF, fA - 1, min)
    else
       minimo := minimo(m, cF, cA - 1, fF, fA, min);
end;

function hallarMin(m:m3; f,c: byte): real;
begin
    hallarMin := minimo(m, f, f, c, c, 999999);
end;

var m : m3;
    res : real;
begin
    m := matriz;
    res := hallarMin(m,3,3);
    writeln('El minimo es: ', res:0:2);

    readln();
end.

{
 Ej 7) Crear una función recursiva que busque el elemento mínimo de una matriz cuadrada.
}

