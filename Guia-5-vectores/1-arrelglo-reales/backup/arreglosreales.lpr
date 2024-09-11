program arreglosreales;
type
    vec32 = Array[1..32] of real;
    vec6 = Array[1..6] of real;

procedure inicializarVector(var vec : vec32; lvec : byte);
var i : byte;
begin
    for i:=1 to lvec do
        vec[i] := 0;
end;

function Suma(vec : vec32; lvec : byte) : real;
var
    i : byte;
    acum : real;
begin
    acum := 0;
    for i:=1 to lvec do
    begin
        acum := acum + vec[i];
    end;
    Suma := acum;
end;

procedure maxMin (vec : vec32; lvec : byte; var max, min : real);
    var i : byte;
begin
    max := vec[1];
    min := vec[1];

    for i:=1 to lvec do
    begin
        if vec[i] > max then
            max := vec[i]
        else
            if vec[i] < min then
                min := vec[i];
    end;
end;

procedure permutarVector(vec1: Vec32; lvec1 : byte; var vec2 : Vec32; var lvec2 :byte);
var i : byte;
begin
    for i:=1 to lvec1 do
    begin
        vec2[i] := vec1[lvec1 - i + 1];
    end;
    lvec2 := lvec1;
end;

const
    vecInicial : Vec6 = (1,502.3,33.22,0.0308,10,12);
    lvecInicial = 6;
var
    vecA, vecB : vec32;
    lvecB : byte;
    i : byte;
    max, min : real;
begin
    inicializarVector(vecA, 32);
    inicializarVector(vecB, 32);
    max := 0;
    min := 0;

    // a)
    for i:=1 to lvecInicial do
        vecA[i] := vecInicial[i];
    writeln('La suma del vecA es: ', suma(vecA, lvecInicial):0:2);

    // b)
    for i:=1 to lvecInicial div 2 do
    begin
        writeln(vecA[i * 2]:0:2);
    end;

    // c)
    maxMin(vecA, lvecInicial,max,min);
    writeln('El maximo es ',max:0:2,' y el minimo es ', min:0:2);

    // d)
    permutarVector(vecA, lvecInicial, vecB, lvecB);
    writeln('El arreglo B tiene', lvecB,' elementos');
    writeln('Sus elementos son:');
    for i:=1 to lvecB do
        writeln(vecB[i]:0:2);
    for i:=1 to lvecB do
        writeln(vecB[i]:8:2);


    readln();
end.

{
 Ej 1) Dado un arreglo A de N elementos reales, desarrollar subprogramas para:
a) Calcular la suma de sus elementos.
b) Mostrar los elementos que se encuentran en posiciones pares.
c) Calcular el máximo y el mínimo elemento.
d) Generar un arreglo B con los elementos de A permutado ( B[1]=A[N], B[2]=A[N-1] … B[N]=A[1] ).
Escribir el programa principal con las invocaciones a cada uno de los subprogramas, mostrando los
resultados correspondientes
}
