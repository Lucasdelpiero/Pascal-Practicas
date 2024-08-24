program monedas;
    var
        moneda : char;
        dinero : real;

    const
        dolar = 120.8;
        euro = 150.1;
        real = 26.5;

begin
    writeln('Que moneda quiere cambiar? (D = dolar, E = euro, R = real)');
    readln(moneda);

    writeln('Cuanto dinero quiere cambiar?');
    readln(dinero);

    if (upcase(moneda) = 'D') then
        writeln('Puede comprar $', (dinero/dolar):0:2, ' dolares')
    else
        if (upcase(moneda) = 'E' ) then
            writeln('Puede comprar $', (dinero/euro):0:2, ' euros')
    else
        if (upcase(moneda) = 'R' ) then
            writeln('Puede comprar $', (dinero/real):0:2, ' reales');

    readln();
end.


{
 Ej 13) Dada una cantidad X de pesos y un tipo de moneda extranjera, ambos ingresados por teclado, se
desea determinar e informar cuánto se puede comprar dada la siguiente tabla de cotizaciones:

MONEDA COMPRA
D=Dólar $ 120.80
E=Euro $ 150.10
R=Real $ 26.50
}

