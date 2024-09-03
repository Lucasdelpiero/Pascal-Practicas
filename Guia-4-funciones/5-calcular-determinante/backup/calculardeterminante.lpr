program  calculardeterminante;
function determinante4x4(a,b,d,e : integer): integer ;
begin
  determinante4x4 := a*e - b*d ;
end;

var a, b, d, e : integer;
begin
    writeln('Se le pediran ingresar los dayos de x1, y1, x2 e y2');
    writeln('Ingrese x1:');
    readln(a);
    writeln('Ingrese y1:');
    readln(b);
    writeln('Ingrese x2:');
    readln(d);
    writeln('Ingrese y2:');
    readln(e);
    writeln('El determinante es: ', determinante4x4(a, b, d, e));
end.

{
 Ej 5) Calcular la solución por determinantes de un sistema de dos ecuaciones lineales con dos incógnitas
(se supone compatible y determinado). Desarrollar la función que dados a,b,d,e obtenga x. Recordar que
el determinante
X= se calcula: x= a*e – d*b
Aplicarlo para los siguientes sistemas de ecuaciones:
2x + 3y = 5
3x -2y = 1
6x + 3y = 12
2x + y = 1
4x + 1y = 8
6x + 3y = 12
}
