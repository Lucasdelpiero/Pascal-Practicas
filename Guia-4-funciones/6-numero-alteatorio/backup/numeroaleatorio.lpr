program numeroaleatorio;
function aleatorio(limInf, limSup : integer) : integer ;
var aux, diferencia : integer;
begin
  diferencia := abs(abs(limSup) - abs(limInf));
  aux := random(diferencia + 1);
  aleatorio := aux + limInf;

end;


    var limInf, limSup : integer;
begin
    randomize();
    repeat
    writeln('Vamos a buscar un numero aleatorio');
    writeln('Ingrese el limite inferior y luego el superior');
    readln(limInf, limSup);
    writeln('Numero aleatorio: ',aleatorio(limInf, limSup));
    writeln('ingrese 2 veces cero para salir');
    until (limInf = 0) and (limSup = 0);

    readln();
end.
{
 Ej 6) Desarrollar una función que devuelva un número aleatorio en un rango [A, B] con A<B ingresados
por teclado. Nota: usar la función Random y Randomize.
}

