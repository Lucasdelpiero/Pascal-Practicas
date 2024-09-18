program dosarreglos;
type v32 = array[1..32] of integer;


procedure writeVec(vect : v32; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
    begin
        write(vect[i]);
        if i <> vL then
            write(',');
    end;
    writeln();

end;

procedure genAscendente(vect : v32; vL : byte; var nVect : v32;var nVectL : byte);
var
    i : byte;
    masGrande : integer;
begin
    masGrande := vect[1];
    nVectL := 1;
    nVect[nVectL] := masGrande;
    for i:=2 to vL do
    begin
        if vect[i] > masGrande then
        begin
            nVectL := nVectL + 1;
            masGrande := vect[i];
            nVect[nVectL] := masGrande;
        end;

    end;
end;

procedure genSimetria(vectA : v32; vectAl : byte; var vectB : v32; var vectBl : byte );
var i : byte;
begin
    vectB := vectA;
    vectBl := vectAl;
    for i:=1 to vectAl DIV 2 do
    begin
        if (vectB[vectBl - i + 1] mod vectB[i])  <> 0 then
        begin
            vectB[vectBl - i + 1] := 0;
            vectB[i] := 0;
        end;
    end;

end;

var
    arch : text;
    vectI, vectA, vectB : v32;
    vectIL, vectAl, vectBl : byte;
    num : integer;
begin
    assign(arch, 'text.txt');
    reset(arch);
    vectIL := 0;

    while not eof(arch) do
    begin
        readln(arch, num);
        vectIL := vectIL + 1;
        vectI[vectIL] := num;
    end;
    writeln('El vect inicial es: ');
    writeVec(vectI, vectIL);

    genAscendente(vectI, vectIl, vectA, vectAl);
    writeln('El vector del conjunto A es:');
    writevec(vectA, vectAl);

    genSimetria(vectA, vectAl, vectB, vectBl);
    writeln('El vector del conjunto B es:');
    writevec(vectB, vectBl);


    readln();
end.

{
 Ej 9) Dado un archivo de números enteros no nulos, almacenar en un arreglo A aquellos que formen una
secuencia ascendente. A partir de A generar B con la misma cantidad de elementos de A pero poniendo
ceros en aquellas componentes simétricas donde la simétrica derecha no sea múltiplo de la izquierda.
Escribir ambos arreglos.
Ejemplo: Archivo: 5, 7, 1, 12, 15, -10, 10, 24, -25, 26, 50, 13
A = (5, 7, 12, 15, 24, 26, 50) -> B= (5, 0, 12, 15, 24, 0, 50)
}
