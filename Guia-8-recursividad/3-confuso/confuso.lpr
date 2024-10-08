program confusoTp;
// B) Es una multiplicacion entre a y b
function confuso(a,b:integer):integer;
begin
    if (b = 0) then
        confuso := 0
    else
        if (b mod 2 = 0) then
            confuso := confuso(a+a, b div 2)
    else
        confuso := confuso(a+a, b div 2) + a;
end;

var a, b : integer;
begin
    repeat
        writeln('Ingrese a');
        readln(a);
        writeln('Ingrese b');
        readln(b);
        writeln('Resultado: ', confuso(a, b));
    until (a = 0) and (b = 0);
end.
{
 Ej 3) Considerar la siguiente función recursiva:
function confuso(a,b:integer):integer;
begin
    if (b = 0) then
        confuso := 0
    else
        if (b mod 2 = 0) then
            confuso := confuso(a+a, b div 2)
    else
        confuso := confuso(a+a, b div 2) + a;
end;
a) Probarlo con los siguientes invocaciones: confuso(2, 17) y confuso(4, 25)
b) Determinar qué función matemática define confuso.
}

