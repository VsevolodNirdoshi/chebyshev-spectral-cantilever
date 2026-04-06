unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.TypInfo, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Samples.Spin,
  VCLTee.TeEngine, VCLTee.Chart, VCLTee.Series, VCLTee.TeeGDIPlus,
  uChebMath, uChebDiff, uChebInt, Math, VCLTee.TeeProcs;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    // Вкладка 1: Лобатто
    TabLobatto: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    ListBoxFunc: TListBox;
    Button1: TButton;
    Button2: TButton;
    CheckBoxIntLobatto: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TPointSeries;
    SeriesInt1: TLineSeries;
    SeriesError1: TLineSeries;
    SeriesSpectralDerivLobatto: TLineSeries;
    SeriesSpectralPointsLobatto: TPointSeries;
    SeriesIntSpectralLobatto: TLineSeries;
    SeriesErrorSpectralLobatto: TLineSeries;
    // Вкладка 2: Гаусс
    TabGauss: TTabSheet;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpinEdit2: TSpinEdit;
    ListBox2: TListBox;
    Button4: TButton;
    Button5: TButton;
    CheckBoxIntGauss: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Chart2: TChart;
    Series5: TFastLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TPointSeries;
    SeriesInt2: TLineSeries;
    SeriesError2: TLineSeries;
    SeriesSpectralDerivGauss: TLineSeries;
    SeriesSpectralPointsGauss: TPointSeries;
    SeriesIntSpectralGauss: TLineSeries;
    SeriesErrorSpectralGauss: TLineSeries;
    // Вкладка 3: Второй род
    TabSecondKind: TTabSheet;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpinEdit3: TSpinEdit;
    ListBox3: TListBox;
    Button7: TButton;
    Button8: TButton;
    CheckBoxIntSecond: TCheckBox;
    CheckBox7: TCheckBox;
    Splitter3: TSplitter;
    Panel5: TPanel;
    Chart3: TChart;
    Series9: TFastLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TPointSeries;
    SeriesInt3: TLineSeries;
    SeriesError3: TLineSeries;
    // Вкладка 4: Матрицы
    TabSheet4: TTabSheet;
    PanelMatrixTop: TPanel;
    RadioGroupMatrixType: TRadioGroup;
    SpinEdit4: TSpinEdit;
    Button10: TButton;
    ButtonShowPseudoInv: TButton;
    LabelMatrixInfo: TLabel;
    StringGridMatrix: TStringGrid;
    Button11: TButton;
    Button12: TButton;
    TabFourthSpectral: TTabSheet;
    Panel7: TPanel;
    LabelFourthGrid: TLabel;
    LabelFourthN: TLabel;
    LabelFourthFunc: TLabel;
    SpinEditFourthN: TSpinEdit;
    ListBoxFourthFunc: TListBox;
    ButtonFourthCompute: TButton;
    ButtonFourthPlot: TButton;
    CheckBoxFourthShowDeriv4: TCheckBox;
    CheckBoxFourthShowRecon: TCheckBox;
    Panel8: TPanel;
    ChartFourth: TChart;
    FastLineSeries1: TFastLineSeries;
    LineSeries1: TLineSeries;
    PointSeries1: TPointSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    PointSeries2: TPointSeries;
    Splitter4: TSplitter;
    RadioFourthGauss: TRadioButton;
    RadioFourthLobatto: TRadioButton;
    CheckBoxFourthShowError: TCheckBox;
    CheckBoxFourthShowInterp: TCheckBox;
    Series13: TLineSeries;
    Panel9: TPanel;
    status: TLabel;
    // Обработчики событий
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBoxIntLobattoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBoxIntGaussClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBoxIntSecondClick(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ButtonShowPseudoInvClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonFourthComputeClick(Sender: TObject);
    procedure CheckBoxFourthShowDeriv4Click(Sender: TObject);
    procedure CheckBoxFourthShowReconClick(Sender: TObject);
    procedure CheckBoxFourthShowErrorClick(Sender: TObject);
    procedure CheckBoxFourthShowInterpClick(Sender: TObject);
  private
    FResults: array[TNodeMode] of TChebResult;
    FCurrentMode: TNodeMode;
    FDiffNodal: array[TNodeMode] of Boolean;
    FDiffSpectral: array[TNodeMode] of Boolean;
    FIntSpectral: array[TNodeMode] of Boolean;
    FIntNodal: array[TNodeMode] of Boolean;
    FFourthResult: TChebFourthResult;


    procedure UpdateCurrentMode;
    procedure ComputeCurrentTab;
    procedure PlotCurrentTab;
    procedure DisplayMatrix(const D: TMatrix; const Grid: TStringGrid);
    procedure DisplaySpectralDiffMatrix(const D: TMatrix; const Grid: TStringGrid);
    procedure DisplaySpectralIntMatrix(const P: TMatrix; const Grid: TStringGrid);
    procedure UpdateMatrixCaption;
    procedure ComputeFourthTab;
    procedure PlotFourthTab;
    function GetFourthModeFromUI(out Mode: TNodeMode): Boolean;

  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Инициализация формы
procedure TForm1.FormCreate(Sender: TObject);
var m: TNodeMode;
begin
  for m := Low(TNodeMode) to High(TNodeMode) do
  begin
    FIntNodal[m] := False;
    FDiffNodal[m] := False;
    FDiffSpectral[m] := False;
    FIntSpectral[m] := False;
  end;
  CheckBoxIntLobatto.Checked := FIntNodal[nmLobatto];
  CheckBoxIntGauss.Checked := FIntNodal[nmGauss];
  CheckBoxIntSecond.Checked := FIntNodal[nmSecondKind];
  SeriesInt1.Active := True; SeriesError1.Active := False;
  SeriesInt2.Active := True; SeriesError2.Active := False;
  SeriesInt3.Active := True; SeriesError3.Active := False;
  SeriesSpectralDerivLobatto.Active := False; SeriesSpectralPointsLobatto.Active := False;
  SeriesIntSpectralLobatto.Active := False; SeriesErrorSpectralLobatto.Active := False;
  SeriesSpectralDerivGauss.Active := False; SeriesSpectralPointsGauss.Active := False;
  SeriesIntSpectralGauss.Active := False; SeriesErrorSpectralGauss.Active := False;
  status.Caption := '';
  Series13.Active := False;
end;

// Определение текущего режима
procedure TForm1.UpdateCurrentMode;
begin
  if PageControl1.ActivePage = TabLobatto then FCurrentMode := nmLobatto
  else if PageControl1.ActivePage = TabGauss then FCurrentMode := nmGauss
  else if PageControl1.ActivePage = TabSecondKind then FCurrentMode := nmSecondKind;
end;

// Универсальный вычислитель
procedure TForm1.ComputeCurrentTab;
var
  N, FuncIdx: Integer;
  DoSpectral: Boolean;
begin
  UpdateCurrentMode;
  if FCurrentMode = nmLobatto then begin N := SpinEdit1.Value; FuncIdx := ListBoxFunc.ItemIndex; end
  else if FCurrentMode = nmGauss then begin N := SpinEdit2.Value; FuncIdx := ListBox2.ItemIndex; end
  else begin N := SpinEdit3.Value; FuncIdx := ListBox3.ItemIndex; end;

  DoSpectral := FDiffSpectral[FCurrentMode] or FIntSpectral[FCurrentMode];
  FResults[FCurrentMode] := SolveDifferentiation(FCurrentMode, N, FuncIdx, DoSpectral);

  if FIntNodal[FCurrentMode] or FIntSpectral[FCurrentMode] then
    SolveIntegration(FResults[FCurrentMode], FIntSpectral[FCurrentMode]);

  PlotCurrentTab;
end;

// Универсальный построитель графиков
procedure TForm1.PlotCurrentTab;
var
  i: Integer;
  R: TChebResult;
  SFunc, SDerivA, SDerivN, SPoints, SInt, SError, SSpectDeriv, SSpectPoints, SSpectInt, SSpectErr: TChartSeries;
begin
  UpdateCurrentMode;
  R := FResults[FCurrentMode];

  // Выбор серий в зависимости от вкладки
  if FCurrentMode = nmLobatto then
  begin
    SFunc:=Series1; SDerivA:=Series2; SDerivN:=Series3; SPoints:=Series4;
    SInt:=SeriesInt1; SError:=SeriesError1;
    SSpectDeriv:=SeriesSpectralDerivLobatto; SSpectPoints:=SeriesSpectralPointsLobatto;
    SSpectInt:=SeriesIntSpectralLobatto; SSpectErr:=SeriesErrorSpectralLobatto;
  end
  else if FCurrentMode = nmGauss then
  begin
    SFunc:=Series5; SDerivA:=Series6; SDerivN:=Series7; SPoints:=Series8;
    SInt:=SeriesInt2; SError:=SeriesError2;
    SSpectDeriv:=SeriesSpectralDerivGauss; SSpectPoints:=SeriesSpectralPointsGauss;
    SSpectInt:=SeriesIntSpectralGauss; SSpectErr:=SeriesErrorSpectralGauss;
  end
  else
  begin
    SFunc:=Series9; SDerivA:=Series10; SDerivN:=Series11; SPoints:=Series12;
    SInt:=SeriesInt3; SError:=SeriesError3;
    SSpectDeriv:=nil; SSpectPoints:=nil; SSpectInt:=nil; SSpectErr:=nil;
  end;

  // Очистка всех серий
  SFunc.Clear; SDerivA.Clear; SDerivN.Clear; SPoints.Clear; SInt.Clear; SError.Clear;
  if Assigned(SSpectDeriv) then begin SSpectDeriv.Clear; SSpectPoints.Clear; end;
  if Assigned(SSpectInt) then begin SSpectInt.Clear; SSpectErr.Clear; end;

  // Настройка видимости серий
  SDerivN.Active := FDiffNodal[FCurrentMode];
  SInt.Active := FIntNodal[FCurrentMode];  // ✅ Интеграл только по флагу
  SError.Active := FIntNodal[FCurrentMode];  // ✅ Ошибка только по флагу
  if Assigned(SSpectDeriv) then SSpectDeriv.Active := FDiffSpectral[FCurrentMode];
  if Assigned(SSpectPoints) then SSpectPoints.Active := FDiffSpectral[FCurrentMode];
  if Assigned(SSpectInt) then SSpectInt.Active := FIntSpectral[FCurrentMode];
  if Assigned(SSpectErr) then SSpectErr.Active := FIntSpectral[FCurrentMode];

  // === 1. Функция f(x) — ВСЕГДА ===
  if Length(R.GridX) > 0 then
    for i := 0 to High(R.GridX) do
      SFunc.AddXY(R.GridX[i], GetSelectedFunction(R.GridX[i], R.FuncIndex));

  // === 2. Аналитическая производная f'(x) — ВСЕГДА ===
  if Length(R.GridX) > 0 then
    for i := 0 to High(R.GridX) do
      SDerivA.AddXY(R.GridX[i], GetSelectedFunctionDerivative(R.GridX[i], R.FuncIndex));

  // === 3. Узловые значения f(x_k) — ВСЕГДА ===
  if Length(R.Nodes) > 0 then
    for i := 0 to High(R.Nodes) do
      SPoints.AddXY(R.Nodes[i], R.Values[i]);

  // === 4. Узловая производная — по флагу ===
  if FDiffNodal[FCurrentMode] and (Length(R.DerivNum) > 0) then
    for i := 0 to High(R.Nodes) do
      SDerivN.AddXY(R.Nodes[i], R.DerivNum[i]);

  // === 5. УЗЛОВОЕ ИНТЕГРИРОВАНИЕ (восстановление функции) — по флагу ===
  if FIntNodal[FCurrentMode] and (Length(R.Reconstructed) > 0) then
    for i := 0 to High(R.Nodes) do
    begin
      SInt.AddXY(R.Nodes[i], R.Reconstructed[i]);  // Восстановленная функция
      SError.AddXY(R.Nodes[i], R.Error[i]);        // Ошибка восстановления
    end;

  // === 6. Спектральная производная — по флагу ===
  if FDiffSpectral[FCurrentMode] and Assigned(SSpectDeriv) and (Length(R.GridDeriv) > 0) then
  begin
    for i := 0 to High(R.GridX) do
      SSpectDeriv.AddXY(R.GridX[i], R.GridDeriv[i]);
    for i := 0 to High(R.Nodes) do
      SSpectPoints.AddXY(R.Nodes[i], R.SpectralDerivValues[i]);
  end;

  // === 7. Спектральное интегрирование — по флагу ===
  if FIntSpectral[FCurrentMode] and Assigned(SSpectInt) and Assigned(SSpectErr) then
  begin
    // ✅ ДОПОЛНИТЕЛЬНАЯ ЗАЩИТА: проверяем что данные есть
    if (Length(R.SpectralIntReconstructed) > 0) and (Length(R.GridInt) > 0) and (Length(R.GridX) > 0) then
    begin
      for i := 0 to High(R.GridX) do
        SSpectInt.AddXY(R.GridX[i], R.GridInt[i]);
      for i := 0 to High(R.Nodes) do
        SSpectErr.AddXY(R.Nodes[i], R.SpectralIntError[i]);
    end;
  end;
end;

// Отображение матрицы
procedure TForm1.DisplayMatrix(const D: TMatrix; const Grid: TStringGrid);
var
  i, j, size: Integer;
begin
  size := Length(D);
  if size = 0 then Exit;

  Grid.RowCount := size + 1;
  Grid.ColCount := size + 1;

  Grid.Cells[0, 0] := 'R/C';

  for j := 0 to size - 1 do
    Grid.Cells[j + 1, 0] := IntToStr(j);

  for i := 0 to size - 1 do
    Grid.Cells[0, i + 1] := IntToStr(i);

  for i := 0 to size - 1 do
    for j := 0 to size - 1 do
      Grid.Cells[j + 1, i + 1] := FormatFloat('0.000', D[i][j]);

  Grid.ColWidths[0] := 80;
  for j := 1 to size do
    Grid.ColWidths[j] := 100;
end;

// Отображение спектральной матрицы дифф.
procedure TForm1.DisplaySpectralDiffMatrix(const D: TMatrix; const Grid: TStringGrid);
var
  i, j, size: Integer;
begin
  size := Length(D);
  if size = 0 then Exit;

  Grid.RowCount := size + 1;
  Grid.ColCount := size + 1;

  Grid.Cells[0, 0] := 'R/C';

  for j := 0 to size - 1 do
    Grid.Cells[j + 1, 0] := IntToStr(j);

  for i := 0 to size - 1 do
    Grid.Cells[0, i + 1] := IntToStr(i);

  for i := 0 to size - 1 do
    for j := 0 to size - 1 do
      if Abs(D[i][j]) < 1e-12 then
        Grid.Cells[j + 1, i + 1] := '0'
      else
        Grid.Cells[j + 1, i + 1] := FormatFloat('0.###', D[i][j]);

  Grid.ColWidths[0] := 70;
  for j := 1 to size do
    Grid.ColWidths[j] := 100;
end;

// Отображение спектральной матрицы инт.
procedure TForm1.DisplaySpectralIntMatrix(const P: TMatrix; const Grid: TStringGrid);
var
  i, j, size: Integer;
begin
  size := Length(P);
  if size = 0 then Exit;

  Grid.RowCount := size + 1;
  Grid.ColCount := size + 1;

  Grid.Cells[0, 0] := 'R/C';

  for j := 0 to size - 1 do
    Grid.Cells[j + 1, 0] := IntToStr(j);

  for i := 0 to size - 1 do
    Grid.Cells[0, i + 1] := IntToStr(i);

  for i := 0 to size - 1 do
    for j := 0 to size - 1 do
      if Abs(P[i][j]) < 1e-12 then
        Grid.Cells[j + 1, i + 1] := '0'
      else
        Grid.Cells[j + 1, i + 1] := FormatFloat('0.###', P[i][j]);

  Grid.ColWidths[0] := 70;
  for j := 1 to size do
    Grid.ColWidths[j] := 100;
end;

// Обновление подписи
procedure TForm1.UpdateMatrixCaption;
var N: Integer;
begin
  N := SpinEdit4.Value;
  case RadioGroupMatrixType.ItemIndex of
    0: LabelMatrixInfo.Caption := Format('Lobatto matrix N=%d (%d nodes)', [N, N + 1]);
    1: LabelMatrixInfo.Caption := Format('Gauss matrix N=%d (%d nodes)', [N, N]);
    2: LabelMatrixInfo.Caption := Format('Second Kind matrix N=%d (%d nodes)', [N, N]);
  end;
end;

// === ОБРАБОТЧИКИ СОБЫТИЙ ===

// Вкладка Лобатто
procedure TForm1.Button1Click(Sender: TObject); begin ComputeCurrentTab; end;
procedure TForm1.Button2Click(Sender: TObject); begin PlotCurrentTab; end;
procedure TForm1.CheckBox1Click(Sender: TObject); begin FDiffNodal[nmLobatto] := CheckBox1.Checked; PlotCurrentTab; end;
procedure TForm1.CheckBox2Click(Sender: TObject); begin FDiffSpectral[nmLobatto] := CheckBox2.Checked; ComputeCurrentTab; end;
// Вкладка Лобатто - CheckBox3 (Спектральное интегрирование Ланцош)
procedure TForm1.CheckBox3Click(Sender: TObject); begin FIntSpectral[nmLobatto] := CheckBox3.Checked; ComputeCurrentTab; end;

// Вкладка Лобатто
procedure TForm1.CheckBoxIntLobattoClick(Sender: TObject);
begin
  FIntNodal[nmLobatto] := CheckBoxIntLobatto.Checked;
  SeriesInt1.Active := FIntNodal[nmLobatto];
  SeriesError1.Active := FIntNodal[nmLobatto];
  if FIntNodal[nmLobatto] and (Length(FResults[nmLobatto].DerivNum) > 0) then
  begin
    SolveIntegration(FResults[nmLobatto], FIntSpectral[nmLobatto]);
    PlotCurrentTab;
  end
  else
    PlotCurrentTab;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject); begin end;

// Вкладка Гаусс
procedure TForm1.Button4Click(Sender: TObject); begin ComputeCurrentTab; end;
procedure TForm1.Button5Click(Sender: TObject); begin PlotCurrentTab; end;
procedure TForm1.CheckBox4Click(Sender: TObject); begin FDiffNodal[nmGauss] := CheckBox4.Checked; PlotCurrentTab; end;
procedure TForm1.CheckBox5Click(Sender: TObject); begin FDiffSpectral[nmGauss] := CheckBox5.Checked; ComputeCurrentTab; end;

// Вкладка Гаусс - CheckBox6 (Спектральное интегрирование Ланцош)
procedure TForm1.CheckBox6Click(Sender: TObject); begin FIntSpectral[nmGauss] := CheckBox6.Checked; ComputeCurrentTab; end;

// Вкладка Гаусс
procedure TForm1.CheckBoxIntGaussClick(Sender: TObject);
begin
  FIntNodal[nmGauss] := CheckBoxIntGauss.Checked;
  SeriesInt2.Active := FIntNodal[nmGauss];
  SeriesError2.Active := FIntNodal[nmGauss];
  if FIntNodal[nmGauss] and (Length(FResults[nmGauss].DerivNum) > 0) then
  begin
    SolveIntegration(FResults[nmGauss], FIntSpectral[nmGauss]);
    PlotCurrentTab;
  end
  else
    PlotCurrentTab;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject); begin end;

// Вкладка Второй род
procedure TForm1.Button7Click(Sender: TObject); begin ComputeCurrentTab; end;
procedure TForm1.Button8Click(Sender: TObject); begin PlotCurrentTab; end;
// Вкладка Второй род
procedure TForm1.CheckBoxIntSecondClick(Sender: TObject);
begin
  FIntNodal[nmSecondKind] := CheckBoxIntSecond.Checked;
  SeriesInt3.Active := FIntNodal[nmSecondKind];
  SeriesError3.Active := FIntNodal[nmSecondKind];
  if FIntNodal[nmSecondKind] and (Length(FResults[nmSecondKind].DerivNum) > 0) then
  begin
    SolveIntegration(FResults[nmSecondKind], FIntSpectral[nmSecondKind]);
    PlotCurrentTab;
  end
  else
    PlotCurrentTab;
end;
procedure TForm1.SpinEdit3Change(Sender: TObject); begin end;

// Вкладка Матрицы
procedure TForm1.SpinEdit4Change(Sender: TObject); begin UpdateMatrixCaption; end;
procedure TForm1.Button10Click(Sender: TObject);
var D: TMatrix; N: Integer; method: string;
begin
  N := SpinEdit4.Value;
  case RadioGroupMatrixType.ItemIndex of
    0: begin D := ChebDiffMatrixLobatto(N); method := 'Lobatto'; end;
    1: begin D := ChebDiffMatrixGauss(N); method := 'Gauss'; end;
    2: begin D := ChebDiffMatrixSecondKind(N); method := 'Second Kind'; end;
    else Exit;
  end;
  DisplayMatrix(D, StringGridMatrix);
  LabelMatrixInfo.Caption := Format('%s diff matrix (N=%d)', [method, N]);
end;
procedure TForm1.ButtonShowPseudoInvClick(Sender: TObject);
var P: TMatrix; N: Integer; method: string;
begin
  N := SpinEdit4.Value;
  case RadioGroupMatrixType.ItemIndex of
    0: begin P := ChebIntPseudoInvMatrixLobatto(N); method := 'Lobatto Pseudo-Inv'; end;
    1: begin P := ChebIntPseudoInvMatrixGauss(N); method := 'Gauss Pseudo-Inv'; end;
    2: begin P := ChebIntPseudoInvMatrixSecondKind(N); method := 'Second Kind Pseudo-Inv'; end;
    else Exit;
  end;
  DisplayMatrix(P, StringGridMatrix);
  LabelMatrixInfo.Caption := Format('%s (N=%d)', [method, N]);
end;
procedure TForm1.Button11Click(Sender: TObject);
var D: TMatrix; N: Integer;
begin
  N := SpinEdit4.Value;
  D := ChebDiffMatrixSpectralT(N);
  DisplaySpectralDiffMatrix(D, StringGridMatrix);
  LabelMatrixInfo.Caption := Format('Spectral Dφ (T-basis, N=%d)', [N]);
end;
procedure TForm1.Button12Click(Sender: TObject);
var P: TMatrix; N: Integer;
begin
  N := SpinEdit4.Value;
  P := ChebIntMatrixLanczosT(N);
  DisplaySpectralIntMatrix(P, StringGridMatrix);
  LabelMatrixInfo.Caption := Format('Spectral Pφ (Lanczos, N=%d)', [N]);
end;

function TForm1.GetFourthModeFromUI(out Mode: TNodeMode): Boolean;
begin
  Result := True;
  if RadioFourthGauss.Checked then
    Mode := nmGauss
  else if RadioFourthLobatto.Checked then
    Mode := nmLobatto
  else
    Result := False;
end;

procedure TForm1.ComputeFourthTab;
var
  Mode: TNodeMode;
begin
  if not GetFourthModeFromUI(Mode) then
  begin
    MessageDlg('Please choose grid type: Gauss or Lobatto.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if ListBoxFourthFunc.ItemIndex < 0 then
  begin
    MessageDlg('Please choose a function.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if SpinEditFourthN.Value < 4 then
  begin
    MessageDlg('Order N must be at least 4 for 4th-order spectral reconstruction.', mtWarning, [mbOK], 0);
    Exit;
  end;

  FFourthResult := SolveFourthSpectral(Mode, SpinEditFourthN.Value, ListBoxFourthFunc.ItemIndex);
  SolveFourthIntegration(FFourthResult);
  PlotFourthTab;
end;

procedure TForm1.PlotFourthTab;
var
  i: Integer;
  diff, maxDiff: Double;
begin
  // Clear
  FastLineSeries1.Clear;   // f(x)
  LineSeries1.Clear;       // analytic 4th derivative
  LineSeries5.Clear;       // spectral 4th derivative
  PointSeries1.Clear;      // nodal values
  LineSeries3.Clear;       // p_rec(x)
  LineSeries4.Clear;       // |f(x)-p_rec(x)|
  PointSeries2.Clear;      // 4th derivative at nodes
  Series13.Clear;          // p(x)

  // Visibility
  LineSeries1.Active := CheckBoxFourthShowDeriv4.Checked;
  LineSeries5.Active := CheckBoxFourthShowDeriv4.Checked;
  PointSeries2.Active := CheckBoxFourthShowDeriv4.Checked;

  LineSeries3.Active := CheckBoxFourthShowRecon.Checked;
  LineSeries4.Active := CheckBoxFourthShowError.Checked;
  Series13.Active := CheckBoxFourthShowInterp.Checked;

  // Always show original function f(x)
  for i := 0 to High(FFourthResult.GridX) do
    FastLineSeries1.AddXY(
      FFourthResult.GridX[i],
      GetSelectedFunction(FFourthResult.GridX[i], FFourthResult.FuncIndex)
    );

  // Always show nodal values
  for i := 0 to High(FFourthResult.Nodes) do
    PointSeries1.AddXY(
      FFourthResult.Nodes[i],
      FFourthResult.Values[i]
    );

  // 4th derivative
  if CheckBoxFourthShowDeriv4.Checked then
  begin
    for i := 0 to High(FFourthResult.GridX) do
      LineSeries1.AddXY(
        FFourthResult.GridX[i],
        FFourthResult.Deriv4AnalytGrid[i]
      );

    for i := 0 to High(FFourthResult.GridX) do
      LineSeries5.AddXY(
        FFourthResult.GridX[i],
        FFourthResult.Deriv4Grid[i]
      );

    for i := 0 to High(FFourthResult.Nodes) do
      PointSeries2.AddXY(
        FFourthResult.Nodes[i],
        FFourthResult.Deriv4Nodes[i]
      );
  end;

  // Reconstructed p_rec(x)
  if CheckBoxFourthShowRecon.Checked then
    for i := 0 to High(FFourthResult.GridX) do
      LineSeries3.AddXY(
        FFourthResult.GridX[i],
        FFourthResult.ReconGrid[i]
      );

  // Error |f(x) - p_rec(x)|
  if CheckBoxFourthShowError.Checked then
    for i := 0 to High(FFourthResult.GridX) do
      LineSeries4.AddXY(
        FFourthResult.GridX[i],
        FFourthResult.ErrorGrid[i]
      );

  // Show p(x) only when requested
  if CheckBoxFourthShowInterp.Checked then
    for i := 0 to High(FFourthResult.GridX) do
      Series13.AddXY(
        FFourthResult.GridX[i],
        FFourthResult.InterpGrid[i]
      );

  // ALWAYS compute and show max |p(x)-p_rec(x)|
  maxDiff := 0.0;
  for i := 0 to High(FFourthResult.GridX) do
  begin
    diff := FFourthResult.InterpGrid[i] - FFourthResult.ReconGrid[i];
    if Abs(diff) > maxDiff then
      maxDiff := Abs(diff);
  end;

  status.Caption :=
    Format('max |p(x)-p_rec(x)| = %.6e', [maxDiff]);
  status.Update;
end;

procedure TForm1.ButtonFourthComputeClick(Sender: TObject);
begin
  ComputeFourthTab;
end;

procedure TForm1.CheckBoxFourthShowDeriv4Click(Sender: TObject);
begin
  PlotFourthTab;
end;

procedure TForm1.CheckBoxFourthShowInterpClick(Sender: TObject);
begin
  PlotFourthTab;
end;

procedure TForm1.CheckBoxFourthShowReconClick(Sender: TObject);
begin
  PlotFourthTab;
end;

procedure TForm1.CheckBoxFourthShowErrorClick(Sender: TObject);
begin
  PlotFourthTab;
end;
end.
