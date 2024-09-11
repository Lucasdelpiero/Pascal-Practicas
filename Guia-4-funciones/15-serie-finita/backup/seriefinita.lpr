program seriefinita;
type
    tfunc = function(n : byte) : real;


function f1(n : byte) : real;
begin
    f1 :=  (1 / (n * n) );
end;

// Halla la potencia de tal numero (para la funcion 2)
function pow(num: real; exp: byte) : real;
var
    i : byte;
    acum : real;
begin
    acum := num;
    if exp = 0 then
        pow := 1
    else
        begin
        for i:=2 to exp  do
            acum := num * acum;
        pow := acum;
        end;
end;

function f2(n : byte) : real;
begin
    f2 :=  (1 /  pow(2,n - 1) );
end;

// Halla el factorial de tal numero (para la funcion 3)
function fact(n : byte) : real;
begin
    if n = 1 then
        fact := 1
    else
        fact := n * fact(n - 1);
end;

function f3(n : byte) : real;
begin
    f3 :=  1 / fact(n) ;
end;

procedure calculo(N : byte; var res : real; f : tfunc);
var
    i : byte;
    acum : real;
begin
    acum := 0;
    for i:=1 to n do
    begin
        acum := acum + f(i)
    end;
    res := acum;
end;

var
    termino : byte;
    resultado : real;
    menu : byte;
    funcUsar : tfunc;
begin
    writeln('Hasta que termino desea calcular?');
    readln(termino);
    writeln('RES1 = 1 + 1/4 + 1/9 +...+1/ n^2');
    writeln('RES2 = 1 + 1/2 + 1/4 +...+ 1/ 2 ^(n-1)');
    writeln('RES3 = 1 + 1/2! + 1/3! +...+ 1/ n! ');
    writeln('Que funcion desea usar (1,2,3)');
    readln(menu);
    case menu of
        1: funcUsar := @F1;
        2: funcUsar := @F2;
        3: funcUsar := @F3;
        else funcUsar := @F1;
    end;
    calculo(termino, resultado, funcUsar);
    writeln('El resultado es', resultado:8:2);

    readln();
end.
{
 Ej 15) Desarrollar un procedimiento y los tipos necesarios para el cálculo de una serie finita. Los
parámetros serán:
N = cantidad de términos a sumar, con N>0
RES = resultado
F = función para calcular cada uno de los términos de la serie
El procedimiento calculará: RES = F(1) + F(2) + F(3) +...+ F(n)
y se pide utilizarlo para evaluar por medio de un menú
RES1 = 1 + 1/4 + 1/9 +...+1/ n^2
RES2 = 1 + 1/2 + 1/4 +...+ 1/ 2^(n-1)
RES3 = 1 + 1/2! + 1/3! +...+ 1/ n!
Resolver utilizando el tipo función. ¿Cómo cambiaría F por P de tipo procedimiento?
}

