program fracciones;
procedure comunMultiplo(var n1, d1, n2, d2 : integer);
begin
    n1 := n1 * d2;
    n2 := n2 * d1;
    d1 := d1 * d2;
    d2 := d1;
end;

procedure suma(n1, d1, n2 , d2 : integer; var nf, df : integer);
var
    aux1 : string[8];
    aux2 : string[8];
begin
    aux1 := ' ';
    aux2 := ' ';
    comunMultiplo(n1, d1, n2, d2);

    nf := n1 + n2;
    df := d1;
end;

procedure producto(n1, d1, n2, d2 : integer ; var nf , df : integer);
var
    aux1 : string[8];
    aux2 : string[8];
begin
    aux1 := ' ';
    aux2 := ' ';
    comunMultiplo(n1, d1, n2, d2);

    nf := n1 * n2;
    df := d1;
end;

    var
        n1, d1, n2, d2, nf, df : integer;
        frac : string;
begin

    suma(1,4,1,3, nf, df);
    writeln('1/4 + 1/3 es ', nf,'/',df);

    producto(1,4,1,3, nf, df);
    writeln('1/4 * 1/3 es ', nf,'/',df);

    readln()

end.

