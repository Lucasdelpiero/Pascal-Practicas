program ventas;
    var
        arch : text;
        nombre, prom, nombreMayorOfertas : string;
        precio, precioBase , descuentoTotal : real;
        contCompraOfertas, mayorCompraOfertas, contClientesSoloOfertas : integer;
        leido : string; // Se lee y se castea acordemente
        guardarNombre , soloOfertas: boolean;


    const
        DESC = 0.1; // 10% de descuento

begin
    precioBase := 0;
    descuentoTotal := 0;
    contCompraOfertas := 0; // Articulos en oferta comprados por cada cliente
    mayorCompraOfertas := 0; // Mayor cantidad de articulos en oferta comprados por 1 cliente
    contClientesSoloOfertas := 0; // Ratones que solo compraron cosas en oferta
    soloOfertas := true;    // Controla si alguien solo compro cosas en oferta
    guardarNombre := true;  // Lee el caracter y diferencia un ***** del nombre
    assign(arch, 'datos.txt');
    reset(arch);

    while not eof(arch) do
    begin
        readln(arch, leido);
        if guardarNombre = true then
        begin
            nombre := leido;
            guardarNombre := false;
        end
        else
            if leido = '*****' then   // Muestra la venta a la persona y se prepara para
                begin                 // el siguiente cliente
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
                end
        else        // Si no es el nombre o fin de linea es una venta
            begin
                prom := leido;
                prom := upcase(prom);
                readln(arch, precio);
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
