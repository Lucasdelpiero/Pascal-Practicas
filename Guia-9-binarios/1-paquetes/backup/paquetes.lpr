program paquetes;
const MAX = 100;
type
    st15= string[15];
    RP = record
        cod: word;
        peso: real;
        cdest: byte;
        maseg: real;
    end;
    RD = record
        cdest: byte;
        desc: st15;
    end;
    TP = file of RP;
    TD = file of RD;

    VP = array[1..MAX] of RP;
    VD = array[1..30] of RD;
    VS = array[1..30] of st15;
    VW = array[1..30] of word; // contador para paquetes

procedure cargaPaquetes(var arch: TP);
var
  R: RP;
  cod: word;
  peso: real;
  cdest: byte;
  maseg: real;
  i: byte;
begin
    rewrite(arch);
    for i:= 1 to 15 do
    begin
        with R do
        begin
            cod := random(30000);
            peso := random(200);
            cdest := random(30);
            maseg := random(50000);
        end;
        write(arch, R);
    end;

end;

procedure listadoPaquetes(var arch: TP);
var
  R: RP;
  cod: word;
  peso: real;
  cdest: byte;
  maseg: real;
  i: byte;
begin
    reset(arch);
    for i:= 1 to 15 do
    begin
        read(arch,R);
        with R do
        begin
            writeln('== Paquete', i,' ==');
            writeln('Ingrese cod'); writeln(cod);
            writeln('Ingrese peso'); writeln(peso:6:2);
            writeln('Ingrese cdest'); writeln(cdest);
            writeln('Ingrese maseg'); writeln(maseg:10:2);


        end;
    end;

end;

procedure cargaVec(var arch: TP;var vec: VP;var vn: byte);
var i: byte;
    R: RP;
begin
    reset(arch);
    vn := 0;
    while  not eof(arch) do
    begin
        vn := vn + 1;
        read(arch, vec[vn]);
    end;
    close(arch);
end;

procedure listadoVec(vec: VP; vn: byte);
var i: byte;
begin
    for i:=1 to vn do
    begin
        with vec[i] do
        begin
            writeln('== Paquete', i,' ==');
            writeln('Cod: '); writeln(cod);
            writeln('Peso: '); writeln(peso:6:2);
            writeln('Cdest: '); writeln(cdest);
            writeln('Maseg: '); writeln(maseg:10:2);
        end;

    end;
end;

procedure cargaDest(var arch :TD);
var i: byte;
    R : RD;
    desc : st15;
begin
    rewrite(arch);
    for i:= 1 to 30 do
    begin
        writeln('Write desc of cod: ', i);
        readln(desc);
        R.cdest := i;
        R.desc := desc;
        write(arch, R);
    end;
    close(arch);
end;

procedure listadoDest(var arch: TD);
var R : RD;
begin
    reset(arch);
    while not eof(arch) do
    begin
        read(arch, R);
        writeln(R.desc);
    end;
    close(arch);
end;

procedure cargaVecDest(var arch: TD;var vec: VS);
var i : byte;
    R : RD;
begin
    reset(arch);
    for i := 1 to 30 do
    begin
        read(arch, R);
        vec[i] := R.desc;
    end;
end;

procedure listadoVecDest(vec: VS);
var i : byte;
begin
    for i := 1 to 30 do
    begin
        writeln(i, ': ' ,vec[i]);
    end;

end;

// Comienza resolucion de ejercicios

function pesoProm(vec: VP; vn: byte): real;
var pesoTotal: real;
    i: byte;
begin
    pesoTotal := 0;
    for i := 1 to vn do
        pesoTotal := pesoTOtal + vec[i].peso;
    pesoProm := pesoTotal / vn;
end;

function totalAseg(vec: VP; vn: byte): real;
var total: real;
    i: byte;
begin
    total := 0;
    for i:=1 to vn do
        total := total + vec[i].maseg;
    totalAseg := total;
end;

procedure listado(vPaq: VP; vn: byte; vdes: VS);
var cont: VW;
    i, dest: byte;
begin
    for i:=1 to 30 do
        cont[i] := 0;
    for i:=1 to vn do
    begin
        dest := vPaq[i].cdest;
        cont[dest] := cont[dest] + 1;
    end;

    writeln('Destino             Cantidad de paquetes');
    for i:=1 to 30 do
    begin
        if cont[i] <> 0 then
        begin
            writeln(vdes[i]:15,' ', cont[i]:15);
        end;
    end;


end;

var
    aPaq: TP;
    aDes: TD;
    vPaq: VP;
    vn: byte;
    vDes: VS;

begin
    assign(aPaq, 'PAQUETES.DAT');
    //cargaPaquetes(aPaq);        // Crea archivo por 1era vez
    //listadoPaquetes(aPaq);
    cargavec(aPaq, vPaq, vn);
    //listadovec(vPaq, vn);
    assign(aDes, 'DESTINO.DAT');
    //cargaDest(aDes);           // Crea archivo por 1era vez
    //listadoDest(aDes);
    cargavecdest(aDes, vDes);
    //listadovecdest(vDes);

    writeln('Peso prom de paquetes: ', pesoProm(vPaq, vn):8:2); // a
    writeln('Total asegurado: ', totalAseg(vPaq, vn):12:2);
    listado(vPaq, vn, vdes);
    readln();
end.

{
Ej 1) Una empresa de transporte de encomiendas tiene un registro de los paquetes a transportar
en un archivo PAQUETES.DAT, de cada uno se conoce:
# CODIGO de PAQUETE
# PESO
# CODIGO de DESTINO (1..30)
# MONTO ASEGURADO
Por otro lado se cuenta con un archivo DESTINO.DAT que contiene:
# CODIGO de DESTINO (1..30, desordenado)
# DESCRIPCION (cadena de 15)
Se desea saber:
a) El peso promedio de los paquetes.
b) Total del monto asegurado de la carga a transportar.
c) Al finalizar el proceso armar el siguiente listado:
Destino Cantidad de Paquetes
Xxxxxxxxxxxxxxxx 99
. . . . . .
TOTAL 99
}
