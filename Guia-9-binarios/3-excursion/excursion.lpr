program excursion;
const
    CENTINELA = 'ZZZ';
type
    st3 = string[3];
    st15 = string[15];
    vs3 = array[1..50] of st3;
    regEx = record
        cod : st3;
        desc : st15;
        pBase : real;
        pComida : real;
    end;
    regBo = record
        cod : st3;
        num : word;
        incluye : char;
    end;
    arEx = file of regEx;
    arBo = file of regBo;

procedure crearArEx(var arch: arEx;var tabla: vs3; var vn: byte);
var temp : regEx;
    tcod : st3;
    tdesc : st15;
    tpBase : real;
    tpComida : real;
    archT : text;
begin
    vn := 0;
    assign(archT, 'EXCURSION.txt');
    reset(archT);
    readln(archT, tcod, tpBase, tpComida, tdesc);
    rewrite(arch);  // Necesario para que cree al archivo
    while not eof(archT) do
        begin
        with temp do
            begin
            cod:=tcod;
            desc:=tdesc;
            pBase:=tpBase;
            pComida:=tpComida;
            end;
        write(arch, temp);
        vn := vn + 1;
        tabla[vn] := tcod;
        readln(archT, tcod, tpBase, tpComida, tdesc);
        end;
    temp.cod:= CENTINELA;
    write(arch, temp);      // Agrega centinela
end;

procedure leerArEx(var arch: arEx);
var temp : regEx;
begin
    reset(arch);
    read(arch, temp);
    writeln('===ARCHIVO EXCURSION.DAT===':40);
    writeln('COD':5,'DESC':14, 'Precio base':19,'Precio comida':16);
    while temp.cod <> CENTINELA do
        begin
        with temp do
            writeln(cod:5,desc:18,pBase:14:2,pComida:14:2);
        read(arch, temp);
        end;

end;

procedure crearArBo(var arch: arBo);
var temp: regBo;
    tcod: st3;
    tnum: word;
    tincluye: char;
    archT: text;
begin
    assign(archT, 'BOLETERIA.txt');
    reset(archT);
    rewrite(arch); // Crea archivo
    readln(archT, tcod, tnum, tincluye, tincluye);
    while not eof(archT) do
        begin
        with temp do
            begin
            temp.cod:=tcod;
            temp.num:=tnum;
            temp.incluye:=tincluye;
            end;
        write(arch, temp);
        readln(archT, tcod, tnum, tincluye, tincluye);
        end;
    temp.cod := CENTINELA;
    write(arch, temp); // agrega centinela

end;

procedure leerArBo(var arch: arBo);
var temp: regBo;
begin
    reset(arch);
    read(arch, temp);
    writeln('===ARCHIVO BOLETERIA.DAT===');
    writeln('COD':5,'NUM':6,'Incluye':10);
    while temp.cod <> CENTINELA do
        begin
        with temp do
            writeln(cod:5,num:5,incluye:8);
        read(arch, temp);
        end;
end;

function buscar(cod: st3; tabla: vs3; vn: byte): byte;
var i, pos : byte;
begin
    i := 1;
    while (i < vn) and (cod <> tabla[i]) do
        i := i + 1;
    if cod = tabla[i] then
        pos := i
    else

end;

procedure listado(var archEx: arEx; var archBo: arBo; tabla: vs3; vn: byte);
var cantBol, cantCom, cantBolTot, cantComTot: word;
    montoTotal, precioBase, precioComida: real;
    pos: byte;
    tempEx: regEx;
    tempBo: regBo;
    codAct: st3;
begin
    cantBolTot := 0;
    cantComTot := 0;
    reset(archBo);
    read(archBo, tempBo);
    writeln('=====LISTADO=====':40);
    writeln('Excursion':14,'Cant Boletos':20, 'Cant Comida':14, 'Monto Total':15);
    while not eof(archBo) do   // Bloque 1 lee hasta el final
        begin
        cantBol := 0;
        cantCom := 0;
        montoTotal := 0;
        codAct := tempBo.cod;    // actualiza codigo cada vez que entra
        pos := buscar(codAct, tabla, vn);
        seek(archEx, pos - 1);  // NO OLVIDA EL -1, fijarse la diff entre
        read(archEx, tempEx);   // la tabla y el archivo antes de asignar un seek

        // Bloque 2 lee los del mismo codigo
        while codAct = tempBo.cod do
            begin
            cantBol := cantBol + 1;
            montoTotal := montoTotal + tempEx.pBase; // Todos suman la base
            if tempBo.incluye = 'S' then
                begin
                cantCom := cantCom + 1;
                montoTotal := montoTotal + tempEx.pComida;
                end;
            read(archBo, tempBo);
            end;
        cantBolTot := cantBolTot + cantBol;
        cantComTot := cantComTot + cantCom;
        writeln(tempEx.desc:18,cantBol:12, cantCom:14, montoTotal:17:2)
        end;
    writeln('  % de turistas que contrataron excursion con comida: ',
        ((cantComTot/cantBolTot) * 100):4:1,'%');

end;

var archEx : arEx;
    archBo : arBo;
    tabla : vs3;
    vn : byte;

begin
    assign(archEx, 'EXCURSION.DAT');
    crearArEx(archEx, tabla, vn);
    leerArEx(archEx);      writeln();
    assign(archBo, 'BOLETERIA.DAT');
    crearArBo(archBo);
    leerArBo(archBo);   writeln();
    listado(archEx, archBo, tabla, vn);
    readln();
end.

{
 Ej 3) Una empresa de turismo ofrece a sus clientes distintas excursiones a los distintos puntos de interés
de la ciudad (paseo a las Sierras, a la Laguna, City Tour, viaje en barco, etc.):
# CODIGO de EXCURSIÓN (cadena de 3, no hay más de 50)
# DESCRIPCION (cadena de 15)
# PRECIO BASE
# PRECIO de la COMIDA
Por otro lado se tiene un archivo BOLETERIA.DAT con el registro de los boletos vendidos con los
siguientes datos:
# CODIGO de EXCURSION (cadena de 3, campo de secuencia, clave secundaria)
# NRO de BOLETO
# INCLUYE COMIDA (S/N)
Se desea realizar el siguiente listado:
Excursión Cantidad de Boletos Cantidad de Comida Monto Total
xxxxxxxxxxxx 99 99 $9999.99
. . . . . . . . . . . .
% de turistas que contrataron excursión con comida: 99.99%
}

