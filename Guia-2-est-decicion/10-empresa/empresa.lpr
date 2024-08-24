program empresa;
    var
        respuesta : char;
        costo : real;
        servicios_contratados : byte;

    const
        costo_basico = 1350;
        costo_pelis = 200;
        costo_depor = 270;
        net_6mb = 800;
        net_10mb = 960;
        costo_grabar = 150;
        descuento = 0.25;

begin
    servicios_contratados := 0;
    // Contratacion cable
    writeln('Quiere contratar el servicio de cable a $1350? (S / N)');
    readln(respuesta);
    if (upcase(respuesta) = 'S') then
        begin
            servicios_contratados := servicios_contratados + 1;
            writeln('Se contrato el servicio de cable');
            costo := costo_basico;
            writeln('Quiere contratar el paquete de peliculas por $200 adicionales? (S / N )');
            readln(respuesta);
            if (upcase(respuesta) = 'S') then
                begin
                    writeln('Se aniadio el paquete de pelis');
                    costo := costo + costo_pelis;
                end;
            writeln('Quiere contratar el paquete de deportes por $270 adicionales? (S / N )');
            readln(respuesta);
            if (upcase(respuesta) = 'S') then
                begin
                    writeln('Se contrato el paquete de deportes');
                    costo := costo + costo_depor;
                end;
        end;

    // Contratacion de internet
    writeln('Quiere contratar el servicio de internet? (S / N)');
    readln(respuesta);
    if (upcase(respuesta) = 'S') then
        begin
            writeln('Tiene el servicio de 6MB a $800 o el de 10MB y WIFI a $960');
            writeln('Ingrese "a" para contratar el de 6MB u "b" 10MB, u otra para cancelarlo');
            readln(respuesta);
            if (upcase(respuesta) = 'A') then
                begin
                    servicios_contratados := servicios_contratados + 1;
                    writeln('Ha contratado el servicio de 6MB');
                    costo := costo + net_6mb;
                end;
            if (upcase(respuesta) = 'B') then
                begin
                    servicios_contratados := servicios_contratados + 1;
                    writeln('Ha contratado el servicio de 10MB + WIFI');
                    costo := costo + net_10mb;
                end;
        end;

    // Descuento
    if (servicios_contratados = 2) then
        begin
            writeln('Se le ha otorgado un descuento del 25% por: $',
                ((costo * descuento)):0:2);
            costo := costo - (costo * descuento);
        end;

    // Final
    writeln('El monto final a pagar es de $', costo:0:2, ' por mes');


    readln();
end.

{
 Ej 10) Una empresa le brinda a sus clientes un servicio de cable con un costo básico de $1350 por mes, el
paquete de películas se cobra $200 adicionales y el de deportes $270. Aparte ofrece internet por $800 con
6MB, si se desea 10MB y WIFI cuesta 20% más. La opción de grabar programas tiene un costo adicional
de $150 por mes. La promoción es que si se contrata ambos servicios (cable e internet), tiene una
bonificación del 25% del total.
Ingresar los datos de un cliente, calcular e informar cuánto debe pagar.
}
