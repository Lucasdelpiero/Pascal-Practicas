program paresimpares;
type
    Vint32 = Array[1..32] of integer;
var
    arch : text;
    num : integer;
    V : Vint32;
    W : Vint32;
    Vt, Wt : byte; // Tamaño del vector
    i : byte;
begin
    assign(arch, 'datos.txt');
    reset(arch);
    Vt := 0;
    Wt := 0;


    while not eof(arch) do
    begin
        readln(arch, num);
        while num = 0 do // Ignora ceros
            readln(arch, num);

        if (num MOD 2) = 0 then
            begin
                Vt := Vt + 1;
                V[Vt] := num;
            end
        else
            begin
                Wt := Wt + 1;
                W[Wt] := num;
            end;
    end;

    write('Los numeros pares son: ');
    for i:=1  to vT do
        write(V[i], ' ');

    writeln();

    write('Los numeros impares son: ');
    for i:=1  to wT do
        write(W[i], ' ');

    close(arch);
    readln();

end.

{
Ej 2) Dado un archivo de enteros, se pide almacenar en un vector V sólo los elementos impares y en otro
vector W, los pares, ignorando si hubiese, los ceros.
}

