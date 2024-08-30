program contrasenia;
    var
        arch : text;
        dentroContra, esValida, tieneMinus, tieneMayus: boolean;
        contra : string;
        contCar, contraTotales, contInvalidas, invalidaMasLarga, contDigitos : byte;
        car : char;

begin
    contCar := 0;
    contDigitos := 0;
    contraTotales := 0;
    contInvalidas := 0;
    dentroContra := false;
    esValida := true;
    invalidaMasLarga := 0;
    car := 'a';
    contra := '';
    assign(arch, 'datos.txt');
    reset(arch);

    while not (car = '.') do
    begin
        read(arch, car);
        // Usar un case evita error de agarrar caracteres bugeados
        case car of
            'a'..'z','A'..'Z','0'..'9':
                begin
                    dentroContra := true;
                    contra := contra + car;
                    contCar := contCar + 1;
                    case car of
                        'a'..'z': tieneMinus := true;
                        'A'..'Z': tieneMayus := true;
                        '0'..'9': contDigitos := contDigitos + 1;
                    end

                end;
            ' ','.':
                if dentroContra = true then
                    // Finaliza contra y hay que evaluarla
                    begin
                        //writeln(contra);  // descomentar para testear
                        contraTotales := contraTotales + 1;
                        if contCar < 8 then
                            esValida := false
                        else
                            if contDigitos <> 4 then
                                esValida := false
                        else
                            esValida := tieneMinus and tieneMayus;

                        if esValida then
                            writeln(contra, '     ====VALIDA ')
                        else
                            begin
                                contInvalidas := contInvalidas + 1;
                                if contCar > invalidaMasLarga then
                                    invalidaMasLarga := contCar;
                                writeln(contra, '      ====INVALIDA ');
                            end;







                        // Re inicializa valores para la proxima contra
                        dentroContra := false;
                        esValida := true;
                        contCar := 0;
                        contra := '';
                        tieneMinus := false;
                        tieneMayus := true;
                        contDigitos := 0;
                    end;
        end; // Fin de case
    end;
    writeln('=========================');


    if contraTotales = 0 then
        writeln('Hay cero contrasenias en los datos')
    else
        writeln('El % de contras invalidas es ', (contInvalidas / contraTotales):0:2);
    writeln('La longitud de la contra invalida mas larga es de ', invalidaMasLarga, ' caracteres');
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
