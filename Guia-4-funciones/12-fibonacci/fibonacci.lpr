program fibonacci;

function fibo(n : byte) : integer;
var
    num1, num2, ultimoNum : integer;
    i : byte;
begin
    num1 := 1;
    num2 := 1;
    ultimoNum := 0;

    if (n < 3) then
        ultimoNum := 1
    else
        begin
            for i:=3 to n  do
            begin
                ultimoNum := num1 + num2;
                num1 := num2;
                num2 := ultimoNum;
            end;
            fibo := ultimoNum;

        end;
    fibo := ultimoNum;



end;

procedure principal();
var
    n : byte;
begin

    repeat
        writeln('Ingrese el termino de fibonacci que desea saber o ingrese el numero "cero" para finalizar el programa');
        readln(n);
        writeln('El numero de fibonacci del termino ', n,' es: ',fibo(n))

    until n = 0;

    writeln('================================');
    writeln('= Gracias por usar el programa =');
    writeln('================================');


end;

begin
    principal();

    readln();
end.

{
 Ej 12) Los dos primeros términos de la sucesión de Fibonacci valen 1, y los demás se hallan sumando los
dos anteriores: 1, 1, 2, 3, 5, 8,13, 21…
Desarrolle un programa que lea N cotas enteras positivas, y para cada una de ellas genere y muestre los
términos de la sucesión hasta superar la cota dada.
}
