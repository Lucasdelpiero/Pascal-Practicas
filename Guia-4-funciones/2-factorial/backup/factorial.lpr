program factorial;
function fact(numero : word) : word;
begin
    if numero = 1 then
        fact :=  1
    else
      fact :=  numero * fact(numero - 1);
end;

    var
        num : word;

begin
    writeln('Ingrese el numero a calcular su factorial');
    readln(num);
    writeln('El factorial de ', num, ' es ', fact(num));

    readln();

end.

