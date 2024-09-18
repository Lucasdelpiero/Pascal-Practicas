program componentesrepetidas;
type
    v10 = array[1..10] of integer;
const
    vConst : v10 = (2,2,3,3,3,3,7,9,9,9);

procedure writeVec(vec : v10; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
    begin
        write(vec[i]);
        if  i < vL then
            write(',');
    end;
    writeln();
end;

procedure frec(vec : v10; vL : byte; var newVector : v10;var newVl : byte);
var
    i, nVecL, frecNum : byte;
    nVec : v10;
    num : integer;

begin
    num := vec[1];
    frecNum := 1;
    nVec[1] := frecNum;
    nVecL := 1;

    for i:=2 to vL do
    begin
        if vec[i] = num then
        begin
            frecNum := frecNum + 1;

        end
        else
        begin
            frecNum := 1;
            num := vec[i];
            nVecL := nVecL + 1;
        end;
        nVec[nVecL] := frecNum;
    end;
    newVector := nVec;
    newVl := nVecL;

end;

var
    vector, frecVector : v10;
    vectorL, frecVectorL : byte;
begin
    vector := vConst;
    vectorL := 10;
    writeln('El vector inicial es:');
    writevec(vector, vectorL);
    frec(vector, vectorL, frecVector, frecVectorL);
    writeln('El nuevo vector es:');
    writevec(frecVector, frecVectorL);

    readln()
end.

{
 Ej 8) Dado un arreglo V de N elementos ordenados en forma ascendente con componentes repetidas,
generar W con la frecuencia de los elementos de V. Mostrar W
Ejemplo: N=10; V=(2,2,3,3,3,3,7,9,9,9) -> W=(2,4,1,3)
}

