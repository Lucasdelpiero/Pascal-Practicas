program piramides;

procedure dibujar(altura, i, max: byte);
begin
    //1 Moverme del mas grande al mas chico
    //2 Dibujarlo y hacer mini caso base
    //3 Si el maximo no llego a la altura entonces se dibuja una nueva linea con max + 1
    //4 se vuevle al 1
    // Si i = max caso base final
    write(i,' ');
    if i > 1 then
        dibujar(altura, i - 1, max)
    else
        if max < altura then
        begin
            writeln();
            dibujar(altura, max + 1, max + 1)
        end;


end;

var altura: byte;

begin
    writeln('Ingrese altura de piramide');
    readln(altura);
    dibujar(altura,1,1);


    readln();
end.
{
 Ej 11) Desarrollar un procedimiento recursivo para imprimir
una media pirámide de dígitos como se muestra a continuación:
1
2 1
3 2 1
4 3 2 1
5 4 3 2 1
6 5 4 3 2 1
7 6 5 4 3 2 1
8 7 6 5 4 3 2 1
9 8 7 6 5 4 3 2 1
}

