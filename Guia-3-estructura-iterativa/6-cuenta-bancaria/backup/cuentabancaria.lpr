program cuentabancaria;
    var
        resp : char;
        saldo, cant : real;
        contFI : byte;


begin
    contFI := 0;
    writeln('Ingrese saldo inicial:');
    readln(saldo);


    writeln('D=deposito, R=retiro o F= fin de datos');
    writeln('Ingrese movimiento a realizar (D/R/F) :');
    readln(resp);
    while (upcase(resp) <> 'F') do
    begin
        if (upcase(resp) = 'D') then
            begin
                writeln('Cuanto desea depositar?');
                readln(cant);
                saldo := saldo + cant;
                writeln('Se han ingresado $', cant:0:2);
            end
        else
            if (upcase(resp) = 'R') then
                begin
                    writeln('Cuanto desea retirar?');
                    readln(cant);
                    if (saldo >= cant) then
                    begin
                        saldo := saldo - cant;
                        writeln('Se han retirado $', cant:0:2);
                    end
                    else
                        begin
                            writeln('Saldo insuficiente');
                            contFI := contFI + 1
                        end
                end;
        writeln('Saldo actual: $', saldo:0:2);
        writeln();
        writeln('Ingrese movimiento a realizar (D/R/F) :');
        readln(resp);
    end;
    writeln('No pudo retirar dinero por fondos insuficienties ', contFI, ' veces.');
    readln();
end.

{
Ej 6) Se conoce el saldo inicial de una cuenta bancaria y una serie de movimientos realizados, por cada
uno:
- código de movimiento (D=depósito, R=retiro ó F= fin de datos).
- monto
Escribir un programa que ingrese dichos datos y determine el saldo exacto de la cuenta después de
procesar las transacciones. Al final del proceso indique cuantas veces no pudo retirar dinero por
insuficiencia de fondos.
}

