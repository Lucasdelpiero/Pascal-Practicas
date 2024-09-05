program contrasenia;
    var
        arch : text;
        esValida, tieneMinus, tieneMayus: boolean;
        contra : string;
        contCar, contraTotales, contInvalidas, invalidaMasLarga, contDigitos : byte;
        car : char;

begin
    contCar := 0;
    contDigitos := 0;
    contraTotales := 0;
    contInvalidas := 0;
    esValida := true;
    invalidaMasLarga := 0;
    car := 'a'; // Valor inicial que se reemplaza al leer el primer caracter
    contra := '';
    assign(arch, 'datos.txt');
    reset(arch);

    while not (car = '.') do
    begin
        // Inicializacion para variables de la contra
        esValida := true;
        contCar := 0;
        contra := '';
        tieneMinus := false;
        tieneMayus := true;
        contDigitos := 0;

        // Lee el primer caracter del archivo y lee el primer caracter seguido de un espacio
        read(arch,car);

        // Saltea los espacios
        while car = ' ' do
            read(arch,car);

        // Esta dentro de una palabra
        while (car <> ' ') and (car <> '.') do
            begin
                if (car in ['a'..'z']) or (car in ['A'..'Z']) or (car in ['0'..'9']) then
                begin
                    contra := contra + car;
                    contCar := contCar + 1;
                    case car of
                        'a'..'z': tieneMinus := true;
                        'A'..'Z': tieneMayus := true;
                        '0'..'9': contDigitos := contDigitos + 1;
                    end

                end
                else // Tiene un caracter no permitido ( & % # )
                    //if (car <> '.') and (car <> ' ') then
                    begin
                        esValida := false;
                        contra := contra + car;
                        contCar := contCar + 1;
                    end;



            read(arch, car);
            end; // Finaliza la palabra

        // Evaluamos la contra
        contraTotales := contraTotales + 1;
        if contCar < 8 then
            esValida := false
        else
            if contDigitos <> 4 then
                esValida := false
        else
            esValida := tieneMinus and tieneMayus;

        // Informar si es valida o no
        if esValida then
            writeln(contra, '     VALIDA ')
        else
            begin
                contInvalidas := contInvalidas + 1;
                if contCar > invalidaMasLarga then
                    invalidaMasLarga := contCar;
                writeln(contra, '      INVALIDA ');
            end;
    end;
    writeln('=========================');


    if contraTotales = 0 then
        writeln('Hay cero contrasenias en los datos')
    else
        writeln('El % de contras invalidas es ', (100 * contInvalidas / contraTotales):0:2);
    writeln('La longitud de la contra invalida mas larga es de ', invalidaMasLarga, ' caracteres');
    close(arch);
    readln();
end.


{
 Ej 23) Un archivo contiene contras (letras mayúsculas, minúsculas, dígitos, caracteres especiales)
separadas entre sí por uno o más blancos. Se debe verificar para cada una si se trata de una contraseña
válida, y en ese caso grabarla en un archivo de salida. Indicar al final del proceso el porcentaje de
contras que no son contraseñas válidas y mostrar la contraseña inválida más larga (puede no existir).
Una contraseña válida debe:
- estar conformada como mínimo por 8 caracteres,
- incluir obligatoriamente, al menos una letra mayúscula y al menos una minúscula
- incluir exactamente cuatro dígitos.
- no contener caracteres diferentes de letras y digitos.

Ejemplo:
eR68G12a 91jY643ebjp eRty74kLh 24fG92 aj85gT32 eL8j$8215 dGb9357jKoup
La salida del programa sería:
El % de contraseñas inválidas es 57.14
La longitud de la contraseña inválida más larga es de 11 caracteres
}
