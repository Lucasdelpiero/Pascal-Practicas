program ordenarsimple;
    var
        a, b, c, aux : char;
        algo : char;

begin
    writeln('Ingrese la letra de las 3 variables: a, b, c');
    readln(a);
    readln(b);
    readln(c);

    // A primero
    if((a < b)) then
        if (a < c) then  // a es el primero
            if (b < c) then                            // a < b < c
                writeln('Ya estaban ordenados')
            else                                       // a < c < b
                begin
                    aux := b;
                    b := c;
                    c := aux;
                end
        else        // ( c < a < b)
            begin
                aux := a;
                a := c;
                c := b;
                b := a;
            end
    else   //  a no es primero
        if (b < c) then //  b < a < c   o   b < c < a
            if (a < c) then  // b < a < c
                begin
                    aux := a;
                    a := b;
                    b := aux;
                end
            else        // b < c < a
                begin
                    aux := a;
                    a := b;
                    b := c;
                    c := aux;
                end
        else // c es primero (ya que ni a ni b es primero)
            if(a < b ) then //  c < a < b
                begin
                    aux := a;
                    a := c;
                    c := b;
                    b := aux;
                end
            else // c < b < a
                begin
                    aux := a;
                    a := c;
                    c := aux;
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

