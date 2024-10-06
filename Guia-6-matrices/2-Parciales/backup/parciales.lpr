program parciales;
type
    st = String[16];
    vNom = array[1..32] of st;
    mR = array[1..32, 1..32] of real;

procedure writevec(vec: vNom; nL: byte);
var i : byte;
begin
    for i:=1 to nL do
        writeln(' ',vec[i]);
end;

procedure writeMat(mat: mr; n, m: byte);
var i, j : byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            write(mat[i,j]:8:2,' ');
        end;
        writeln();
    end;

end;

procedure leerArchivo(var Nbre: vNom;var nL: byte;var notas: mR;var notN,notM: byte);
var arch : text;
begin
    assign(arch, 'text.txt');
    reset(arch);
    nL := 0;
    notN := 0;

    while not   eof(arch) do
    begin
        nL := nL + 1;
        notN := notN + 1;
        readln(arch, Nbre[nL]);
        notM := 0;

        while not eoln(arch) do
        begin
            notM:= notM + 1;
            read(arch, notas[notN, notM]);
        end;
        readln(arch);
    end;
    close(arch);
end;

procedure aprobados(nbre: vNom;nL: byte; notas: mR; notN, notM: byte);
var i, j: byte;
    aprobado: boolean;
begin
    for i:=1 to notN do
    begin
        aprobado := true;
        for j:=1 to notM do
        begin
            if notas[i,j] < 5 then
                aprobado := false;
        end;
        if aprobado then
            writeln(nBre[i]);
    end;
end;

procedure situacion(nbre: vNom;nL: byte; notas: mR; notN, notM: byte;
        var promoc: vNom; var promocL: byte);
var i, j: byte;
    suma,promedio: real;
begin
    promocL := 0;
    for i:=1 to notN do
    begin
        suma := 0;
        for j:=1 to notM do
        begin
            suma := suma + notas[i, j];
        end;
        promedio := suma / notM;

        if promedio >= 7 then
            begin
            writeln(nbre[i], 'ha promocionado con: ', promedio:0:2);
            promocL := promocL + 1;
            promoc[promocL] := nbre[i];
            end
        else
            if (promedio >= 5) and (notas[i, notM] >= 5) then
                writeln(nbre[i],' ha habilitado con: ', promedio:0:2)
        else
            writeln(nbre[i], ' ha desaaprobado con: ', promedio:0:2);
    end;
end;

var
    Nbre, promoc : vNom;
    notas : mR;
    nomL, notN, notM, promocL: byte;

begin
    leerArchivo(nBre, nomL, notas, notN, notM);
    writevec(nBre, nomL);
    writeMat(notas, notN, notM);
    writeln('Los aprobados son');
    aprobados(nBre, nomL, notas, notN, notM);
    writeln('La situacion es');
    situacion(nBre, nomL, notas, notN, notM, promoc, promocL);
    writevec(promoc, promocL);

    readln();
end.

{
 Ej 2) En un archivo se almacenó el Nombre del alumno y la nota de los K parciales,
 pasar los datos a un vector Nbre paralelo a la matriz Notas e informar:
a) Listado de los alumnos que aprobaron los K parciales.
b) Por cada alumno determinar su situación:
- Promociona: si el promedio es >= 7
- Habilita: si promedio >= 5 y < 7; y la K-ésima nota >= 5
- Desaprobado: en otro caso
y generar un arreglo con los nombres de aquellos que promocionaron.
}
