program camisas;
    var
        cant_camisa:byte;
        sexo, talle:char;
        precio_final : real;
        { Se usa el descuento total para sumar los porcentajes de descuento porque
        los porcentajes se suman, es diferente hacer:
            (100 * 0.9) * 0.9 que hacer (100 * 0.8), 10% de desc + 10% desc = 20% desc
        }
        descuento_total : real;
    const
        precio_m = 1000;
        precio_f = 1200;
        iva = 1.21;
        desc_talle = 0.05;
        desc_cant = 0.07;

begin
    descuento_total := 0;

    writeln('Ingrese sexo de la camisa F / M (femenino/masculino) ');
    readln(sexo);
    sexo := upcase(sexo);

    writeln('Cuantas camisas va a llevar?');
    readln(cant_camisa);

    writeln('Que talle va a llevar (S / M / L / X)?');
    readln(talle);
    talle := upcase(talle);

    // Aplicar descuento por talle
    if ( (talle = 'S') and (sexo = 'M')) or ((talle = 'X') and (sexo = 'F') ) then
        begin
          descuento_total := descuento_total + desc_talle ;
          writeln('Aplica descuento por talle');
        end;


    // Aplicar descuento mayorista
    if (cant_camisa > 12) then
        begin
            descuento_total := descuento_total + desc_cant;
            writeln('Aplica el descuento por cantidad');
        end;


    // Calcular precio final
        // Precio bruto
    case sexo of
        'M': precio_final := cant_camisa * precio_m;
        'F': precio_final := cant_camisa * precio_f;
        else
          begin
            precio_final := 9999999;
            writeln('Te pasaste de vivo gil');
          end;
    end;

        // Precio luego de iva
    precio_final := precio_final * iva;
        // Descuentos      si el desc es del 25% multuplica por 0.75
    precio_final := precio_final - (precio_final * descuento_total);

    writeln('El precio final a pagar es de: ', precio_final:0:2);

    readln();

end.
