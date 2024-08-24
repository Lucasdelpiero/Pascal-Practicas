program cartas;
    var
      color_1, color_2, palo_1, palo_2 : char;
      num_1, num_2 : byte;
      situacion : char;

begin
    writeln('Color 1er carta (r/a): ');
    readln(color_1);
    while ( (color_1 <> 'r') and (color_1 <> 'a') ) do
    begin
      writeln('Color 1er carta (r/a): ');
        readln(color_1);
    end;

    writeln('Palo 1er carta (o/c/e/b): ');
    readln(palo_1);
    while ( (palo_1 <> 'o') and (palo_1 <> 'c') and (palo_1 <> 'e') and (palo_1 <> 'b') ) do
    begin
      writeln('Palo 1er carta (o/c/e/b): ');
        readln(palo_1);
    end;

    writeln('Numero 1er carta (1-12):');
    readln(num_1);
    while( (num_1 < 1) or (num_1 > 12) ) do
    begin
        writeln('Numero 1er carta (1-12):');
        readln(num_1);
    end;


    writeln('Ingresa la situacion que quieras comprobar');



  readln();
end.

