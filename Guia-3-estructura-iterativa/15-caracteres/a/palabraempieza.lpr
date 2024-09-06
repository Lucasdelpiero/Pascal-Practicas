program palabraempieza;
var
    arch : text;
    char1, char2 , charCom: char;
    cont : byte;

begin
    cont := 0;
    assign(arch, 'datos.txt');
    reset(arch);
    read(arch, char1);

    writeln('Letra con la cual comienzan las palabras');
    readln(charCom);
    charCom := upcase(charCom);

    if char1 = charCom then
        cont:= cont + 1;


    while char1 <>'.' do
    begin
        read(arch, char2);
        char2 := upcase(Char2);
        if (char1 = ' ') and (char2 = charCom) then
            cont := cont + 1;
            char1 := char2;
    end;

    writeln('La letra ', charCom, ' aparece un total de ', cont,' veces.');
    readln();

end.

{
Ej 15) A partir de un archivo de texto que contiene una secuencia de caracteres terminada en punto,
desarrollar un programa para cada item:
a) Cuántas palabras comienzan con una letra que ingresa por teclado.
b) Cuántas palabras contienen una letra que ingresa por teclado.
}

