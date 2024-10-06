program Planos;
type
    punto = record
        x, y : real;
        cuad : byte;
    end;
    plano = array[1..32] of punto;
    cuadrantes = array[1..4] of byte;

function distancia(punto1, punto2 : punto): real;
begin
    distancia := sqrt(sqr(punto1.x - punto2.x) + sqr(punto1.y - punto2.y));
end;

procedure writevec(pl: plano; l: byte);
var i : byte;
begin
    for i:=1 to l do
        with pl[i] do
        begin
            writeln('(X,Y) = (', x:6:2,',', y:6:2, ') Cuad: ', cuad);
        end;
end;

procedure leerArchivo(var pl : plano; var l: byte);
var arch : text;

begin
    assign(arch, 'text.txt');
    reset(arch);
    l := 0;
    while not eof(arch) do
    begin
        l := l + 1;
        with pl[l] do
        begin
            readln(arch, x, y);
            if y >= 0 then
            begin
                if x >= 0 then
                    cuad := 1
                else
                    cuad := 2;
            end
            else
                if x < 0 then
                    cuad := 3
                else
                    cuad := 4;
        end;

    end;

    close(arch);
end;

procedure infoDistancia(pl: plano; l: byte);
var i: byte;
    masL, masC, centro: punto;
    distML, distMC, dist : real;
begin
    centro.x := 0;
    centro.y := 0;
    centro.cuad := 1;
    masL := pl[1];
    distML := distancia(masL, centro);
    masC := pl[1];
    distMC := distancia(masC, centro);

    for i:=2 to l do
    begin
        dist := distancia(pl[i], centro);
        if dist > distML then
        begin
            masL := pl[i];
            distML := dist;
        end;
        if dist < distMC then
        begin
            masC := pl[i];
            distMC := dist;
        end;
    end;

    writeln('El punto mas lejano del centro es el de (', masL.x:6:2,',',masL.y:6:2,')');
    writeln('El punto mas cercano del centro es el de (', masC.X:6:2,',',masC.y:6:2,')');
end;

procedure infoCuadrantes(pl: plano; l: byte);
var i: byte;
    cuad : cuadrantes;
begin
    for i:=1 to 4 do
        cuad[i] := 0;
    for i:=1 to l do
        cuad[pl[i].cuad] := cuad[pl[i].cuad] + 1;
    for i:=1 to 4 do
    begin
        if cuad[i] > 0 then
            writeln('Cuad ',i,': %', (100 *cuad[i] / l):6:2)
        else
            writeln('No hay puntos en el cuadrante ', i);
    end;
end;

var
    pl: plano;
    l : byte;

begin
    leerArchivo(pl, l);
    writevec(pl, l);
    infoDistancia(pl,l);
    infoCuadrantes(pl,l);

    readln();
end.
{
 Ej 3) Dado un conjunto de puntos en el plano, almacenar en un arreglo sus coordenadas junto
 con la distancia al centro de coordenadas y a qué cuadrante pertenece.
Usando el arreglo, se pide:
- Informar el más cercano y más lejano al centro.
- Porcentaje de puntos en cada cuadrante (1..4, centro, eje X, eje Y).
Cada punto en el plano P tiene una coordenada X y otra Y.
Desarrollar la función Distancia que dados dos puntos P y Q devuelva la distancia entre ambos.
}

