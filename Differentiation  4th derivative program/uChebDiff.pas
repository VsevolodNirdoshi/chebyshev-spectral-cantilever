unit uChebDiff;

interface

uses
  System.SysUtils, System.Math, uChebMath;

function ChebDiffMatrixLobatto(N: Integer): TMatrix;
function ChebDiffMatrixGauss(N: Integer): TMatrix;
function ChebDiffMatrixSecondKind(N: Integer): TMatrix;
function ChebDiffMatrixSpectralT(N: Integer): TMatrix;

function SolveDifferentiation(Mode: TNodeMode; N: Integer; FuncIndex: Integer;
  DoSpectral: Boolean): TChebResult;

function SolveFourthSpectral(Mode: TNodeMode; N: Integer; FuncIndex: Integer): TChebFourthResult;

implementation

function SolveFourthSpectral(Mode: TNodeMode; N: Integer; FuncIndex: Integer): TChebFourthResult;
var
  D: TMatrix;
  i, M: Integer;
begin
  Result.N := N;
  Result.FuncIndex := FuncIndex;
  Result.Mode := Mode;

  // 1. Nodes and original values
  Result.Nodes := GetNodes(Mode, N);
  SetLength(Result.Values, Length(Result.Nodes));
  for i := 0 to High(Result.Nodes) do
    Result.Values[i] := GetSelectedFunction(Result.Nodes[i], FuncIndex);

  // 2. Dense grid
  M := 400;
  SetLength(Result.GridX, M + 1);
  for i := 0 to M do
    Result.GridX[i] := -1.0 + 2.0 * i / M;

  // 3. Original spectral coefficients
  case Mode of
    nmLobatto: CalculateLobattoSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs0);
    nmGauss:   CalculateGaussSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs0);
    nmSecondKind: CalculateSecondKindSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs0);
  end;

  if Length(Result.SpectralCoeffs0) = 0 then Exit;


  // 3a. Evaluate initial interpolant p(x) on dense grid
  SetLength(Result.InterpGrid, M + 1);
  for i := 0 to M do
    Result.InterpGrid[i] := EvalChebSeriesClenshawT(Result.SpectralCoeffs0, Result.GridX[i]);


  // 4. Differentiate 4 times in spectral space
  D := ChebDiffMatrixSpectralT(Length(Result.SpectralCoeffs0) - 1);

  Result.SpectralCoeffs1 := ApplyMatrixToVector(D, Result.SpectralCoeffs0);
  Result.SpectralCoeffs2 := ApplyMatrixToVector(D, Result.SpectralCoeffs1);
  Result.SpectralCoeffs3 := ApplyMatrixToVector(D, Result.SpectralCoeffs2);
  Result.SpectralCoeffs4 := ApplyMatrixToVector(D, Result.SpectralCoeffs3);

  // 5. Evaluate 4th derivative at nodes
  SetLength(Result.Deriv4Nodes, Length(Result.Nodes));
  for i := 0 to High(Result.Nodes) do
    Result.Deriv4Nodes[i] := EvalChebSeriesClenshawT(Result.SpectralCoeffs4, Result.Nodes[i]);

  // 6. Evaluate 4th derivative on dense grid
  SetLength(Result.Deriv4Grid, M + 1);
  for i := 0 to M do
    Result.Deriv4Grid[i] := EvalChebSeriesClenshawT(Result.SpectralCoeffs4, Result.GridX[i]);

  // 7. Optional exact analytical 4th derivative
  SetLength(Result.Deriv4AnalytGrid, M + 1);
  for i := 0 to M do
    Result.Deriv4AnalytGrid[i] := GetSelectedFunctionDerivative4(Result.GridX[i], FuncIndex);
end;

// === МАТРИЦЫ ДИФФЕРЕНЦИРОВАНИЯ ===

function ChebDiffMatrixLobatto(N: Integer): TMatrix;
var i, j: Integer; c, x: array of Double;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  SetLength(Result, N+1, N+1); SetLength(c, N+1); SetLength(x, N+1);
  for i := 0 to N do x[i] := Cos(Pi * i / N);
  for i := 0 to N do if (i = 0) or (i = N) then c[i] := 2.0 else c[i] := 1.0;
  for i := 0 to N do
    for j := 0 to N do
      if i <> j then
        Result[i][j] := (c[i] / c[j]) * Power(-1, i+j) / (x[i] - x[j])
      else
        if i = 0 then Result[i][i] := (2.0 * N * N + 1.0) / 6.0
        else if i = N then Result[i][i] := -(2.0 * N * N + 1.0) / 6.0
        else if Abs(1.0 - x[i]*x[i]) > 1e-12 then
          Result[i][i] := -x[i] / (2.0 * (1.0 - x[i]*x[i]))
        else Result[i][i] := 0.0;
end;

function ChebDiffMatrixGauss(N: Integer): TMatrix;
var i, j: Integer; x: array of Double;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  SetLength(Result, N, N); SetLength(x, N);
  for i := 0 to N-1 do x[i] := Cos(Pi * (i + 0.5) / N);
  for i := 0 to N-1 do
    for j := 0 to N-1 do
      if i <> j then
        Result[i][j] := Power(-1, i+j) / (x[i] - x[j])
      else
        if Abs(1.0 - x[i]*x[i]) > 1e-12 then
          Result[i][i] := -x[i] / (2.0 * (1.0 - x[i]*x[i]))
        else Result[i][i] := 0.0;
end;

function ChebDiffMatrixSecondKind(N: Integer): TMatrix;
var i, j: Integer; x, w: array of Double; theta, s: Double;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  SetLength(Result, N, N); SetLength(x, N); SetLength(w, N);
  for i := 0 to N-1 do
  begin
    theta := (i + 1) * Pi / (N + 1);
    x[i] := Cos(theta);
    w[i] := Power(-1, i) * Sin(theta);
  end;
  for i := 0 to N-1 do
    for j := 0 to N-1 do
      if i <> j then Result[i][j] := (w[j] / w[i]) / (x[i] - x[j])
      else Result[i][i] := 0.0;
  for i := 0 to N-1 do
  begin
    s := 0.0;
    for j := 0 to N-1 do if j <> i then s := s + Result[i][j];
    Result[i][i] := -s;
  end;
end;

function ChebDiffMatrixSpectralT(N: Integer): TMatrix;
var i, j: Integer; ci: Double;
begin
  if N < 0 then raise Exception.Create('N must be nonnegative');
  SetLength(Result, N + 1, N + 1);
  for i := 0 to N do for j := 0 to N do Result[i][j] := 0.0;
  for j := 1 to N do
    for i := 0 to j - 1 do
      if Odd(i + j) then
      begin
        if i = 0 then ci := 2.0 else ci := 1.0;
        Result[i][j] := 2.0 * j / ci;
      end;
end;

// === УНИВЕРСАЛЬНАЯ ФУНКЦИЯ РЕШЕНИЯ ===
function SolveDifferentiation(Mode: TNodeMode; N: Integer; FuncIndex: Integer;
  DoSpectral: Boolean): TChebResult;
var
  D: TMatrix;
  i, M: Integer;
  x: Double;
begin
  Result.N := N;
  Result.FuncIndex := FuncIndex;
  Result.Mode := Mode;

  // 1. Узлы и значения функции
  Result.Nodes := GetNodes(Mode, N);
  SetLength(Result.Values, Length(Result.Nodes));
  for i := 0 to High(Result.Nodes) do
    Result.Values[i] := GetSelectedFunction(Result.Nodes[i], FuncIndex);

  // 2. Матрица дифференцирования и численная производная
  case Mode of
    nmLobatto: D := ChebDiffMatrixLobatto(N);
    nmGauss:   D := ChebDiffMatrixGauss(N);
    nmSecondKind: D := ChebDiffMatrixSecondKind(N);
  end;
  Result.DerivNum := ApplyMatrixToVector(D, Result.Values);
  Result.DerivAnalyt := GetAnalyticalDerivative(Result.Nodes, FuncIndex);

  // 3. СЕТКА ДЛЯ ГРАФИКОВ (400 точек) — ЗАПОЛНЯЕТСЯ ВСЕГДА, ВНЕ if DoSpectral!
  M := 400;
  SetLength(Result.GridX, M + 1);
  for i := 0 to M do
    Result.GridX[i] := -1.0 + 2.0 * i / M;

  // 4. Спектральная часть (только если запрошена)
  if DoSpectral then
  begin
    // Вычисление коэффициентов разложения
    case Mode of
      nmLobatto: CalculateLobattoSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs);
      nmGauss:   CalculateGaussSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs);
      nmSecondKind: CalculateSecondKindSystemWithFunction(N, FuncIndex, Result.SpectralCoeffs);
    end;

    // ЗАЩИТА: проверяем что коэффициенты вычислены
    if Length(Result.SpectralCoeffs) >= 1 then
    begin
      D := ChebDiffMatrixSpectralT(Length(Result.SpectralCoeffs) - 1);
      Result.SpectralDerivCoeffs := ApplyMatrixToVector(D, Result.SpectralCoeffs);

      SetLength(Result.SpectralDerivValues, Length(Result.Nodes));
      for i := 0 to High(Result.Nodes) do
        Result.SpectralDerivValues[i] := EvalChebSeriesClenshawT(Result.SpectralDerivCoeffs, Result.Nodes[i]);

      SetLength(Result.GridDeriv, M + 1);
      for i := 0 to M do
        Result.GridDeriv[i] := EvalChebSeriesClenshawT(Result.SpectralDerivCoeffs, Result.GridX[i]);
    end;
  end;
end;

end.
