program arreglosreales;
type
    v16 = Array[1..16] of real;
const
    vDes : v16 = (1,6,7,3,12,45,6,4,12,25,58,13,91,7,21,27);
    vOrd : v16 = (1,2,4,5,8,11,12,15,26,56,57,60,61,67,72,84);

function pos(num: real; v: v16; vL: byte) : byte;
begin
    if v[vL] = num then
        pos := vL
    else
        if vL > 1 then
            pos := pos(num, v, vL - 1)
        else
            pos := 0;
end;

function posOrd(num: real; v: v16;pI, pF: byte) : byte;
var target : byte;
begin
    target := (pF + pI - 1) DIV 2;
    if pF - pI < 2 then
        posOrd := 0
    else
        if v[target] = num then
        posOrd := target
    else
        if v[target] > num then
            posOrd := posOrd(num, v, target + 1, pF)
        else
            posOrd := posOrd(num, v, pI, target - 1);
end;

var vec1 , vec2: v16;
    v1L, v2L, res: byte;
    num : real;
    car : char;
begin
    v1L := 16;
    v2L := 16;
    vec1 := vDes;
    vec2 := vOrd;

    writeln('Ingrese X a buscar');
    readln(num);
    writeln('Esta ordenado? S/N');
    readln(car);
    if upcase(car) = 'S' then
        res := posOrd(num, vec2, 1, v2L)
    else
        res := pos(num, vec1, v1L);

    if res <> 0 then
        writeln('Posicion en: ', res)
    else
        writeln('No se encontro el numero');



    readln();
end.

{
 Ej 6) Sea A un arreglo de reales y un valor X real ingresado por teclado,
 se pide determinar en qué posición se encuentra X, devolver 0 en caso de no encontrarlo.
 Implementar:
a) considerando el arreglo desordenado, una búsqueda lineal recursiva.
b) para un arreglo ordenado en forma ascendente, una búsqueda binaria recursiva
}

