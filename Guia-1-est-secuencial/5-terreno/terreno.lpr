program terreno;
    var
        ancho_a_enbaldosar, alto_a_enbaldosar : real;

    const
        ancho_terreno = 10;
        alto_terreno = 30;
        baldosa_diametro = 0.25;

begin
    writeln('Tenemos un terreno de 10x30 metros cuadrados que queremos enbaldosar.');
    writeln('Ingrese las dimensiones a enbaldosar, primero el ancho, luego el alto.');
    readln(ancho_a_enbaldosar, alto_a_enbaldosar);
    while (ancho_a_enbaldosar > ancho_terreno) or (alto_a_enbaldosar > alto_terreno)do
    begin
      writeln('Dimension de mayor a al menos uno de los largos del terreno');
      writeln('Las dimensiones deben ser el ancho <= 10 y el alto <= 30');
      readln(ancho_a_enbaldosar, alto_a_enbaldosar);
    end;

    writeln('La superficie a enbaldosar es de ',
        (ancho_a_enbaldosar * alto_a_enbaldosar):0:2,
        ' metros cuadrados.'
    );
    writeln('Necesita ',
    //((ancho_a_enbaldosar / baldosa_diametro) * (alto_a_enbaldosar / baldosa_diametro) ):0:2),
    ( (ancho_a_enbaldosar * alto_a_enbaldosar )/ baldosa_diametro):0:2,
    ' baldosas');


    readln();
end.

