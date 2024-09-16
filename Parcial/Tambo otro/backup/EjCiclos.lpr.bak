program ejCiclos;
type
  st20 = string[20];

var
  archE : text;
  nombre : st20;
  i, n , dia, diaMax, contSupX : byte;
  litros, litrosMax, acumLecheTotal, x, acumLeche : real;

begin
  assign(archE, 'Tambos.txt');
  reset(archE);
  readln(archE, n);
  contSupX := 0;
  writeln('Ingrese x');
  readln(x);
  acumLecheTotal := 0;
  for i := 1 to n do
  begin
    readln(archE, nombre);
    litrosMax := -1;
    acumLeche := 0;
    read(archE, dia);
    while dia <> 0 do
    begin
      readln(archE, litros);
      acumLeche := acumLeche + litros;
      if litros > litrosMax then
      begin
        litrosMax := litros;
        diaMax := dia;
      end;
      read(archE, dia);
    end;
    readln(archE);
    acumLecheTotal := acumLecheTotal + acumLeche;
    if acumLeche > x then
       contSupX := contSupX + 1;
    writeln(nombre, ' ', diaMax);
  end;
  writeln('Promedio Total: ', acumLecheTotal/n :4:2);
  writeln('Tambos que superaron ', x:4:2, ' litros en total: ', contSupX);
  close(archE);
  readln();
end.

