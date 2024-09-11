program eliminarceros;
type
    v16 = Array[1..16] of integer;

procedure writeVec(vec : v16; vecT : byte);
var i : byte;
begin
    for i:=1 to vecT do
        write(vec[i],' ');
    writeln();
end;

procedure compactar(vec1 : v16; vec1T : byte; var vec2 : v16; var vec2T : byte);
var i : byte;
begin
    vec2T := 0;
    for i:=1 to vec1T do
        begin
            if vec1[i] <> 0 then
                begin
                    vec2T := vec2T + 1;
                    vec2[vec2T] := vec1[i];
                end;
        end;
end;

const
    vConst : v16 = (1,2,3,5,0,0,5,3,0,10,13,0,1,7,0,16);
var
    Vec1 ,Vec2: v16;
    Vec1T, Vec2T : byte; // Tamaño de vectores

begin
    Vec1 := vConst;
    vec1T := 16;
    writeln('Antes:');
    writeVec(Vec1, vec1T);
    compactar(Vec1, vec1T, vec2, vec2T);
    writeln('Despues:');
    writeVec(Vec2, vec2T);

end.

{
 Ej 4) Se pide compactar un arreglo (eliminar los ceros que contiene) generando otro arreglo
}

