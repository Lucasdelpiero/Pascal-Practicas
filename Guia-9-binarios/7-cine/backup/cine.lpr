program cine;
const CENTINELA = 'ZZZZ';
type
    st3 = string[3];
    st4 = string[4];
    regSal = record
        cine : st4;
        zona : byte;
        cap : word;
    end;
    regPel = record
        cine : st4;
        peli : st3;
        ventas : word;
    end;
    arSal = file of regSal;
    arPel = file of regPel;
    vw = array[1..10] of word;
    vs3 = array[1..40] of st3;

procedure crearArSal(var arch: arSal);
var archT : text;
    temp: regSal;
    tcine: st4;
    tzona: byte;
    tcap: word;
begin
    assign(arch, 'SALAS.DAT');
    rewrite(arch);
    assign(archT, 'SALAS.txt');
    reset(archT);
    readln(archT, tcine, tzona, tcap);

    while not eof(archT) do
        begin
        with temp do
            begin
            cine:= tcine;
            zona:= tzona;
            cap:= tcap;
            end;
        write(arch, temp);
        readln(archT, tcine, tzona, tcap);
        end;
    temp.cine:= tcine;
    write(arch, temp); // agrega centinela
    close(archT);
    close(arch);
end;

procedure leerArSal(var arch: arSal);
var temp: regSal;
begin
    reset(arch);
    read(arch, temp);
    writeln('===SALAS.DAT===':24);
    writeln('CINE':10,'ZONA':10,'CAP':9);
    while temp.cine <> CENTINELA do
        begin
        writeln(temp.cine:10,temp.zona:9,temp.cap:10);
        read(arch, temp);
        end;
    close(arch);
end;

procedure crearArPel(var arch: arPel);
var archT: text;
    temp : regPel;
    tcine : st4;
    tpeli : st4;
    tventas : word;
    b : char;
begin
    assign(arch, 'PELICULAS.DAT');
    rewrite(arch);
    assign(archT, 'PELICULAS.txt');
    reset(archT);
    readln(archT, tcine, b,tpeli, tventas);
    while not eof(archT) do
        begin
        with temp do
            begin
            cine:=tcine;
            peli:=tpeli;
            ventas:=tventas;
            end;
        write(arch, temp);
        readln(archT, tcine, b,tpeli, tventas);
        end;
    temp.cine:=tcine;
    write(arch, temp); // Agrega centinela
    close(archT); close(arch);
end;

procedure leerArPel(var arch: arPel);
var temp: regPel;
begin
    reset(arch);
    read(arch, temp);
    writeln('===PELICULAS.DAT===':28);
    writeln('CINE':10,'PELI':10,'VENTAS':12);
    while temp.cine <> CENTINELA do
        begin
        with temp do
            writeln(cine:10,peli:10,ventas:10);
        read(arch, temp);
        end;
    close(arch);
end;

function consulta(pel: st3; tabla: vs3; vn: byte): byte;
var i: byte;
begin
    i := 1;
    while (i < vn) and (pel <> tabla[i]) do
        i := i + 1;
    if pel = tabla[i] then
        consulta := i
    else
        consulta := 0;
end;

procedure listado(var archSal: arSal; var archPel: arPel);
var tempSal: regSal;
    tempPel: regPel;
    i: byte;
    ventasZona: vw;
    cantPelis, cantFunc, cantVent, cantNoProyectan: word;
    pelAct: st4;
    peliMenorProm : st3;
    promCine, promPeli, menorProm: real;
    archT: text;
    tabla: vs3;
    vn: byte;
    pos: byte;
    cantCapTotal, cantVendTotal: vw;

begin


    // Acumulador de localidades vendidas por zonas
    for i:=1 to 10 do
        ventasZona[i] := 0;
    // Acumulador de peliculas con sus ventas sobre capacidad total
    for i:=1 to 40 do
        begin
        cantCapTotal[i] := 0;
        cantVendTotal[i] :=0;
        end;

    // Crear tabla de consulta (Para contadores de asistencia a peliculas)
    assign(archT, 'TITULOS.txt');
    reset(archT);
    readln(archT, tabla[1]);
    vn := 1;
    for i:=1 to 40 do
        tabla[i] := '';
    while not eof(archT) do
        begin
        vn := vn + 1;
        readln(archT, tabla[vn]);
        end;
    {
    writeln('==Tabla==':10);
    for i:=1 to vn do
        writeln(tabla[i]:5);
    }
    close(archT);


    reset(archSal); reset(archPel);
    read(archSal, tempSal); read(archPel, tempPel);
    cantPelis:=0;
    cantFunc:=0;
    cantVent:=0;
    pelAct:= '';
    cantNoProyectan := 0;
    menorProm:= 9999;
    PeliMenorProm:='';

    writeln('CINE':10, 'PELIS':10, 'FUNCIONES':12, 'VENTAS':10, 'PROM':9);
    while not eof(archSal) or not eof(archPel) do
        if tempSal.cine < tempPel.cine then
            begin
            if (cantFunc <> 0) and (tempSal.cap <> 0) then
                promCine := ((cantVent) /(tempSal.cap * cantFunc)) * 100
            else
                begin
                promCine := 0;
                cantNoProyectan:= cantNoProyectan + 1;
                end;
            ventasZona[tempSal.zona] := ventasZona[tempSal.zona] + cantVent;
            writeln(tempSal.cine:10, cantPelis:8, cantFunc:10, cantVent:12, promCine:10:1,'%');
            cantPelis:=0;
            cantFunc:=0;
            cantVent:=0;
            read(archSal, tempSal);
            end
        else
            if tempSal.cine > tempPel.cine then
                begin
                writeln('=====================ERROR===========================');
                end
        else    // son iguales
            begin
            cantPelis:= 0;
            while tempSal.cine = tempPel.cine do
                begin
                cantFunc:= cantFunc + 1;
                cantVent:= cantVent + tempPel.ventas;
                if pelAct <> tempPel.peli then
                    begin
                    cantPelis := cantPelis + 1;
                    pelAct := tempPel.peli;
                    pos := consulta(pelAct, tabla, vn);
                    end;
                cantCapTotal[pos] := cantCapTotal[pos] + tempSal.cap;
                cantVendTotal[pos] := cantVendTotal[pos] + tempPel.ventas ;
                read(archPel, tempPel);
                end;
            end;
    writeln();
    writeln('  Total de localidades vendidas por zona');
    for i := 1 to 10 do
        writeln('Zona ':12, i,ventasZona[i]:10);
    writeln();
    writeln('  Cant que no proyectan peliculas: ', cantNoProyectan);
    for i:=1 to vn do
        begin
        if cantVendTotal[i] <> 0 then
            begin
            promPeli := (cantVendTotal[i] / cantCapTotal[i]) * 100;
            if promPeli < menorProm then
                begin
                menorProm := promPeli;
                peliMenorProm:=tabla[i];
                end;
            end;
        end;
    writeln('  Peli con menor prom es: ',peliMenorProm,'(',menorProm:4:1,'%)');
    close(archSal); close(archPel);
end;

var
    archSal: arSal;
    archPel: arPel;
begin
    crearArSal(archSal);
    leerArSal(archSal); writeln();
    crearArPel(archPel);
    leerArPel(archPel); writeln();
    listado(archSal, archPel);

    readln();
end.

{
 Ej 7) Una cadena de cines tiene grabados en un archivo binario los siguientes datos de sus salas:
# CODIGO de CINE (cadena de 4, campo de secuencia clave primaria)
# ZONA (1..10) (puede haber más de un cine en la misma zona)
# CAPACIDAD
Además registra en otro archivo binario la venta de localidades de las películas que proyecta:
# CODIGO de CINE (cadena de 4, campo de secuencia, clave secundaria)
# CODIGO de PELICULA (cadena de 3, campo de secuencia, puede repetirse en este u otro cine)
# LOCALIDADES VENDIDAS
Se cuenta, además, con un archivo de texto que contiene los códigos de película, títulos y la duración (en
minutos) de cada película (40 como máximo); una película por línea.
Se pide generar el siguiente listado:
Cine Cant.Películas(1) Cant. funciones Total Loc.Vendidas %Ocup.Promedio
xxxx 999 999 999 99.99%
. . . . . . . . . . . . . . .
Cantidad de cines que no proyectaron ninguna película: 999
Película con menor promedio de localidades vendidas por función: xxx(99 min.)
Total de localidades vendidas por zona
Zona 1 999
. . .
(1) Cantidad de películas diferentes. Una película se puede proyectar en varias
funciones en el mismo cine
}

