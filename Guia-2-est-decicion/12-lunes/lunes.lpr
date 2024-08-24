program lunes;
    var
      dia : byte;

begin
    writeln('Ingrese el dia:');
    readln(dia);

    case dia of
        1,8,15,22,29:   writeln('Es lunes');
        2,9,16,23,30:   writeln('Es martes');
        3,10,17,24,31:  writeln('Es miercoles');
        4,11,18,25:     writeln('Es jueves');
        5,12,19,26:     writeln('Es viernes');
        6,13,20,27:     writeln('Es sabado');
        7,14,21,28:     writeln('Es domingo');
    end;

    readln();
end.

{
 Ej 12) Dado un día (entre 1 y 31) y suponiendo que el día 1 es Lunes, determinar a qué
día de la semana corresponde el número ingresado.
}
