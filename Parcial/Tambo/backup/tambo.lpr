program tambo;
var
    nombre : string[32];
    dia, diaMentrega, num, contTambosSuperanL, nTambos , i: byte;
    litros, litrosTambo, litrosTotal, maxEntregado, LaSuperar : real;
    arch : text;

begin
    assign(arch, 'text.txt');
    reset(arch);
    writeln('Ingrese x a superar en entrega total por tambo');
    readln(lAsuperar);
    readln(arch ,nTambos);

    contTambosSuperanL := 0;
    for i:=1 to nTambos do
    begin
        num := 99;
        maxEntregado := 0;
        diaMentrega := 0;
        litrosTambo := 0;

        readln(arch, nombre);
        readln(arch, num);

        while num <> 0 do
        begin
            read(arch, num);
            if num <> 0 then
            begin
                dia := num;
                readln(arch, litros);
                litrosTambo := litrosTambo + litros;

                if litros > maxEntregado then
                begin
                    diaMentrega := dia;
                    maxEntregado := litros;
                end;
            end
            else
                readln(arch); {Pasa a siguiente linea}

            if litrosTambo > LaSuperar then
                contTambosSuperanL := contTambosSuperanL + 1;

        end;
        writeln(nombre, ' entrego mas el dia ', diaMentrega, ' unos', maxEntregado:8:2,'L');
        writeln('El promedio fue de ', (litrosTambo / dia):8:2,'L');

    end;
    writeln('En total ', contTambosSuperanL, ' tambos superan el x pedido');
    close(arch);
    readln();
end.

