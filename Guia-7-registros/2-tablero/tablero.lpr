program tableroAjedrez;
type
    pieza = record
        tipo: char;
        color: byte;
    end;
    tablero = array[1..8,1..8] of pieza;

procedure dibujarTablero(tab: tablero);
var i, j: byte;
    cuadro: string[8];
begin
    for i:=1 to 8 do
    begin
        for j:=1 to 8 do
        begin
            with tab[i, j] do
            begin
                if tipo <> ' ' then
                    cuadro := tipo
                else
                    cuadro := '[  ]';

                if color = 1 then
                    cuadro := cuadro + '(B)'
                else
                    if color = 2 then
                        cuadro := cuadro + '(N)';
                end;
            write(' ',cuadro,' ');
        end;
        writeln();
    end;
end;

procedure leerArchivo(var tab : tablero);
var arch: text;
    i, j, fila, col: byte;

begin
    assign(arch, 'text.txt');
    reset(arch);
    //Inicializar tablero vacio
    for i:=1 to 8 do
        for j:=1 to 8 do
        begin
            tab[i,j].tipo:= ' ';
            tab[i,j].color:= 0;
        end;
    while not eof(arch) do
    begin
        read(arch, fila, col);
        with tab[fila, col] do
        begin
            read(arch, tipo); // Saltea el espacio
            read(arch, tipo);
            readln(arch, color);
        end;
    end;

    close(arch);
end;

procedure informeTorre(tab: tablero); // 6 4
var i, j, fila, col : byte;
begin
    i := 6;
    j := 4;
    // Arriba
    fila := i - 1;
    while (fila > 0) and (tab[fila, j].color = 0) do
        fila := fila - 1;
    if tab[fila, j].color = 1 then
        writeln('Amenaza a ',tab[fila, j].tipo)
    else
        if tab[fila, j].color = 2 then
            writeln('Protege a ', tab[fila, j].tipo);
    // Abajo
        fila := i + 1;
    while (fila < 8) and (tab[fila, j].color = 0) do
        fila := fila + 1;
    if tab[fila, j].color = 1 then
        writeln('Amenaza a ',tab[fila, j].tipo)
    else
        if tab[fila, j].color = 2 then
            writeln('Protege a ', tab[fila, j].tipo);
    // Izquierda
    col := j - 1;
    while (col > 0) and (tab[i, col].color = 0) do
        col := col - 1;
    if tab[i, col].color = 1 then
        writeln('Amenaza a ',tab[i, col].tipo)
    else
        if tab[i, col].color = 2 then
            writeln('Protege a ', tab[i, col].tipo);
      // Derecha
    col := j + 1;
    while (col < 8) and (tab[i, col].color = 0) do
        col := col + 1;
    if tab[i, col].color = 1 then
        writeln('Amenaza a ',tab[i, col].tipo)
    else
        if tab[i, col].color = 2 then
            writeln('Protege a ', tab[i, col].tipo);



end;

var tab : tablero;

begin
    leerArchivo(tab);
    dibujarTablero(tab);
    informeTorre(tab);

    readln();
end.

{
 Ej 2) En una matriz Tablero de 8x8 se almacenó una jugada de ajedrez.
 Además, se sabe la posición (i,j) de una de las Torres Negras, y que juegan las negras.
 Determinar e informar a qué piezas “defiende” la Torre y a cuáles “amenaza”,
 sabiendo que las piezas tienen dos atributos:
- Tipo: R = Rey, Q = Reina, A = Alfil, T = Torre, C = Caballo, P = Peón
- Color: 1 = Blanco, 2 = Negro
Nota: armar el Tablero leyendo desde archivo, donde en cada línea viene (fila, col, Tipo, Color)
}
