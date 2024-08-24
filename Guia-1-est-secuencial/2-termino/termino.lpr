program termino;
        var
           termino:byte;

begin
     writeln('Ingrese un numero para asignarla a la sucesion: ');
     readln(termino);
     writeln('El valor del termino es: ', 1+3*(termino-1));
     write('La diferencia entre el termino y su siguiente es: ');
     write((1+3*(termino))-(1+3*(termino-1)));
end.

{dada la sucesion:

an= a1 + 3(n-1)
an+1 = 1 + 3n

y a1=1

se pide un termino y despues se entrega
a) ek valor del k-esimo termino
b) diferencia entre k y (k+1)
[0..9]
}

