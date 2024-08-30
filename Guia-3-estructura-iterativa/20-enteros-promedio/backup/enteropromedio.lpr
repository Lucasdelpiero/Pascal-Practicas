program enteropromedio;
    var
        arch : text;
        dentroConjunto : boolean;
        num, sumPos, contEnteros : integer;

begin
    sumPos := 0;
    contEnteros := 0;
    dentroConjunto := false;
    assign(arch, 'datos.txt');
    reset(arch);

    read(arch, num);
    if num < 0 then
        dentroConjunto := true;
    while not eof(arch) do
    begin
        read(arch, num);
        if num < 0 then  // Comienza a contarse el num maximo
            begin
                dentroConjunto := true;
                        if contEnteros = 0 then
                            writeln('Hay cero positivos en este conjunto')
                        else
                            writeln((sumPos / contEnteros):0:2,' ');
                sumPos := 0; // Se re-inicializa para el proximo conjunto
                contEnteros := 0
            end
        else // Si es parte del conjunto y positivo se ve si es el mayor del conjunto
            if (dentroConjunto = true) and (num > 0) then
                begin
                    sumPos := sumPos + num;
                    contEnteros := contEnteros + 1;
                end;


    end;

    readln();

end.

{
 Ej 20) Leer desde un archivo números enteros, calcular y escribir el promedio de los elementos positivos y
distintos de cero que se encuentran entre dos negativos no consecutivos.
-7 6 -1 0 2 4 -8 -7 3 1 -24 6 7 0 9 -> debe escribir : 6 3 2
7 6 -1 0 2 4 -8 -7 3 1 -24 6 7 0 9 -8 -> debe escribir : 3 2 7.33
}

