program alumnos;
const CENTINELA = 00000;
    MAX = 100;
type
    regAlu = record
        matri: word;
        mat: byte;
        fis1: byte;
        qui1: byte;
    end;
    regIns = record
        matri: word;
        fis2: byte;
        qui2: byte;
    end;
    arAlu = file of regAlu;
    arIns = file of regIns;
    vw = array[1..MAX] of word;

procedure crearArAlu(var arch: arAlu; var tabla: vw; var vn: byte);
var temp: regAlu;
    tmatri: word;
    tmat, tfis1, tqui1: byte;
    archT: text;
begin
    vn := 0;
    rewrite(arch);
    assign(archT, 'ALUMNOS.txt');
    reset(archT);
    readln(archT, tmatri, tmat, tfis1, tqui1);
    while not eof(archT) do
        begin
        with temp do
            begin
            matri:=tmatri;
            mat:=tmat;
            fis1:=tfis1;
            qui1:=tqui1;
            end;
        write(arch, temp);
        vn := vn + 1;
        tabla[vn] := tmatri;
        readln(archT, tmatri, tmat, tfis1, tqui1);
        end;
    temp.matri := CENTINELA;
    write(arch, temp); // agrega centinela
end;

procedure leerArAlu(var arch: arAlu);
var temp: regAlu;
begin
    reset(arch);
    read(arch, temp);
    writeln('===ARCHIVO ALUMNOS.DAT===':36);
    writeln('Matricula':12, 'Mate':9, 'Fisica 1':12,'Quimica 1':12);
    while temp.matri <> CENTINELA do
        begin
        with temp do
            writeln(matri:10, mat:10, fis1:10, qui1:10);
        read(arch, temp);
        end;

end;

procedure crearArIns(var arch: arIns);
var temp: regIns;
    tmatri: word;
    tqui, tfis: byte;
    archT: text;
begin
    rewrite(arch);
    assign(archT, 'INSCRIPTOS.txt');
    reset(archT);
    readln(archT,tmatri, tqui, tfis);
    while not eof(archT) do
        begin
        with temp do
            begin
            matri:=tmatri;
            qui2:=tqui;
            fis2:=tfis;
            end;
            write(arch, temp);
            readln(archT, tmatri, tqui, tfis);
        end;
    temp.matri:=CENTINELA;
    write(arch, temp);
end;

procedure leerArIns(var arch: arIns);
var temp: regIns;
begin
    writeln('===ARCHIVO INSCRIPTOS.DAT===':36);
    writeln('Matricula':12, 'Quimica 2':12,'Fisica 2':12);
    reset(arch);
    read(arch, temp);
    while temp.matri <> CENTINELA do
        begin
        with temp do
            writeln(matri:10 , qui2:10, fis2:12);
        read(arch, temp);
        end;
end;

function buscar(matri: word; tabla: vw; vn: byte): byte;
var i: byte;
begin
    i := 1;
    while (i < vn) and (matri <> tabla[i]) do
        i := i + 1;
    if matri = tabla[i] then
        buscar := i
    else
        buscar := 0;
end;

procedure listadoMal(var archAlu: arAlu; var archIns: arIns; tabla: vw; vn: byte);
var tempAlu: regAlu;
    tempIns: regIns;
    pos : byte;
begin
    writeln('===Listado de los que no cumplen===');
    reset(archIns);
    read(archIns, tempIns);
    while tempIns.matri <> CENTINELA do
        begin
        with tempIns do
            begin
            pos := buscar(matri, tabla, vn);
            seek(archAlu, pos - 1); // NO OLVIDARSE EL - 1 EN EL SEEK
            read(archAlu, tempAlu);
            end;
        if ( (tempIns.fis2 = 1) and ((tempAlu.mat < 4) or (tempAlu.fis1 < 4) )) or
                ( (tempIns.qui2 = 1) and (tempAlu.qui1 < 4)) then
                    writeln(tempAlu.matri:10);
        read(archIns, tempIns);
        end;
end;

// Se comparan las matriculas
// si ALU < INS se avanza en ALU
// si ALU = INS se chequea si se agrega al listado
// si ALU > INS se avanza en INS
procedure listado(var archAlu: arAlu; var archIns: arIns);
var tempAlu: regAlu;
    tempIns: regIns;
begin
    reset(archAlu);
    reset(archIns);
    read(archAlu, tempAlu);
    read(archIns, tempIns);
    writeln('===Listado de los que no cumplen===');
    while (tempAlu.matri <> CENTINELA) and (tempIns.matri <> CENTINELA) do
        begin
        if tempAlu.matri < tempIns.matri then
            read(archAlu, tempAlu)
        else
            if tempAlu.matri > tempIns.matri then
                read(archIns, tempIns)
            else
                begin
               if ( (tempIns.fis2 = 1) and ((tempAlu.mat < 4) or (tempAlu.fis1 < 4) )) or
                ( (tempIns.qui2 = 1) and (tempAlu.qui1 < 4)) then
                    writeln(tempAlu.matri:10);

                read(archAlu, tempAlu);
                read(archIns, tempIns);
                end;
        end;

end;


var
    archAlu: arAlu;
    archIns: arIns;
    tabla: vw;
    vn: byte;
begin
    assign(archAlu, 'ALUMNOS.DAT');
    crearArAlu(archAlu, tabla, vn);
    leerArAlu(archAlu); writeln();
    assign(archIns, 'INSCRIPTOS.DAT');
    crearArIns(archIns);
    leerArIns(archIns); writeln();
    //listadoMal(archAlu, archIns, tabla, vn);
    listado(archAlu, archIns);

    close(archAlu);
    close(archIns);
    readln();
end.

{
 Ej 5) Dado un archivo ALUMNOS.DAT con las notas de alumnos cuyo diseño de registro es:
# MATRICULA (campo de secuencia, clave primaria)
# NOTA en MATEMÁTICA (0..10)
# NOTA en FISICA I (0..10)
# NOTA en QUIMICA I (0..10)
y un archivo de inscriptos (INSCRIPTOS.DAT) en QUIMICA II y FISICA II cuyo diseño de registro es:
# MATRICULA (campo de secuencia, clave primaria)
# QUIMICA II (1=inscripto, 0=no inscripto)
# FISICA II (1=inscripto, 0=no inscripto)
Obtener un listado con la matrícula de aquellos alumnos inscriptos que no cumplan con los requisitos de
equivalencia exigidos, que son: para FISICA II, tener aprobados MATEMATICA y FISICA I, y para
QUIMICA II, tener aprobado QUIMICA I. (se aprueba con NOTA >=4)
}
