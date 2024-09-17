program frases;
type
    st32 = String[32];
    vPal = Array[1..30] of st32;
    vInt32 = Array[65..90] of integer;


function longPalMlarga(vector : vPal; vL : byte) : byte;
var max, i: byte;
begin
    max := length(vector[1]);
    for i:=2 to vL do
        if length(vector[i]) > max then
            max := length(vector[i]);
    longPalMlarga := max;
end;

function esAnterior(p1, p2 : st32) : boolean;
var L1, L2, min, i : byte;
    esAux : boolean;
begin
    esAux := false;
    L1 := length(p1);
    L2 := length(p2);
    if L1 <= L2 then
        min := L1
    else
      min := L2;

    i := 1;

    while i <= min do
    begin
        writeln('comparando ', p1[i], ' y ',p2[i]);
        // De la palabra toma una letra, la pasa a mayuscula para que solo importe el orden
        // en el abecedario y no en ascii y lo pasa a num
        if (ord(upcase(p1[i])) < ord(upcase(p2[i]))) then
        begin
            writeln(p1, ' es anterior a ', p2);
            esAux := true;
            i := 99;
        end
        else
            if (ord(p1[i]) > ord(p2[i])) then
            begin
                writeln(p2, ' es anterior a ', p1);
                esAux := false;
                i := 99;
            end;

        i := i + 1;
    end;
    esAnterior := esAux

end;

function antesDic(vector : vPal; vL : byte) : st32;
var
    i : byte;
    antes : st32;
begin
    antes := vector[1];
    for i:=2 to vL do
    begin
    writeln('A comprar palabras ',vector[i],' y ', antes);
    if esAnterior(vector[i], antes) then
        antes := vector[i];
    end;
    antesDic := antes;

end;

procedure vectDePal(frase : string; var vector : vPal; var num : byte);
var
    i : byte;
    palabra : st32;
    vPalL : byte;
    car : char;
begin
    palabra := '';
    vPalL := 0;
    car := frase[1];
    i := 1;
    while i <= length(frase) do
    begin
        palabra := '';
        car := frase[i];
        // Lee toda la palabra hasta encontrarse con los caracteres que la cortan
        while (car <> ' ') and (car <> ',') and (car <> '.') and (i <= length(frase)) do
        begin
            palabra := palabra + car;
            i := i + 1;
            car := frase[i];
        end;

        // La palabra se agrega al vector, se aumenta el numero y se vuelve a buscar la sig palabra
        if  (car = ' ') or (car = ',') or (car = '.') or (i - 1 <= length(frase)) then
            if length(palabra) > 0 then
            begin
                vPalL := vPalL + 1;
                vector[vPalL] := palabra;
            end;
    i := i + 1;
    end;
    num := vPalL;
end;

procedure frecCadaLetra(palabras : vPal; vL : byte);
var i, j : byte;
    vect : vInt32;
begin
    for i:= ord('A') to ord('Z') do
        vect[i] := 0;

    for i:=1 to vL do
    begin
        for j:=1 to length(palabras[i]) do
            vect[ord(upcase(palabras[i][j]))] := vect[ord(upcase(palabras[i][j]))] + 1;
    end;
    vect := vect;

    writeln('La frecuencia de cada letra es');
    for i:= ord('A') to ord('Z') do
    begin
        writeln(chr(i),': ', vect[i] );
    end;
end;

procedure writeVec(vector :vPal; vL : byte);
var
    i : byte;
begin
    for i:= 1 to vL do
        writeln(vector[i]);
end;

procedure mostrarMenu(palabras : vPal; vL : byte);
var resp : st32;
begin
    repeat
        writeln('Eliga una opcion para sobre como tratar la frase o cero para salir:');
        writeln('a) El numero de palabras que contiene.');
        writeln('b) La longitud de la palabra mas larga.');
        writeln('c) De todas las palabras, la que aparece antes en el diccionario.');
        writeln('d) la frecuencia de cada letra (mayuscula o minuscula) que aparece en la frase.');
        readln(resp);
        //antes := AntesDic(palabras, vL);
        case upcase(resp) of
            'A': writeln('Contiene ', vL,' palabras');
            'B': writeln('La palabra mas larga tiene ', longPalMlarga(palabras, vL) ,' letras');
            'C': writeln('La palabra que aparece antes en el diccionario es ', AntesDic(palabras, vL));
            'D': frecCadaLetra(palabras, vL);
        end;


    until resp = '0';


end;

var
    frase : String;
    palabras : vPal;
    palabrasNum : byte;


begin
    writeln('A :', ord('A'));
    writeln('Z :', ord('Z'));
    repeat
        writeln('Ingrese una frase o salga del ciclo escribiendo un cero');
        readln(frase);
        vectDePal(frase, palabras, palabrasNum);
        writeVec(palabras, palabrasNum);

        if frase <> '0' then
            mostrarMenu(palabras, palabrasNum);

    until frase = '0';

end.

{
Ej 6) Escriba un programa que lea una frase (secuencia de caracteres separada por espacio, coma, punto)
y mediante un menú de opciones calcule e informe:
a) El número de palabras que contiene.
b) La longitud de la palabra más larga.
c) De todas las palabras, la que aparece antes en el diccionario. Analizar las alternativas de
almacenar dicha palabra en un arreglo de caracteres o en un string.
d) la frecuencia de cada letra (mayúscula o minúscula) que aparece en la frase.
No es necesario almacenar toda la frase en un arreglo.
}

