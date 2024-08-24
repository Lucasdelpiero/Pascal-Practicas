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
