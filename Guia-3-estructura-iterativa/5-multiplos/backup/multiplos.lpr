program multiplos;
    var
        limite, num, i : byte;

begin
    writeln('Ingrese el numero que quiere conocer sus multiplos');
    readln(num);
    writeln('Ingrese hasta que numero quiere saber sus multiplos');
    readln(limite);

    for i:= 1 to limite do
        begin
            if ((num mod i) = 0) then
                begin
                    if (i = 1) then
                        write(i)
                    else
                        write(', ',i);
                end
        end;

    readln();
end.

{
Ej 5) Generar y mostrar los múltiplos de K menores que un valor Q. (K y Q se leen de teclado).
}
