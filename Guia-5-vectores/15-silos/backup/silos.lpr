program silos;
type
    st = String[32];
    vS = Array[1..32] of st;
    vB = Array[1..32] of byte;
    vR = Array[1..32] of real;

function estaDesordenado(str1 : st; str2 : st) : boolean;
var i, len : byte;
    es : boolean;
    val1, val2 : byte;
begin
    i := 1;
    len := length(str1);
    es := false;

    if length(str2) > len then
        len := length(str2);
    while i < len do
    begin
        val1 := ord(str1[i]);
        val2 := ord(str2[i]);
        if val1 > val2 then
        begin
            es := true;
            i := 99;
        end
        else
            if val2 > val1 then
                i := 99;
        i := i + 1;
    end;
    estaDesordenado := es;
end;

procedure writevec(vClientes : vS; vPatentes: vS;vTipos : vB;vToneladas : vR; vL : byte);
var i : byte;
    pal : st;
begin
    for i:=1 to vL do
    begin
        case vTipos[i] of
            1: pal := 'trigo';
            2: pal := 'girasol';
            3: pal := 'soja';
            4: pal := 'maiz';
        end;
        writeln(vClientes[i],' : ', vPatentes[i],' lleva ', vToneladas[i]:0:2,' toneladas de ', pal);
    end;
end;

procedure leerArchivo(var vClientes : vS;var vPatentes: vS; var vTipos : vB; var vToneladas : vR;var vL : byte);
var
    arch : text;
    cliente, patente : st;
    tipo : byte;
    toneladas : real;
begin
    assign(arch,'text.txt');
    reset(arch);
    vL := 0;
    while not eof(arch) do
    begin
        vL := vL + 1;
        readln(arch, cliente);
        readln(arch, patente);
        readln(arch, tipo);
        readln(arch, toneladas);
        vClientes[vL] := cliente;
        vPatentes[vL] := patente;
        vTipos[vL] := tipo;
        vToneladas[vL] := toneladas;
    end;

    close(arch);
end;

procedure porcentaje(vClientes : vS; vPatentes: vS;vTipos : vB;vToneladas : vR; vL : byte);
var i : byte;
    total : real;
begin
    total := 0;
    for i:=1 to vL do
        total := total + vToneladas[i];
    for i:=1 to vL do
        writeln('Tipo ', vTipos[i],' es de % ', (100 * vToneladas[i] / total):0:2);
end;

procedure buscarPatente(patente : st;vClientes : vS; vPatentes: vS;vTipos : vB;vToneladas : vR; vL : byte);
var i : byte;
begin
    i:= 1;
    while (i < vL) and (patente<>vPatentes[i]) do
        i := i + 1;
    if patente = vPatentes[i] then
        writeln('Tipo : ', vTipos[i],', Toneladas: ', vToneladas[i]:0:2, ', Cliente: ', vClientes[i])
    else
        writeln('No se encontro esa patente');
end;

procedure transportaronMas(cantidad : real;vClientes : vS; vPatentes: vS;vTipos : vB;vToneladas : vR; vL : byte;
                                 var  nvClientes : vS;var nvPatentes: vS;var nvTipos : vB;var nvToneladas : vR;var nvL : byte);
var i : byte;
begin
    nvL := 0;
    for i:=1 to vL do
    begin
        if vToneladas[i] > cantidad then
        begin
            nvL := nvL + 1;
            nvClientes[nvL] := vClientes[i];
            nvPatentes[nvL] := vPatentes[i];
            nvTipos[nvL] := vTipos[i];
            nvToneladas[nvL] := vToneladas[i];
        end;
    end;
end;

procedure ordenarAlf(var vClientes : vS;var vPatentes: vS;var vTipos : vB;var vToneladas : vR; vL : byte);
var i, j, palLen : byte;
    cambioValor : boolean;
    auxCli, auxPat : st;
    auxTip : byte;
    auxTon : real;
begin
    i := 1;
    while i < vL do
    begin
        cambioValor := false;
        writeln(i);
        if estaDesordenado(vClientes[i], vClientes[i + 1]) then
        begin
            cambioValor := true;
            auxCli := vClientes[i + 1];
            auxPat := vPatentes[i + 1];
            auxTip := vTipos[i + 1];
            auxTon := vToneladas[i + 1];
            vClientes[i + 1] := vClientes[i];
            vPatentes[i + 1] := vPatentes[i];
            vTipos[i + 1] := vTipos[i];
            vToneladas[i + 1] := vToneladas[i];
            vClientes[i] := auxCli;
            vPatentes[i] := auxPat;
            vTipos[i] := auxTip;
            vToneladas[i] := auxTon;
        end;
        i := i + 1;
        if cambioValor then
            i := 1;
    end;



end;

var
    clientes , nClientes: vS;
    patentes , nPatentes: vS;
    tipos , nTipos: vB;
    toneladas, nToneladas : vR;
    vL, nvL : byte;
    pregunta : st;
    numero : real;
begin
    //writeln('Roberto-Soledad ',estaDesordenado('Roberto','Soledad'));
    leerArchivo(clientes, patentes, tipos, toneladas, vL);
    writevec(clientes, patentes, tipos, toneladas, vL);
    writeln('a) Porcentaje de toneladas de cada cereal respecto del total');
    writeln('1-trigo, 2-girasol, 3-soja, 4-maiz ');
    porcentaje(clientes, patentes, tipos, toneladas, vL);

    repeat
        writeln('Ingrese patente buscar info o escriba "0" (cero) para salir');
        readln(pregunta);
        if pregunta <> '0' then
            buscarPatente(pregunta, clientes, patentes, tipos, toneladas, vL );
    until pregunta = '0';
    writeln('Ingrese X cantidad a superar en toneladas');
    readln(numero);
    transportaronMas(numero ,clientes, patentes, tipos, toneladas, vL,
                    nClientes, nPatentes, nTipos, nToneladas, nVL);
    writevec(nclientes, npatentes, ntipos, nToneladas, nvL);
    ordenarAlf(nclientes, npatentes, ntipos, nToneladas, nvL);
    writeln('Ordenados');
    writevec(nclientes, npatentes, ntipos, nToneladas, nvL);

    readln();
end.
{
 Ej 15) Una planta de silos registra el ingreso de camiones de sus clientes con cereal,
 por cada uno se tiene:
• Cliente
• Patente del camión
• Tipo de cereal ( 1-trigo, 2-girasol, 3-soja, 4-maiz )
• Toneladas
Se pide que lea los datos desde un archivo y mediante un menú de opciones iterativo calcule e informe:
a) Porcentaje de toneladas de cada cereal respecto del total.
b) Dada una patente, si es que existe, decir qué tipo de cereal transporta,
las toneladas y a qué cliente pertenece.
c) Generar un arreglo con los clientes que transportaron más de X toneladas, ordenado
alfabéticamente.
Generar un archivo de texto, con un mínimo de 10 líneas, que obtenga los siguientes resultados:
a) Trigo: 30%, Girasol: 20%, Soja: 40%, Maiz: 10%.
b) Para la patente AB123CD -> Soja, 45, MDP3
c) X = 30 -> [BAL1, MDP3, NEC3, TAN2]
}

