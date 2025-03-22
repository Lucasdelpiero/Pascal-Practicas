program fechas;
    var
        mes1, mes2, dia1, dia2 : byte;
        anio1, anio2: word;

begin
    writeln('Ingrese dia, mes y anio 1'); readln(dia1, mes1, anio1);
    writeln('Ingrese dia, mes y anio 2'); readln(dia2, mes2, anio2);

    // Anio menor ----------mismo anio y menor mes-----------(mismo anio y mes) -- dia1 menor
    if (anio1<anio2) or ((anio1=anio2) and ((mes1<mes2) or ((mes1=mes2) and (dia1<dia2)))) then
        writeln('La primera fecha es menor. Trimestre:', mes1 div 4 + 1)
    else
        if (anio2<anio1) or ((anio2=anio1) and ((mes2<mes1) or ((mes2=mes1) and (dia2<dia1)))) then
            writeln('La segunda fecha es menor. Trimestre: ', mes2 div 4 + 1)
        else
            writeln('Son la misma fecha');
    // El 'anio1=anio2' en los parentesis se 'distribuye' gracias al 'and' haciendo que no haya
    // que usarlo en cuando se comprueba el mes y el dia
    readln();

end.

