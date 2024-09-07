program parabola;
// a)
function ejeDeSimetria(a, b : real) : real;
begin
    ejeDeSimetria := (-b)/(2 * a);
end;

// b)
function aperturaArriba(a : real): boolean;
begin
    aperturaArriba := a > 0;
end;

// c     Usa el discriminante para saber si hay dos, una o cero raices
function cantRaices(a, b, c : real) : integer;
var
    discriminante : real;
begin
    discriminante := (b * b) - (4 * a * c);
    if discriminante > 0 then
        cantRaices := 2
    else
        if discriminante < 0 then
            cantRaices := 0
    else
        cantRaices := 1;

end;

// c     Muestra las raices de la funcion
procedure raices(a, b, c : real);
var
    auxRaices : integer;
    r1, r2 : real;
begin
    auxRaices := cantRaices(a, b, c);
    if auxRaices = 2 then
        begin
            r1 := (-b + sqrt(sqr(b) - (4 * a * c) ) ) / (2 * a);
            r2 := (-b - sqrt(sqr(b) - (4 * a * c) ) ) / (2 * a);
            writeln('c) r1 - r2: ', r1:0:2,' - ', r2:0:2);
        end
    else
        if auxRaices = 1 then
            begin
                r1 := -b/ (2 * a);
                writeln('c) La unica raiz es en x=', r1:0:2);
            end
    else
        writeln('c) No tiene raices');
end;

// d) dibuja la imagen de la funcion en tal posicion de x
function imagen(a, b, c, x : real) : real;
begin
    imagen := (a * x * x) + (b * x) + c;
end;

// Procedimiento que toma a la funcion y resuelve todos los incisos
procedure evaluar(a, b, c : real);
var
    imagenes, i : integer;
    x : real;
begin
    // a)
    writeln('a) Eje de simetria en x=', ejeDeSimetria(a, b):0:2);
    // b)
    if aperturaArriba(a) then
        writeln('b)La apertura de la parabola es hacia arriba')
    else
        writeln('b)La apertura de la parabola es hacia abajo');
    // c)
    raices(a, b, c);

    // d)
    writeln('d)Cuantas imagenes desea escribir en pantalla? ');
    readln(imagenes);
    for i := 1 to imagenes do
    begin
        writeln('Ingrese la posicion en x para la cual quiere saber la imagen');
        readln(x);
        writeln('La imagen en x=',x:0:2, ' es y=', imagen(a , b, c, x):0:2);
    end;

end;

// Proceso principal que guarda las varibales donde se guardan la formula en su
// almacenamiento local (Es preferible evitar usar variables globales)
procedure comienzo();
var
    a, b, c : real;
begin
    writeln('Ingrese el a (del termino cuadratico)');
    readln(a);
    writeln('Ingrese el b (del termino lineal)');
    readln(b);
    writeln('Ingrese el termino independiente');
    readln(c);
    evaluar(a, b, c);
end;

// Comienza el programa llamando a un procedimiento, no hay uso de variables globales
begin
    comienzo();

    readln();

end.

{
 Ej 11) Dada la ecuación de una parábola y=ax2 + bx +c, escribir un programa que mediante un menú de
opciones iterativo permita:
a) Encontrar el eje de simetría, sabiendo que x1 = -b/(2.a) y si presenta un mínimo ó un máximo en
f(x1).
b) Informar hacia dónde es abierta la parábola.
c) Calcular y mostrar las raíces, informar en caso que no existan. Para ello debe analizar si el
discriminante, D = b2 – 4ac, es mayor, menor ó igual a cero.
d) Dado un conjunto de valores de x informar su imagen.
Usar procedimientos y/o funciones según corresponda
}
