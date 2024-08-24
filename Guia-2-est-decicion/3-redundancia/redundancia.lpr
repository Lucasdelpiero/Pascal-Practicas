program redundancia;
    var temp : real;

begin
    if (temp < 0) then
        writeln(‘No salgo de casa….’)
    else
        if (temp<20) then // Si fuera menor a cero ya habria ejecutado lo de arriba
            writeln(‘Hace frio’)
    else
        if (temp<25) and (temp<29) then// Si fuera menor a 20 se hubiera ejecutado lo de arriba
            writeln(‘Barbaro’)
    else    // La unica alternativa que queda es que sea mayor a 29, por lo que
            // no es necesario comparar si es mayor a 29 grados
        writeln(´Qué calor!!’);


end.

{
 Readln(temp);
If temp<0 then writeln(‘No salgo de casa….’)
Else if (temp>=0)and(temp<20) then writeln(‘Hace frio’)
Else if (temp>=20)and(temp<25)and(temp<29) then writeln(‘Barbaro’)
Else if(temp>=29) then writeln(´Qué calor!!’);
}
