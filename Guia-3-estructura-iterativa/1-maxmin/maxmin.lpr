program maxmin;
    var
        MaxN, minN, cantNum, N, ocurrencias, i: integer;
        hayImpar : boolean;

begin
    hayImpar := false;
    writeln('Ingrese cuantos numeros quiere ingresar');
    readln(cantNum);


    for i := 1 to cantNum do
    begin
        writeln('Ingrese un numero para calcular');
        readln(n);
        if (i = 1) then
            maxN := n;

        if (n > maxN) then
        begin
            maxn := n;
            ocurrencias := 1;
        end
        else
            if (n = maxN) then
                ocurrencias := ocurrencias + 1;

        if (not hayImpar) and ((n mod 2) <> 0) then
        begin
            minN := n;
            hayImpar := true;
        end
        else
            if ((n < minN) and (n mod 2 <> 0) ) then
            begin
                hayImpar := true;
                minN := n;
            end;
    end;

    writeln(maxN,' es el mayor y aparece ', ocurrencias, ' veces.');
    if (hayImpar) then
        writeln(minN, ' es el numero menor')
    else
        writeln('No hay numero minimo');
end.

{
Ej 1) Dados N números enteros, calcular e informar:
a) El máximo, qué lugar ocupa la primera aparición y cuántas ocurrencias tiene.
b) El mínimo de los impares (informar si no existe)
Ejemplo: N = 10, 78, 45, 80, 56, 80, 32, 90, 89, 90, 45
a) 90 - 7º lugar - 2 ocurrencias
b) 45
}

