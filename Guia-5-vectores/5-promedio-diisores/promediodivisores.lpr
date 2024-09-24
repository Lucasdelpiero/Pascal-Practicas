program promediodivisores;
type
    vInt32 = Array[1..32] of integer;
    vProm32 = Array[1..32] of real;

procedure leerArchivo(var vector : vInt32 ;var n : byte);
var
    i : byte;
    arch : text;
    num : integer;
begin
    assign(arch, 'text.txt');
    reset(arch);
    i := 0;

    while not eof(arch) do
    begin
        i := i + 1;
        readln(arch, num);
        vector[i] := num;
    end;
    n := i;
    close(arch);
end;

procedure escribirVector(vector : VInt32; n : byte);
var i : byte;
begin
    for i:=1 to n do
        writeln(vector[i]);
end;

procedure obtenerDivisores(vEnt : vInt32; vEntL : byte ; max : integer;
                        var vSal : vInt32; var VSalL : byte);
var
   i : byte;
begin
    vSalL := 0;

    for i:=1 to vEntL do
    begin
        if (max MOD vEnt[i]) = 0 then
            begin
                vSalL := vSalL + 1;
                vSal[vSalL] := vEnt[i];
            end;
    end;


end;

function maxEnVector(vector : vInt32 ; vL : byte) : integer;
var
    i : byte;
    max : integer;
begin
    max := vector[1];
    for i:=2 to vL do
    begin
        if vector[i] > max then
            max := vector[i];
    end;
    maxEnVector := max;
end;

function promedioVec(vector : vInt32; vL : byte) : real;
var
    i : byte;
    total : real;
begin
    for i:=1 to vL do
        total := total + vector[i];
    promedioVec := total / vL;


end;

var
   arch : text;
   prom : real;
   vInt, vDiv : vInt32;
   num, vIntL, vDivL : byte;

begin
    vIntL := 0;
    vDivL := 0;
    leerArchivo(vInt , vIntL);
    writeln('Los numeros del archivo son');
    escribirVector(vInt, vIntL);
    obtenerDivisores(vInt, vIntL, maxEnVector(vInt,vIntL), vDiv, vDivL);
    writeln('Los divisores de ', maxEnVector(vInt,vIntL));
    escribirVector(vDiv, vDivL);
    prom := promedioVec(vDiv, vDivL);
    writeln('El promedio es: ', prom:0:2);

    readln();
end.

{
 Ej 5) Dado un archivo de enteros, almacenarlos en un arreglo,luego obtener el promedio
 de todos los números divisores del máximo y con ellos armar otro arreglo.
 Mostrar ambos arreglos y el promedio
obtenido
}

