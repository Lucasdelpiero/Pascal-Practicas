program parcial;
const
    MAX_MAT = 8;
    MAX_RES = 16;

type
    TMc = array[1..MAX_MAT, 1..MAX_MAT] of char;
    result = record
        col: byte;
        porc: real;
    end;

    VR = array[1..MAX_RES] of result;

function cantMayus(mat: TMc; i, j: byte): byte;
var sum: byte;
begin
    if i = 0 then
        cantMayus := 0
    else
    begin
        sum := 0;
        case mat[i, j] of
        'A'..'Z': sum := 1;
        end;
        cantMayus := sum + cantMayus(mat, i - 1, j);
    end;
end;

function porcentaje(mat: TMc; NM, j: byte): real;
begin
    porcentaje := ( cantMayus(mat, NM, j) * 100 ) / NM;
end;

procedure leerArchivo(var mat: TMc; var n: byte; var m: byte);
var i, j: byte;
    arch: text;
    car: char;
begin
    assign(arch, 'datos.txt'); reset(arch);
    i := 1; j:= 0;
    readln(arch, n, m);

    repeat
        read(arch, car);
        if car <> ' ' then
        begin
            j := j + 1;
            if j > m then
            begin
                j := 0;
                i := i + 1;
                readln(arch);
            end;
            mat[i, j] := car;
        end;

    until eof(arch);
    close(arch);
end;

procedure mostrarVec(vec: VR; n: byte);
begin
    if n > 1 then
        mostrarVec(vec, n - 1);
    if n <= 3 then
            writeln(vec[n].col,'  ',vec[n].porc:2:2);

end;

procedure inserteOrd(var vec: VR; var n: byte; res: result);
var i: byte;
begin
    i := n;
    while (i > 0) and (res.porc > vec[i].porc) do
    begin
        vec[i + 1].col := vec[i].col;
        vec[i + 1].porc := vec[i].porc;
        i := - 1;
    end;
    n := n + 1;
    vec[i + 1].col := res.col;
    vec[i + 1].porc := res.porc;

end;

procedure genVec(var vec: VR; var VN: byte; mat: TMc; n, m: byte);
var i, j: byte;
    temp: result;
begin
    for j:= 1 to m do
    begin
        temp.col := j;
        temp.porc := porcentaje(mat,n,j);
        inserteOrd(vec, VN, temp);
    end;
end;

var
    mat: TMc;
    n, m, VN: byte;
    vec: VR;

begin
    leerArchivo(mat, n, m);
    genvec(vec, VN, mat, n, m);
    mostrarVec(vec, VN);

    readln();
end.

