program maximo;
type
    tM = Array[1..3,1..3] of real;
const
    MATRIZ_CONST : tM = ((1,5,6),(2,5,8),(56,7,3));


// Procedimiento horrendo dejado a modo de como no hay que hacerlo
procedure max(m: tM; fF, fA, cF, cA: byte ; var mval: real);
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

// Maximo numero en una matriz de forma bien hecha
function maxBien(matriz: tM; filaN, i, colN, j: byte) : real;
var val : real;
begin
    if i > 1 then
        if j <> 1 then  // Se mueve a columna de izquierda
            val := maxBien(matriz, filaN, i, colN, j - 1)
        else            // Se mueve a fila de arriba y la columna va al final
            val := maxBien(matriz, filaN, i - 1, colN, colN)
    else
        if j <> 1 then  // Se mueve a columna de izquierda   (Como sacar esto?)
            val := maxBien(matriz, filaN, i, colN, j - 1)
        else   // Llego a la esq. sup. de la matriz y devuelve el numero
            val := matriz[1,1];

    {La matriz se desarma hasta que se comparan valor a valor y devuelve el mayor
    en cada comparacion de a pares}
    if val > matriz[i, j] then
            maxBien := val
    else
            maxBien := matriz[i, j];
end;

function hallarMax(matriz: tM;filas, columnas: byte) : real;
begin
    hallarMax := maxBien(matriz, filas, filas, columnas, columnas);
end;

var
    matriz : tM;
begin
    matriz := MATRIZ_CONST;
    writeln('El numero mayor es: ', hallarMax(matriz,3,3):0:2);

    readln();
end.

