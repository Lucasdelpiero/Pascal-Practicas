program numeromayor;
    var
      num1, num2, num3 : integer;


begin
    writeln('Ingrese el num 1');
    readln(num1);
    writeln('Ingrese el num 2');
    readln(num2);
    writeln('Ingrese el num 3');
    readln(num3);

    // a) Expresiones secuenciales
    if ( num1 > num2) and (num1 > num3) then
        writeln(num1,' es el mayor');

    if (num2 > num1) and (num2 > num3) then
        writeln(num2,' es el mayor');

    if (num3 > num1) and (num3 > num2) then
        writeln(num3,' es el mayor');

    // b) Expresiones compuestas y anidadas
     if ( num1 > num2) and (num1 > num3) then
        writeln(num1,' es el mayor')
     else
        if (num2 > num1) and (num2 > num3) then
            writeln(num2,' es el mayor')
     else
        writeln(num3,' es el mayor');

     // c) Expresiones simples y anidadas
     if (num1 > num2) then
         begin
            if (num1 > num3) then
                writeln(num1,' es el mayor')
            else
               writeln(num3,' es el mayor');
         end
     else
        if (num2 > num1) then
            begin
                if (num2 > num3) then
                    writeln(num2,' es el mayor')
                else
                    writeln(num3,' es el mayor');
            end
     else
        writeln(num3,' es el mayor');




     readln();
end.


{
Ej 5) Dados tres números enteros mostrar el mayor de ellos. Plantear tres soluciones:
a) Alternativas secuenciales
b) Alternativas anidadas con expresiones lógicas compuestas
c) Alternativas anidadas con expresiones lógicas simples
}

