program unirarreglo;
type
    TV = array[1..12] of integer;

const
    ARR1 : TV = (1,3,4,10,15,18,0,0,0,0,0,0);
    ARR2 : TV = (2,9,10,10,10,40,0,0,0,0,0,0);

// Hecho solo para practicar
function pos(num: integer ;vec: TV; n: byte): byte;
begin
    if num = vec[n] then
        pos := n
    else
        if n > 1 then
            pos := 0 + pos(num, vec, n - 1)
    else
        pos := 0;
end;

function esta(num: integer; vec: TV; n: byte): boolean;
begin
    if num = vec[n] then // Esta
        esta := true
    else
        if n > 1 then   // No es el numero, sigue buscando
            esta := esta(num, vec, n - 1)
    else        // Llego al final del array entonces NO esta
        esta := false;
end;

procedure agregar(elem: integer;var vec: TV; var n: byte);
begin
    if not esta(elem, vec, n) then
    begin
        n := n + 1;
        vec[n] := elem;
    end;

end;

procedure genVec(vecA, vecB: TV; nA,i, nB, j: byte; var vecC : TV; var nC: byte);

begin
    // Si esta en el intervalo de ambos entonces agrega al menor
    if (i <= nA) and (j <= nB) then
    begin
        if vecA[i] < vecB[j] then // Agrega el A
        begin
            agregar(vecA[i], vecC, nC);
            i := i + 1;
        end
        else
            if vecB[j] < vecA[i] then  // Agrega el B
        begin
            agregar(vecB[j], vecC, nC);
            j := j + 1;
        end
        else    // Estan repetidos, toma 1 y avanza en ambos
        begin
            vecC[nC] := vecA[i];
            i := i + 1;
            j := j + 1;
        end;
        // Se lo vuelve a llamar, ahora que el i/j cambio de valor
        genVec(vecA, vecB, nA,i, nB, j, vecC, nC);
    end;

    if (i < nA) and (j > nB) then
    begin
        agregar(vecA[i], vecC, nC);
        i := i + 1;
        genVec(vecA, vecB, nA,i, nB, j, vecC, nC);
    end
    else
        if (j < nB) and (i > nA) then
        begin
            agregar(vecB[j], vecC, nC);
            j := j + 1;
            genVec(vecA, vecB, nA,i, nB, j, vecC, nC);
        end;

end;

var
    A, B, C : TV;
    nA, nB, nC: byte;
    x: integer;

begin
    A := ARR1;
    B := ARR2;
    nA := 6;
    nB := 6;

    genVec(A,B,nA,1, nB,1,C,nC);
    writeln('Ingres num a buscar, cero para salir');
    repeat
        readln(x);
        if x <> 0 then
            writeln(pos(x, C, nC));
    until x = 0;
    readln();
end.

{
 Ej 10) Dado dos arreglos de enteros A y B ordenados ascendentemente, realizar un algoritmo
recursivo que mezcle ambos arreglos en otro C manteniendo el orden. Cada arreglo no tiene valores
repetidos. Si un valor aparece en ambos arreglos, debe pasar a C uno solo.
}
