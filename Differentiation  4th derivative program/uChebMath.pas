unit uChebMath;

interface

uses
  System.SysUtils, System.Math;

type
  TMatrix = array of array of Double;
  TDynamicDoubleArray = array of Double;
  TNodeMode = (nmLobatto, nmGauss, nmSecondKind);

  // Единая структура для хранения всех результатов вычислений
  TChebResult = record
    N: Integer;
    FuncIndex: Integer;
    Mode: TNodeMode;
    // Узловые данные
    Nodes: TDynamicDoubleArray;
    Values: TDynamicDoubleArray;
    DerivNum: TDynamicDoubleArray;
    DerivAnalyt: TDynamicDoubleArray;
    Reconstructed: TDynamicDoubleArray;
    Error: TDynamicDoubleArray;
    // Спектральные коэффициенты
    SpectralCoeffs: TDynamicDoubleArray;
    SpectralDerivCoeffs: TDynamicDoubleArray;
    SpectralDerivValues: TDynamicDoubleArray;
    SpectralIntCoeffs: TDynamicDoubleArray;
    SpectralIntReconstructed: TDynamicDoubleArray;
    SpectralIntError: TDynamicDoubleArray;
    // Сетки для графиков (400 точек)
    GridX: TDynamicDoubleArray;
    GridDeriv: TDynamicDoubleArray;
    GridInt: TDynamicDoubleArray;
  end;

    TChebFourthResult = record
    N: Integer;
    FuncIndex: Integer;
    Mode: TNodeMode;

    // Nodes and original values
    Nodes: TDynamicDoubleArray;
    Values: TDynamicDoubleArray;

    // Dense grid
    GridX: TDynamicDoubleArray;

    // Initial interpolant p(x) on dense grid
    InterpGrid: TDynamicDoubleArray;

    // Original spectral coefficients
    SpectralCoeffs0: TDynamicDoubleArray;

    // Repeated spectral differentiation
    SpectralCoeffs1: TDynamicDoubleArray;
    SpectralCoeffs2: TDynamicDoubleArray;
    SpectralCoeffs3: TDynamicDoubleArray;
    SpectralCoeffs4: TDynamicDoubleArray;

    // Values of 4th derivative
    Deriv4Nodes: TDynamicDoubleArray;
    Deriv4Grid: TDynamicDoubleArray;

    // Raw reconstruction after 4 integrations
    ReconCoeffsRaw: TDynamicDoubleArray;
    ReconNodesRaw: TDynamicDoubleArray;
    ReconGridRaw: TDynamicDoubleArray;

    // Cubic correction coefficients:
    // p3(x) = C0 + C1*x + C2*x^2 + C3*x^3
    CorrC0: Double;
    CorrC1: Double;
    CorrC2: Double;
    CorrC3: Double;

    // Final corrected reconstruction
    ReconNodes: TDynamicDoubleArray;
    ReconGrid: TDynamicDoubleArray;

    // Error
    ErrorNodes: TDynamicDoubleArray;
    ErrorGrid: TDynamicDoubleArray;

    // Optional exact 4th derivative
    Deriv4AnalytGrid: TDynamicDoubleArray;
  end;

// Базовая линейная алгебра
function MultiplyMatrices(const M1, M2: TMatrix): TMatrix; // M1 * M2
function TransposeMatrix(const M: TMatrix): TMatrix; // Mᵀ
function ApplyMatrixToVector(const A: TMatrix; const V: TDynamicDoubleArray): TDynamicDoubleArray; // A * V

// Генерация узлов Чебышёва
function GetLobattoNodes(N: Integer): TDynamicDoubleArray; // N+1 узел, включая границы
function GetGaussNodes(N: Integer): TDynamicDoubleArray; // N узлов, без границ
function GetSecondKindNodes(N: Integer): TDynamicDoubleArray; // N узлов, 2-й род
function GetNodes(Mode: TNodeMode; N: Integer): TDynamicDoubleArray; // Универсальный доступ

// Тестовые функции и их аналитика (ВСЕ ЗДЕСЬ)
function GetSelectedFunction(x: Double; FunctionIndex: Integer): Double; // f(x)
function GetSelectedFunctionDerivative(x: Double; FunctionIndex: Integer): Double; // f'(x)
function GetSelectedFunctionDerivative4(x: Double; FunctionIndex: Integer): Double; // f''''(x)
function GetSelectedFunctionIntegral(x: Double; FunctionIndex: Integer; C: Double = 0): Double; // ∫f(x)dx
function GetAnalyticalDerivative(const x: TDynamicDoubleArray; FuncIndex: Integer): TDynamicDoubleArray; // f'(x_k) массив
function GetFunctionName(idx: Integer): string; // Имя функции для отображения

// Алгоритм Кленшоу для ряда по полиномам Чебышёва 1-го рода
function EvalChebSeriesClenshawT(const Coefs: TDynamicDoubleArray; x: Double): Double;

// Системы для спектральных методов (вычисление коэффициентов разложения)
procedure CalculateLobattoSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);
procedure CalculateGaussSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);
procedure CalculateSecondKindSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);

implementation

// === ЛИНЕЙНАЯ АЛГЕБРА ===

function MultiplyMatrices(const M1, M2: TMatrix): TMatrix;
var r, c, t, rowsA, colsA, colsB: Integer;
begin
  rowsA := Length(M1); colsA := Length(M1[0]); colsB := Length(M2[0]);
  SetLength(Result, rowsA, colsB);
  for r := 0 to rowsA - 1 do
    for c := 0 to colsB - 1 do
      for t := 0 to colsA - 1 do
        Result[r][c] := Result[r][c] + M1[r][t] * M2[t][c];
end;

function TransposeMatrix(const M: TMatrix): TMatrix;
var r, c: Integer;
begin
  SetLength(Result, Length(M[0]), Length(M));
  for r := 0 to High(M) do
    for c := 0 to High(M[0]) do
      Result[c][r] := M[r][c];
end;

function ApplyMatrixToVector(const A: TMatrix; const V: TDynamicDoubleArray): TDynamicDoubleArray;
var i, j: Integer;
begin
  SetLength(Result, Length(A));
  for i := 0 to High(A) do
  begin
    Result[i] := 0.0;
    for j := 0 to High(V) do
      Result[i] := Result[i] + A[i][j] * V[j];
  end;
end;

// === УЗЛЫ ЧЕБЫШЁВА ===

function GetLobattoNodes(N: Integer): TDynamicDoubleArray;
var i: Integer;
begin
  SetLength(Result, N+1);
  for i := 0 to N do Result[i] := Cos(Pi * i / N);
end;

function GetGaussNodes(N: Integer): TDynamicDoubleArray;
var i: Integer;
begin
  SetLength(Result, N);
  for i := 0 to N-1 do Result[i] := Cos(Pi * (i + 0.5) / N);
end;

function GetSecondKindNodes(N: Integer): TDynamicDoubleArray;
var i: Integer;
begin
  SetLength(Result, N);
  for i := 0 to N-1 do Result[i] := Cos((i + 1) * Pi / (N + 1));
end;

function GetNodes(Mode: TNodeMode; N: Integer): TDynamicDoubleArray;
begin
  case Mode of
    nmLobatto: Result := GetLobattoNodes(N);
    nmGauss:   Result := GetGaussNodes(N);
    nmSecondKind: Result := GetSecondKindNodes(N);
  else Result := GetLobattoNodes(N);
  end;
end;

// === ТЕСТОВЫЕ ФУНКЦИИ И АНАЛИТИКА ===

function GetSelectedFunction(x: Double; FunctionIndex: Integer): Double;
const alpha = 10.0; omega = 50.0;
begin
  case FunctionIndex of
    0: Result := Sqr(x); // x^2
    1: Result := Exp(alpha * (Sqr(x) - 1.0)); // exp(α(x²-1))
    2: Result := Sin(omega * x) * Exp(-Sqr(x)); // sin(ωx)·exp(-x²)
    3: Result := Sin(3.0 * Pi * x) * Cos(2.0 * Pi * Sqr(x)) + 0.3 * Sin(6.0 * Pi * Abs(x)); // комбинированная
  else
    Result := 0.0;
  end;
end;


function GetSelectedFunctionDerivative(x: Double; FunctionIndex: Integer): Double;
const alpha = 10.0; omega = 10;
begin
  case FunctionIndex of
    0: Result := 2.0 * x; // d/dx(x^2)
    1: Result := Exp(alpha * (Sqr(x) - 1.0)) * 2.0 * alpha * x;
    2: Result := omega * Cos(omega * x) * Exp(-Sqr(x)) + Sin(omega * x) * (-2.0 * x) * Exp(-Sqr(x));
    3:
      begin
        Result := 3.0 * Pi * Cos(3.0 * Pi * x) * Cos(2.0 * Pi * Sqr(x)) +
                  Sin(3.0 * Pi * x) * (-4.0 * Pi * x) * Sin(2.0 * Pi * Sqr(x));
        if x > 0 then
          Result := Result + 0.3 * 6.0 * Pi * Cos(6.0 * Pi * x)
        else if x < 0 then
          Result := Result - 0.3 * 6.0 * Pi * Cos(6.0 * Pi * x);
      end;
  else
    Result := 0.0;
  end;
end;

function GetSelectedFunctionDerivative4(x: Double; FunctionIndex: Integer): Double;
const
  alpha = 10.0;
  omega = 50.0;
var
  epart, s, c: Double;
begin
  case FunctionIndex of
    0:
      Result := 0.0; // d4/dx4 (x^2) = 0

    1:
      begin
        // f(x) = exp(alpha*(x^2-1))
        // f''''(x) = exp(alpha*(x^2-1)) * (12*alpha^2 + 48*alpha^3*x^2 + 16*alpha^4*x^4)
        epart := Exp(alpha * (Sqr(x) - 1.0));
        Result := epart * (12.0*Sqr(alpha) + 48.0*Power(alpha,3)*Sqr(x) + 16.0*Power(alpha,4)*Power(x,4));
      end;

    2:
      begin
        // f(x) = sin(omega*x)*exp(-x^2)
        // Analytic 4th derivative
        epart := Exp(-Sqr(x));
        s := Sin(omega * x);
        c := Cos(omega * x);

        Result :=
          epart * (
            s * (16.0*Power(x,4) - 48.0*Sqr(x) + 12.0 + Power(omega,4) - 24.0*Sqr(x)*Sqr(omega) + 12.0*Sqr(omega))
            + c * (8.0*omega*x*(6.0*Sqr(x) - 3.0 - Sqr(omega)))
          );
      end;

    3:
      begin
        // Complicated mixed function:
        // keep 0 for now unless you want full symbolic expression
        Result := 0.0;
      end;
  else
    Result := 0.0;
  end;
end;

function GetSelectedFunctionIntegral(x: Double; FunctionIndex: Integer; C: Double = 0): Double;
var n, i: Integer; h, sum, xi: Double; weight: Integer;
begin
  // Численное интегрирование Симпсоном (1000 шагов) для универсальности
  n := 1000; h := (x - (-1.0)) / n; sum := 0;
  for i := 0 to n do
  begin
    xi := -1.0 + i * h;
    if (i = 0) or (i = n) then weight := 1
    else if i mod 2 = 1 then weight := 4 else weight := 2;
    sum := sum + weight * GetSelectedFunction(xi, FunctionIndex);
  end;
  Result := sum * h / 3.0 + C;
end;

function GetAnalyticalDerivative(const x: TDynamicDoubleArray; FuncIndex: Integer): TDynamicDoubleArray;
var i: Integer;
begin
  SetLength(Result, Length(x));
  for i := 0 to High(x) do Result[i] := GetSelectedFunctionDerivative(x[i], FuncIndex);
end;

function GetFunctionName(idx: Integer): string;
begin
  case idx of
    0: Result := 'x^2';
    1: Result := 'exp(α(x²-1))';
    2: Result := 'sin(ωx)·exp(-x²)';
    3: Result := 'sin(3πx)cos(2πx²)+0.3sin(6π|x|)';
  else
    Result := 'f(x)';
  end;
end;

// === АЛГОРИТМ КЛЕНШОУ ===

function EvalChebSeriesClenshawT(const Coefs: TDynamicDoubleArray; x: Double): Double;
var k, N: Integer; bkp1, bkp2, bk: Double;
begin
  N := Length(Coefs) - 1;
  if N < 0 then begin Result := 0.0; Exit; end;
  bkp1 := 0.0; bkp2 := 0.0;
  for k := N downto 0 do
  begin
    bk := 2.0 * x * bkp1 - bkp2 + Coefs[k];
    bkp2 := bkp1; bkp1 := bk;
  end;
  Result := bkp1 - x * bkp2;
end;

// === СИСТЕМЫ ДЛЯ СПЕКТРАЛЬНЫХ МЕТОДОВ ===

procedure CalculateLobattoSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);
const INV_SQRT2 = 0.7071067811865475244;
var k, i: Integer; theta, val, x, y: Double; A, AT: TMatrix; ftilde, Tt_f, TTdiag: TDynamicDoubleArray;
begin
  SetLength(ccoef, n + 1); SetLength(ftilde, n + 1); SetLength(Tt_f, n + 1); SetLength(TTdiag, n + 1);
  SetLength(A, n+1, n+1); SetLength(AT, n+1, n+1);
  for k := 0 to n do
  begin
    theta := k * Pi / n;
    for i := 0 to n do
    begin
      val := Cos(i * theta);
      if (k = 0) or (k = n) then val := val * INV_SQRT2;
      A[k][i] := val; AT[i][k] := val;
    end;
  end;
  for k := 0 to n do
  begin
    x := Cos(k * Pi / n); y := GetSelectedFunction(x, FuncIndex);
    if (k = 0) or (k = n) then y := y * INV_SQRT2;
    ftilde[k] := y;
  end;
  for i := 0 to n do
  begin
    Tt_f[i] := 0.0; TTdiag[i] := 0.0;
    for k := 0 to n do
    begin
      Tt_f[i] := Tt_f[i] + AT[i][k] * ftilde[k];
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k];
    end;
    if TTdiag[i] <> 0.0 then ccoef[i] := Tt_f[i] / TTdiag[i] else ccoef[i] := 0.0;
  end;
end;

procedure CalculateGaussSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);
var k, i: Integer; theta, val, x: Double; A, AT: TMatrix; fvec, Tt_f, TTdiag: TDynamicDoubleArray;
begin
  SetLength(ccoef, n); SetLength(fvec, n); SetLength(Tt_f, n); SetLength(TTdiag, n);
  SetLength(A, n, n); SetLength(AT, n, n);
  for k := 0 to n-1 do
  begin
    theta := (k + 0.5) * Pi / n;
    for i := 0 to n-1 do begin val := Cos(i * theta); A[k][i] := val; AT[i][k] := val; end;
  end;
  for k := 0 to n-1 do begin x := Cos((k + 0.5) * Pi / n); fvec[k] := GetSelectedFunction(x, FuncIndex); end;
  for i := 0 to n-1 do
  begin
    Tt_f[i] := 0.0; TTdiag[i] := 0.0;
    for k := 0 to n-1 do
    begin
      Tt_f[i] := Tt_f[i] + AT[i][k] * fvec[k];
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k];
    end;
    if TTdiag[i] <> 0.0 then ccoef[i] := Tt_f[i] / TTdiag[i] else ccoef[i] := 0.0;
  end;
end;

procedure CalculateSecondKindSystemWithFunction(n: Integer; FuncIndex: Integer; out ccoef: TDynamicDoubleArray);
var k, i: Integer; theta, x, val, w: Double; A, AT: TMatrix; fvec, Tt_f, TTdiag: TDynamicDoubleArray;
begin
  SetLength(ccoef, n + 1); SetLength(fvec, n + 1); SetLength(Tt_f, n + 1); SetLength(TTdiag, n + 1);
  SetLength(A, n + 1, n + 1); SetLength(AT, n + 1, n + 1);
  for k := 0 to n do
  begin
    theta := k * Pi / n; x := Cos(theta);
    for i := 0 to n do
    begin
      if Abs(Sin(theta)) > 1e-14 then val := Sin((i + 1) * theta) / Sin(theta)
      else begin if x > 0 then val := (i + 1) else val := (i + 1) * Power(-1, i); end;
      A[k][i] := val; AT[i][k] := val;
    end;
  end;
  for k := 0 to n do begin x := Cos(k * Pi / n); fvec[k] := GetSelectedFunction(x, FuncIndex); end;
  for i := 0 to n do
  begin
    Tt_f[i] := 0.0; TTdiag[i] := 0.0;
    for k := 0 to n do
    begin
      theta := k * Pi / n; w := Sqr(Sin(theta));
      Tt_f[i] := Tt_f[i] + AT[i][k] * fvec[k] * w;
      TTdiag[i] := TTdiag[i] + AT[i][k] * AT[i][k] * w;
    end;
    if Abs(TTdiag[i]) > 1e-14 then ccoef[i] := Tt_f[i] / TTdiag[i] else ccoef[i] := 0.0;
  end;
end;

end.
