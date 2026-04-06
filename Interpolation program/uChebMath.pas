unit uChebMath;

interface

uses
  System.SysUtils,
  Math;

type
  TMatrix = array of array of Double;

  // �������� ���:
  TNodeMode = (nmLobatto, nmGauss, nmSecondKind);

  TDynamicDoubleArray = array of Double;

function MultiplyMatrices(const M1, M2: TMatrix): TMatrix;
function TransposeMatrix(const M: TMatrix): TMatrix;

function GetSelectedFunction(x: Double; FunctionIndex: Integer): Double;

// change TDynamicDoubleArray = array of Double start
function EvalInterpolant(const x: Double; const c: TDynamicDoubleArray): Double;
function EvalInterpolantSecondKind(const x: Double; const c: TDynamicDoubleArray): Double;

procedure CalculateLobattoSystemWithFunction(
  n: Integer; FuncIndex: Integer;
  out A, AT, G: TMatrix;
  out ftilde, Tt_f, TTdiag, ccoef: TDynamicDoubleArray
);

procedure CalculateGaussSystemWithFunction(
  n: Integer; FuncIndex: Integer;
  out A, AT, G: TMatrix;
  out fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray
);

procedure CalculateSecondKindLobattoSystemWithFunction(
  n: Integer; FuncIndex: Integer;
  out A, AT, G, Aw: TMatrix;
  out fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray
);


implementation

function MultiplyMatrices(const M1, M2: TMatrix): TMatrix;
var
  r, c, t, rowsA, colsA, colsB: Integer;
begin
  rowsA := Length(M1);
  colsA := Length(M1[0]);
  colsB := Length(M2[0]);

  SetLength(Result, rowsA, colsB);

  for r := 0 to rowsA - 1 do
    for c := 0 to colsB - 1 do
    begin
      Result[r][c] := 0.0;
      for t := 0 to colsA - 1 do
        Result[r][c] := Result[r][c] + M1[r][t] * M2[t][c];
    end;
end;

function TransposeMatrix(const M: TMatrix): TMatrix;
var
  r, c: Integer;
begin
  SetLength(Result, Length(M[0]), Length(M));
  for r := 0 to High(M) do
    for c := 0 to High(M[0]) do
      Result[c][r] := M[r][c];
end;

function GetSelectedFunction(x: Double; FunctionIndex: Integer): Double;
const
  alpha = 10.0;
  omega = 50.0;
  a     = 0.3;
  a1    = 0.2;
  a2    = 0.4;
begin
  case FunctionIndex of
    0: Result := Exp(alpha * (Sqr(x) - 1.0));
    1: Result := Sin(omega * x) * Exp(-Sqr(x));
    2: Result := Sin(3.0 * Pi * x) * Cos(2.0 * Pi * Sqr(x))
                 + 0.3 * Sin(6.0 * Pi * Abs(x));
    3: Result := Abs(x - a);
    4: Result := Abs(sqr(x) - a1) * Abs(sqr(x) - a2);
    5: Result := Abs(x - a1) * Abs(x - a2);
  else
    Result := 0.0;
  end;
end;

function EvalInterpolant(const x: Double; const c: TDynamicDoubleArray): Double;
var
  j: Integer;
  th: Double;
begin
  th := ArcCos(x);
  Result := 0.0;
  for j := 0 to High(c) do
    Result := Result + c[j] * Cos(j * th);
end;

function EvalInterpolantSecondKind(const x: Double; const c: TDynamicDoubleArray): Double;
var
  j: Integer;
  theta: Double;
begin
  theta := ArcCos(x);
  Result := 0.0;
  for j := 0 to High(c) do
  begin
    if Sin(theta) <> 0 then
      Result := Result + c[j] * Sin((j + 1) * theta) / Sin(theta)
    else
      Result := Result + c[j] * (j + 1);
  end;
end;


procedure CalculateLobattoSystemWithFunction(n: Integer; FuncIndex: Integer;
  out A, AT, G: TMatrix; out ftilde, Tt_f, TTdiag, ccoef: TDynamicDoubleArray);
const
  INV_SQRT2 = 0.7071067811865475244;
var
  k, i: Integer;
  theta, val, x, y: Double;
begin

  SetLength(ftilde, n + 1);
  SetLength(Tt_f,   n + 1);
  SetLength(TTdiag, n + 1);
  SetLength(ccoef,  n + 1);

  SetLength(A, n+1, n+1);
  SetLength(AT, n+1, n+1);

  for k := 0 to n do
  begin
    theta := k * Pi / n;
    for i := 0 to n do
    begin
      val := Cos(i * theta);
      if (k = 0) or (k = n) then
        val := val * INV_SQRT2;
      A[k][i] := val;
      AT[i][k] := val;
    end;
  end;

  G := MultiplyMatrices(AT, A);

  for k := 0 to n do
  begin
    x := Cos(k * Pi / n);
    y := GetSelectedFunction(x, FuncIndex);
    if (k = 0) or (k = n) then
      y := y * INV_SQRT2;
    ftilde[k] := y;
  end;

  for i := 0 to n do
  begin
    Tt_f[i] := 0.0;
    TTdiag[i] := 0.0;
    for k := 0 to n do
    begin
      Tt_f[i] := Tt_f[i] + AT[i][k] * ftilde[k];
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k];
    end;
    if TTdiag[i] <> 0.0 then
      ccoef[i] := Tt_f[i] / TTdiag[i]
    else
      ccoef[i] := 0.0;
  end;
end;

procedure CalculateGaussSystemWithFunction(n: Integer; FuncIndex: Integer;
  out A, AT, G: TMatrix; out fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray);
var
  k, i: Integer;
  theta, val, x: Double;
begin

  SetLength(fvec,   n);
  SetLength(Tt_f,   n);
  SetLength(TTdiag, n);
  SetLength(ccoef,  n);

  SetLength(A, n, n);
  SetLength(AT, n, n);

  for k := 0 to n-1 do
  begin
    theta := (k + 0.5) * Pi / n;
    for i := 0 to n-1 do
    begin
      val := Cos(i * theta);
      A[k][i] := val;
      AT[i][k] := val;
    end;
  end;

  G := MultiplyMatrices(AT, A);

  for k := 0 to n-1 do
  begin
    x := Cos((k + 0.5) * Pi / n);
    fvec[k] := GetSelectedFunction(x, FuncIndex);
  end;

  for i := 0 to n-1 do
  begin
    Tt_f[i] := 0.0;
    TTdiag[i] := 0.0;
    for k := 0 to n-1 do
    begin
      Tt_f[i] := Tt_f[i] + AT[i][k] * fvec[k];
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k];
    end;
    if TTdiag[i] <> 0.0 then
      ccoef[i] := Tt_f[i] / TTdiag[i]
    else
      ccoef[i] := 0.0;
  end;
end;

procedure CalculateSecondKindLobattoSystemWithFunction(
  n: Integer; FuncIndex: Integer;
  out A, AT, G, Aw: TMatrix;
  out fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray
);

var
  k, i: Integer;
  theta, x, val, w: Double;
begin
  // Sizes: Lobatto has (n+1) nodes, and we'll use (n+1) basis functions U_0..U_n
  SetLength(fvec,   n + 1);
  SetLength(Tt_f,   n + 1);
  SetLength(TTdiag, n + 1);
  SetLength(ccoef,  n + 1);

  SetLength(A,  n + 1, n + 1);
  SetLength(AT, n + 1, n + 1);

  // Build matrix A[k][i] = U_i(x_k), x_k = cos(k*pi/n)
  for k := 0 to n do
  begin
    theta := k * Pi / n;
    x := Cos(theta);

    for i := 0 to n do
    begin
      // U_i(cos(theta)) = sin((i+1)*theta)/sin(theta)
      if Abs(Sin(theta)) > 1e-14 then
        val := Sin((i + 1) * theta) / Sin(theta)
      else
      begin
        // theta = 0 or pi -> limit values at x=±1
        // U_i(1)  = i+1
        // U_i(-1) = (i+1)*(-1)^i
        if x > 0 then
          val := (i + 1)
        else
          val := (i + 1) * Power(-1, i);
      end;

      A[k][i] := val;
      AT[i][k] := val;
    end;
  end;

  // Weighted orthogonality diagnostic:
  // w_k = sin^2(theta_k), theta_k = k*pi/n
  SetLength(Aw, n + 1, n + 1);
  for k := 0 to n do
  begin
    theta := k * Pi / n;
    w := Sqr(Sin(theta)); // endpoints become 0 automatically
    for i := 0 to n do
      Aw[k][i] := Sqrt(w) * A[k][i];
  end;

  G := MultiplyMatrices(TransposeMatrix(Aw), Aw);

  // Function values at nodes
  for k := 0 to n do
  begin
    x := Cos(k * Pi / n);
    fvec[k] := GetSelectedFunction(x, FuncIndex);
  end;

  // Compute ccoef using diagonal scaling:
  // Tt_f[i] = sum_k U_i(x_k) f(x_k) w_k
  // TTdiag[i] = sum_k U_i(x_k)^2 w_k
  // c_i = Tt_f[i] / TTdiag[i]
  for i := 0 to n do
  begin
    Tt_f[i] := 0.0;
    TTdiag[i] := 0.0;

    for k := 0 to n do
    begin
      theta := k * Pi / n;
      w := Sqr(Sin(theta));

      Tt_f[i]   := Tt_f[i]   + AT[i][k] * fvec[k] * w;
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k] * w;
    end;

    if Abs(TTdiag[i]) > 1e-14 then
      ccoef[i] := Tt_f[i] / TTdiag[i]
    else
      ccoef[i] := 0.0;
  end;
end;

end.

