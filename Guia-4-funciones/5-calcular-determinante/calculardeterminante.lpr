program  calculardeterminante;
function hallarDet(a,b,d,e : integer): integer ;
begin
  hallarDet := a*e - b*d ;
end;


var x1, y1, c1, x2, y2, c2, deter : integer;
begin
    writeln('Ingrese x1, y1 y primer el termino independiente');
    readln(x1, y1, c1);
    writeln('Ingrese x2, y2 y segundo el termino independiente');
    readln(x2, y2, c2);
    deter := hallarDet(x1, y1, x2, y2);
    if deter = 0 then       // La 2da ecuacion no tiene solución
        writeln('No hay solucion al sistema')
    else
        begin
        writeln('x: ', trunc(hallarDet(c1, y1, c2, y2)/ deter));
        writeln('y: ' , trunc(hallarDet(x1, c1, x2, c2)/ deter));
        end;

    readln();
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
