unit uChebInt;

interface

uses
  System.SysUtils, System.Math, uChebMath, uChebDiff;

function ChebIntPseudoInvMatrixLobatto(N: Integer): TMatrix;
function ChebIntPseudoInvMatrixGauss(N: Integer): TMatrix;
function ChebIntPseudoInvMatrixSecondKind(N: Integer): TMatrix;
function ChebIntMatrixLanczosT(N: Integer): TMatrix;

procedure SolveIntegration(var R: TChebResult; UseSpectral: Boolean);

procedure SolveFourthIntegration(var R: TChebFourthResult);

implementation




function InvertMatrix(const A: TMatrix): TMatrix;
var n, i, j, k: Integer; aug: TMatrix; pivot, factor: Double;
begin
  n := Length(A); if n = 0 then Exit(nil);
  SetLength(aug, n, 2*n);
  for i := 0 to n-1 do
  begin
    for j := 0 to n-1 do aug[i][j] := A[i][j];
    for j := 0 to n-1 do aug[i][n+j] := 0.0;
    aug[i][n+i] := 1.0;
  end;
  for i := 0 to n-1 do
  begin
    pivot := aug[i][i];
    if Abs(pivot) < 1e-18 then raise Exception.Create('Matrix inversion failed: near-zero pivot.');
    for j := 0 to 2*n-1 do aug[i][j] := aug[i][j] / pivot;
    for k := 0 to n-1 do
    begin
      if k = i then Continue;
      factor := aug[k][i];
      for j := 0 to 2*n-1 do aug[k][j] := aug[k][j] - factor * aug[i][j];
    end;
  end;
  SetLength(Result, n, n);
  for i := 0 to n-1 do
    for j := 0 to n-1 do
      Result[i][j] := aug[i][n+j];
end;

function EvalCubicCorrection(x, C0, C1, C2, C3: Double): Double;
begin
  Result := C0 + C1*x + C2*Sqr(x) + C3*x*Sqr(x);
end;

function SolveSmallLinearSystem4(const A: TMatrix; const b: TDynamicDoubleArray): TDynamicDoubleArray;
var
  Ainv: TMatrix;
  i, j: Integer;
begin
  Ainv := InvertMatrix(A);
  SetLength(Result, 4);
  for i := 0 to 3 do
  begin
    Result[i] := 0.0;
    for j := 0 to 3 do
      Result[i] := Result[i] + Ainv[i][j] * b[j];
  end;
end;


procedure SolveFourthIntegration(var R: TChebFourthResult);
var
  P: TMatrix;
  i, M, idx0, idx1, idx2, idx3: Integer;
  CorrMat: TMatrix;
  CorrRhs, CorrSol: TDynamicDoubleArray;
begin
  if Length(R.SpectralCoeffs4) = 0 then Exit;

  // 1. Integrate back 4 times spectrally
  P := ChebIntMatrixLanczosT(Length(R.SpectralCoeffs4) - 1);

  R.ReconCoeffsRaw := ApplyMatrixToVector(P, R.SpectralCoeffs4);
  R.ReconCoeffsRaw := ApplyMatrixToVector(P, R.ReconCoeffsRaw);
  R.ReconCoeffsRaw := ApplyMatrixToVector(P, R.ReconCoeffsRaw);
  R.ReconCoeffsRaw := ApplyMatrixToVector(P, R.ReconCoeffsRaw);

  // 2. Evaluate raw reconstruction at nodes
  SetLength(R.ReconNodesRaw, Length(R.Nodes));
  for i := 0 to High(R.Nodes) do
    R.ReconNodesRaw[i] := EvalChebSeriesClenshawT(R.ReconCoeffsRaw, R.Nodes[i]);

  // 3. Evaluate raw reconstruction on dense grid
  M := Length(R.GridX);
  SetLength(R.ReconGridRaw, M);
  for i := 0 to High(R.GridX) do
    R.ReconGridRaw[i] := EvalChebSeriesClenshawT(R.ReconCoeffsRaw, R.GridX[i]);

  // 4. Choose 4 nodes for cubic correction:
  // first two and last two
  idx0 := 0;
  idx1 := 1;
  idx2 := High(R.Nodes) - 1;
  idx3 := High(R.Nodes);

  SetLength(CorrMat, 4, 4);
  SetLength(CorrRhs, 4);

  // row 0
  CorrMat[0][0] := 1.0;
  CorrMat[0][1] := R.Nodes[idx0];
  CorrMat[0][2] := Sqr(R.Nodes[idx0]);
  CorrMat[0][3] := R.Nodes[idx0] * Sqr(R.Nodes[idx0]);
  CorrRhs[0] := R.Values[idx0] - R.ReconNodesRaw[idx0];

  // row 1
  CorrMat[1][0] := 1.0;
  CorrMat[1][1] := R.Nodes[idx1];
  CorrMat[1][2] := Sqr(R.Nodes[idx1]);
  CorrMat[1][3] := R.Nodes[idx1] * Sqr(R.Nodes[idx1]);
  CorrRhs[1] := R.Values[idx1] - R.ReconNodesRaw[idx1];

  // row 2
  CorrMat[2][0] := 1.0;
  CorrMat[2][1] := R.Nodes[idx2];
  CorrMat[2][2] := Sqr(R.Nodes[idx2]);
  CorrMat[2][3] := R.Nodes[idx2] * Sqr(R.Nodes[idx2]);
  CorrRhs[2] := R.Values[idx2] - R.ReconNodesRaw[idx2];

  // row 3
  CorrMat[3][0] := 1.0;
  CorrMat[3][1] := R.Nodes[idx3];
  CorrMat[3][2] := Sqr(R.Nodes[idx3]);
  CorrMat[3][3] := R.Nodes[idx3] * Sqr(R.Nodes[idx3]);
  CorrRhs[3] := R.Values[idx3] - R.ReconNodesRaw[idx3];

  CorrSol := SolveSmallLinearSystem4(CorrMat, CorrRhs);

  R.CorrC0 := CorrSol[0];
  R.CorrC1 := CorrSol[1];
  R.CorrC2 := CorrSol[2];
  R.CorrC3 := CorrSol[3];

  // 5. Final corrected reconstruction at nodes
  SetLength(R.ReconNodes, Length(R.Nodes));
  SetLength(R.ErrorNodes, Length(R.Nodes));
  for i := 0 to High(R.Nodes) do
  begin
    R.ReconNodes[i] := R.ReconNodesRaw[i] +
      EvalCubicCorrection(R.Nodes[i], R.CorrC0, R.CorrC1, R.CorrC2, R.CorrC3);
    R.ErrorNodes[i] := Abs(R.Values[i] - R.ReconNodes[i]);
  end;

  // 6. Final corrected reconstruction on dense grid
  SetLength(R.ReconGrid, Length(R.GridX));
  SetLength(R.ErrorGrid, Length(R.GridX));
  for i := 0 to High(R.GridX) do
  begin
    R.ReconGrid[i] := R.ReconGridRaw[i] +
      EvalCubicCorrection(R.GridX[i], R.CorrC0, R.CorrC1, R.CorrC2, R.CorrC3);
    R.ErrorGrid[i] := Abs(GetSelectedFunction(R.GridX[i], R.FuncIndex) - R.ReconGrid[i]);
  end;
end;

function RegularizedPseudoInverse(const D: TMatrix; lambda: Double): TMatrix;
var n, i, j, k: Integer; DT, DTD, Ainv: TMatrix;
begin
  n := Length(D); if n = 0 then Exit(nil);
  SetLength(DT, n, n);
  for i := 0 to n-1 do
    for j := 0 to n-1 do
      DT[i][j] := D[j][i];
  SetLength(DTD, n, n);
  for i := 0 to n-1 do
    for j := 0 to n-1 do
    begin
      DTD[i][j] := 0.0;
      for k := 0 to n-1 do
        DTD[i][j] := DTD[i][j] + DT[i][k] * D[k][j];
    end;
  for i := 0 to n-1 do
    DTD[i][i] := DTD[i][i] + lambda;
  Ainv := InvertMatrix(DTD);
  SetLength(Result, n, n);
  for i := 0 to n-1 do
    for j := 0 to n-1 do
    begin
      Result[i][j] := 0.0;
      for k := 0 to n-1 do
        Result[i][j] := Result[i][j] + Ainv[i][k] * DT[k][j];
    end;
end;

function ChebIntPseudoInvMatrixLobatto(N: Integer): TMatrix;
var D: TMatrix;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  D := ChebDiffMatrixLobatto(N);
  Result := RegularizedPseudoInverse(D, 1e-8);
end;

function ChebIntPseudoInvMatrixGauss(N: Integer): TMatrix;
var D: TMatrix;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  D := ChebDiffMatrixGauss(N);
  Result := RegularizedPseudoInverse(D, 1e-8);
end;

function ChebIntPseudoInvMatrixSecondKind(N: Integer): TMatrix;
var D: TMatrix;
begin
  if N < 1 then raise Exception.Create('N must be at least 1');
  D := ChebDiffMatrixSecondKind(N);
  Result := RegularizedPseudoInverse(D, 1e-8);
end;

function ChebIntMatrixLanczosT(N: Integer): TMatrix;
var k, j: Integer; c0: Double;
begin
  if N < 0 then
    raise Exception.CreateFmt('ChebIntMatrixLanczosT: N must be nonnegative, got %d', [N]);

  SetLength(Result, N + 1, N + 1);
  for k := 0 to N do
    for j := 0 to N do
      Result[k][j] := 0.0;

  if N >= 1 then Result[1][0] := 1.0;

  for k := 1 to N do
  begin
    if k = 1 then c0 := 0.25
    else c0 := k * Sin(k * Pi / 2.0) / (k * k - 1.0);
    Result[0][k] := Result[0][k] + c0;
    if k + 1 <= N then
      Result[k + 1][k] := Result[k + 1][k] + 1.0 / (2.0 * (k + 1));
    if k > 1 then
      Result[k - 1][k] := Result[k - 1][k] - 1.0 / (2.0 * (k - 1));
  end;
end;

procedure SolveIntegration(var R: TChebResult; UseSpectral: Boolean);
var
  P: TMatrix;
  i, M, SpectralN: Integer;
  ShiftC: Double;
  IntegralNum: TDynamicDoubleArray;
begin
  if Length(R.DerivNum) = 0 then Exit;

  // 1. Узловое интегрирование через псевдообратную
  case R.Mode of
    nmLobatto: P := ChebIntPseudoInvMatrixLobatto(R.N);
    nmGauss:   P := ChebIntPseudoInvMatrixGauss(R.N);
    nmSecondKind: P := ChebIntPseudoInvMatrixSecondKind(R.N);
  end;

  IntegralNum := ApplyMatrixToVector(P, R.DerivNum);
  SetLength(R.Reconstructed, Length(IntegralNum));
  SetLength(R.Error, Length(IntegralNum));

  ShiftC := R.Values[0] - IntegralNum[0];
  for i := 0 to High(R.Reconstructed) do
  begin
    R.Reconstructed[i] := IntegralNum[i] + ShiftC;
    R.Error[i] := Abs(R.Reconstructed[i] - R.Values[i]);
  end;

  // 2. Спектральное интегрирование через матрицу Ланцоша
  if UseSpectral then
  begin
    // ✅ КЛЮЧЕВАЯ ЗАЩИТА КАК В ОРИГИНАЛЕ (строка 156 версия1.txt)
    if Length(R.SpectralDerivCoeffs) = 0 then
      Exit;  // Тихо выходим если коэффициентов нет

    SpectralN := Length(R.SpectralDerivCoeffs) - 1;

    // ✅ Дополнительная защита от отрицательного индекса
    if SpectralN < 0 then Exit;

    try
      P := ChebIntMatrixLanczosT(SpectralN);
      R.SpectralIntCoeffs := ApplyMatrixToVector(P, R.SpectralDerivCoeffs);

      ShiftC := R.Values[0] - EvalChebSeriesClenshawT(R.SpectralIntCoeffs, R.Nodes[0]);
      if Length(R.SpectralIntCoeffs) > 0 then
        R.SpectralIntCoeffs[0] := R.SpectralIntCoeffs[0] + ShiftC;

      SetLength(R.SpectralIntReconstructed, Length(R.Nodes));
      SetLength(R.SpectralIntError, Length(R.Nodes));
      for i := 0 to High(R.Nodes) do
      begin
        R.SpectralIntReconstructed[i] := EvalChebSeriesClenshawT(R.SpectralIntCoeffs, R.Nodes[i]);
        R.SpectralIntError[i] := Abs(R.Values[i] - R.SpectralIntReconstructed[i]);
      end;

      // Сетка для графиков — ВСЕГДА заполняется если UseSpectral
      M := 400;
      // Заполняем GridX если пустой (как в оригинале)
      if Length(R.GridX) <> M + 1 then
      begin
        SetLength(R.GridX, M + 1);
        for i := 0 to M do
          R.GridX[i] := -1.0 + 2.0 * i / M;
      end;
      // Заполняем GridInt
      SetLength(R.GridInt, M + 1);
      for i := 0 to M do
        R.GridInt[i] := EvalChebSeriesClenshawT(R.SpectralIntCoeffs, R.GridX[i]);
    except
      on E: Exception do
      begin
        // Тихо игнорируем ошибки спектрального интегрирования
        SetLength(R.SpectralIntCoeffs, 0);
        SetLength(R.SpectralIntReconstructed, 0);
        SetLength(R.SpectralIntError, 0);
        SetLength(R.GridInt, 0);
      end;
    end;
  end;
end;



end.
