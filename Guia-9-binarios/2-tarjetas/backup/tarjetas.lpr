program tarjetas;
const MAX = 100;
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
    while not eof(arch) do
    begin
        read(arch, temp);
        vn := vn + 1;
        vec[vn] := temp.num;
        writeln('Num: ', temp.num, ' Tope: ', temp.tope:12:2,' Gasto: ', temp.gastoMes:12:2,
        ' Nom: ',temp.nom);
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
    close(archR);
end;

procedure leerRechazados(var arch: AR);
var temp : RR;
begin
    reset(arch);
    writeln();
    writeln('RECHAZADOS:');
    while not eof(arch) do
    begin
        read(arch, temp);
        writeln('Num: ',temp.num, ' Cod: ', temp.cod, ' Monto: ', temp.monto:12:2);
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

