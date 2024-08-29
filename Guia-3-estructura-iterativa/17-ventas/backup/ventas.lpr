program ventas;
    var
        nombre, prom, nombreMayorOfertas : string;
        precio, precioBase , descuentoTotal : real;
        contCompraOfertas, mayorCompraOfertas, contClientesSoloOfertas, num, i : integer;
        soloOfertas: boolean;


    const
        DESC = 0.1; // 10% de descuento

begin
    i := 0;
    precioBase := 0;
    descuentoTotal := 0;
    contCompraOfertas := 0; // Articulos en oferta comprados por cada cliente
    mayorCompraOfertas := 0; // Mayor cantidad de articulos en oferta comprados por 1 cliente
    contClientesSoloOfertas := 0; // Ratones que solo compraron cosas en oferta
    soloOfertas := true;    // Controla si alguien solo compro cosas en oferta


    writeln('Ingrese nombre del cliente:');
    readln(nombre);
    while nombre <> '*****' do
    begin

        writeln('Cantidad de articulos comprados:');
        readln(num);
        for i:= 1 to num do
            begin
                writeln('Ingrese precio: ');
                readln(precio);
                writeln('Esta en oferta? (S / N)');
                readln(prom);
                prom := upcase(prom);

                precioBase:= precioBase + precio;

                if prom = 'S' then
                    begin
                        contCompraOfertas := contCompraOfertas + 1;
                        descuentoTotal := descuentoTotal + (precio * DESC);
                    end
                else
                    if prom = 'N' then
                        soloOfertas := false;
            end;

        // a) Muestra la venta
        writeln(nombre,' monto venta: ',
            precioBase:0:2,
            ' descuento: ',
            descuentoTotal:0:2,
            ' Precio final: ',
            (precioBase - descuentoTotal):0:2);

        // Guardar datos del cliente
        if soloOfertas = true then
            contClientesSoloOfertas := contClientesSoloOfertas + 1;

        if contCompraOfertas > mayorCompraOfertas then
        begin
            nombreMayorOfertas := nombre;
            mayorCompraOfertas := contCompraOfertas;
        end;

        // Re inicializar variables para la siguiente persona
        precioBase := 0;
        descuentoTotal := 0;
        soloOfertas := true;
        contCompraOfertas := 0;
        guardarNombre := true;
        // Pasar al siguiente cliente
        writeln('Ingrese nombre del siguiente cliente o ***** para terminar:');
        readln(nombre);

    end;

    // b)
    writeln(nombreMayorOfertas, ' compro la mayor cantidad de articulos en ofertas.');

    // c)
    writeln(contClientesSoloOfertas ,' clientes compraron solo articulos en oferta.');

    readln();

end.

{
 Ej 17) La cajera de un supermercado ha registrado varias ventas, de cada una sabe:
- Nombre del cliente ( “ ***** “ indica fin de datos )
- Cantidad de artículos que compró el cliente y por cada uno se conoce:
-- Precio base del artículo
-- Si está o no en promoción ( ‘S’ ó ‘N’ )
En el caso de estar en promoción, se realiza un descuento del 10% sobre el precio base.
Se pide ingresar los datos e informar:
a) Monto total de cada venta, el total del descuento y el precio final a pagar.
b) Nombre del cliente que compró la mayor cantidad de artículos en oferta.
c) Cuántos clientes compraron solo artículos en oferta.
}
