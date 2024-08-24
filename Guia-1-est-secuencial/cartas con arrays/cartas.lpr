program cartas;
    type
        array_color = array[1..2] of string;
        array_palo = array [1..4] of char;
        array_numero = array [1..12] of integer;


    var
      color : array_color;
      palo : array_palo;
      numero : array_numero;
      n, p, c : byte;   // 1er iterador para numeros, palos, color
      n2, p2, c2 : byte;  // 2do iterador para numeros, palos color
      respuesta : char; // para elegir si responder todo o solo una pregunta


begin
  // Inicializacion de arrays
    color[1] := 'rojo';
    color[2] := 'azul';

    palo[1] := 'O';
    palo[2] := 'C';
    palo[3] := 'E';
    palo[4] := 'B';

    for n := 1 to 12 do
        numero[n] := n;

    // Comienzo del programa para el usuario
    write('Escriba la letra correspondiente al inciso que quiere responder a-h o escriba ');
    writeln('t para recibir todas las respuestas');
    readln(respuesta);
    // Validacion
    while not( (respuesta in ['a'..'h']) or (respuesta = 't') ) do
    begin
      writeln('Escribe una letra entre a-h o t para recibir todas las respuestas');
      readln(respuesta);
    end;

    // a)
    if (respuesta = 'a' ) or (respuesta = 't') then
    begin
        for c := 1 to 2 do // c = color
            for p := 1 to 4 do // p palo
                writeln('a) 1 de ', palo[p], ' del mazo color ', color[c]);
    end;

    // b)
    if (respuesta = 'b' ) or (respuesta = 't') then
    begin
        for p := 1 to 4 do // p palo
            for n := 1 to 12 do // n numero
                writeln('b) ',numero[n], ' de ', palo[p], ' del mazo color rojo' );
    end;

    // c)
    if (respuesta = 'c' ) or (respuesta = 't') then
    begin
        for p := 1 to 4 do // p palo
            for n := 1 to 12 do // n numero
                writeln('c)' ,numero[n], ' de ', palo[p], ' de color rojo y azul');
    end;

    // d)
    if (respuesta = 'd' ) or (respuesta = 't') then
    begin
        for c := 1 to 2 do // c color
          for p := 1 to 4 do // p palo
    // Se comprueba hasta el 11 para que no compare n+1 con n=12 daria 13 (fuera de rango)
              for n := 1 to 11 do // n numero
                  writeln('d) ',numero[n],' y ', numero[n+1], ' de ', palo[p] ,
                  ' de color ', color[c] ,' son consecutivos');
    end;

    // e)
    if (respuesta = 'e' ) or (respuesta = 't') then
    begin
        for c := 1 to 2 do // c color
          for p := 1 to 4 do // p palo
              for n := 1 to 12 do// n numero
                for c2 := 1 to 2 do // c2 color
                    for p2 := 1 to 4 do// p2 palo
                        for n2 := 1 to 12 do // n2 numero
                            if  ( ((numero[n] + numero[n2]) = 12) and (c <> c2) and (palo[p] <> palo[p2]) )  then
                              writeln('e) Suman 12: el ', numero[n],' de ', palo[p],' color ', color[c],
                              ' y el ', numero[n2],' de ', palo[p2],' color ', color[c2]
                              );
    end;

    // f)
    if (respuesta = 'f' ) or (respuesta = 't') then
    begin
        writeln('Son el mismo numero, siendo teniendo mismo mazo o palo:');
        for c := 1 to 2 do // c color
          for p := 1 to 4 do // p palo
              for n := 1 to 12 do// n numero
                for c2 := 1 to 2 do // c2 color
                    for p2 := 1 to 4 do// p2 palo
                        for n2 := 1 to 12 do // n2 numero
                            if ( (numero[n] = numero[n2]) and ( (color[c] = color[c2] ) or (palo[p] = palo[p2]) )  )   then
                                writeln('f) ' ,numero[n], ' de ', palo[p], ' color ', color[c] , ' y ',
                                    numero[n2], ' de ', palo[p2], ' color ', color[c2]
                                );
    end;

    // g)
    if ( (respuesta = 'g' ) or (respuesta = 't') ) then
    begin
        writeln('g) Son distintos numeros del mismo mazo y palo:');
        for c := 1 to 2 do // c color
          for p := 1 to 4 do // p palo
              for n := 1 to 12 do // n numero primera carta
                  for n2 := 1 to 12 do // n numero segunda carta
                      if ( n <> n2 ) then
                          writeln('g) ', n, ' de ', palo[p], ' color ', color[c] ,
                          ' y ', n2, ' de ', palo[p], ' color ', color[c]
                          );
    end;

    // h)
    if ( (respuesta = 'h' ) or (respuesta = 't') ) then
    begin
        for c := 1 to 2 do // c color
          for p := 1 to 4 do // p palo
              for n := 1 to 12 do// n numero
                for c2 := 1 to 2 do // c2 color
                    for p2 := 1 to 4 do// p2 palo
                        for n2 := 1 to 12 do // n2 numero

                            // Si es mayor, ya cumple
                            if ( n > n2  ) then
                                writeln('h) ', n, ' de ', palo[p], ' de color ', color[c], ' es mayor que ',
                                        n2, ' de ', palo[p2], ' de color ', color[c2])

                            // Si tiene numeros iguales, desempata el color
                            else if ( n = n2) then // n = n2

                                // EL color rojo prioriza al azul
                                  if ( c <> c2) then // n = n2, distinto color
                                      if (c < c2) then // Tiene prioridad el rojo (menor)
                                          writeln('h) ', n, ' de ', palo[p], ' de color ', color[c], ' es mayor que ',
                                          n2, ' de ', palo[p2], ' de color ', color[c2])

                                  // Si tienen el mismo color desempata el palo
                                  // El palo escrito antes vale mas
                                  else if ( c = c2 ) then // n = n2, mismo color
                                      if ( p < p2) then
                                          writeln(n, ' de ', palo[p], ' de color ', color[c], ' es mayor que ',
                                          n2, ' de ', palo[p2], ' de color ', color[c2])


    end;



  readln();
end.

