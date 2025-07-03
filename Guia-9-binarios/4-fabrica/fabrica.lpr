program fabrica;
const CENTINELA = 'ZZZ';
type
    st4 = string[4];
    st6 = string[6];
    regSto = record
        cod : st4;
        talle : char;
        color: char;
        cant: word;
        precio: real;
    end;
    arSto = file of regSto;

procedure crearArSto(var arch: arSto);
var archT : text;
    temp: regSto;
    tcod: st4;
    ttalle: char;
    tcolor: char;
    tcant: word;
    tprecio: real;
begin
    rewrite(arch);
    assign(archT, 'STOCK.txt');
    reset(archT);
    readln(archT, tcod, ttalle, ttalle, tcolor, tcolor, tcant, tprecio);
    while not eof(archT) do
        begin
        with temp do
            begin
            cod:=tcod;
            talle:=ttalle;
            color:=tcolor;
            cant:=tcant;
            precio:=tprecio
            end;
        write(arch, temp);
        readln(archT, tcod, ttalle, ttalle, tcolor, tcolor, tcant, tprecio);
        end;
    temp.cod:=CENTINELA;
    write(arch, temp);
end;

procedure leerArSto(var arch: arSto);
var temp: regSto;
begin
    reset(arch);
    read(arch, temp);
    writeln('===ARCHIVO STOCK.DAT===':30);
    writeln('COD':6,'TALLE':8,'COLOR':8,'CANT':6,'PRECIO':9);
    while temp.cod <> CENTINELA do
        begin
        with temp do
            writeln(cod:6,talle:6,color:8,cant:7,precio:10:2);
        read(arch, temp);
        end;

end;

procedure listado(var arch: arSto);
var temp: regSto;
    codFinal: st6;
    cantTotal, cantNegras: word;
begin
    cantTotal:=0; cantNegras:= 0;
    writeln('===Stock de prendas===':30);
    reset(arch);
    read(arch, temp);
    codFinal := temp.cod + temp.talle + temp.color;
    // Si se tiene al color como numero se puede converstir a string haciendo
    // str(temp.color, stringTemporal) y sumarle eso

    while temp.cod <> CENTINELA do
        begin
        codFinal := temp.cod + temp.talle + temp.color;
        cantTotal := cantTotal + temp.cant;
        if temp.color = '1' then
            cantNegras := cantNegras + temp.cant;
        writeln('Codigo: ', codFinal);
        writeln('Talle':10,'Cantidad':12,'Precio Costo':16);
        with temp do
            writeln(talle:8,cant:10, (precio * cant):18:2);
        read(arch, temp);
        writeln('----------------------------------------');
        end;
    writeln();
    writeln('Cantidad total:':30, cantTotal:8);
    writeln('Porcentaje de Prendas Negras:':30, ((cantNegras / cantTotal) * 100):8:1,'%' )
end;

var
    archSto: arSto;

begin
    assign(archSto, 'STOCK.DAT');
    crearArSto(archSto);
    leerArSto(archSto); writeln();
    listado(archSto);


    close(archSto);
    readln();
end.

{
 Ej 4) Una fábrica de camperas tiene organizado su stock de la siguiente manera en un archivo de tipo:
# CODIGO de ARTICULO (cadena de 4) (1er. campo de secuencia, clave secundaria)
# TALLE ( S, M, L, X) (2do. campo de secuencia, clave secundaria)
# COLOR (1=Negro, 2=Marrón, 3=Azul, 4=Rojo) (3er. campo de secuencia, clave secundaria)
# CANTIDAD de PRENDAS
# PRECIO de COSTO
Clave primaria: CODIGO de ARTICULO + TALLE + COLOR
Se desea obtener el siguiente listado:
Stock de Prendas
Código: XXXX
Talle Cantidad Precio Costo
X 999 $ 99999.99
. . . . . . . . .
Código: XXXX
. . .
Cantidad Total: 9999
Porcentaje de Prendas Negras: 99.99 %
}
