program palabras;
    var
        arch : text;
        dentroPalabra, esCapicua : boolean;
        palabra, masVocales, alReves : string;
        contLetras, contVocales, maxVocales, contCapicua, i : byte;
        car : char;

begin
    contLetras := 0;
    contVocales := 0;
    maxVocales := 0;
    dentroPalabra := false;
    esCapicua := true;
    car := 'a';
    palabra := '';
    alReves := '';
    assign(arch, 'datos.txt');
    reset(arch);

    while not (car = '.') do
    begin
        read(arch, car);
        // Usar un case evita error de agarrar caracteres bugeados
        case car of
            'a'..'z','A'..'Z':
                begin
                    dentroPalabra := true;
                    palabra := palabra + car;
                    contLetras := contLetras + 1;
                    case car of
                        'a','e','i','o','u': contVocales := contVocales + 1;
                    end;
                    if contVocales >= maxVocales then
                    begin
                        maxVocales := contVocales;
                        masVocales := palabra;
                    end;

                end;
            ' ','.':
                if dentroPalabra = true then
                    // Finaliza palabra y hay que evaluarla
                    begin
                        //writeln(palabra);  // descomentar para testear
                        // b) Dar vuelta palabra
                        if contLetras > 4 then
                        begin
                            for i:= contLetras  downto 1 do
                                alReves := alReves + palabra[i];
                            writeln(palabra ,' al reves: ', alReves);
                        end;

                        // Capicua
                        if contLetras > 1 then
                        begin
                            for i := 1 to (ContLetras DIV 2) do
                            begin
                                if palabra[i] <> palabra[contLetras - i + 1] then
                                    esCapicua := false;
                            end;
                        end
                            else
                              esCapicua := false;
                        if esCapicua = true then
                            contCapicua := contCapicua + 1;

                        // Re inicializa valores para la proxima palabra
                        dentroPalabra := false;
                        contLetras := 0;
                        contVocales := 0;
                        palabra := '';
                        alReves := '';
                        esCapicua := true;
                    end;
        end; // Fin de case
    end;

    // a)
    writeln('Palabra con mas vocales: ', masVocales);
    // c)
    writeln('Hay ', contCapicua, ' palabras capicua');


    readln();
end.

{
Ej 22) A partir de un archivo de texto que contiene palabras separadas entre sí por uno o más blancos
desarrollar un programa para:
a) Mostrar la palabra con más cantidad de vocales del texto.
b) Grabar en un texto de salida las palabras con más de cuatro letras pero escritas al revés.
c) Contar cuántas son palíndromas (capicúas).
}
{
    Hola como estas
}
{
    Ver donde comienza y empezar a concatenar a una palabra
}


