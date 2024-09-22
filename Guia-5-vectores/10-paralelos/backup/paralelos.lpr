program paralelos;
    type vT = array[1..17] of integer;

    const
        vecConst : vT = (3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2);

procedure writeVec(vec : vT; vecL : byte);
var i : byte;
begin
    for i:=1 to vecL do
    begin
        write(vec[i]);
        if i < vecL then
            write(',');
    end;
    writeln();

end;
// Hecho con while
procedure genWhile(vecA : vT; vecAl : byte; var vecB, vecC : vT;var vecBl : byte);
var i , contSum: byte;
    totalSum : integer;
begin
    i := 1;
    vecBl := 0;
    while i < vecAl do
    begin
        if vecA[i] < 0 then
        begin
            totalSum := 0;
            contSum := 0;
            i := i + 1;
            while (i < vecAl) and (vecA[i] > 0) do
            begin
                totalSum := totalSum + vecA[i];
                contSum := contSum + 1;
                i := i + 1;
            end;
            if vecA[i] < 0 then
            begin
                vecBl := vecBl + 1;
                vecB[vecBl] := totalSum;
                vecC[vecBl] := contSum;
            end;
        end
        else
            i:= i + 1;

    end;
    writeVec(vecB, vecBl);
    writeVec(vecC, vecBl);
end;

// Hecho con un for loop
procedure genParalelos(vecA : vT; vecAl : byte; var vecB, vecC : vT;var vecBl : byte);
var i , contSum: byte;
    isInside : boolean;
    totalSum : integer;
begin
    isInside := false;
    totalSum := 0;
    contSum := 0;
    vecBl := 0;
    for i:=1 to vecAl do
    begin
        if vecA[i] < 0 then
        begin
            if not isInside then
                isInside := true
            else
            begin
                vecBl := vecBl + 1;
                vecB[vecBl] := totalSum;
                vecC[vecBl] := contSum;
                totalSum := 0;
                contSum := 0;
            end;
        end
        else
        begin
            if isInside then
            begin
                totalSum := totalSum + vecA[i];
                contSum := contSum + 1;
            end;
        end;
    end;

    writeVec(vecB, vecBl);
    writeVec(vecC, vecBl);
end;

var
    vecA, vecB, vecC : vT;
    vecAL, vecBL : byte;
begin
    vecA := vecConst;
    vecAl := 17;

    genParalelos(vecA, vecAl, vecB, vecC, vecBl);
    genWhile(vecA, vecAl, vecB, vecC, vecBl);

    readln();
end.
{
Ej 10) Dado un arreglo A, generar dos arreglos paralelos B y C donde B contiene la suma de los
elementos de A que están entre dos negativos y C la cantidad que se sumó. Mostrar B y C.
Ejemplo:
A=(3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2)  B=(13, 12, 0, 17) C=(3, 2, 0, 3)
}

