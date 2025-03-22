program numyfrec;
    var
        arch : text;
        num, anterior, frec : byte;

begin
    frec := 0;
    assign(arch, 'datos.txt');
    reset(arch);
    writeln('Numero Frecuencia');

    if not eof(arch) then
        begin
            readln(arch, anterior);
            frec := 1;
        end;

    while not eof(arch) do
    begin
        readln(arch, num);
        if (num = anterior) then
            frec := frec + 1
        else
            begin
                writeln(anterior:4,frec:8);
                frec := 1;
            end;
        anterior := num;

    end;
    close(arch);
    writeln(num:4, frec:8);
    readln();

end.

{
Ej 10) Leer desde un archivo números enteros ordenados de menor a mayor, puede haber elementos
repetidos.
Calcular y mostrar cada número con su respectiva frecuencia.
Ejemplo: 2, 2, 3, 3, 3, 3, 7, 9, 9, 9
}
