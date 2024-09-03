program calcularnaturales;
function calcularSucesion(num : word) : word;
var
     i : byte;
     suma : word;
begin

    suma := 0;
    for i := 1 to num  do
      suma := suma + i;
    calcularSucesion := suma;
end;

    var n : word;
begin
    writeln('Ingrese hasta que natural quiere calcular su suma');
    readln(n);
    writeln('La suma hasta ', n,' es ', calcularSucesion(n));

    readln();
end.

