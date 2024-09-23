program alquiler;
type
    st7 = String[7];
    vSt = Array[1..32] of st7;
    vR = Array[1..32] of real;
    vB = Array[1..32] of byte;

function menosRecaudo(patentes : vSt; recaudacion : vR; vL : byte) : st7;
var
    i, pos : byte;
    cantidad : real;
begin
    pos := 1;
    cantidad := recaudacion[1];

    for i:=2 to vL do
        if recaudacion[i] < cantidad then
        begin
            cantidad := recaudacion[i];
            pos := i;
        end;
    menosRecaudo := patentes[pos];
end;

procedure writeVec(pat : vSt; rec : vR; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
    begin
        writeln(pat[i],': $ ',rec[i]:8:2);
    end;

end;

function posEnArray(patente : st7; patentes : vSt; vL : byte) : byte;
var i, pos : byte;
begin
    pos := 0;
    for i:=1 to vL do
        if patente = patentes[i] then
            pos := i;

    posEnArray := pos;
end;

procedure leerArchivo(var patentes : vSt; var recaudacion : vR; var vL : byte);
var
    arch : text;
    patente : st7;
    rec : real;
begin
    assign(arch, 'text.txt');
    reset(arch);
    vL := 0;

    while not eof(arch) do
    begin
        readln(arch, patente, rec);
        vL := vL + 1;
        patentes[vL] := patente;
        recaudacion[vL] := rec;
    end;
end;

procedure compactar(var patentes : vSt; var recaudacion : vR;var dias: vB; var vL : byte);
var
    nPatentes : vSt;
    nRecaudacion: vR;
    i, nVl, pos : byte;
begin
    nVl := 0;

    for i:=1 to vL do
    begin
        nPatentes[i] := '';
        nRecaudacion[i] := 0;
        dias[i] := 0;
    end;

    for i:=1 to vL do
    begin
        pos := posEnArray(patentes[i],  nPatentes, vL);
        if pos = 0 then
            begin
                nVl := nVl + 1;
                nPatentes[nVl] := patentes[i];
                nRecaudacion[nVl] := recaudacion[i];
                dias[i] := 1;
            end
        else
        begin
            nRecaudacion[pos] := nRecaudacion[pos] + recaudacion[i];
            dias[pos] := dias[pos] + 1;
        end;
    end;

    patentes := nPatentes;
    recaudacion := nRecaudacion;
    vL := nVl;

end;

procedure promedio(pantentes : vSt; recaudacion : vR; dias : vB; vL : byte);
var i : byte;
begin
    for i:= 1 to vL do
        writeln(pantentes[i], ': ', (recaudacion[i] /dias[i]):8:2);
end;

procedure superaron(patentes : vSt; recaudacion: vR; vL : byte);
var i : byte;
    num : real;
begin
    writeln('b) Ingrese el numero a superar');
    readln(num);
    for i:=1 to vL do
        if recaudacion[i] > num then
            writeln(patentes[i]);

end;

var
    patentes : vSt;
    recaudacion : vR;
    dias : vB;
    vL : byte;

begin
    //writeln('Datos iniciales:');
    leerArchivo(patentes, recaudacion, vL);
    //writeVec(patentes, recaudacion, vL);
    //writeln('Compacto :');
    compactar(patentes, recaudacion, dias , vL);
    //writeVec(patentes, recaudacion, vL);
    writeln('a) Promedio por cada patente:');
    promedio(patentes, recaudacion, dias, vL);
    superaron(patentes, recaudacion, vL);
    writeln('c) Quien menos recaudo es: ', menosRecaudo(patentes,recaudacion, vL) );

    readln();
end.

{
 Ej 14) Una empresa de autos de alquiler grabó en cada línea del archivo
la patente del vehículo (cadena
de 7) y el total recaudado en el día. Se pide leer los datos en dos arreglos paralelos
e informar:
a) El promedio recaudado por auto.
b) Las patentes de los vehículos que superaron en la recaudación X pesos (X es dato).
c) La patente del que recaudó menos
}
