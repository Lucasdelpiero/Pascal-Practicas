program empleados;
var
    liquidacion, sueldomayor, sueldototal:real;
    i, empleados:integer;
    antiguedad:byte;
    nombre, nombreMayor:string;

    const
        sueldo=15000;
begin
    writeln('Ingrese la cantidad de empleados que tiene tu empresa de mierda');
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
        writeln('El empleado ',nombreMayor,' ,cobra $',sueldoMayor:0:2, ' y vende merca');
        writeln('El sueldo promedio entre todos los empleados es: $', (sueldototal/empleados):0:2 );
    end
    else
        writeln('no tenes empleados jaja pobre');
end.
