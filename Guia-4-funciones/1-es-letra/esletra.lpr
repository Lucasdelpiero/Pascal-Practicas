program esUnletra;
function esLetra(letra : char) : boolean ;
begin
    letra := upcase(letra);
    if (letra in ['A'..'Z']) then
        esLetra := true
    else
      esLetra := false;

end;
    var
        car : char;

begin
    writeln('Ingrese un caracter para ver si es letra o no');
    readln(car);

    if esLetra(car) then
        writeln(car, ' es una letra')
    else
        writeln(car, ' no es una letra');

    readln();
end.

{
 Ej 1) Desarrollar una función booleana que dado un caracter diga si es letra o no.
}
