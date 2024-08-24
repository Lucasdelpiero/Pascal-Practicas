program ordenarsecu;
    var
        a, b, c, aux : char;
        algo : char;

begin
    writeln('Ingrese la letra de las 3 variables: a, b, c');
    readln(a);
    readln(b);
    readln(c);

    // Compara los primero 2      (A la derecha un hipotetico peor caso)
    if (b < a) then         // c < b < a
        begin
            aux := a;
            a := b;
            b := aux;       // b < c < a
        end;

    // Compara los ultimos 2
    if (c < b) then         // b < c < a
        begin
            aux := b;
            b := c;
            c := aux;       // b < a < b
        end;

    // Compara los primeros 2 una vez mas
    if (b < a) then         // b < a < b
        begin
            aux := a;
            a := b;
            b := aux;       // a < b < c
        end;

    writeln('Ordenadas: ', a, ',', b, ',', c);
    readln();
end.

