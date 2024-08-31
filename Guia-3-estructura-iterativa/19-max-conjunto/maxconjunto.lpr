program maxconjunto;
    var
        arch : text;
        dentroConjunto : boolean;
        num, maxNum : integer;

begin
    maxNum := 0;
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
                if maxNum <> 0 then
                    writeln(maxNum,' ');
                maxNum := 0; // Se re-inicializa para el proximo conjunto
            end
        else // Si es parte del conjunto y positivo se ve si es el mayor del conjunto
            wif (dentroConjunto = true) and (num > maxNum) then
                maxNum := num;


    end;

    close(arch);
    readln();

end.

{
 Ej 19) Leer desde archivo un conjunto de números, con elementos negativos no consecutivos que
delimitan subconjuntos. Obtener e informar el valor máximo de cada subconjunto (el máximo entre dos
negativos).
Ejemplo:
2 3 4 -7 4 5 -5 7 5 3 9 8 7 -1 3 1 -2  ->  5 9 3
2 3 4 -7 4 5 -5 7 5 3 9 8 7 -1 3 1   ->   5 9
}

