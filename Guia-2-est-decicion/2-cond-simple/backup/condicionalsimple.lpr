program condicionalsimple;
    var
        letra:char;
begin
    writeln('Ingrese una letra del alfabeto español');
    readln(letra);
    case(letra)of
    'a'..'z','A'..'Z':
      begin
          if letra=upcase(letra) then
              writeln('La letra que ingresaste es mayuscula')
          else
              writeln('la letra que ingresaste es minuscula');
      end;
    else
        writeln('escribiste cualquier letra pete');
    end;
end.

