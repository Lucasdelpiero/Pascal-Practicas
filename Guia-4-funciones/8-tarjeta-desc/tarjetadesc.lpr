program tarjetadesc;
// Desc Otros
function tieneDescO(tipo : char; dia: byte; monto : real) : boolean;
begin
    if (upcase(tipo) = 'O') and (monto > 300) then
        case dia of
            10,20,30: tieneDescO := true;
        end
    else
        tieneDescO := false;
end;
// Desc Combustible
function tieneDescC(tipo : char; dia : byte; monto: real) : boolean;
begin
    if(upcase(tipo) = 'C') and (dia > 15) then
        tieneDescC := true
    else
        tieneDescC := false;

end;
// Desc Supermercado
function tieneDescS(tipo : char; dia : byte; monto: real) : boolean;
begin
    if(upcase(tipo) = 'S') and (dia < 15) then
        tieneDescS := true
    else
        tieneDescS := false;

end;

// Funcion descuento llama a las otras 3
function descuento(tipo : char; dia : byte; monto : real) : real;
begin
    if tieneDescO(tipo, dia, monto) then
        monto := monto * 0.95
    else
        if tieneDescC(tipo, dia, monto) then
            monto := monto * 0.9
    else
        if tieneDescS(tipo, dia, monto) then
            monto := monto * 0.85;

    descuento := monto;

end;

    var
        arch : text;
        cliente : integer;
        tipo: char;
        monto, montoT, montoTConDesc : real;
        dia, clientesAhorradores : byte;
        clienteDescO, clienteDescS, clienteDescC : boolean;
begin
    montoT := 0;
    montoTConDesc := 0;
    clientesAhorradores := 0;
    assign(arch,'datos.txt');
    reset(arch);

    while not eof(arch) do
    begin
        clienteDescO := false;
        clienteDescS := false;
        clienteDescC := false;
        montoT := 0;
        montoTConDesc := 0;
        readln(arch, cliente);
        readln(arch, tipo);

        while upcase(tipo) <> 'F' do
        begin
            readln(arch, dia);
            readln(arch, monto);

            montoT := montoT + monto;
            montoTConDesc := montoTConDesc + descuento(tipo, dia, monto);


            // Por cada compra analiza si tiene descuento
            if tieneDescO(tipo, dia, monto) then
                clienteDescO := true
            else
                if tieneDescS(tipo, dia, monto) then
                    clienteDescS := true
            else
                if tieneDescC(tipo, dia, monto) then
                    clienteDescC := true;


           readln(arch, tipo);
        end;     // Termina con un cliente



        // a
        if clienteDescS and clienteDescC and clienteDescO then
            clientesAhorradores := clientesAhorradores + 1
        else
            if (not clienteDescS) and (not clienteDescC) and (not clienteDescO) then
                writeln(cliente,' abono $', montoT:0:2,  ', no recibio ningun descuento');

        // c)
        writeln(cliente, ' se ahorro $', (montoT - montoTConDesc):0:2);

    end;

    // b
    writeln(clientesAhorradores, ' clientes recibieron descuentos en los 3 rubros');
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
