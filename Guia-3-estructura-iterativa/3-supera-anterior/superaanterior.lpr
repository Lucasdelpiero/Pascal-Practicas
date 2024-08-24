program superaanterior;
    var
        num, cantNum, anterior, vecesSuperado, i : byte;

begin
    vecesSuperado := 0;
    writeln('Cuantos numeros desea ingresar?');
    readln(cantNum);
    for i:=1 to cantNum do
        begin
            writeln('ingrese un numero:');
            readln(num);
            if (i <> 1) then
                if(num > anterior) then
                    vecesSuperado := vecesSuperado + 1;
            anterior := num;
        end;
    writeln('Se supera al anterior ', vecesSuperado, ' veces.');
    readln();
end.

{
Ej 3) Ingresar N números enteros, informar cuántas veces un número supera al anterior.
}


