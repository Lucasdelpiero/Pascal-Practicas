program hora;

procedure tiempoTranscurrido(horaI, minutosI, segundosI, horaF, minutosF, segundosF : byte; var
            difHoras, difMinutos, difSegundos : byte);

var
    segundosTotales, segundosIniciales, segundosFinales : word;
begin
    // Se calcula todo usando los segundos, usando el DIV para saber cuantas horas o min hay
    segundosIniciales := (horaI * 60 * 60) + (minutosI * 60) + segundosI;
    segundosFinales := (horaF * 60 * 60) + (minutosF * 60) + segundosF;
    segundosTotales := segundosFinales - segundosIniciales ; // Differencia de segundos entre ambos

    // Por cada hora de diferencia se le resta la cantidad correspondiente de segundos
    difHoras :=   (segundosTotales DIV ( 60 *  60 )  );
    segundosTotales := segundosTotales - (difHoras * 60  * 60);

    // Por cada minuto se le resta la cantidad correspondiente de segundos
    difMinutos := (segundosTotales DIV 60);
    segundosTotales := segundosTotales - (difMinutos * 60);

    difSegundos := segundosTotales; // Segundos sobrantes
end;

// Subprograma que controla todo, se usa para que las variables tengan solo alcence local
procedure principal();
    var
        horaI, horaF, minutosI, minutosF, segundosI, segundosF : byte;
        difHoras, difMinutos, difSegundos : byte;
begin
    writeln('Se le pide la hora-minutos-segundos iniciales');
    writeln('Ingrese las horas');
    readln(horaI);
    writeln('Ingrese los minutos');
    readln(minutosI);
    writeln('Ingrese los segundos');
    readln(segundosI);

    writeln('Ahora se le pide la hora-minutos-segundos finales');
    writeln('Ingrese las horas');
    readln(horaF);
    writeln('Ingrese los minutos');
    readln(minutosF);
    writeln('Ingrese los segundos');
    readln(segundosF);

    tiempoTranscurrido(horaI, minutosI, segundosI, horaF, minutosF, segundosF,
        difHoras, difMinutos, difSegundos);

    writeln('Entre una hora y otra hay ', difHoras,'h ',difMinutos,'m ', difSegundos,'s de diferencia')

end;

begin
    principal();

    readln();
end.

{
 Ej 13) Desarrollar un procedimiento que dada una Hora Inicial (horas, minutos, segundos) y unos
segundos transcurridos, devuelva la Hora Final (en horas, minutos y segundos)
}

