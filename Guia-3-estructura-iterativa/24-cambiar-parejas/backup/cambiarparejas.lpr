program cambiarparejas;
    var
    entrada , salida: text;
    car, carAnterior : char;
    palabra : string;
    i : byte;
     reemplaza : boolean;
    num : integer;

begin
    carAnterior := '.';
    palabra := '';
    reemplaza := false;
    assign(entrada ,'datos.txt');
    reset(entrada);
    assign(salida,'salida.txt');
    rewrite(salida);

    read(entrada, car);
    repeat
        case carAnterior of
            'a'..'z':
                begin
                    case car of
                        '0'..'9':
                        begin
                            reemplaza := true;
                            val(car, num);
                            for i := 1 to num do
                                palabra := palabra + carAnterior;

                        end
                        else
                          begin
                            reemplaza := false;
                            palabra := palabra + carAnterior;
                          end;



                    end;
                end;
            'A'..'Z':
                begin
                    reemplaza := false;
                    palabra := palabra + carAnterior
                end;
            '0'..'9':
                if reemplaza = false then
                    palabra := palabra + carAnterior;
            ' ':
                begin
                    writeln(palabra,' ');
                    palabra:= '';
                end;

        end;



        carAnterior := car;
        read(entrada, car);
    until car = '.';

    // La ultima palabra hay que hacerla manualmente
    palabra := palabra + carAnterior + '.';
    writeln(palabra);

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
