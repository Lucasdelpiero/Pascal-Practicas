program cifras;
    var
        numero : longint;
        texto : string;

begin
    writeln('Ingrese un numero:');
    readln(numero);
    str(numero,texto);  // Convierte int a un string y lo guarda en 'texto'

    if numero >= 1000 then
      begin
          // Se queda con la parte entera de la division (real) y el round lo convierte a entero
          numero := round(int(numero/1000));
          writeln('a) ', numero);
      end
    else
        writeln('a) No se puede escribir ningun numero');



    if (length(texto) >= 3) then
      begin
          texto := texto[length(texto) - 2];
          writeln('b) En las centenas se encuentra el numero ',
          texto
          );
      end
    else
        writeln('b) No hay numero de centenas');

    readln();
end.

