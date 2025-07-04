program comisiones;
const CENTINELA = 999;
type
    st32 = string[32];
    regMes = record
        leg: word;
        nom: st32;
        ventas: real;
        nMayorVenta: word;
        importeMayorVenta: real;
    end;
    regDia = record
        leg: word;
        nFact: word;
        importe: real;
    end;
    arMes = file of regMes;
    arDia = file of regDia;

procedure crearArMes(var arch: arMes);
var archT: text;
    temp: regMes;
    tleg: word;
    tventas: real;
    tnMayorVenta: word;
    timporteMayorVenta: real;
    tnom: st32;
begin
    rewrite(arch);
    assign(archT, 'MES.txt');
    reset(archT);
    readln(archT, tleg, tventas, tnMayorVenta, timporteMayorVenta, tnom);
    while not eof(archT) do
        begin
        with temp do
            begin
            leg:=tleg;
            ventas:=tventas;
            importeMayorVenta:=timporteMayorVenta;
            nMayorVenta:=tnMayorVenta;
            nom:=tnom;
            end;
        write(arch, temp);
        readln(archT, tleg, tventas, tnMayorVenta, timporteMayorVenta, tnom);
        end;
    temp.leg:= CENTINELA;
    write(arch, temp); // agrega centinela
end;

procedure leerArMes(var arch: arMes);
var temp: regMes;
begin
    writeln('===MES.DAT===':32);
    writeln('Legajo':8,'Nombre':10,'Ventas':11,'N MayV':12, 'Imp MV':10);
    reset(arch);
    read(arch, temp);
    while temp.leg <> CENTINELA do
        begin
        with temp do
            begin
            writeln(leg:6,nom:12,ventas:12:2, nMayorVenta:10, importeMayorVenta:12:2)
            end;
        read(arch, temp);
        end;
end;

procedure crearArDia(var arch: arDia);
var archT: text;
    temp: regDia;
    tleg: word;
    tnum: word;
    timp: real;
begin
    rewrite(arch);
    assign(archT, 'DIA.txt');
    reset(archT);
    readln(archT, tleg, tnum, timp);
    while not eof(archT) do
        begin
        with temp do
            begin
            leg:=tleg;
            nFact:=tnum;
            importe:= timp;
            end;
        write(arch, temp);
        readln(archT, tleg, tnum, timp);
        end;
    temp.leg := tleg;
    write(arch, temp); // Agrega centinela
end;

procedure leerArDia(var arch: arDia);
var temp : regDia;
begin
    writeln('===DIA.DAT===':22);
    writeln('Legajo':8,'N Fact':10, 'Importe':10);
    reset(arch);
    read(arch, temp);
    while temp.leg <> CENTINELA do
        begin
        with temp do
            begin
            writeln(leg:6,nFact:11,importe:12:2);
            end;
        read(arch, temp);
        end;
end;

// Si MES.LEG < DIA.LEG AVANZO EN EL MES
// SI MES.LEG > DIA.LEG AVANZO EN EL DIA
// SI MES.LEG = DIA.LEG AVANZO EN EL DIA Y ACTUALIZO EL DEL MES
procedure actualizarArMes(var archMes: arMes; var archDia: arDia);
var tempMes: regMes;
    tempDia: regDia;
    archTemp: arMes;
begin
    assign(archTemp, 'TEMP.DAT');
    rewrite(archTemp);
    reset(archMes);
    reset(archDia);
    read(archMes, tempMes);
    read(archDia, tempDia);

    while not eof(archMes) or not eof(archDia) do
        if tempMes.leg < tempDia.leg then
            begin
                write(archTemp, tempMes);
                read(archMes, tempMes) // Avanzo mes
            end
        else
            if tempMes.leg > tempDia.leg then
                read(archDia, tempDia)     // avanzo dia
        else // Son iguales
            begin
            while tempMes.leg = tempDia.leg do // Mientras sean iguales sigue leyendo
                // el de los dias hasta hacer todas las facturas de este empleado
                begin

                tempMes.ventas:= tempMes.ventas + tempDia.importe;
                if tempDia.importe > tempMes.importeMayorVenta then
                    begin
                    tempMes.importeMayorVenta:=tempDia.importe;
                    tempMes.nMayorVenta:=tempDia.nFact;
                    end;

                read(archDia, tempDia);
                end;
            end;
    write(archTemp, tempMes);  // Agrega centinela

    // Para actualizar archivos se crea un tercer archivo temporal
    // Se cierran ambos, se borra el original y se renombra el nuevo
    close(archMes);
    close(archTemp);
    Erase(archMes);
    rename(archTemp,'MES.DAT');
end;

var
    archMes : arMes;
    archDia : arDia;
begin
    assign(archMes, 'MES.DAT');
    crearArMes(archMes);
    leerArMes(archMes);  writeln();
    assign(archDia, 'DIA.DAT');
    crearArDia(archDia);
    leerArDia(archDia); writeln();
    actualizarArMes(archMes, archDia);
    leerArMes(archMes);  writeln();

    close(archMes);
    close(archDia);
    readln();
end.

{
 Ej 6) Una empresa paga a fin de mes a sus empleados una comisión del 0.5% sobre las ventas
efectuadas, para ello almacena el acumulado mensual de ventas en un archivo cuyo diseño de registro es:

# LEGAJO (campo de secuencia, clave primaria)
# NOMBRE y APELLIDO
# TOTAL de VENTAS
# NRO de FACTURA de MAYOR VENTA del MES
# IMPORTE de MAYOR VENTA del MES
Al final del día actualiza los registros de ese archivo con las ventas efectuadas almacenadas en otro
archivo cuyo diseño de registro es:
# LEGAJO (campo de secuencia, clave secundaria)
# NRO de FACTURA
# IMPORTE
Se pide actualizar el primer archivo y listar las comisiones que le corresponden hasta el momento a cada
empleado
}
