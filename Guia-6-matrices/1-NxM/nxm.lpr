program nxm;
type matI = array[1..32, 1..32] of integer;

procedure writemat(mat : matI; ln, lm: byte);
var i,j : byte;
begin
    for i:=1 to ln do
    begin
        for j:=1 to lm do
        begin
            write(' ', mat[i,j] ,' ');
        end;
    writeln();
    end;

end;

procedure leerArchivo(var mat : matI; var ln, lm : byte);
var
    arch : text;
    i, j : byte;
begin
    assign(arch, 'text.txt');
    reset(arch);
    read(arch, ln, lm);
    for i:=1 to ln do
    begin
        for j:=1 to lm do
        begin
            read(arch, mat[i, j]);
        end;
        readln(arch);
    end;
    close(arch);
end;

procedure maximos(mat: matI; ln, lm: byte; var matM: matI; var mLn, mLm: byte);
var
    i, j : byte;
    max : integer;
begin
    for i:=1 to ln do
    begin
        max := mat[i, 1];
        for j:=2 to lm do
        begin
            if mat[i, j] > max then
                max := mat[i, j];
        end;
        matM[i, 1] := max;
    end;
    mLn := i;
    mLm := 1;

end;

procedure sumaImpares(mat: matI; ln, lm: byte; var matImp : matI; var impLn, impLm : byte );
var i, j : byte;
    suma : integer;
begin
    impLn := 0; // No hay elementos al principio
    impLm := 1;
    for i:=1 to ln do
    begin
        suma := 0;
        for j:=1 to lm do
        begin
            if not (mat[i, j] MOD 2 = 0) then
                suma := suma + mat[i,j];
        end;
        if suma <> 0 then
        begin
            impLn := impLn + 1;
            matImp[impLn, 1] := suma;
        end;
    end;


end;

function promCol(X: integer; mat: matI; ln: byte): real;
var i,j : byte;
    prom : real;
begin
    prom := 0;
    for i:=1 to ln do
        prom := prom + mat[i, X];

    promCol := prom / ln;
end;

var
    mat, matM,matImp : matI;
    ln, lm, mLn, mLm, impLn, impLm : byte;
    X : integer;

begin
    leerArchivo(mat, ln, lm);
    writeln('Matriz original:');
    writemat(mat, ln, lm);
    writeln('Matriz de maximos:');
    maximos(mat, ln, lm, matM, mLn, mLm );
    writemat(matM, mLn, mLm);
    writeln('Matriz de suma de impares');
    sumaImpares(mat, ln, lm, matImp, impLn, impLm);
    writemat(matImp, impLn, impLm);
    writeln('Ingrese X columna a saber el promedio de los elem');
    readln(X);
    if X > lm then
        writeln('El X supera el numero de columnas que hay en la matriz')
    else
        writeln('El promedio es: ', promCol(X, mat, ln):0:2);
    readln();
end.

{
Ej 1) Leer desde un archivo una matriz de NxM elementos enteros, (N y M se encuentran en la primera
línea del archivo y luego en las restantes N líneas vienen los M elementos). Se pide:
a) Generar un arreglo con el máximo de cada fila y mostrarlo.
b) Generar un arreglo con la suma de los impares de cada columna, no generar elemento si la
columna no tiene impares.
c) Dada una columna X, ingresada por el usuario, hallar el promedio de sus elementos.
}

