program tarjetas;
const MAX = 100;
    COD_IMPO = 999;
type
    st32 = string[32];
    VW = array[1..MAX] of word;
    RT = record
        num: word;
        nom: st32;
        tope: real;
        gastoMes: real;
    end;
    RR = record
        num: word;
        cod: word;
        monto: real;
    end;

    AT = file of RT;
    AR = file of RR;

procedure crearArchivo(var archD: AT);
var
    archT: text;
    temp : RT;
begin
    assign(archT,'TARJETAS.TXT');
    reset(archT);
    rewrite(archD);
    while not eof(archT) do
    begin
        readln(archT, temp.num, temp.tope, temp.gastoMes, temp.nom);
        write(archD, temp);
    end;

    close(archT);
end;

procedure leerArchivo(var arch: AT; var vec: VW; var vn: byte);
var
    temp : RT;
begin
    vn := 0;
    reset(arch);
    read(arch, temp);
    while temp.num <> CODE_IMPO  do
    begin
        vn := vn + 1;
        vec[vn] := temp.num;
        writeln('Num: ', temp.num, ' Tope: ', temp.tope:12:2,' Gasto: ', temp.gastoMes:12:2,
        ' Nom: ',temp.nom);
        read(arch, temp);
    end;
end;

function buscarTarjeta(num: word; tabla: VW; vn: byte): word;
var i,pos : byte;
begin
    i := 0;
    while (i < vn) and (num <> tabla[i]) do
        i := i + 1;
    if num = tabla[i] then
        pos := i
    else
        pos := 0;
    buscarTarjeta := pos;

end;

procedure procesaMov(var archD: AT;var archR : AR; tabla: VW; vn: byte);
var
    pos : word;
    num: word;
    cod: word;
    monto: real;
    archT: text;
    R :  RT;
    rechazado: RR;
begin
    assign(archT,'COMPRAS.txt');
    reset(archT);
    rewrite(archR);
    reset(archR);
    while not eof(archT) do
    begin
        readln(archT, num, cod, monto);
        pos := buscarTarjeta(num, tabla, vn);
        seek(archD, pos - 1);
        read(archD, R);
        R.gastoMes := R.gastoMes + monto;
        if R.gastoMes < R.tope then
            begin
                seek(archD, pos - 1);
                write(archD, R)
            end
        else
            begin
                rechazado.num:= num;
                rechazado.cod:= cod;
                rechazado.monto:= monto;
                write(archR, rechazado);
            end;
    end;
    rechazado.cod := COD_IMPO; rechazado.num := COD_IMPO; rechazado.monto:= COD_IMPO;
    write(archR, rechazado); // Agrega centinela al archivo de rechazados
    close(archR);
end;

procedure leerRechazados(var arch: AR);
var temp : RR;
begin
    reset(arch);
    writeln();
    writeln('RECHAZADOS:');
    read(arch, temp);
    while temp.cod <> COD_IMPO do
    begin
        writeln('Num: ',temp.num, ' Cod: ', temp.cod, ' Monto: ', temp.monto:12:2);
        read(arch, temp);
    end;
    writeln();
end;

var
    archD: AT;
    archR : AR;
    tabla : VW;
    vn: byte;
begin
    assign(archD, 'TARJETAS.DAT');
    crearArchivo(archD);
    leerArchivo(archD, tabla, vn);
    assign(archR,'RECHAZADOS.DAT');
    procesaMov(archD, archR, tabla, vn);
    leerRechazados(archR);
    leerArchivo(archD, tabla, vn);// Muestra el archivo luego de procesar y modificar valores
    readln();
end.

{
Ej 2) Un Banco registra en TARJETAS.DAT el movimiento de las tarjetas de crédito de sus usuarios.
# NUMERO de TARJETA (1er campo de secuencia, clave primaria)
# NOMBRE del PROPIETARIO
# TOPE
# GASTO del MES (hasta el momento)
Además, se van ingresando (desde teclado ó archivo de texto) las compras con los siguientes datos:
- Número de Tarjeta (puede repetirse)
- Monto
- Código de operación
Procesar los datos, actualizando los gastos del mes, siempre que no supere el monto tope, en caso
contrario, rechazarlo y grabar en un archivo RECHAZADOS.DAT con la siguiente información:
# NUMERO de TARJETA
# CODIGO DE OPERACION
# MONTO
Sugerencia: para obtener la dirección relativa y acceder en forma directa al archivo TARJETAS, descargar
del mismo los números de tarjeta sobre un arreglo (tabla).
}
