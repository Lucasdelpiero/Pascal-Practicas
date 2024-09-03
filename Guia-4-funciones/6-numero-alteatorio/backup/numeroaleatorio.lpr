program numeroaleatorio;
function aleatorio(limInf, limSup : integer) : integer ;
var aux, diferencia : integer;
begin
  diferencia := abs(abs(limSup) - abs(limInf));

  aux := limInf + limSup;
  aux:= aux + 4 * limSup + 3 * limInf;

  while aux > diferencia do
    aux := aux - diferencia;
  while aux < -diferencia do
    aux := aux + diferencia;

  aleatorio := aux;


end;


    var limInf, limSup : integer;
begin
    writeln('Vamos a buscar un numero aleatorio');
    writeln('Ingrese el limite inferior y luego el superior');
    readln(limInf, limSup);
    writeln('Numero aleatorio: ',aleatorio(limInf, limSup));

    readln();
end.
{
 Ej 6) Desarrollar una función que devuelva un número aleatorio en un rango [A, B] con A<B ingresados
por teclado. Nota: usar la función Random y Randomize.
}

