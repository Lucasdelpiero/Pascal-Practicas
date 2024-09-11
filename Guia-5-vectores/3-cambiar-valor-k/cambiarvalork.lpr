program cambiarvalork;
type
    v32 = Array[1..32] of integer;

procedure writeVec(vec : v32; vecT : byte);
var i : byte;
begin
    for i:=1 to vecT do
        write(vec[i],' ');
    writeln();
end;

procedure reemplazar(var vec : v32; vecT : byte; num: byte);
var i : byte;
begin
  for i:= 1 to vecT do
  begin
    if vec[i] = num then
        vec[i] := 0;
  end;
end;

const
    Vconst : v32 = (1,5,7,4,32,4,5,6,7,8,3,2,6,7,2,1,1,6,7,8,9,2,3,5,6,5,1,12,3,5,6,4);
var
    k : integer;
    V : v32;
    Vt : byte;

begin
    V := Vconst;
    Vt := 32;
    write('Tiene el array: ');
    writeVec(V, Vt);
    writeln('Que numero quiere reemplazar por cero?');
    readln(k);
    writeln('Antes:');
    writeVec(V, Vt);
    reemplazar(V, Vt, k);
    writeln('Despues:');
    writeVec(V, Vt);

    readln();

end.

{
 Ej 3) Dado un arreglo V y un número K, cambiar todas las ocurrencias de K por 0.
}
