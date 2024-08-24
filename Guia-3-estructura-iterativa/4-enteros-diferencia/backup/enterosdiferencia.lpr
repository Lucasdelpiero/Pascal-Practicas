program enterosdiferencia;
    var
        cantNum, anterior, num, diferencia, posicion : integer;
        i : byte;

begin
    diferencia := 0;
    posicion := 0;
    writeln('Cuantos numeros desea ingresar?');
    readln(cantNum);
    writeln('Ingrese los numeros en orden descendente.');

    for i:= 1 to cantNum do
        begin
            writeln('Ingrese un numero:');
            readln(num);

            if (i = 1) then
                anterior := num
            else
                if ((anterior - num) > diferencia ) then
                    begin
                        diferencia := anterior - num;
                        posicion := i - 1;
                    end
            anterior := num;
        end;

    writeln('La maxima diferencia es de ', diferencia,' y corresponde al par ', posicion);
    readln();
end.

{
Ej 4) Ingresar N números enteros (ordenados en forma descendente), informar cual es la máxima
diferencia entre dos números consecutivos y qué posición ocupa ese par de números dentro de la
secuencia.
Ejemplo: 25 19 11 9 3 -3, la máxima diferencia es 8 y corresponde al par 2
}

