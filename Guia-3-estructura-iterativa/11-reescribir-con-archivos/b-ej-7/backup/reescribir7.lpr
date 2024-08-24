program reescribir7;
var
    arch : text;
    nombre : string;
    nota1, nota2, nota3: real;
    cantAlum, cantApro : byte;

begin
assign(arch, 'datos.txt');
reset(arch);
cantAlum := 0;
cantApro := 0;

while not eof(arch) do
  begin
      cantAlum := cantAlum + 1;
      readln(arch, nombre); // El string debe estar en su propia linea pq sino agarra toda la linea
      // incluyendo los numeros que serian de las notas
      readln(arch,nota1, nota2, nota3);

      if (((nota1 + nota2 + nota3)/3) >= 4) then
          begin
              cantApro := cantApro + 1;
              writeln(nombre, ', Aprobado con ', ((nota1 + nota2 + nota3)/3):0:2 );
          end
      else
          writeln(nombre, ', Desaprobado con ', ((nota1 + nota2 + nota3)/3):0:2);
  end;
    if (cantAlum <> 0) then
        writeln('El porcentaje de alumnos aprobados es: %', ((CantApro/cantAlum)*100):0:2 );
  close(arch);

readln();

end.

{
 Ej 11) Reescriba utilizando archivo de texto para ingreso de datos los siguientes ejercicios:
a) Ej 6, considerar en la primera línea del archivo el saldo inicial y en cada una de las líneas siguientes
un movimiento: Tipo, Monto (notar que no es necesario el tipo F).
b) Ej 7, en cada línea del archivo: Nombre (15 caracteres) y las tres notas reales
}

