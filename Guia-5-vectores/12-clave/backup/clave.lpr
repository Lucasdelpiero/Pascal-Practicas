program clave;
type
    st16 = string[16];
    vClave = array[1..16] of st16;
    vProm = array[1..16] of real;
    vCar = array[1..16] of char;

procedure writeVec(var vecClave: vClave; var vecProm : vProm; var vecCar : vCar; vL : byte);
var i: byte;
begin
    for i:=1 to vL do
        writeln(vecClave[i],', ',vecProm[i]:0:2,', ',vecCar[i]);
end;

procedure leerArchivo(var vecClave: vClave; var vecProm : vProm; var vecCar : vCar;var vL : byte);
var
    arch : text;
    clave : st16;
    car : char;
    num1, num2, num3 : integer;
    prom : real;
    carInvalidos : byte;
begin
    assign(arch,'text.txt');
    reset(arch);

    while not eof(arch) do
    begin
        clave := '';
        carInvalidos := 0;
        read(arch, car);
        while car <> ' ' do
        begin
            case car of
                'a'..'z','A'..'Z','0'..'9': clave := clave + car;
            else
                carInvalidos := carInvalidos + 1;
            end;
            read(arch, car);
        end;
        read(arch, num1, num2, num3);
        prom := (num1 + num2 + num3) / 3;
        // Saltea los espacios y si llega al final el caracter sera un espacio (inciso b)
        while (car = ' ') and (not eoln(arch)) do
            read(arch, car);
        readln(arch);

        if (carInvalidos <= 3) and (clave[length(clave)] <> car ) then
        begin // Agregar a array
            vL := vL + 1;
            vecClave[vL] := clave;
            vecProm[vL] := prom;
            vecCar[vL] := car;
        end;


    end;
end;

procedure mayorPromedio(letra : char ;vecClave : vClave; vecProm : vProm; vecCar :vCar; vL : byte);
var i, pos : byte;
    mayorProm : real;
begin
    pos := 0;
    mayorProm := -999999;
    letra := upcase(letra);
    for i:=1 to vL do
        if (letra = vecCar[i]) and (vecProm[i] > mayorProm) then
        begin
            mayorProm := vecProm[i];
            pos := i
        end;
    if pos > 0 then
        writeln('La clave ',vecClave[pos],' tiene el mayor promedio con ', mayorProm:0:2)
    else
        writeln('No hay ninguna clave con esa letra');
end;

procedure infoClave(clave : st16 ;vecClave : vClave; vecProm : vProm; vecCar :vCar; vL : byte);
var i : byte;
begin
    i := 1;
    while (i < vL) and (clave <> vecClave[i]) do
        i := i + 1;

    if clave = vecClave[i] then
        writeln(vecClave[i],' prom: ', vecProm[i]:0:2, ' letra: ', vecCar[i])
    else
        writeln('Esa clave no existe en el sistema');


end;

var
    vL : byte;
    vecClave : vClave;
    vecProm : vProm;
    vecCar : vCar;
    letra : char;
    claveInfo : st16;
begin
    leerArchivo(vecClave, vecProm, vecCar, vL);

    writeln('Las claves validas son: ');
    writeVec(vecClave, vecProm, vecCar, vL);
    writeln('=====================================================');
    writeln('a) Ingrese la letra con mayor promedio ');
    readln(letra);
    mayorPromedio(letra, vecClave, vecProm, vecCar, vL);
    writeln('b) Ingrese clave para conseguir info');
    readln(claveInfo);
    infoClave(claveInfo, vecClave, vecProm, vecCar, vL);

    readln();
end.
{
 Ej 12) En un archivo de texto se ha grabado por cada línea, una cadena (es una clave encriptada que
puede contener letras, números y caracteres especiales (&, $, #, etc.), y que siempre termina en letra),
luego uno o más blancos y tres números separados por blancos, por último uno o más blancos y una letra.
Ejemplo: mU&1#hT34*A 80 40 30 P
Se pide, a partir del archivo, cargar tres arreglos paralelos:
• VClave contendrá las claves sin los caracteres especiales, que registren en su encriptación hasta
tres caracteres especiales (las claves que tengan más de tres invalidan la información de la línea,
que no se almacena)
• VProm almacena el promedio de los tres números.
• VCar almacena el caracter que está al final de la línea, siempre que no coincida con la última letra
de la clave, en cuyo caso invalida la información de la línea, que no se almacena)
Mostrar los arreglos generados, y luego para una letra y una clave que se ingresan por teclado:
a) Para la letra ingresada, calcular e informar la clave de máximo promedio.
b) Para la clave ingresada, informar el promedio y la letra asociada (puede no existir)
Resultados: si el archivo fuera
    mU&1#hT34*A 80 40 30 P
    AsD4=H23**9+T 4 78 56 L (1)
    jYC%MkS6M 10 70 3 M (2)
    MnDe3!ku#z 6 8 19 A

VClave      VProm       VCar
mU1hT34A      50         P
MnDe3kuz      11         A
(1) se descarta la línea porque la clave tiene más de 3 caracteres especiales.
(2) se descarta la línea porque la última letra de la clave coincide con la última de la línea
}

