program vendedor;
    var
        sueldo, ventas : real;
        dias_faltados : byte;
    const
        sueldo_bas = 8000;
        comision = 0.05;
        ventas_a_superar = 10000 ; // Puede ser cualquier numero
        ventas_bonificacion = 0.03;
        presen_bonificacion = 0.02;
        presen_penalizacion = 0.07;

begin
    writeln('Calculando sueldo...bip..bup...bip');
    writeln('Ingrese el monto en dinero de ventas hechas en el mes:');
    readln(ventas);
    sueldo := sueldo_bas + (ventas * comision);

    if (ventas > ventas_a_superar)then
        sueldo := sueldo + (ventas * ventas_bonificacion);

    writeln('Ingrese cuandos dias falto a trabajar:');
    readln(dias_faltados);
    if (dias_faltados = 0) then
        begin
            if ((ventas * presen_bonificacion) > 1000 ) then
                sueldo := sueldo + (ventas * presen_bonificacion)
            else
                sueldo := sueldo + 1000
        end
    else
        if (dias_faltados > 2) then
            sueldo := sueldo - (sueldo * presen_penalizacion);

    writeln('El sueldo a pagar es de: $', sueldo:0:2);

    readln();
end.

{
 Ej 9) A un vendedor le pagan un sueldo básico de $8000 por mes más una comisión del 5% de las ventas;
si superó en ventas un monto X (dato ingresado por teclado) se le agrega un 3%. Por presentismo cobra
$1000 más ó 2% de las ventas, lo que resulte mayor. Si faltó más de 2 días se le descuenta un 7% del
total.
Definir los datos a ingresar. Calcular e informar lo que debe cobrar el vendedor.
}
