program insercion_ordenada;
type
    TV = array[1..16] of integer;

procedure writevec(vec: TV; n: byte);
var i: byte;
begin
    for i:=1 to n do
    begin
        if i = 1 then
            write('(');
        write(n);
        if i <> n then
            write(', ');
        if i = n then
            write(')');
    end;
    writeln();
end;

procedure inserteOrd(var vec: TV; var n: byte; x: integer);
var i: byte;
begin
    i:= n;
    while (i > 0) and (x < vec[i]) do
    begin
        vec[i + 1] := vec[i];
        i := i - 1;
    end;
    vec[i + 1] := x;
    n := n + 1;
end;

var
    vec : TV;
    n, i: byte;
    x: integer;
begin
    n := 0;
    for i:= 1 to 16 do
        vec[i] := 0;
    repeat
        readln(x);
        inserteOrd(vec, n, x);
        writeVec(vec, n);
    until x = 0;

end.

