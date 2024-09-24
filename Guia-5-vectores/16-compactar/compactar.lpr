program compactar;
type
    vInt = Array[1..16] of integer;
    vI = Array[1..8] of integer;

const
    vConst : vInt = (1,2,2,3,4,3,3,5,6,4,5,6,4,5,3,6);
    v8 : vI = (1,2,2,3,4,3,3,5);

procedure writevec(vec : vInt; vL : byte);
var i : byte;
begin
    for i:= 1 to vL do
        write(vec[i], ', ');
    writeln();
end;
procedure comp2(var vec : vInt;var vL : byte);
var i, j, k, tam : byte;
    cambio : boolean;
    num : integer;
begin
    i := 1;
    while i < vL do
    begin
        j := i + 1;
        num := vec[i];
        while (j < vL) or (num <> vec[j]) do
        begin

        if num = vec[j] then
        begin
            writeln('Se repite el ', num,' en la pos ', j);
            k := j;
            while k < vL + 1  do
            begin
                vec[k] := vec[k+1];
                k := k + 1;
                i := 1
            end;
            vL := vL - 1;
        end;
        j := j + 1;
        end;
       i := i + 1;
       writevec(vec, vL);
    end;

end;

procedure comp(var vec : vInt;var vL : byte);
var i, j, k, tam : byte;
    cambio : boolean;
begin
    i := 1;
    while i < vL - 1 do
    begin
        if (i = 6) and (vL = 8) then
            writeln('kys');
        j := i + 1;
        cambio := false;
        while j < vL + 1   do
        begin
            if vec[i] = vec[j] then
            begin
                writeln('Los de pos ',i,':',j,' son iguales: ', vec[i]);

                k := j;
                while k < vL + 1  do
                begin
                    //writeln('reemplaza ', vec[k],' por ', vec[k+1]);
                    vec[k] := vec[k+1];
                    k := k + 1;
                    cambio := true;
                    //writevec(vec, vL - 1);
                end;
                i := 0;
                writeln('Resta tamanio');
                vL := vL - 1;
                //writevec(vec, vL);

            end;
            //writevec(vec, vL);
            j := j + 1;
        end;
        writevec(vec, vL);
        i := i + 1;
        if cambio then
        begin
            writeln('Hubo cambio');
            i := 6;
        end;
    end;
   // vL := vL - 1;

end;
var
    arr : vInt;
    arr2 : vI;
    vL : byte;
    vL2 : byte;
begin
    arr := vConst;
    arr2 := v8;
    vL := 16;
    vl2 := 8;
    writevec(arr, vl);
    //comp(arr, vl);
    comp2(arr,vl);
    writevec(arr, vl);

    readln();
end.

