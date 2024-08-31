program Palabras;
    var
        arch : text;
        palabra, palabraInversa, palabraMasVocales : string;
        contLetras, contCapicua, contVocales, contMasVocales, i : integer;
        car : char;
        esCapicua : boolean;



begin
    car := ' ';
    contLetras := 0;
    contCapicua := 0;
    contMasVocales := 0;
    palabraMasVocales := '';
    assign(arch, 'datos.txt');
    reset(arch);

    while car <> '.' do
        begin
        contLetras := 0;
        palabra := '';
        palabraInversa := '';
        contVocales := 0;
        esCapicua := true;
        read(arch, car);
        if car <> ' ' then // Principio de palabra
        begin
        // Lee hasta el final de la palabra
            while (car <> ' ') and (car <> '.') do
            begin
                palabra := palabra + car;
                contLetras := contLetras + 1;
                case car of
                'a','e','i','o','u': contVocales := contVocales + 1;
                end;
                read(arch, car);
            end; // Fin de palabra y de while interno
            writeln(palabra); // Para testear
        end; // Fin de palabra y de while externo

        // Hay que escribirla al reves
        if contLetras > 4 then
        begin
            for i := contLetras downto 1 do
                palabraInversa := palabraInversa + palabra[i];

            writeln(palabra,' su inversa es ', palabraInversa);
        end;

        // Es capicua si tiene mas de una letra y su letra en orden inversa es igual
        if contLetras > 1 then
            for i := 1 to contLetras do
                begin
                if palabra[i] <> palabra[contLetras - i + 1] then
                    esCapicua := false;
                end
        else
            esCapicua := false;


        // Vocales
        if contVocales > contMasVocales then
        begin
            contMasVocales := contVocales;
            palabraMasVocales := palabra;
        end;

        if esCapicua then
        begin
            writeln(palabra,' es capicua');
            contCapicua := contCapicua + 1;
        end;

    end; // Fin de while externo

    writeln(palabraMasVocales, ' es la que tiene mas vocales');
    writeln('Hay ', contCapicua, ' palabras capicua');
    close(arch);
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


