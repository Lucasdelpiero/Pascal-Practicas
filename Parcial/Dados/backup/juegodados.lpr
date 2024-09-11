program juegodados;
    var
        nombre : String[10];
        arch : text;
        puntaje, x, dado1, dado2, suma, puntajeTotal : byte;
        contMenorX, contJugadores, tiros, i : byte;
        tiene6 : boolean;
begin
    nombre:='x';
    contMenorX := 0;
    contJugadores := 0;
    tiros := 2;
    writeln('Ingrese x a ser menor');
    readln(x);
    assign(arch,'text.txt');
    reset(arch);
    readln(arch, nombre);
    while nombre <> '***' do
    begin
        PuntajeTotal :=0;
        contJugadores := contJugadores + 1;
        tiene6 := false;
        for i:=1 to tiros do
        begin
            readln(arch, dado1, dado2);
            suma := dado1 + dado2;
            if (dado1 = 6) or (dado2 = 6) then
                tiene6 := true;
            if dado1 = dado2 then
                suma := suma * 3
            else
              if (dado1 - 1 = dado2) or (dado1 = dado2 - 1) then
                    suma := suma * 2;
            PuntajeTotal := PuntajeTotal + suma;
        end;
        if (PuntajeTotal < x) and (tiene6 = true) then
            contMenorX := contMenorX + 1;
        writeln('El puntaje es de: ', puntajeTotal);
        readln(arch, nombre);
    end;

    if contMenorX = 0 then
        writeln('No hay jugadores que hayan sacado 6')
    else
        writeln('Un total de ', (100 * contMenorX / contJugadores):5:2, '% tienen 6 en alguna tirada');
    close(arch);

    readln();

end.

