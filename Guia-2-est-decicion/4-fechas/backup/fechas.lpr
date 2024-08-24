program fechas;
    var
        anio1, anio2, mes1, mes2, dia1, dia2 : byte;
        mes_antiguo : byte; // el mes mas antiguo usado para ver cual es el más antiguo


begin
    writeln('Ingrese el anio, luego el mes y luego dia de la primera fecha');
    readln(anio1, mes1, dia1);
    writeln('Ingrese el anio, luego el mes y luego dia de la segunda fecha');
    readln(anio2, mes2, dia2);

    if (anio1 = anio2) then // mismo año
        if ( mes1 = mes2 ) then // mismo año, mismo mes
            if ( dia1 = dia2) then // mismo año, mismo mes, mismo dia
                begin
                    writeln('Son la misma fecha');
                    mes_antiguo := mes1  ;
                end
            else
                if (dia1 < dia2) then    // mismo año, mismo mes, 1ero es mas antigua
                  begin
                    writeln('La primera fecha es mas antigua');
                    mes_antiguo := mes1;
                  end
                else                    // mismo año, mismo mes, 2do es mas antigua
                   begin
                        writeln('La segunda fecha mas antigua');
                        mes_antiguo := mes2;
                   end
        else   // meses distintos
            if ( mes1 < mes2) then // mismo anio, 1eri es mas antigua
                begin
                    writeln('La primera fecha es mas antigua');
                    mes_antiguo := mes1;
                end
            else    // mismo anio, 2do es mas antigua
                begin
                    writeln('La segunda fecha es mas antigua');
                    mes_antiguo := mes1;
                end
    else // distinto año
        if ( anio1 < anio2) then   // 1er anio mas antigua
            begin
                writeln('La primera fecha es mas antigua');
                mes_antiguo := mes1;
            end
        else                   // 2do anio es mayor
            begin
                writeln('La segunda fecha es mayor');
                mes_antiguo := mes1;
            end;

    // Calculo del trimestre
    case mes_antiguo of
        1..3: writeln('Pertenece al primer trimestre');
        4..6: writeln('Pertenec al segundo trimestre');
        7..9: writeln('Pertenec al tercer trimestre');
        10..12: writeln('Pertenec al cuarto trimestre');
    end;

    readln();



end.

