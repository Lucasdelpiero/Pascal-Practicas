program matriz;
type TM = array[1..5,1..5] of integer;
const C_MAT : TM = (
                    (1,1,1,5,6),
                    (0,1,3,5,6),
                    (0,0,3,5,6),
                    (0,0,3,5,6),
                    (0,0,1,1,6)
                    );
    C_MAT_2 : TM = (
                    (1,1,1,5,6),
                    (0,1,3,5,6),
                    (0,0,3,5,6),
                    (0,8,3,5,6),
                    (0,0,1,1,6)
                    );

function sumaFila(mat: TM; i,j: byte) : integer;
begin
    if j = 0 then
        sumaFila := 0
    else
        sumaFila := mat[i,j] + sumaFila(mat, i, j - 1);
end;

function cumple(mat: TM;i, j, colum, diag: byte): boolean;
var
    suma : integer;
begin
    suma := sumaFila(mat,i , i - 1);
    if i = 0 then
        cumple := true   // Llego al final de la matriz entonces es verdadero
    else
        if (suma <= mat[i,j]) then
            begin
            if j > diag + 1 then
                cumple := cumple(mat, i, j - 1, colum, i) // Se mueve una columna a la izq
            else
                cumple := cumple(mat, i - 1, colum, colum, i - 1); // Sube fila
            end
        else
            cumple := false; // No es mayor a la suma, es falso
end;

procedure writeMat(mat: TM; M: byte);
var i,j: byte;
begin
    for i:=1 to M do
    begin
        for j:=1 to M do
        begin
            write(mat[i,j]);
            if j < M then
                write(', ');
        end;
        writeln();
    end;

end;

var mat, mat2 : TM;
begin
    mat := C_MAT;
    mat2 := C_MAT_2;

    writeMat(mat,5);
    if cumple(mat, 5, 5, 5, 5) then
        writeln('Cumple')
    else
        writeln('No cumple');

    writeMat(mat2,5);
    if cumple(mat2, 5, 5, 5, 5) then
        writeln('Cumple')
    else
        writeln('No cumple');

    readln();
end.
{
 Ej 12) Verificar si una matriz A de NxN de números enteros cumple que para cada fila el elemento
respectivo de la diagonal principal es mayor a la suma del resto de los elementos de la fila.
}

