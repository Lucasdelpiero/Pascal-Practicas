program tambo2;
type
    st = string[4];
    vB = array[1..32] of byte;
    vR = array[1..32] of real;
    vS = array[1..32] of st;

var
    arch : text;
    codigo : st;
    dia, i, vL, vLsinComp : byte;
    litros, x : real;
    COD, CODsinComp : vS;
    TOT, TOTsinComp : vR;
    ENTREGAS : vB;

function masEntrego(COD: vS; TOT: vR; vL : byte) :st;
var i, pos : byte;
    maxEntregado : real;
begin
    maxEntregado := 0;
    for i:=1 to vL do
        if TOT[i] > maxEntregado then
        begin
            pos := i;
            maxEntregado := TOT[i];
        end;
    masEntrego := COD[pos];
end;

function supXprom(x : real; TOT: vR; ENTREGAS: vB; vL: byte): byte;
var i, cant : byte;
begin
    cant := 0;
    for i:=1 to vL do
        if (TOT[i]/ENTREGAS[i]) > x then
            cant := cant + 1;
    supXprom := cant;
end;

procedure writeVec(COD: vS; TOT: vR; ENTREGAS: vB; vL : byte);
var i : byte;
begin
    for i:=1 to vL do
        writeln(COD[i],' TOT: ', TOT[i]:0:2, ' PROM: ', (TOT[i]/ENTREGAS[I]):0:2);
end;

{Se pueden reemplazar los vectores asi que no es necesario crear nuevos en el
programa princioal }
procedure compactar(CODsinComp: vS; TOTsinComp: vR; vlSinComp : byte;
                    var COD: vs; var TOT: vR; var ENTREGAS: vB; var vL : byte);
var i, j : byte;
begin
    vL := 0;

    for i:= 1 to vlSinComp do
    begin
        j := 1;
        while (j<vL) and (CODsinComp[i] <> COD[j]) do
            j := j + 1;

        if CODsinComp[i] = COD[j] then
        begin
            TOT[j] := TOT[j] + TOTsinComp[i];
            ENTREGAS[j] := ENTREGAS[j] + 1;
        end
        else
            begin
                vl := vl + 1;
                COD[vl] := CODsinComp[i];
                TOT[vl] := TOTsinComp[i];
                ENTREGAS[vl] := 1;
            end;
    end;
end;

// Usa vectores auxiliares para reemplazar a los antiguos
procedure compactarBueno(var COD: vs; var TOT: vR; var ENTREGAS: vB; var vL : byte);
var i, j : byte;
    auxCOD : vS;
    auxTOT : vR;
    auxENTREGAS : vB;
    auxVl : byte;
begin
    auxvL := 0;
    // Solo parece ser necesario si hay info basura
    for i:= 1 to vL do
    begin
        //auxCOD[i] := '';
        //auxTOT[i] := 0;
        //auxENTREGAS[i] := 0;
    end;
    //for i:= 1 to vl do
       // writeln(COD[i],' : ', TOT[i]:0:2);

    for i:= 1 to vl do
    begin
        j := 1;
        while (j<auxVL) and (COD[i] <> auxCOD[j]) do
            j := j + 1;

        if COD[i] = auxCOD[j] then
        begin
            auxTOT[j] := auxTOT[j] + TOT[i];
            auxENTREGAS[j] := auxENTREGAS[j] + 1;
        end
        else
            begin
                auxvl := auxvl + 1;
                auxCOD[auxvl] := COD[i];
                auxTOT[auxvl] := TOT[i];
                auxENTREGAS[auxvl] := 1;
            end;
    end;
    COD := auxCOD;
    TOT := auxTOT;
    ENTREGAS := auxENTREGAS;
    vl := auxvL
end;

procedure infoCod(codigo : st; COD : vS; TOT: vR; ENTREGAS: vB; vL : byte);
var i : byte;

begin
    i := 1;
    while (i<vL) and (codigo <> COD[i]) do
        i := i + 1;
    if codigo = COD[i] then
        writeln('TOT: ', TOT[i]:0:2,' Prom: ',(TOT[i]/ENTREGAS[i]):0:2)
    else
        writeln('Codigo no existe');
end;

begin
    assign(arch, 'tambo.txt');
    reset(arch);
    i := 0;
    while not eof(arch) do
    begin
        i := i + 1;
        readln(arch, codigo, dia, litros);
        COD[i] := codigo;
        TOT[i] := litros;
    end;
    vL := i;
    //compactar(CODsinComp, TOTsinComp, vlSinComp, COD, TOT, ENTREGAS, vL);
    //writeVec(COD, TOT, ENTREGAS, vL);
    compactarBueno(COD, TOT,ENTREGAS, vl);
    writeln('El tambo que entrego mas leche fue: ', masEntrego(COD, TOT, vl));
    //writeln('==========================');
    //writeVec(COD, TOT, ENTREGAS, vL);
    writeln('Cuantos litros promedio debe superar?');
    readln(x);
    writeln('Lo superan: ', supXprom(x, TOT, ENTREGAS, vL));
    writeln('Ingrese el codigo a buscar info');
    readln(codigo);
    infocod(codigo, COD, TOT, ENTREGAS, vL);
    close(arch);

    readln();
end.

