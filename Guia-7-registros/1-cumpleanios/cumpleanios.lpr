program cumpleanios;
type
    st = string[16];
    persona = record
        nombre : st;
        dia, mes: byte;
        anio: word;
    end;
    vP = array[1..32] of persona;

procedure writeRec(per: vP; l: byte);
var i: byte;
begin
    for i:=1 to l do
    begin
        with per[i] do
            writeln(nombre, ' ',dia,'/',mes,'/',anio);
    end;
end;

procedure leerArchivo(var per: vP; var perL: byte);
var arch: text;
begin
    perL := 0;
    assign(arch, 'text.txt');
    reset(arch);
    while not eof(arch) do
    begin
        perL := perL + 1;
        with per[perL] do
        begin
            readln(arch, nombre);
            readln(arch, dia, mes, anio);
        end;
    end;

    close(arch);
end;

procedure estacion(per: vP; L: byte);
var
    ver, pri, oto, inv, i : byte;
begin
    ver:= 0; pri:= 0; oto:= 0; inv:=0;
    for i:=1 to l do
    begin
        with per[i]do
        begin
            case mes of // Simplificadas las estaciones (no es muy precisa)
            3,4,5: oto := oto + 1;
            6,7,8: inv := inv + 1;
            9,10,11: pri := pri + 1;
            12,1,2: ver := ver + 1;
            end;
        end;
    end;
    write('La estacion que mas cumpleanios tiene es ');
    if (oto > inv) and (oto > inv) and (oto > ver) then
        writeln('Otonio')
    else
      if (inv > pri) and (inv > ver) then
          writeln('Invierno')
    else
      if (pri > ver) then
        writeln('Primavera')
    else
      writeln('Verano');

end;

var
    per : vP;
    perL : byte;
begin
    leerArchivo(per, perL);
    writeRec(per, perL);
    estacion(per, perL);

    readln();
end.

{
 Ej 1) El departamento de Recursos Humanos de una empresa desea que sus empleados fraternicen y
decidió cada 3 meses hacer un brindis por los que nacieron en esa estación del año. Se pide:
- Leer los datos (Nombre del empleado y Fecha de Nacimiento)
- Informar en qué estación del año se festejan más cumpleaños.
}

