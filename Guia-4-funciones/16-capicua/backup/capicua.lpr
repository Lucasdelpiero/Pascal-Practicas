program capicua;
type
    st32 = String[32];

function esCapicua( num : integer) : boolean;
var
    i, palabraT : byte;
    numString : st32;
    resultado : boolean;
begin
    resultado := true;
    palabraT := length(numString);
    Str(num, numString);
    for i:=1 to palabraT DIV 2 do
    begin
        if (numString[i] <> numString[palabraT - i + 1]) then
            resultado := false;
    end;
    esCapicua := resultado
end;

var
    num : integer;
begin
    repeat
        writeln('Ingrese un numero entero a ver si es capicua o cero para salir');
        readln(num);
        if esCapicua(num) then
            writeln(num,' es capicua')
        else
        writeln(num,' no es capicua');
    until num = 0;

end.
{
 Ej 16) Mediante una función booleana determinar si un número es capicúa.
}

