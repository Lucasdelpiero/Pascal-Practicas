program archivodescendiente;
    var
        arch : text;
        num1, num2 : real;
        ordenados : boolean;

begin
    ordenados := true;
    assign(arch, 'datos.txt');
    reset(arch);

    // Carga primer numero
    if not eof(arch) then
        readln(arch, num1);

    // Segundo numero entra a partir del loop
    while not eof(arch) and ordenados do    // Si sabe que estan desordenados corta antes
    begin
        readln(arch, num2);
            if num2 > num1 then
                ordenados := false;
            num1 := num2


    end;
    if (ordenados) then
        writeln('Estan ordenados')
    else
        writeln('Estan desordenados');
    close(arch);

    readln();
end.

{
Ej 9) Dado un conjunto de números leídos desde un archivo, informar si están ordenados en forma
ascendente
}
