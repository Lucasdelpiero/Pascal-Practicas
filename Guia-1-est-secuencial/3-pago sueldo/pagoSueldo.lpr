program pagoSueldo;
        var
          h_trab : byte;   // Horas trajabadas
        const
          sal_x_h = 200;   // Salario por hora

begin
  writeln('Ingrese la cantidad de horas trabajadas');
  readln(h_trab);
  writeln('Salario bruto: $', (sal_x_h * h_trab * 1.0):0:2 );
  writeln('Salario Neto: $',
      ((sal_x_h * h_trab) - (sal_x_h * h_trab * 0.11) - (sal_x_h * h_trab * 0.5)):0:2
  );

  readln();
end.

