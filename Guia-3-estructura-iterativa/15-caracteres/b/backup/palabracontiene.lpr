program palabracontiene;
var
arch : text;
char1, char2 , charCon: char;
cont : byte;
contieneLetra : boolean;

begin
cont := 0;
contieneLetra := false;
assign(arch, 'datos.txt');
reset(arch);
read(arch, char1);

writeln('Letra que letra contienen las palabras');
readln(charCon);
charCon := upcase(charCon);

if char1 = charCon then
contieneLetra := true;


while char1 <>'.' do
begin
read(arch, char2);
char2 := upcase(Char2);
if (char2 = charCon) then
contieneLetra := true
else // si termina la palabra suma al contador si contiene la letra
if (char2 = ' ') or (char2 = '.') then
if contieneLetra = true then
begin
cont := cont + 1;
// la siguiente palabra por defecto no suma al contador
contieneLetra := false;
end;

char1 := char2;
end;

writeln('La letra ', charCon, ' aparece en un total de ', cont,' palabras.');
readln();

end.

{
Ej 15) A partir de un archivo de texto que contiene una secuencia de caracteres terminada en punto,
desarrollar un programa para cada item:
a) Cuántas palabras comienzan con una letra que ingresa por teclado.
b) Cuántas palabras contienen una letra que ingresa por teclado.
}

