program maximo;
type
    m3 = Array[1..3,1..3] of real;
const
    matriz : m3 = ((1,5,6),(2,5,8),(56,7,3));


procedure max(m: m3; fF, fA, cF, cA: byte ; var mval: real);
var val : real;
begin
    val := m[fA, cA];
    if val > mval then
        mval := val;
    if cA - 1 < 1 then
        if fA - 1 < 1 then
            mval := mval // al dope
        else
           max(m, fF, fA - 1, cF, cA , mval)
    else
        max(m, fF, fA, cF, cA - 1, mval);
end;

procedure hallarMax(m: m3;f, c: byte;var num: real);
begin
    num := m[f,c];
    max(m, 3, 3, 3, 3, num);
end;

var
    m : m3;
    num : real;
begin
    m := matriz;
    hallarMax(m,3,3,num);
    writeln('El numero mayor es: ', num:0:2);

    readln();
end.

