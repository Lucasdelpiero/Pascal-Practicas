program cifras;
    var
        numero : longint;
        texto : string;

begin
    writeln('Ingrese un numero:');
    readln(numero);
    writeln('a: ', numero div 1000);
    writeln('b: ', (numero mod 1000)div 100);

    readln();
end.

