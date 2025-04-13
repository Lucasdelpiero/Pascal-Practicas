program tarjetadesc;
type st6 = string[6];

procedure leerArchivo(N: byte);
var
    dia, nDesTres, i: byte;
    monto, subtotal, descTot: real;
    arch: text;
    tipo: char;
    cod: st6;
    descO, descC, descS: boolean;
begin
    nDesTres := 0;
    assign(arch,'datos.txt'); reset(arch);
    for i:=1 to N do
    begin
        descO := false; descC := false; descS  := false; descTot := 0; subtotal := 0;
        readln(arch, cod);
        readln(arch, tipo); tipo := upcase(tipo);

        while tipo <> 'F' do
        begin
            readln(arch, dia); readln(arch, monto);
            subtotal := subtotal + monto;
            if (tipo = 'O') and (monto > 300) and ( dia in [10,20,30]) then
            begin
                descO := true;
                descTot := descTot + monto * 0.05;
            end
            else
                if (tipo = 'C') and (dia > 15) then
                begin
                    descC := true;
                    descTot := descTot + monto * 0.1;
                end
            else
                if (tipo = 'S') and ( dia < 15) then
                begin
                    descS := true;
                    descTot := descTot + monto * 0.15;
                end;
            readln(arch, tipo);  tipo := upcase(tipo);
        end;
        if (not descO) and (not descC) and (not descS) then
            writeln(cod,' sin desc: ', subtotal:10:2);

        if descO and descC and descS then
            nDesTres := nDestres + 1;

        writeln(cod,' ahorro: ', descTot:10:2);
    end;
    writeln('Hay ', nDesTres,' que tuvieron los 3 descuentos');
    close(arch);
end;

var
    n: byte;


begin
  writeln('ingrese N clientes'); readln(N);
  leerArchivo(N);

  readln();
end.



{
 Ej 8) En un archivo de texto se registraron las compras de N titulares de tarjetas de crédito de la siguiente
forma:
- Código de Cliente y a continuación sus compras: no se sabe cuántas son, por cada una:
• Tipo de compra: (C=combustible, S=supermercado, O=otros, F=fin de datos)UNMDP – FI Programación I
Pág. 2
• Día (1..31)
• Monto
El banco ofrece un descuento de:
- 5% los días 10, 20 y 30 para el tipo Otros si el monto supera los $300.
- 10% para Combustible en la 2º quincena.
- 15% para Supermercado en la 1º quincena.
Se pide:
a) Código del cliente y total abonado, por cada cliente que no se benefició con ningún descuento.
b) Cuántos clientes obtuvieron descuento en los tres rubros.
c) Informar cuánto ahorró cada cliente.
En la solución debe desarrollar la función Descuento, que a partir del tipo de compra, día y monto
devuelva el correspondiente descuento
}

