program enterossubconjuntos;
    var
        arch : text;
        num, anterior, contElem, max, contMasElem, masElem, subConj : byte;
        continuar : boolean;  // Cuando lee el doble cero controla que no siga el loop

begin
    contElem := 0; // Cuantos elem tiene el conjunto actual
    contMasElem := 0; // Cuantos elem tiene el que mas elementos tiene actualmente
    masElem := 0; // Subconjunto con mas elementos
    max := 0;
    masElem := 0;
    subConj := 1;
    anterior := 100;
    assign(arch, 'datos.txt');
    reset(arch);
    continuar := true;

    writeln('Subconjunto', '   ', 'Maximo');
    while continuar = true do
    begin
        read(arch, num);
        if num = 0 then
            begin
                if anterior <> 0 then
                    writeln('      ',subConj,'         ', max)
                else
                    continuar := false;

                if contElem > contMasElem then
                    begin
                        masElem := subConj;
                        contMasElem := contElem;
                    end;

                contElem := 0;
                max := 0;
                subConj := subConj + 1;
            end
        else  // No es un cero
            begin
                contElem := contElem + 1;
                if num > max then
                    max := num;

            end;


    anterior := num;
    end;

    writeln('El subconjunto con mas elementos es: ', masElem);
    readln()
end.

{
Ej 21) Leer un conjunto de números enteros, la presencia de ceros intermedios indica fin de un
subconjunto y comienzo del siguiente, dos ceros consecutivos es fin de datos. Se pide calcular e informar
el máximo en cada subconjunto y el orden del subconjunto más numeroso.
Ejemplo: 3,5,2,0,6,7,4,7,0,2,1,0,0
Respuesta: subconjunto Máximo
1 5
2 7
3 2
El subconjunto con más elementos es: 2
}

