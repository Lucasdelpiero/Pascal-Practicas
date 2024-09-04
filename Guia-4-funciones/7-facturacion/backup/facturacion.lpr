program facturacion;
function impuesto(tipo : char; fact: real) : real;
const
    ivaRi = 0.21;
    iva = 0.31;
begin
    if tipo = 'S' then
        impuesto := fact * ivaRi
    else
      impuesto := fact * iva;

end;

    var
        nombre, nombreMenosFacturacion : string;
        tipo : char;
        fact, menorFacturacion : real;
        meses : byte;
begin
    menorFacturacion := 9999999999;
    writeln('Cuantos meses de facturacion queres ver?');
    readln(meses);
    repeat
    writeln('Ingrese nombre de la empresa o "-" para terminar la carga de datos');
    readln(nombre);
    if nombre <> '-' then
        begin
        writeln('Es responsable inscripo?  (S / N)');
        readln(tipo);
        tipo := upcase(tipo);
        writeln('Cuanto facturo?');
        readln(fact);

        if (fact < menorFacturacion) and (tipo <> 'S') then
            begin
                menorFacturacion := fact;
                nombreMenosFacturacion := nombre;
            end;

        writeln(nombre,' RI: ', tipo, ' iva pagado: ', impuesto(tipo, fact):0:2);
        end

    until nombre = '-';

    writeln('Quien facturo menos de los no RI fue: ', nombreMenosFacturacion);
    readln();
end.







{
 Ej 7) Un estudio contable registró la facturación de varios comercios en los últimos N meses,
por cada uno se tiene:
- Nombre
- Tipo (S/N) si es Responsable Inscripto o No, y luego por cada uno de los N meses:
-- Importe facturado mensual sin IVA
Se desea saber:
a) Listar Nombre, tipo y cuánto pagó de IVA en los N meses.
b) El nombre del comercio Responsable Inscripto que menos facturó en total.

Desarrollar la función Impuesto con los parámetros necesarios de modo tal que devuelva el monto de IVA
que debe pagar. Sabiendo que si es Responsable Inscripto, corresponde el 21% de la compra, si no lo es,
el 21%+10%.
}
