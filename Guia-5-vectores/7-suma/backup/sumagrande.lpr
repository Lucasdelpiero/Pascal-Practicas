program sumagrande;
type
    st64 = string[64];
    v64 = Array[1..64] of byte;

procedure writeVec(vec : v64; vl : byte);
var i : byte;
begin
    for i:=1 to vl do
        write(vec[i]);

    writeln();
end;

function invertirVec(vec : v64; vl : byte): v64;
var nVec : v64;
    i : byte;
begin
    for i:= 1 to vl do
        nVec[i] := vec[vl - i + 1];
    invertirVec := nVec;
end;

function vecAstr(vector : v64; vL : byte) : st64;
var
    i : byte;
    aux : st64;
    nStr : st64;
begin
    aux := '';
    for i:=1 to vL do
        begin
            str(vector[i], nStr);
            aux := aux + nStr;

        end;
    vecAstr := aux;

end;
{
 Toma 2 strings, suma sus decimas comenzando por derecha y las añade a un array
 El array contiene el resultado con las decimas al reves.
 Luego invierte el array y ahora si el resultado se muestra como un array
 con cada decima correspondiendole ordenadamente un lugar
}
function sumaVec(n1, n2 : st64) : st64 ;
var
    masGrande, masChico, i, total : byte;
    nGrande, nChico : st64;
    sum : v64;
    sumL : byte;
    int1, int2 : integer;
    error : word;
    carry : byte;
begin
    sumL := 0;
    int1 := 0;
    int2 := 0;
    carry := 0;
    error := 0;
    for i:=1 to 32 do
        sum[i] := 99;

    val(n1, int1, error);
    val(n2, int2, error);
    if int1 >= int2 then
    begin
        nGrande := n1;
        nChico := n2;
    end
    else
    begin
        nGrande := n2;
        nChico := n1;
    end;

    // Suma cada decimal comenzando desde lo mas a la derecha de cada numero
    masGrande := length(nGrande);
    masChico := length(nChico);
    for i:= 0 to masChico do
    begin
        val(nGrande[masGrande - i], int1, error);
        val(nChico[masChico - i], int2, error);
        sumL := sumL + 1;
        total := int1 + int2 + carry;

        // Si es mayor que 10, se suma 1 a un digito mas grande con el carry
        if  (total >= 10)  then
        begin
            carry := 1;
            total := total - 10;
        end
        else
            carry := 0;
            sum[i + 1] := total;
    end;

    { Si el numero mas grande tiene digitos más grandes que el mas chico, entonces
    estos se van a sumar al nuevo array con los carry correspondientes }
    for i := masChico + 1 to masGrande - 1  do
    begin
        val(nGrande[i], int1, error);
        if (int1 <> 0) or ((int1 = 0) and  (i <> masGrande + 1)) then
        begin
            sumL := sumL + 1;
            total := int1  + carry;
            if total = 10 then
                begin
                carry := 1;
                total := total - 10;
                end
            else
                carry := 0;

            sum[sumL] := total;
        end;
    end;
    // Si al final me sobra un digito por el carry, lo agrego al array
    if carry = 1 then
    begin
        sumL := sumL + 1;
        sum[sumL] := 1;
    end;

    sumaVec := vecAstr(invertirVec(sum, sumL), sumL) ;

end;

var
    n1, n2 : st64;
begin
    writeln(int);
    writeln('Ingrese el primer numero para sumar');
    readln(n1);
    writeln('Ingrese el segundo numero a sumar');
    readln(n2);

    writeln('El resultado es: ', sumaVec(n1, n2));

    readln();
end.

