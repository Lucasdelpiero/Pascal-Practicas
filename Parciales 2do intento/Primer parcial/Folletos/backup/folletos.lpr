program folletos;
const
  MAX_LENGTH = 300;
type
    vB = array[1..MAX_LENGTH] of byte;
    vR = array[1..MAX_LENGTH] of real;
    st16 = string[16];
var
    vCant, vMasL: vB;
    vCosto: vR;
    vN, n: byte;
    costo: real;

function calcCosto(tipo: char; tamanio: byte; cant: byte): real;
var costo: real;
begin
    costo := cant;
    case tipo of
        'A': costo := costo * 2;
        'B': costo := costo * 3;
        'C': costo := costo * 5;
    end;

    if tamanio = 2 then
        costo := costo * 1.5;

    calcCosto := costo;
end;

procedure leerArchivo(dir: string; var vCant: vB; var vMasL: vB;
            var vCosto: vR; var vN: byte);
var
    costo: real;
    pal: st16;
    tipo, car: char;
    cantPal, masL, tamanio: byte;
    arch: text;

begin
    assign(arch, dir); reset(arch);
    vN := 0;

    while not eof(arch) do
    begin
        cantPal:= 0; masL:= 0;
        read(arch, tipo, tamanio, car);
        while car <> '.' do
            begin
            while car = ' ' do
                read(arch, car);

            pal:= '';
            while (car <> ' ') and (car <> '.') do
                begin
                pal := pal + car;
                read(arch, car);
                end;

            if length(pal) > masL then
                masL := length(pal);

            cantPal := cantPal + 1;
            //read(arch, car);
            {El ciclo que contiene este read ya puede salir
            del ciclo con el read de los espacios o palabras, que leen el sig
            caracter, con el que se puede salir de alli}
            end;
        vN := vN + 1;
        vCant[vN] := cantPal;
        vMasL[vN] := MasL;
        vCosto[vN] := calcCosto(tipo, tamanio, cantPal);
        readln(arch);
    end;
    close(arch);
end;

function costoMlargo(vMasL: vB; vCosto: vR; vN: byte): real;
var
    masL, cant, i: byte;
    costo: real;
begin
    masL:= 0; cant:= 0; costo:= 0;

    for i:=1 to vN do
    begin
        if vMasL[i] > masL then
            begin
            masL := vMasL[i];
            cant := 1;
            costo := vCosto[i]
            end
        else
            if vMasL[i] = masL then
            begin
                cant := cant + 1;
                costo := costo + Vcosto[i];
            end;
    end;

    costoMlargo :=  costo / cant;
end;

function nCosto(n: byte; vCant: vB; vCosto: vR; vN: byte): real;
var i: byte;
begin
    i := 1;
    while (i < vN) and (vCant[i] <> n) do
        i := i + 1;
    if vCant[i] = n then
        nCosto := vCosto[i]
    else
        nCosto := -1;
end;

procedure indicarNcosto(n: byte; vCant: vB; vCosto: vR; vB: byte);
var costo: real;
begin
    costo := nCosto(N, vCant, vCosto, vN);
    if costo = -1 then
        writeln('No se encontro el folleto con ', n, ' palabras')
    else
        writeln('El costo es: ', costo:6:2);
end;


begin
    leerArchivo('datos.txt', vCant, vMasl, vCosto, vN);
    writeln('El costo del folleto con l apalabra mas larga es: ',
        costoMlargo(vMasl, vCosto, vN):6:2);
    writeln('Ingrese N para buscar costo'); readln(n);
    indicarNcosto(N, vCant, vCosto, vN);

    readln();
end.

