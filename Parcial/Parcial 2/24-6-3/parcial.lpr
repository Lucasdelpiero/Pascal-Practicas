program parcial;
type
    stCod = string[5];
    Tdur = array[1..3] of word; // Aca deberia ser mas grande el array pq puede haber n canciones
    // Va, ya no se usa el tDur en este caso
    tInterprete = record
        cod: stCod;
        gen: byte;
    end;

    TVinterpretes = array[1..100] of Tinterprete;
    TMdur = array[1..100,1..3] of word; // Aca puede haber N canciones, pueden ser mas de 3
    Tgen = array[1..6] of byte;
    TMpos = array[1..100,1..100] of word;

function cantSuperanT(T: word; mat: TMdur; n: byte): byte;
var cant, i, j: byte;
    superan: boolean;
begin
    cant := 0;
    for i:=1 to n do
    begin
        superan := true;
        {for j:= 1 to 3 do // Mal, puede haber mas de 3 canciones
        begin                     // Suma mal ( si una da falsa entonces deja de sumar el resto)
            if mat[i, j] < T then
                superan := false;
            if superan then
                cant := cant + 1;
        end;}
        // asi deberia ser
        for j := 1 to 3 do // Mal porque puede haber mas de 3 canciones
        begin
            if mat[i,j] > T then
                cant := cant + 1
        end;

    end;
    cantSuperanT := cant;
end;

function mayordur(mat: TMdur; fila: byte): word ;
var max: word;
    i: byte;
begin
    max := 0;
    for i := 1 to 3 do // Mal, puede haber mas de 3 canciones
    begin
        if mat[fila, i] > max then
            max := mat[fila, i];
    end;
    mayordur := max;
end;

function promedio(mat: TMdur; filas: byte): real;
var i,j: byte;
    total: word;
begin
    total := 0;
    if filas = 0 then
        promedio := 0
    else
    begin
        for i := 1 to filas do
        begin
            for j := 1 to 3 do // mal, puede haber mas de 3 canciones
                total := total + mat[i, j];
        end;
        promedio := total / (filas * 3); // Mal, puede haber mas de 3 canciones
    end;
end;

procedure leerArchivo(var Vinterpretes: TVinterpretes; var nInter: byte;  var mat: TMdur);
var arch: text;
  i,n,gen: byte;
  cod: stCod;
  prem,noqui: char;
  tempMat: TMdur;
begin
    assign(arch, 'ranking.txt'); reset(arch);
    readln(arch, n);
    nInter := 0;

    while not eof(arch) do
    begin
        read(arch, cod, gen);
        for i:= 1 to n do
            read(arch, tempMat[1,i]);
        readln(arch, noqui, prem);

        if prem = 'S' then
        begin
            nInter := nInter + 1;
            Vinterpretes[nInter].cod := cod;
            Vinterpretes[nInter].gen := gen;
            for i:= 1 to 3 do // deberia ser hasta N y no hasta 3
                mat[nInter, i] := tempMat[1, i];
        end;
    end;
    close(arch);
end;

procedure genVec(Vinter: TVinterpretes; mat: TMdur; nInter: byte;
                    var nuevoVec: TVinterpretes; var nuevoN: byte);
var i, j: byte;
    prom: real;
begin
    prom := promedio(mat, nInter);
    nuevoN := 0;
    for i:= 1 to nInter do
    begin
        if prom < mayordur(mat, i) then
        begin
            nuevoN := nuevoN + 1;
            nuevoVec[nuevoN].cod := Vinter[i].cod;
            nuevoVec[nuevoN].gen := Vinter[i].gen;
        end;
    end;
end;

procedure mostrarVec(vec: TVInterpretes; n: byte);
var i: byte;
begin
    for i := 1 to n do
        writeln(vec[i].cod, ' ', vec[i].gen);
end;

procedure inicializar(vec: Tgen; n: byte);
var i: byte;
begin
    for i := 1 to n do
        vec[i] := 0;
end;

procedure infoxGen(vec: TVinterpretes; n: byte);
var i: byte;
    Vgen : Tgen;
begin
    inicializar(Vgen, 6);
    for i := 1 to n do
        Vgen[vec[i].gen] := Vgen[vec[i].gen] + 1;

    for i := 1 to 6 do
        writeln('El Genero ', i, ' tiene ', Vgen[i] * 3, ' canciones '); // el 3 esta mal
end;






var
  interpretes, interpretesSup: TVinterpretes;
  nInter, nInterSup: byte;
  T: word;
  mat : TMdur;
  matPos: TMpos;
  nMPos: byte;

begin
    leerArchivo(interpretes, nInter, mat);
    writeln('Ingrese T');
    readln(T);
    writeln('Superan T unas ', cantSuperanT(T, mat, nInter), ' canciones');
    writeln('Artistas que la cancion de mayor duracion supera el promedio:');
    genVec(interpretes, mat, nInter, interpretesSup, nInterSup);
    mostrarVec(interpretesSup, nInterSup);
    //writeln('Info por genero de los que ganaron un premio: ');
    infoXgen(interpretes, nInter);


    readln();
end.







