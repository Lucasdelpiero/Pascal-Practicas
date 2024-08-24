program pintura;
        var
           x:real; {cantidad de pintura}
           tipo:char;
begin
     writeln('Ingrese el color de pintura (B: Blanca / N: Negra): ');
     readln(tipo);
     if ((tipo='b') OR (tipo='B') ) then
     begin
          writeln('Ingrese la cantidad de pintura requerida (litros): ');
          readln(x);
          writeln('');
          write('Usted necesita ');
          write((x*(9.5/4.5)):0:2);
          writeln(' litros de blanco');
     end;
     if ((tipo='n') OR (tipo='N') ) then
     begin
          write('Ingrese la cantidad de pintura requerida (litros):');
          readln(x);
          writeln('');
          write('Usted necesita ');
          write((x*(4.5/9.5)):0:2);
          writeln(' litros de negro');
     end;
readln();
end.
