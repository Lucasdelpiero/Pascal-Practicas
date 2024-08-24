program reescribir6;
var
    arch : text;
    resp : char;
    saldo, cant : real;
    contFI : byte;


begin
contFI := 0;
assign(arch, 'datos.txt');
reset(arch);
readln(arch, saldo);
writeln('Su saldo inicial es de $', saldo:0:2);

while not eof(arch) do
begin
    readln(arch, resp, cant);
    if (upcase(resp) = 'D') then
        begin
            saldo := saldo + cant;
            writeln('Se han ingresado $', cant:0:2);
        end
    else
        if (upcase(resp) = 'R') then
            begin
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
end;
writeln('No pudo retirar dinero por fondos insuficienties ', contFI, ' veces.');
readln();
end.


{
Ej 11) Reescriba utilizando archivo de texto para ingreso de datos los siguientes ejercicios:
a) Ej 6, considerar en la primera línea del archivo el saldo inicial y en cada una de las líneas siguientes
un movimiento: Tipo, Monto (notar que no es necesario el tipo F).
b) Ej 7, en cada línea del archivo: Nombre (15 caracteres) y las tres notas reales
}
