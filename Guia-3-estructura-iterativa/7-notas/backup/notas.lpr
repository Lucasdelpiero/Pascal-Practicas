program notas;
    var
        nombre : string;
        nota1, nota2, nota3: real;
        cantAlum, cantApro : byte;

begin
    cantAlum := 0;
    cantApro := 0;
    writeln('Ingrese el nombre del alumno o *** para fin de datos');
    readln(nombre);

    while (nombre <> '***') do
    begin
        cantAlum := cantAlum + 1;
        writeln('Ingrese nota 1:');
        readln(nota1);
        writeln('Ingrese nota 2:');
        readln(nota2);
        writeln('Ingrese nota 3:');
        readln(nota3);

        if (((nota1 + nota2 + nota3)/3) >= 4) then
            begin
                cantApro := cantApro + 1;
                writeln(nombre, ', Aprobado con ', ((nota1 + nota2 + nota3)/3):0:2 );
            end
        else
            writeln(nombre, ', Desaprobado con ', ((nota1 + nota2 + nota3)/3):0:2);

        writeln('Ingrese el nombre del alumno o *** para fin de datos');
        readln(nombre);
    end;
    if (cantAlum <> 0) then
        writeln('El porcentaje de alumnos aprobados es: ', ((CantApro/cantAlum)*100):0:2 );

    readln()
end.
{
Ej 7) Dado un conjunto de alumnos, no se sabe cuántos son, de cada uno de ellos se conoce:
- Nombre (‘***’ indica fin de datos)
- Nota1, Nota2 y Nota3
Ingresar la información e informar:
a) El promedio de cada alumno y su condición:
− ‘Aprobado’ si su promedio es mayor o igual a 4
− ‘Desaprobado’ si su promedio es menor a 4.
b) Porcentaje de alumnos Aprobados
}

