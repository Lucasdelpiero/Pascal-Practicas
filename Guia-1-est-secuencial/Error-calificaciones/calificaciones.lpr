program calificaciones;
        var
          cant_prom, cant_reg, cant_des : byte; // cantidad de aprobados/regulares/desaprobados
          nota_1, nota_2 : real; // notas parciales
          i : byte; // iterador para for loop

          asistencia_alumno , asistencia_total : real;

        const
          cant_alumnos = 5;

begin
  // Inicializacion de variables
  cant_prom := 0;
  cant_reg := 0;
  cant_des := 0;
  asistencia_total := 0;

  // Inicio del programa que ve el usuario
  writeln('Bienvenido al sistema calificador de 5 alumnos');
  for i := 1 to cant_alumnos do
  begin
      writeln('-----------------------------------------------------------');
      writeln('Usted es el alumno numero ', i,'.');

      // Ingresar notas y validacion
      writeln('Ingrese la nota (1-10) del primer parcial, y luego el del segundo.');
      readln(nota_1, nota_2);
      while(nota_1 <= 0) or (nota_1 > 10) or (nota_2 <= 0) or (nota_2 > 10) do
      begin
          writeln('Ingrese las notas una a la vez y solo en numero enteros entre 1 y 10.');
          readln(nota_1, nota_2);
      end;

      // Ingresar asistencia y validacion
      writeln('Ingrese su porcentaje de asistencia (0-100).');
      readln(asistencia_alumno);
      while(asistencia_alumno <0) or (asistencia_alumno > 100) do
      begin
          writeln('Ingrese el porcentaje mayor o igual a 0 y menor a 100, solo en numeros.');
          readln(asistencia_alumno);
      end;
      asistencia_total := asistencia_total + asistencia_alumno;

      // Aprobado
      if (((nota_1 + nota_2)/ 2) >= 12) and (nota_1 >= 5) and (nota_2 >=5) and (asistencia_alumno >= 50) then
           cant_prom := cant_prom + 1
      // Habilitado
      else if ( (nota_1 >= 5) or (nota_2 >=5) ) and (asistencia_alumno >= 80) then
           cant_reg := cant_reg + 1
      // Desaprobado
      else cant_des := cant_des + 1;

      { Mientras no se agregue un ";" se pasa al siguiente condicional del if-else if-else
      agregando un ";" va a dar error de compilacion }


  end;

  // Muestra valores obtenidos al final del programa
  writeln('===========================================================');
  writeln('Cantidad de alumnos que promocionan: ', cant_prom);
  writeln('Cantidad de alumnos que habilitan: ', cant_reg);
  writeln('Cantidad de alumnos desaprobados: ', cant_des);
  writeln('Promedio de asistencia a clase: ', (asistencia_total / cant_alumnos):0:1, '%');

  readln();
end.
{
 -Hay 5 alumnos que tienen 2 parciales:
      -promocion: aprobo 2, su suma es x >= 12 y asistencia mayor a 50%
      -regulariza: 1 de 2 aprobados y asistencia mayor a 80%
      -desaprueba: cualquier otro caso
 -Se aprueba con 5.
 a) Cuantos alumnos hay en cada condicion
 b) promedio asistencia a clase

 -------------------------------
 -requiere constante de cant de alumnos.
 -ingresar la nota del primer y segundo parcial, un promedio, y asistencia
 -contador con cada alumno: aprobado, habilitado, desaprobado
 -contador con asistencia de todos los alumnos

}
