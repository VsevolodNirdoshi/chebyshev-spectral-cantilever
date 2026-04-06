unit uChebDiff;

interface

uses
  System.SysUtils, System.Math, uChebMath;

// Основные функции для матриц дифференцирования
function ChebDiffMatrixLobatto(N: Integer): TMatrix;
function ChebDiffMatrixGauss(N: Integer): TMatrix;
function ChebDiffMatrixSecondKind(N: Integer): TMatrix;

// Вычисление производной через матрицу
function ApplyDiffMatrix(const D: TMatrix; const f: TDynamicDoubleArray): TDynamicDoubleArray;

// Вспомогательные функции
function GetSelectedFunctionDerivative(x: Double; FunctionIndex: Integer): Double;
function GetAnalyticalDerivative(const x: TDynamicDoubleArray; FuncIndex: Integer): TDynamicDoubleArray;
function GetFunctionDerivativeName(FunctionIndex: Integer): string;

implementation

{-------------------------------------------------------------------------------
  Матрица дифференцирования для узлов Чебышёва-Гаусса-Лобатто (N+1 точек)
-------------------------------------------------------------------------------}
function ChebDiffMatrixLobatto(N: Integer): TMatrix;
var
  i, j: Integer;
  c: array of Double;
  x: array of Double;
begin
  if N < 1 then
    raise Exception.Create('N must be at least 1');

  SetLength(Result, N+1, N+1);
  SetLength(c, N+1);
  SetLength(x, N+1);

  // Узлы Чебышёва-Гаусса-Лобатто
  for i := 0 to N do
    x[i] := Cos(Pi * i / N);

  // Коэффициенты c_i
  for i := 0 to N do
  begin
    if (i = 0) or (i = N) then
      c[i] := 2.0
    else
      c[i] := 1.0;
  end;

  // Заполнение матрицы
  for i := 0 to N do
  begin
    for j := 0 to N do
    begin
      if i <> j then
      begin
        Result[i][j] := (c[i] / c[j]) * Power(-1, i+j) / (x[i] - x[j]);
      end
      else // диагональные элементы
      begin
        if i = 0 then
          Result[i][i] := (2.0 * N * N + 1.0) / 6.0
        else if i = N then
          Result[i][i] := -(2.0 * N * N + 1.0) / 6.0
        else
        begin
          if Abs(1.0 - x[i]*x[i]) > 1e-12 then
            Result[i][i] := -x[i] / (2.0 * (1.0 - x[i]*x[i]))
          else
            Result[i][i] := 0.0;
        end;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  Матрица дифференцирования для узлов Чебышёва-Гаусса (N точек)
-------------------------------------------------------------------------------}
function ChebDiffMatrixGauss(N: Integer): TMatrix;
var
  i, j: Integer;
  c: array of Double;
  x: array of Double;
begin
  if N < 1 then
    raise Exception.Create('N must be at least 1');

  SetLength(Result, N, N);
  SetLength(c, N);
  SetLength(x, N);

  // Узлы Чебышёва-Гаусса
  for i := 0 to N-1 do
    x[i] := Cos(Pi * (i + 0.5) / N);

  // Все коэффициенты c_i = 1 для узлов Гаусса
  for i := 0 to N-1 do
    c[i] := 1.0;

  // Заполнение матрицы
  for i := 0 to N-1 do
  begin
    for j := 0 to N-1 do
    begin
      if i <> j then
      begin
        Result[i][j] := (c[i] / c[j]) * Power(-1, i+j) / (x[i] - x[j]);
      end
      else // диагональные элементы
      begin
        if Abs(1.0 - x[i]*x[i]) > 1e-12 then
          Result[i][i] := -x[i] / (2.0 * (1.0 - x[i]*x[i]))
        else
          Result[i][i] := 0.0;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  Матрица дифференцирования для полиномов Чебышёва второго рода
-------------------------------------------------------------------------------}
function ChebDiffMatrixSecondKind(N: Integer): TMatrix;
var
  i, j, k: Integer;
  x: array of Double;
  theta: Double;
  sum: Double;
begin
  if N < 1 then
    raise Exception.Create('N must be at least 1');

  SetLength(Result, N, N);
  SetLength(x, N);

  // Узлы для полиномов второго рода
  for k := 0 to N-1 do
  begin
    theta := (k + 1) * Pi / (N + 1);
    x[k] := Cos(theta);
  end;

  // Вычисление элементов матрицы через производные базисных функций
  for i := 0 to N-1 do
  begin
    for j := 0 to N-1 do
    begin
      if i = j then
      begin
        // Диагональные элементы
        sum := 0.0;
        for k := 0 to N-1 do
        begin
          if k <> i then
            sum := sum + 1.0 / (x[i] - x[k]);
        end;
        Result[i][i] := sum;
      end
      else
      begin
        // Недиагональные элементы
        Result[i][j] := Power(-1, i+j) / (x[i] - x[j]);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  Применение матрицы дифференцирования к вектору значений функции
-------------------------------------------------------------------------------}
function ApplyDiffMatrix(const D: TMatrix; const f: TDynamicDoubleArray): TDynamicDoubleArray;
var
  i, j: Integer;
  n: Integer;
begin
  n := Length(f);
  SetLength(Result, n);

  for i := 0 to n-1 do
  begin
    Result[i] := 0.0;
    for j := 0 to n-1 do
    begin
      Result[i] := Result[i] + D[i][j] * f[j];
    end;
  end;
end;

{-------------------------------------------------------------------------------
  Аналитические производные выбранных функций
-------------------------------------------------------------------------------}
function GetSelectedFunctionDerivative(x: Double; FunctionIndex: Integer): Double;
const
  alpha = 10.0;
  omega = 50.0;
  a     = 0.0;
begin
  case FunctionIndex of
    0: // f(x) = exp(alpha*(x^2-1))
      Result := Exp(alpha * (Sqr(x) - 1.0)) * 2.0 * alpha * x;

    1: // f(x) = sin(omega*x)*exp(-x^2)
      Result := omega * Cos(omega * x) * Exp(-Sqr(x)) +
                Sin(omega * x) * (-2.0 * x) * Exp(-Sqr(x));

    2: // f(x) = sin(3*pi*x)*cos(2*pi*x^2) + 0.3*sin(6*pi*|x|)
      begin
        // Производная первого слагаемого
        Result := 3.0 * Pi * Cos(3.0 * Pi * x) * Cos(2.0 * Pi * Sqr(x)) +
                  Sin(3.0 * Pi * x) * (-4.0 * Pi * x) * Sin(2.0 * Pi * Sqr(x));

        // Производная второго слагаемого
        if x > 0 then
          Result := Result + 0.3 * 6.0 * Pi * Cos(6.0 * Pi * x)
        else if x < 0 then
          Result := Result - 0.3 * 6.0 * Pi * Cos(6.0 * Pi * x)
        else
          Result := 0.0; // производная |x| в нуле не определена
      end;

    3: // f(x) = |x-a|
      if x > a then
        Result := 1.0
      else if x < a then
        Result := -1.0
      else
        Result := 0.0; // производная в точке a не определена
    4: // f(x) = x^2
      Result := 2.0 * x;
  else
    Result := 0.0;
  end;
end;

{-------------------------------------------------------------------------------
  Вычисление аналитической производной в массиве точек
-------------------------------------------------------------------------------}
function GetAnalyticalDerivative(const x: TDynamicDoubleArray; FuncIndex: Integer): TDynamicDoubleArray;
var
  i: Integer;
begin
  SetLength(Result, Length(x));
  for i := 0 to High(x) do
    Result[i] := GetSelectedFunctionDerivative(x[i], FuncIndex);
end;

{-------------------------------------------------------------------------------
  Получение имени производной функции
-------------------------------------------------------------------------------}
function GetFunctionDerivativeName(FunctionIndex: Integer): string;  // ИЗМЕНИЛОСЬ!
begin
  case FunctionIndex of
    0: Result := 'df/dx = 2αx exp(α(x²-1))';
    1: Result := 'df/dx = ω cos(ωx)exp(-x²) - 2x sin(ωx)exp(-x²)';
    2: Result := 'df/dx = 3π cos(3πx)cos(2πx²) - 4πx sin(3πx)sin(2πx²) ± 1.8π cos(6π|x|)';
    3: Result := 'df/dx = sign(x-a)';
    4: Result := 'df/dx = 2x';
  else
    Result := 'Unknown derivative';
  end;
end;

end.
