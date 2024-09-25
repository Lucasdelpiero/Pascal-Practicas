program tambo1;
type
    st = string[4];
    vS = array[1..32] of st;
    vR = array[1..32] of real;

function masEntrego(cod : vS; tot: vr; n : byte): st;
var
    i, pos : byte;
    maxEntregado : real;
begin
    maxEntregado := 0;
    pos := 0;
    for i:= 1 to n do
    begin
        if tot[i] > maxEntregado then
        begin
            maxEntregado := tot[i];
            pos := i;
        end;
    end;
    masEntrego := cod[pos];
end;

function superaMin(xMinProm : real; prom : vR ; n : byte): byte;
var i , cont : byte;
begin
    cont := 0;
    for i:= 1 to n do
    begin
        if prom[i] > xMinProm then
            cont := cont + 1;
    end;
    superaMin := cont;
end;

procedure infoCodigo(codigo : st; cod:vs; tot : vr; prom: vr; n:byte);
var i : byte;
begin
    i := 1;
    while (i < n) and (codigo <> cod[i]) do
        i := i + 1;
    if codigo = cod[i] then
        writeln('Total: ',tot[i],' litros y promedio diario: ', prom[i],' litros')
    else
        writeln('No existe');
end;

var
    codigo : st;
    n, contDias, i : byte;
    total, entrega, xPromSuperar : real;
    cod : vS;
    tot, prom : vr;
begin
    writeln('Ingrese cantidad de tambos');
    readln(n);
    for i:= 1 to n do
    begin
        contDias := 0;
        total := 0;
        writeln('Ingrese codigo del tambo');
        readln(codigo);
        repeat
            writeln('Ingrese litros entregados en el dia (o cero para salir)');
            readln(entrega);
            if entrega > 0 then
            begin
                contDias := contDias + 1;
                total := total + entrega;
            end;
        until entrega = 0 ;

        cod[i] := codigo;
        tot[i] := total;
        prom[i] := (total/contDias);
    end;
    writeln('a) ', masEntrego(cod, tot, n));
    writeln('Ingrese x promedio a superar');
    readln(xPromSuperar);
    writeln('b) x=', xPromSuperar,' rta= ', superamin(xPromSuperar, prom, n));
    writeln('Ingrese codigo a buscar datos');
    readln(codigo);
    infocodigo(codigo, cod, tot, prom, n);

end.

