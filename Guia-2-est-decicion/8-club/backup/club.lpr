program club;
    var
        edad, cant_dep , dia_pago : byte;
        hace_pileta : char;
        precio : real;
    const
      costo_dep = 250;
      costo_pileta = 800;
      recargo = 0.05;

begin
    writeln('Ingrese su edad');
    readln(edad);

    writeln('Cuantos adicionales deportes va a hacer?');
    readln(cant_dep);

    if(cant_dep > 0) then
      begin
        writeln('Uno de esos deportes es pileta ( S / N)');
        readln(hace_pileta);
        hace_pileta := upcase(hace_pileta);
      end;

    writeln('Que dia va a abonar?');
    readln(dia_pago);

    // Asigna precio segun edad
    case edad of
        19..150:    precio := 1800;
        13..18:     precio := 1200;
        5..12:      precio := 750;
        else
                    precio := 0;
    end;

    // Sumar deportes extra
    if (cant_dep >= 1) then
      if ( hace_pileta = 'S' ) then
          precio := precio + costo_pileta + (costo_dep * (cant_dep - 1))
      else
          precio := precio + cant_dep * costo_dep;

    // Recargo por pago tarde
    if (dia_pago > 15) then
      precio := precio + (precio * recargo);

    writeln('Su total a abonar es: ', precio:0:2);

    readln();
end.

{
 Ej 8) Un club cobra a sus socios una cuota básica por mes que incluye dos deportes, su costo depende de
la edad del socio:
Si es mayor de 18: $1800
Si está entre 13 y 18: $1200
Si tiene entre 5 y 12 años: $750
En otro caso no pagaUNMDP – FI Programación I
Pág. 2
Además, se cobra $250 por cada deporte adicional que realiza, excepto pileta escuela que cuesta $800. Si
la cuota se abona después del día 15 tiene un recargo del 5%.
Determinar los datos a ingresar, para calcular e informar cuánto paga un socio
}
