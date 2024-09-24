program peaje;
type
    vR = Array[1..32] of real;
    vB = Array[1..32] of byte;

procedure writeAte( vec : vB ; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
        writeln('Cab ', i,': ', vec[i]);
end;

procedure writeRec( vec : vR ; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
        writeln('Cab ', i,': $ ', vec[i]:6:2);
end;


procedure leerArchivo(var recaudacion : vR; var atendidos : vB; var vL : byte);
var
    i : byte;
    arch : text;
    cabina, tipo, hora : byte;
    tarifa : real;

begin
    assign(arch, 'text.txt');
    reset(arch);
    vL := 0;
    tarifa := 0;

    for i:=1 to 32 do
        begin
            recaudacion[i] := 0;
            atendidos[i]:= 0;
        end;

    while not eof(arch) do
    begin
        readln(arch,cabina, tipo, hora);
        if cabina > vL then
            vL := cabina;
        case tipo of
            2: tarifa := 150;
            1,3: tarifa := 300;
            4: tarifa := 470;
            5: tarifa :=390;
        end;
        if (hora > 10) and (hora < 18) then
            tarifa := tarifa * 1.1;
        recaudacion[cabina] := recaudacion[cabina] + tarifa;
        atendidos[cabina]:= atendidos[cabina] + 1;
    end;
    close(arch);
end;

var
    recaudacion : vR;
    atendidos : vB;
    vL : byte;
begin
    leerArchivo(recaudacion, atendidos , vL);

    writeln('La recaudacion por cada cabina es:');
    writeRec(recaudacion, vL);
    writeln('La cantidad de atendidos por cabina es:');
    writeAte(atendidos, vL);

    readln();
end.

{
 Ej 13) En una estación de peaje hay N cabinas por donde pasan varios vehículos. Desde un archivo se lee
la siguiente información:
• Número de cabina
• Tipo de vehículo (1=auto, 2=moto, 3=camioneta, 4=camión, 5=colectivo)
• Hora (0..23)
Las tarifas son: moto = $150, auto y camioneta = $300, camión = $470, colectivo = $390.
Si la hora está entre las 10 y las 18 sufre un incremento del 10%.
Calcular e informar:
a) Cuántos vehículos atendió cada una de las N cabinas.
b) Cuál fue la que más importe recaudó
}
