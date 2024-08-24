program cuestionario;
        Const
          LimInf = 10;
          LimSup = 255;
        Var
           X,Y: real;
           N,M: integer;
           Cadena: string;
           Car: char;
           Mayus, Cumple, Ok: boolean;
begin
  Cumple := True;
  N := 20;
  M := 1;
  X := 5.8;
  Y := 12.7;
  car :='B';

  //Ok := Not cumple or (N>LimInf) and (X<>Y);
  //writeln(OK);

  //X := N / 3 + M*Y;
  //writeln(X:0:2);

  //Mayus := Cumple or (car='S') and (odd(N));
  //writeln(Mayus);

  N := trunc(X)+LimInf;
  writeln(N);

  readln();
end.

{
  Const
  LimInf = 10;
  LimSup = 255;
  Var
  X,Y: real;
  N,M: integer;
  Cadena: string;
  Car: char;
  Mayus, Cumple, Ok: boolean;
}
{
Analizar si son sintáctica y semánticamente
correctas, o si son redundantes, las siguientes
sentencias:
  a) Mayus := upcase(car)=car;
  b) Cumple := (X<=LimInf) and (X>=LimSup);
  c) Mayus := ‘A’=car or car=’B’or TRUE;
  d) Cumple := length(cadena)>LimSup;
  e) M := N / LimInf;
  f) Ok := LimInf< M <LimSup;
  g) Ok := Odd (n * (n-1));
}
{
 a) Correcta
 b) Error semantico
 c) Error semantico
 d) Error semantico
 e) Error sintactico ( la division revuelve un real y no puede guardarse en M )
 f) Error sintactico ( debe ser liminf < M and M < limsup )
 g) Error semantico ( en n=1 es igual a cero, que es par )

}

{
Evaluar cuál es el resultado de cada asignación si
  Cumple=True,
  N=20,
  M=1,
  X=5.8,
  Y=12.7 y
  car=’B’

  a) Ok := Not cumple or (N>LimInf) and
  (X<>Y);
  b) X := N / 3 + M*Y;
  c) Mayus := Cumple or (car=’S’) and
  (odd(N));
  d) N := trunc(X)+LimInf;
}
{
 a) true
 b) (5.8/3) + 12.7 =
 c) false
 d) 15
}
