program competencia;
type
    st = string[20];
    res = array[1..8] of st;
    rClub = record
        nombre : st;
        jugados : byte;
        resultados : res;
        puntaje : byte;
    end;
    vClubes = array[1..8] of rClub;
    rTabla = record
        clubes : vClubes;
        l : byte;
    end;

function invictos(tabla: rTabla) : real;
var i,j , cont : byte;
    invicto : boolean;
begin
    cont := 0;
    for i:=1 to tabla.l do
    begin
        invicto := true;
        for j:=1 to tabla.clubes[i].jugados do
        begin
            if tabla.clubes[i].resultados[j] = 'P' then
                invicto := false;
        end;
        if invicto then
            cont := cont + 1;
    end;
    invictos := 100 * cont / tabla.l;

end;

procedure leerArchivo(var tabla: rTabla);
var i: byte;
    arch: text;
begin
    assign(arch, 'text.txt');
    reset(arch);
    tabla.l := 0;
    while not eof(arch) do
    begin
        tabla.l := tabla.l + 1;
        with tabla.clubes[tabla.l] do
        begin
            puntaje := 0;
            readln(arch, nombre);
            readln(arch, jugados);
            for i:=1 to jugados do
                readln(arch, resultados[i]);

            for i:=1 to jugados do
            begin
                if resultados[i] = 'G' then
                    puntaje := puntaje + 3
                else
                    if resultados[i] = 'E' then
                        puntaje := puntaje + 1;
            end;
        end;
    end;

    close(arch);
end;

procedure listado(tabla: rTabla);
var i : byte;
begin
    for i:=1 to tabla.l do
    begin
        with tabla.clubes[i] do
        begin
            writeln(nombre,' ',puntaje,' pts');
        end;
    end;
end;

procedure punteros(tabla: rTabla);
var i, masAlto: byte;
begin
    masAlto := tabla.clubes[1].puntaje;
    for i:=1 to tabla.l do
        if tabla.clubes[i].puntaje > masAlto then
            masAlto := tabla.clubes[i].puntaje;
    writeln('El/Los punteros es/son');
    for i:=1 to tabla.l do
        if tabla.clubes[i].puntaje = masAlto then
            writeln(tabla.clubes[i].nombre);

end;

var
    tabla : rTabla;

begin
    leerArchivo(tabla);
    writeln('Listado de clubes y puntaje');
    listado(tabla);
    punteros(tabla);
    writeln('Equipos invictos %', invictos(tabla):0:2);


    readln();
end.

{
 Ej 4) En una competencia intervienen N equipos deportivos de los cuales se registró:
- Nombre del Club
- Cantidad de partidos jugados
- El resultado de cada encuentro ( G = ganado, E = empatado, P = perdido)
Se pide almacenar los datos en una estructura adecuada junto con el total del puntaje obtenido.
Por cada partido ganado son 3 puntos, empatado 1 y perdido 0.
A partir de lo almacenado, informar:
a) Listado con los nombres de los clubes junto con el puntaje obtenido.
b) Nombre de el/los punteros de la Tabla.
c) Porcentaje de los que no perdieron ningún partido sobre el total de clubes.
}

