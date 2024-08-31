program autos;
var
    arch : text;
    auto, autoMasViajes : string[6];
    contMasViajes, masViajesTuvo : byte;
    consumo, consumoMenorRecorrido, distanciaTotal, menorDistancia, num : real;


begin
    num := 99;     // numero que lee en cada celda aparte de la licencia y consumo
    contMasViajes := 0;
    masViajesTuvo := 0;
    consumoMenorRecorrido := 0.0;
    menorDistancia := 99999; // Lo que recorrio el que menor distancia hizo
    assign(arch, 'datos.txt');
    reset(arch);

    while not eof(arch) do
    begin
        contMasViajes := 0;  // Cuenta cuantos viajes hizo cada auto
        distanciaTotal := 0; // Cuenta lo que recorrio un auto en total

        read(arch, auto);
        read(arch, consumo);
        read(arch,num); // Se lee el primer num fuera para poder usar el while

        while (num <> 0) do
        begin
            contMasViajes := contMasViajes + 1;
            distanciaTotal := distanciaTotal + num;
            read(arch,num);
        end;

        //a
        writeln(auto, ' consumio ', consumo:0:2, ' litros de nafta en ', distanciaTotal:0:2,' kms');

        // b
        if (contMasViajes > masViajesTuvo) then
            begin
                autoMasViajes := auto;
                masViajesTuvo := contMasViajes;
            end;

        //c
        if (distanciaTotal < menorDistancia) then
            begin
                consumoMenorRecorrido := consumo;
                menorDistancia := distanciaTotal;
            end;

        // Pasa a la siguiente linea
        readln(arch);


    end;

    //b
    writeln('Hizo mas viajes el de patente: ', autoMasViajes);

    //c
    writeln('El que recorrio la menor cantidad de kms consumio: ', consumoMenorRecorrido:0:2);

    readln();



end.

{
Ej 16) Una empresa de autos de alquiler posee N vehículos y ha registrado la siguiente información de los
viajes realizados, por cada uno de ellos:
-Patente
-Total de litros de combustible consumidos
Y por cada viaje realizado
- Kilómetros recorridos. (0 indica fin de datos).
Se pide ingresar los datos e informar:
a) Por cada vehículo el consumo que tuvo (cantidad de litros por km. recorrido)
b) Patente del vehículo que más viajes hizo.
c) Total de litros consumidos por el auto que hizo la menor cantidad de kms.
}
