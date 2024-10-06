program matrizrala;
type
    rElem = record
        col, fila: byte;
        valor : integer;
    end;
    vE = array[1..16] of rElem;
    mI = array[1..16, 1..16] of integer;

procedure writeMat(matriz: mI; n, m: byte);
var i,j: byte;
begin
for i:=1 to n do
begin
    for j:=1 to m do
    begin
        write(matriz[i,j],' ');
    end;
    writeln();
end;

end;

procedure ingresoDatos(var vector: vE;var vL: byte);
var i, j: byte;
    valor: integer;
begin
    vl := 0;
    repeat
        writeln('Ingrese valor del elemento o cero para salir');
        readln(valor);
        if valor <> 0 then
        begin
            vl := vl + 1;
            writeln('Ingrese i:');
            readln(i);
            writeln('Ingrese j:');
            readln(j);
            vector[vl].col := i;
            vector[vl].fila := j;
            vector[vl].valor := valor;
        end;

    until valor = 0 ;

end;
procedure matrizRellenando(vector: vE; vl, n, m: byte; var matriz: mI);
var i, j: byte;
begin
    for i:=1 to n do
        for j:=1 to m do
            matriz[i,j] := 0;
    for i:=1 to vl do
    begin
        matriz[vector[i].col, vector[i].fila] := vector[i].valor;
    end;
end;

procedure trasponer(var matriz: mI; n,m: byte);
var i, j: byte;
    aux : integer;
begin
    i := 1;
    j := 1;
    while i <= j do
    begin
        while j <= m do
        begin
            aux := matriz[i,j];
            matriz[i,j] := matriz[j, i];
            matriz[j,i] := aux;
            j := j + 1;
        end;
        i := i + 1;
    end;
end;

var
    n,m, vL : byte;
    vector : vE;
    matriz : mI;

begin
    writeln('Ingrese n');
    readln(n);
    writeln('Ingrese m');
    readln(m);
    ingresoDatos(vector, vl);
    matrizRellenando(vector, vl, n, m, matriz);
    writeMat(matriz, n, m);
    if n = m then
    begin
        writeln('Traspuesta: ');
        trasponer(matriz, n, m);
        writeMat(matriz, n, m);
    end;

    readln();
end.

{
 Ej 5) Ingresar N y M y luego los elementos no nulos de una matriz rala por filas (i, j, valor)
 y almacenar en n arreglo de registros.
a) Mostrar en formato matricial completando los ceros faltantes.
b) Si es cuadrada, modificarla para obtener la traspuesta.
}

