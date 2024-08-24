program cartas;
    var
      color_1, color_2, palo_1, palo_2 : char;
      num_1, num_2 : byte;
      situacion : char;

begin
    // ===Primera carta===
    // Color
    writeln('Color 1er carta (r/a): ');
    readln(color_1);
    while ( (color_1 <> 'r') and (color_1 <> 'a') ) do
    begin
      writeln('Color 1er carta (r/a): ');
        readln(color_1);
    end;

    // Palo
    writeln('Palo 1er carta (o/c/e/b): ');
    readln(palo_1);
    while ( (palo_1 <> 'o') and (palo_1 <> 'c') and (palo_1 <> 'e') and (palo_1 <> 'b') ) do
    begin
      writeln('Palo 1er carta (o/c/e/b): ');
        readln(palo_1);
    end;

    // Numero
    writeln('Numero 1er carta (1-12):');
    readln(num_1);
    while( (num_1 < 1) or (num_1 > 12) ) do
    begin
        writeln('Numero 1er carta (1-12):');
        readln(num_1);
    end;

    // ===Segunda carta===
    // Color
    writeln('Color 2da carta (r/a): ');
    readln(color_2);
    while ( (color_2 <> 'r') and (color_2 <> 'a') ) do
    begin
      writeln('Color 2da carta (r/a): ');
        readln(color_2);
    end;

    // Palo
    writeln('Palo 2da carta (o/c/e/b): ');
    readln(palo_2);
    while ( (palo_2 <> 'o') and (palo_2 <> 'c') and (palo_2 <> 'e') and (palo_2 <> 'b') ) do
    begin
      writeln('Palo 2da carta (o/c/e/b): ');
        readln(palo_2);
    end;

    // Numero
    writeln('Numero 2da carta (1-12):');
    readln(num_2);
    while( (num_2 < 1) or (num_2 > 12) ) do
    begin
        writeln('Numero 2da carta (1-12):');
        readln(num_2);
    end;

    writeln('Ingresa la situacion que quieras comprobar (a-h)');
    readln(situacion);




  readln();
end.

