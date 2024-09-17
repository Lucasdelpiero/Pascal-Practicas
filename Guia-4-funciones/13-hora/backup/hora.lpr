program hora;
type
    st8 = String[8];

// Testeando el forward
function horasAseg(hora, min, seg : byte) : longint; forward;
procedure segAhoras(segT : longint; var hora, min, seg : byte); forward;

// Lo de abajo no es lo que pide el inciso pero lo dejo porque esta piola
procedure tiempoTranscurrido(horaI, minutosI, segundosI, horaF, minutosF, segundosF : byte; var
            difHoras, difMinutos, difSegundos : byte);
var
    segundosTotales, segundosIniciales, segundosFinales : longint;
begin
    // Se calcula todo usando los segundos, usando el DIV para saber cuantas horas o min hay
    segundosIniciales := (horaI * 60 * 60) + (minutosI * 60) + segundosI;
    writeln('test1: ',segundosIniciales);
    segundosIniciales := horasAseg(horaI, minutosI, segundosI);
    writeln('test2: ',segundosIniciales);

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

procedure segAhoras(segT : longint; var hora, min, seg : byte);
var segRestantes : longint;
begin
    segRestantes := segT;
    hora := segRestantes div (60 * 60);
    while hora >= 24 do
        begin
        hora := hora - 24;
        segRestantes := segRestantes - (24 *60 * 60)
        end;
    segRestantes := segRestantes - (hora * 60 * 60);

    min := segRestantes div 60;
    segRestantes := segRestantes - (min * 60);

    seg := segRestantes;
end;

procedure horaFinal(horaI, minI, segI : byte; segTransc : longint;
                var horaF : byte; var minF : byte; var segF : byte);
var
    segT : longint;
begin
    segT := horasaSeg(horaI, minI, segI);
    segT := segT + segTransc;
    segAhoras(segT, horaF, minF, segF);
end;


function horasAseg(hora, min, seg : byte) : longint;
begin
    horasAseg := (hora * 60 * 60) + (min * 60) + seg;
end;

function formDig(dig : byte) : st8;
var texto, aux : st8;
begin
    texto := '';
    if dig < 10 then
    begin
        str(dig,aux);
        texto := '0' + aux;
    end
    else
    begin
        str(dig, aux);
        texto := texto + aux;
    end;
    formDig := texto;
end;

function formatearHora(hora, min, seg : byte) : st8;
begin
    formatearHora := formDig(hora) + ':' + formDig(min) + ':' + formDig(seg);
end;


// Subprograma que controla todo, se usa para que las variables tengan solo alcence local
procedure principal();
    var
        horaI, horaF, minutosI, minutosF, segundosI, segundosF : byte;
        //difHoras, difMinutos, difSegundos : byte;
        segTransc : longint;
begin
    writeln('Se le pide la hora-minutos-segundos iniciales');
    writeln('Ingrese las horas');
    readln(horaI);
    writeln('Ingrese los minutos');
    readln(minutosI);
    writeln('Ingrese los segundos');
    readln(segundosI);

    segAhoras(horasAseg(horaI, minutosI, segundosI), horaF, minutosF, segundosF);
    writeln('Hora ingresada:  ' ,formatearHora(horaI, minutosI, segundosI));

    writeln('Ingrese los segundos transcurridos');
    readln(segTransc);
    horaFinal(horaI, minutosI, segundosI, segTransc, horaF, minutosF, segundosF);
    writeln('Hora final:  ', formatearHora(horaF, minutosF, segundosF));


    {
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
    }
end;

begin
    principal();

    readln();
end.

{
 Ej 13) Desarrollar un procedimiento que dada una Hora Inicial (horas, minutos, segundos) y unos
segundos transcurridos, devuelva la Hora Final (en horas, minutos y segundos)
}

