program ordenarsecu;
    var
        a, b, c, aux : char;
        algo : char;

begin
    writeln('Ingrese la letra de las 3 variables: a, b, c');
    readln(a);
    readln(b);
    readln(c);

    if (b < a) then         // c < b < a
        begin
            aux := a;
            a := b;
            b := aux;       // b < c < a
        end;


    if (c < b) then         // b < c < a
        begin
            aux := b;
            b := c;
            c := aux;       // b < a < b
        end;


    if (b < a) then         // b < a < b
        begin
            aux := a;
            a := b;
            b := aux;       // a < b < c
        end;

    writeln('Ordenadas: ', a, ',', b, ',', c);
    readln();
end.


{
 Ej 6) Dadas tres letras mostrarlas ordenadas en forma ascendente. Plantear tres soluciones:
a) Alternativas secuenciales
b) Alternativas anidadas con expresiones lógicas compuestas
c) Alternativas anidadas con expresiones lógicas simples
}

{
// A primero
if((a < b) and (a < c)) then
    if (b < c) then
        writeln('Ya estaban ordenados')
    else
        begin
            aux := b;
            b := c;
            c := aux;
        end;
// B primero
if ((b < a) and (b < c)) then
    if (a < c) then              // b < a < c
        begin
            aux := a;
            a := b;
            b := aux;
        end
    else                        // b < c < a
        begin
            aux := a;
            a := b;
            b := c;
            c := aux;
        end;


// C primero
if ((c < a) and (c < b)) then
    if (a < b) then              // c < a < b
        begin
            aux := a;
            a := c;
            c := b;
            b := aux;

        end
    else                        // c < b < a
        begin
            aux := a;
            a := c;
            c := aux;
        end;


writeln('Ordenadas: ', a, ',', b, ',', c);
readln();

end.
}
