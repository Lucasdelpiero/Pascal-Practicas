program cifras;
    var
        numero : longint;
        texto : string;

begin
    writeln('Ingrese un numero:');
    readln(numero);
    writeln('a: ', numero div 1000);
    writeln('b:', (numero mod 1000)div 100);

    readln();
    str(numero,texto);  // Convierte int a un string y lo guarda en 'texto'

    // Quitar ultimos 3 numeros
    if numero >= 1000 then
      begin
          // Se queda con la parte entera de la division (real) y el round lo convierte a entero
          numero := round(int(numero/1000));
          writeln('a) ', numero);
      end
    else
        writeln('a) No se puede escribir ningun numero');

    // Escribir numero de centena
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

