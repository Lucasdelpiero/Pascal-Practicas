program empleados;
var
    liquidacion, sueldomayor, sueldototal:real;
    i, empleados:integer;
    antiguedad:byte;
    nombre, nombreMayor:string;

    const
        sueldo=15000;
begin
    writeln('Ingrese la cantidad de empleados que tiene su empresa');
    readln(empleados);
    for i:=1 to empleados do
    begin
        writeln('---------------');
        writeln('Empleado numero:', i); writeln('');
        write('Nombre:'); readln(nombre);
        write('Antiguedad (años):'); readln(antiguedad);
        case (antiguedad)of
            0..5: liquidacion:=sueldo+(sueldo*0.05);
            6..10: liquidacion:=sueldo+(sueldo*0.08) ;
            11..15: liquidacion:=sueldo+(sueldo*0.12) ;
            16..100: liquidacion:=sueldo+(sueldo*0.20) ;
        end;
    liquidacion:=liquidacion-(liquidacion*0.11)-500;
    sueldototal:=sueldototal+liquidacion;
    writeln(nombre, ' gana $', liquidacion);
    if (i = 1) then
        begin
        nombreMayor := nombre;
        sueldoMayor := liquidacion;
        end
    else
        if (liquidacion > sueldoMayor) then
        begin
            nombreMayor := nombre;
            sueldoMayor := liquidacion;
        end;
    end;
    if empleados<>0 then
    begin
        writeln('El empleado ',nombreMayor,' ,cobra $',sueldoMayor:0:2, ' tiene el mayor salario');
        writeln('El sueldo promedio entre todos los empleados es: $', (sueldototal/empleados):0:2 );
    end
    else
        writeln('No tiene empleados sobre los cuales informar');
end.


{
Ej 2) Se debe liquidar el sueldo de N empleados, de ellos se sabe el nombre y la antigüedad en años.
Todos parten de un básico de $15000 y la antigüedad se calcula según la siguiente tabla:
- Hasta 5 años …………. 5%
- De 6 a 10 años……….. 8%
- De 11 a 15 años…….. 12%
- Más de 15 años …… 20%
Además se descuenta un 11% por cargas sociales y $500 por seguro obligatorio.
Calcular e informar:
a) Nombre y sueldo de cada empleado.
b) Nombre del empleado que más cobra (suponer que es único).
c) Monto del sueldo promedio.
}

