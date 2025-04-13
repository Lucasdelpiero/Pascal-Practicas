program alquileres;

const
    MAX = 9;
type
    vw = array[1..MAX] of word;
    vr = array[1..MAX] of real;

procedure leerArchivo(var vDias, vNclientes: vw; var vRec, vPorcVip: vr; var vN: byte);
var
    tipo: char;
    precio, descTotal: real;
    carpa : word;
    dias, i, pas: byte;
    arch: text;
    vnVipAux: vw;
begin
    vN := 9; // Creo que deberia saberse el vN viendo la centena mas grande
    for i:= 1 to vN do
    begin
        vDias[i]:=0; vNclientes[i]:=0; vRec[i]:=0; vPorcVip[i]:=0; vNvipAux[i]:=0;
    end;

    assign(arch, 'alquileres.txt'); reset(arch);
    readln(arch, precio);

    while not eof(arch) do
    begin
        descTotal := 0;
        readln(arch, carpa, dias, tipo, tipo);
        pas := carpa DIV 100;

        if (dias = 120) then
            descTotal := 0.3
        else
            if (dias > 60) then
                descTotal := 0.15
        else
            if (dias > 30) then
                descTotal := 0.1;

        if tipo = 'P' then
            descTotal := DescTotal + 0.1
        else
            if tipo = 'V' then
            begin
                descTotal := descTotal + 0.2;
                vNvipAux[pas] := vNvipAux[pas] + 1;
            end;

        vDias[pas] := vDias[pas] + dias;
        vRec[pas] := vRec[pas] + precio * (1 - descTotal);
        vNclientes[pas] := vNclientes[pas] + 1;
    end;

    for i:= 1 to vN do
        if vNclientes[i] > 0 then
            vPorcVip[i] := (vNvipAux[i] / vNclientes[i]) * 100;

    close(arch);
end;

function menosAcum(vDias: vw; vRec: vr; vn: byte): byte;
var
    i, menorDias: byte;
begin
    menorDias := 1;

    for i:= 2 to vN do
        if (vDias[i] < vDias[menorDias]) or
                ((vDias[i] = vDias[menorDias]) and (vRec[i] < vRec[menorDias])) then
            menorDias := i;

    menosAcum := menorDias;
end;

procedure promPasVip(vNclientes: vw; vRec, vPorcVip: vr; vN: byte);
var
    x: real;
    i: byte;
begin
    writeln('Ingrese X % de clientes vip'); readln(x);
    for i:= 1 to vN do
    begin
        if (vPorcVip[i] > x) then
            writeln('Rec prom. de pasillo ', i,' : ',(vRec[i]/vnClientes[i]):10:2);
    end;
end;

function primerVip(vPorcVip: vr; vN: byte): byte;
var
    i: byte;
begin
    i := 1;
    while (i < vN) and (vPorcVip[i] <= 30) do
        i := i + 1;

    if vPorcVip[i] > 30 then
        primerVip := i
    else
        primerVip := 0;
end;

procedure primerPas(vPorcVip: vr; vN: byte);
var
    primerPas : byte;
begin
    primerPas := primerVip(vPorcVip, Vn);
    if primerPas <> 0 then
        writeln('El primer pasillo con mas de 30% de vip es: ', primerPas)
    else
        writeln('No existe ningun pasillo con mas de 30% de vip');
end;

var
    vDias, vNclientes: vw;
    vRec, vPorcVip: vr;
    vN: byte;

begin
    leerArchivo(vDias, vNclientes, vRec, vPorcVip, vN);
    writeln('El pasillo con menos dias alquilados es ', menosAcum(vDias, vRec, vN));  // a)
    promPasVip(vNclientes, vRec, vPorcVip, vN);                                                 // b)
    primerPas(vPorcVip, vN);                                                          // c)

    readln();
end.

