program parimpar;

function f(i: word): word;
begin
    if i = 0 then
        f := 1
    else
        if (i mod 2) = 0 then
            f:= 1 + f(i - 1)
    else
        f := f(i-1);
end;
var
    num : word;
begin
    repeat
        writeln('Ingrese num o cero para salir');
        readln(num);
        writeln(f(num));
    until num = 0 ;
end.

