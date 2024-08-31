Program CambiarParejas;
    var
        entrada, salida : text;
        car1, car2 : char;
        palabra : string;
        i, num : byte;

begin
    car1 := '-';
    car2 := '-';
    palabra := '';
    assign(entrada, 'datos.txt');
    reset(entrada);
    assign(salida, 'salida.txt');
    rewrite(salida);

    read(entrada, car1);
    while car2 <> '.' do
    begin
        read(entrada, car2);

        // Si hay un espacio antes de empezar la palabra, siempre se escribe
        if (car1 = ' ') and (car2 <> ' ') then
            palabra := palabra + car2;

        // Si el car1 es minuscula, puede o no repetirse el numero
        if car1 in ['a'..'z'] then
            if car2 in ['0'..'9'] then
            begin
                val(car2,num);
                for i := 1 to num do
                    palabra := palabra + car1;
            end
            else
                palabra := palabra + car1;

        // La mayuscula se escribe siempre
        if (car1 in ['A'..'Z']) then
            palabra := palabra + car1;

        // El numero se escribe solo si le precede una mayuscula
        if car2 in ['0'..'9']  then
            if car1 in ['A'..'Z'] then
                palabra := palabra + car2; ;


        // Termina la palabra y se escribe en pantalla
        if (car2 = ' ') or (car2 = '.')  then
            begin
                //writeln(palabra);   // Descomentar para testear
                write(salida, palabra);
                write(salida, car2);
                palabra := '';
            end;

        car1 := car2;
    end;

    // Se muestra en pantalla el resultado
    close(salida);
    assign(salida, 'salida.txt');
    reset(salida);
    read(salida, palabra);
    writeln('El archivo dice:');
    writeln(palabra);
    // Se cierran archivos
    close(entrada);
    close(salida);
    readln();
end.

{
 Ej 24) En un archivo se han grabado palabras, separadas por uno o más blancos en una misma línea,
finalizando con un punto. Cada palabra está conformada por letras y dígitos (3ab4c3Hd).
Se pide, a partir del archivo descripto generar otro cambiando las parejas “LetraminusculaDigito” por las
repeticiones de la Letra según indique el digito

Ejemplos: ab4C3hd 1Ab2c3hD2. -> abbbbC3hd 1AbbccchD2.
Ab0C3hd 1Ab2c0hD2. -> AC3hd 1AbbhD2.
}
