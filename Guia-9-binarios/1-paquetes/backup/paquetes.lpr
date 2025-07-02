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
function pesoProm(var arch: TP): real;
var pesoTotal: real;
    cont: byte;
    R : RP;
begin
    pesoTotal := 0;
    cont := 0;
    reset(arch);
    read(arch, R);
    while not eof(arch) do
        begin
        pesoTotal := pesoTotal + R.peso;
        cont := cont + 1;
        read(arch, R);
        end;
    pesoTotal := pesoTotal + R.peso; //El ultimo registro ya es EOF asi que no los suma dentro
    cont := cont + 1;                // del loop asi que hay que hacerlo luego afuera
    pesoProm := pesoTotal / cont;
end;

function totalAsegMal(vec: VP; vn: byte): real;
var total: real;
    i: byte;
begin
    total := 0;
    for i:=1 to vn do
        total := total + vec[i].maseg;
    totalAsegMal := total;
end;
function totalAseg(var arch: TP): real;
var total: real;
    R : RP;
begin
    total := 0;
    reset(arch);
    read(arch, R);
    while not eof(arch) do
        begin
        total := total + R.maseg;
        read(arch, R);
        end;
    totalAseg := total + R.maseg; // El ultimo no lo agarra

end;



procedure listadoMal(vPaq: VP; vn: byte; vdes: VS);
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

    writeln('       Destino         Cantidad de paquetes');
    for i:=1 to 30 do
    begin
        if cont[i] <> 0 then
        begin
            writeln(vdes[i]:15,' ', cont[i]:15);
        end;
    end;
end;

procedure listado(var archP: TP; var archD: TD);
var cont: VW;
    i, dest: byte;
    regP : RP;
    regD : RD;
begin
    for i:=1 to 30 do
        cont[i] := 0;

    reset(archP);
    read(archP, regP);
    while not eof(archP) do
        begin
        dest := regP.cdest;
        cont[dest] := cont[dest] + 1;
        read(archP, regP);
        end;
    writeln('       Destino         Cantidad de paquetes');
    reset(archD);
    read(archD, regD);
    i := 1;
    while not eof(archD) do
        begin
            if cont[i] > 0 then
                writeln(regD.desc:15,' ', cont[i]:15);
            i := i + 1;
            read(archD, regD);
        end;
end;

var
    aPaq: TP;
    aDes: TD;
    vPaq: VP;   // Sin usar vectores
    vn: byte;   // Sin usar vectores
    vDes: VS;   // Sin usar vectores

begin
    assign(aPaq, 'PAQUETES.DAT');
    //cargaPaquetes(aPaq);        // Crea archivo por 1era vez
    //listadoPaquetes(aPaq);
    cargavec(aPaq, vPaq, vn);  // No hay que usar vectores en archivos binarios
    //listadovec(vPaq, vn);      // No hay que usar vectores en archivos binarios
    assign(aDes, 'DESTINO.DAT');
    //cargaDest(aDes);           // Crea archivo por 1era vez
    //listadoDest(aDes);
    //cargavecdest(aDes, vDes); // No hay que usar vectores en archivos binarios
    //listadovecdest(vDes);     // No hay que usar vectores en archivos binarios

    writeln('Peso prom de paquetes: ':25, pesoProm(aPaq):8:2); // a
    writeln('Total asegurado: ':25, totalAsegMal(vPaq, vn):12:2);
    writeln('Total asegurado: ':25, totalAseg(aPaq):12:2); // b
    writeln();
    //listadoMal(vPaq, vn, vdes); // Mal, no hay que usar vectores en archivos binarios
    listado(aPaq, aDes);
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
