unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, Vcl.StdCtrls, VCLTee.TeEngine, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Grids, Vcl.Samples.Spin,
  VCLTee.Series, uChebMath, uChartGridUtils, uCsvExport, Math;

type

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    points1: TTabSheet;
    points2: TTabSheet;
    SecondGauss: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    PanelMain1: TPanel;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    PanelLeft1: TPanel;
    PanelRight1: TPanel;
    PanelCenter1: TPanel;
    Splitter6: TSplitter;
    PanelTop1: TPanel;
    PanelBottom1: TPanel;
    StringGridPoint1: TStringGrid;
    StringGridMatrix1: TStringGrid;
    Label2: TLabel;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TPointSeries;
    PanelMain2: TPanel;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    PanelLeft2: TPanel;
    PanelRight2: TPanel;
    PanelCenter2: TPanel;
    Splitter9: TSplitter;
    PanelTop2: TPanel;
    PanelBottom2: TPanel;
    StringGridPoint2: TStringGrid;
    Label6: TLabel;
    StringGridMatrix2: TStringGrid;
    Label8: TLabel;
    Chart2: TChart;
    Series4: TFastLineSeries;
    Series5: TFastLineSeries;
    Series6: TPointSeries;
    PanelMain3: TPanel;
    Splitter10: TSplitter;
    Splitter11: TSplitter;
    PanelLeft3: TPanel;
    PanelRight3: TPanel;
    PanelCenter3: TPanel;
    Splitter12: TSplitter;
    PanelTop3: TPanel;
    PanelBottom3: TPanel;
    StringGridU2: TStringGrid;
    StringGridMatrixU2: TStringGrid;
    Chart3: TChart;
    Series7: TFastLineSeries;
    Series8: TFastLineSeries;
    Series9: TPointSeries;
    ScrollBox1: TScrollBox;
    Graph: TButton;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    Matrix: TButton;
    SpinEdit1: TSpinEdit;
    trans1: TButton;
    ScrollBox2: TScrollBox;
    Graph2: TButton;
    Label5: TLabel;
    Label9: TLabel;
    ListBox2: TListBox;
    Matrix2: TButton;
    SpinEdit2: TSpinEdit;
    Trans2: TButton;
    ScrollBox3: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    ListBox3: TListBox;
    Matrix3: TButton;
    Plot: TButton;
    SpinEdit3: TSpinEdit;
    CPanelMain1: TPanel;
    Splitter16: TSplitter;
    CPanelBottom1: TPanel;
    CPanelCenter1: TPanel;
    Chart4: TChart;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TPointSeries;
    Series13: TLineSeries;
    Series14: TPointSeries;
    Series15: TFastLineSeries;
    Series16: TFastLineSeries;
    Erase: TButton;
    lblErrG: TLabel;
    lblErrL: TLabel;
    lblWinner: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    BtnExportCSV: TButton;
    SecondLobatto: TTabSheet;
    PanelMain4: TPanel;
    Splitter13: TSplitter;
    Splitter14: TSplitter;
    PanelLeft4: TPanel;
    Label17: TLabel;
    StringGrid1: TStringGrid;
    PanelRight4: TPanel;
    ScrollBox4: TScrollBox;
    Label18: TLabel;
    Label19: TLabel;
    ListBox4: TListBox;
    Matrix4: TButton;
    Plot2: TButton;
    SpinEdit4: TSpinEdit;
    PanelCenter4: TPanel;
    Splitter15: TSplitter;
    PanelTop4: TPanel;
    Label20: TLabel;
    StringGrid2: TStringGrid;
    PanelBottom4: TPanel;
    Chart5: TChart;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    PointSeries1: TPointSeries;
    stran2: TButton;
    stran1: TButton;
    SecondComparison: TTabSheet;
    CPanelMain2: TPanel;
    Splitter17: TSplitter;
    CPanelBottom2: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Erase2: TButton;
    BtnExportCSV2: TButton;
    CPanelCenter2: TPanel;
    Chart6: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    PointSeries2: TPointSeries;
    LineSeries3: TLineSeries;
    PointSeries3: TPointSeries;
    FastLineSeries3: TFastLineSeries;
    FastLineSeries4: TFastLineSeries;
    TabSheet1: TTabSheet;
    CPanelMain3: TPanel;
    Splitter18: TSplitter;
    CPanelBottom3: TPanel;
    FirstGaussmax: TLabel;
    FirstLobattomax: TLabel;
    bestmethod: TLabel;
    Erase3: TButton;
    BtnExportCSV3: TButton;
    CPanelCenter3: TPanel;
    Chart7: TChart;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    PointSeries4: TPointSeries;
    LineSeries6: TLineSeries;
    PointSeries5: TPointSeries;
    FastLineSeries5: TFastLineSeries;
    FastLineSeries6: TFastLineSeries;
    SecondLobattolmax: TLabel;
    SecondGaussmax: TLabel;
    tocomp1: TButton;
    tocomp2: TButton;
    Series17: TLineSeries;
    Series18: TPointSeries;
    Series19: TLineSeries;
    Series20: TPointSeries;
    Series21: TFastLineSeries;
    Series22: TFastLineSeries;
    TabSheet3: TTabSheet;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    ExpCVS2: TButton;
    ExpCVS1: TButton;
    ExpCVS3: TButton;
    ExpCVS4: TButton;

    procedure MatrixClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Matrix2Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure GraphClick(Sender: TObject);
    procedure Graph2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Matrix3Click(Sender: TObject);
    procedure PlotClick(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure trans1Click(Sender: TObject);
    procedure Trans2Click(Sender: TObject);
    procedure EraseClick(Sender: TObject);
    procedure Chart4GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: string);
    procedure FormResize(Sender: TObject);
    procedure BtnExportCSVClick(Sender: TObject);



    procedure Matrix4Click(Sender: TObject);
    procedure Plot2Click(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);

    procedure stran1Click(Sender: TObject);
    procedure stran2Click(Sender: TObject);
    procedure Erase2Click(Sender: TObject);
    procedure BtnExportCSV2Click(Sender: TObject);
    procedure tocomp1Click(Sender: TObject);
    procedure tocomp2Click(Sender: TObject);
    procedure Erase3Click(Sender: TObject);
    procedure BtnExportCSV3Click(Sender: TObject);
    procedure Chart7GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: string);

    procedure ExpCVS2Click(Sender: TObject);
    procedure ExpCVS1Click(Sender: TObject);
    procedure ExpCVS3Click(Sender: TObject);
    procedure ExpCVS4Click(Sender: TObject);

  private



    FStarted: Boolean;

    // n values
    FValueN1: Integer;
    FValueN2: Integer;
    FValueN3: Integer;
    FValueN4: Integer;

    // coefficients
    FLobattoCoeffs: TDynamicDoubleArray;
    FGaussCoeffs: TDynamicDoubleArray;
    FSecondKindCoeffs: TDynamicDoubleArray;

    // selected function indices
    FSelectedFunc1: Integer;
    FSelectedFunc2: Integer;
    FSelectedFunc3: Integer;
    FSelectedFunc4: Integer;

    // Comparison-tab state
    FCompareFuncId: Integer;
    FCompareFuncSet: Boolean;

    // layout ratios
    FLobLeftRatio,    FLobRightRatio,    FLobTopRatio:    Double;
    FGaussLeftRatio,  FGaussRightRatio,  FGaussTopRatio:  Double;
    FSecondLeftRatio, FSecondRightRatio, FSecondTopRatio: Double;



    // second kind – Lobatto tab
    FSecondKindLobattoCoeffs: TDynamicDoubleArray;

    // ======== second-kind comparison state ========
    FCompare2FuncId: Integer;
    FCompare2FuncSet: Boolean;


    // ======== BOTH-KINDS comparison state (Chart7) ========
    FCompareBothFuncId: Integer;
    FCompareBothFuncSet: Boolean;
    FBothHasFirstKind: Boolean;
    FBothHasSecondKind: Boolean;
    FBothFuncId: Integer;
    FBothFuncSet: Boolean;




    // ======== extracted UI helpers ========
    function EnsureFunctionSelected(const Lb: TListBox; const TabName: string): Boolean;
    function GetFuncIndexSafe(const Lb: TListBox; DefaultIdx: Integer = 0): Integer;

    procedure PrepareSeriesForPlot(const SFunc, SInterp, SNodes: TChartSeries;
      const FuncTitle, InterpTitle, NodesTitle: string);

    procedure PlotKind1(const n: Integer; const FuncIndex: Integer;
      const Coefs: TDynamicDoubleArray;
      const SFunc, SInterp, SNodes: TChartSeries;
      const FuncTitlePrefix, InterpTitle, NodesTitle: string;
      const NodeMode: TNodeMode);


    procedure PlotKind2(const n: Integer; const FuncIndex: Integer;
      const Coefs: TDynamicDoubleArray;
      const SFunc, SInterp, SNodes: TChartSeries;
      const FuncTitlePrefix, InterpTitle, NodesTitle: string);

    procedure DisplayMatrixInGrid(const G: TMatrix; const Grid: TStringGrid);

    procedure ClearMatrixGrid(const Grid: TStringGrid);
    procedure SendRawAndWeightedToPreview(const A: TMatrix; const Aw: TMatrix; const HasWeights: Boolean);

    procedure FillNodesGrid_Lobatto(const n: Integer; const Grid: TStringGrid);
    procedure FillNodesGrid_Gauss(const n: Integer; const Grid: TStringGrid);
    procedure FillNodesGrid_SecondKind(const n: Integer; const Grid: TStringGrid);

    procedure RecalcLobattoCoeffs(const n, FuncIndex: Integer);
    procedure RecalcGaussCoeffs(const n, FuncIndex: Integer);
    procedure RecalcSecondKindCoeffs(const n, FuncIndex: Integer);

    // comparison
    procedure SetChart4Titles;
    procedure UpdateComparisonView;
    procedure DrawErrorCurvesOnChart4;

    procedure FillNodesGrid_SecondKindLobatto(const n: Integer; const Grid: TStringGrid);

    // ======== second-kind comparison state ========
    procedure SetChart6Titles;
    procedure UpdateSecondComparisonView;
    procedure DrawSecondErrorCurvesOnChart6;


    procedure SaveMethodMeta(const FileName, MethodName: string;
      const NodeCount, FuncIndex: Integer);

    procedure ExportSingleMethodKind1(const Prefix, MethodName: string;
      const N, FuncIndex: Integer;
      const Coefs: TDynamicDoubleArray;
      const SFunc, SInterp, SNodes: TChartSeries);

    procedure ExportSingleMethodKind2(const Prefix, MethodName: string;
      const N, FuncIndex: Integer;
      const Coefs: TDynamicDoubleArray;
      const SFunc, SInterp, SNodes: TChartSeries);



    // ======== BOTH-KINDS comparison state (Chart7) ========
    function SeriesMaxAbsY(const S: TChartSeries): Double;
    procedure SetChart7Titles;
    procedure UpdateBothComparisonView;
    procedure RecalcBothLabelsAndAxis;
    function Chart7HasAnyData: Boolean;


    function Chart4HasBothMethods: Boolean;
    function Chart6HasBothMethods: Boolean;
    function Chart7HasBothKinds: Boolean;

    function Chart4HasLobatto: Boolean;
    function Chart4HasGauss: Boolean;
    function Chart6HasLobatto: Boolean;
    function Chart6HasGauss: Boolean;

  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.Chart4HasBothMethods: Boolean;
begin
  Result := (not SeriesIsEmpty(Series10)) and (not SeriesIsEmpty(Series11));
end;

function TForm1.Chart6HasBothMethods: Boolean;
begin
  Result := (not SeriesIsEmpty(LineSeries1)) and (not SeriesIsEmpty(LineSeries2));
end;

function TForm1.Chart7HasBothKinds: Boolean;
begin
  Result := FBothHasFirstKind and FBothHasSecondKind;
end;

function TForm1.Chart4HasLobatto: Boolean;
begin
  Result := not SeriesIsEmpty(Series10); // Lobatto interpolant series
end;

function TForm1.Chart4HasGauss: Boolean;
begin
  Result := not SeriesIsEmpty(Series11); // Gauss interpolant series
end;

function TForm1.Chart6HasLobatto: Boolean;
begin
  Result := not SeriesIsEmpty(LineSeries1); // Lobatto u_L(x)
end;

function TForm1.Chart6HasGauss: Boolean;
begin
  Result := not SeriesIsEmpty(LineSeries2); // Gauss u_G(x)
end;

procedure TForm1.FillNodesGrid_SecondKindLobatto(const n: Integer; const Grid: TStringGrid);
var
  k: Integer;
  theta: Double;
begin
  Grid.ColCount := 2;
  Grid.RowCount := (n + 1) + 1;
  Grid.Cells[0, 0] := 'k';
  Grid.Cells[1, 0] := 'Points';

  for k := 0 to n do
  begin
    theta := k * Pi / n;
    Grid.Cells[0, k + 1] := IntToStr(k);
    Grid.Cells[1, k + 1] := FloatToStrF(Cos(theta), ffFixed, 15, 6);
  end;
end;

{ ===================== TForm1: extracted UI helpers ===================== }

function TForm1.EnsureFunctionSelected(const Lb: TListBox; const TabName: string): Boolean;
begin
  Result := (Lb <> nil) and (Lb.ItemIndex >= 0);
  if not Result then
    ShowMessage('Please select a function before plotting.' + sLineBreak + 'Tab: ' + TabName);
end;

function TForm1.GetFuncIndexSafe(const Lb: TListBox; DefaultIdx: Integer): Integer;
begin
  if (Lb <> nil) and (Lb.ItemIndex >= 0) then
    Result := Lb.ItemIndex
  else
    Result := DefaultIdx;
end;

procedure TForm1.PrepareSeriesForPlot(const SFunc, SInterp, SNodes: TChartSeries;
  const FuncTitle, InterpTitle, NodesTitle: string);
begin
  if SFunc <> nil then
  begin
    SFunc.Clear;
    SFunc.Title := FuncTitle;
  end;

  if SInterp <> nil then
  begin
    SInterp.Clear;
    SInterp.Title := InterpTitle;
  end;

  if SNodes <> nil then
  begin
    SNodes.Clear;
    SNodes.Title := NodesTitle;
    if SNodes is TPointSeries then
    begin
      TPointSeries(SNodes).Pointer.Visible := True;
      TPointSeries(SNodes).Marks.Visible := False;
    end;
  end;
end;

procedure TForm1.PlotKind1(const n: Integer; const FuncIndex: Integer;
  const Coefs: TDynamicDoubleArray;
  const SFunc, SInterp, SNodes: TChartSeries;
  const FuncTitlePrefix, InterpTitle, NodesTitle: string;
  const NodeMode: TNodeMode);
var
  k, i, M: Integer;
  x: Double;
  funcTitle: string;
begin
  funcTitle := FuncTitlePrefix + FuncNameByIndex(FuncIndex);
  PrepareSeriesForPlot(SFunc, SInterp, SNodes, funcTitle, InterpTitle, NodesTitle);

  // nodes
  case NodeMode of
    nmLobatto:
      for k := 0 to n do
      begin
        x := Cos(k * Pi / n);
        SNodes.AddXY(x, GetSelectedFunction(x, FuncIndex));
      end;

    nmGauss:
      for k := 0 to n-1 do
      begin
        x := Cos((k + 0.5) * Pi / n);
        SNodes.AddXY(x, GetSelectedFunction(x, FuncIndex));
      end;
  end;

  // dense curves
  M := 400;
  for i := 0 to M do
  begin
    x := -1.0 + 2.0 * i / M;
    SFunc.AddXY(x, GetSelectedFunction(x, FuncIndex));
    SInterp.AddXY(x, EvalInterpolant(x, Coefs));
  end;
end;

procedure TForm1.PlotKind2(const n: Integer; const FuncIndex: Integer;
  const Coefs: TDynamicDoubleArray;
  const SFunc, SInterp, SNodes: TChartSeries;
  const FuncTitlePrefix, InterpTitle, NodesTitle: string);
var
  k, i, M: Integer;
  x, theta: Double;
  funcTitle: string;
begin
  funcTitle := FuncTitlePrefix + FuncNameByIndex(FuncIndex);
  PrepareSeriesForPlot(SFunc, SInterp, SNodes, funcTitle, InterpTitle, NodesTitle);

  // second kind nodes: k=1..n
  for k := 1 to n do
  begin
    theta := k * Pi / (n + 1);
    x := Cos(theta);
    SNodes.AddXY(x, GetSelectedFunction(x, FuncIndex));
  end;

  // dense curves
  M := 400;
  for i := 0 to M do
  begin
    x := -1.0 + 2.0 * i / M;
    SFunc.AddXY(x, GetSelectedFunction(x, FuncIndex));
    SInterp.AddXY(x, EvalInterpolantSecondKind(x, Coefs));
  end;
end;

procedure TForm1.DisplayMatrixInGrid(const G: TMatrix; const Grid: TStringGrid);
var
  r, c, RCount, CCount: Integer;
begin
  if Grid = nil then Exit;

  RCount := Length(G);
  if RCount = 0 then
  begin
    ClearMatrixGrid(Grid);
    Exit;
  end;

  CCount := Length(G[0]);
  if CCount = 0 then
  begin
    ClearMatrixGrid(Grid);
    Exit;
  end;

  Grid.RowCount := RCount + 1;
  Grid.ColCount := CCount + 1;
  Grid.FixedRows := 1;
  Grid.FixedCols := 1;

  Grid.Cells[0,0] := 'R/C';

  for c := 0 to CCount - 1 do
    Grid.Cells[c + 1, 0] := IntToStr(c);

  for r := 0 to RCount - 1 do
    Grid.Cells[0, r + 1] := IntToStr(r);

  for r := 0 to RCount - 1 do
    for c := 0 to CCount - 1 do
      Grid.Cells[c + 1, r + 1] := FloatToStrF(G[r][c], ffFixed, 15, 6);
end;

procedure TForm1.SaveMethodMeta(const FileName, MethodName: string;
  const NodeCount, FuncIndex: Integer);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Add('method=' + MethodName);
    sl.Add('nodes_count=' + IntToStr(NodeCount));
    sl.Add('function_id=' + IntToStr(FuncIndex));
    sl.Add('function_name=' + FuncNameByIndex(FuncIndex));
    sl.SaveToFile(FileName, TEncoding.UTF8);
  finally
    sl.Free;
  end;
end;

procedure TForm1.ExportSingleMethodKind1(const Prefix, MethodName: string;
  const N, FuncIndex: Integer;
  const Coefs: TDynamicDoubleArray;
  const SFunc, SInterp, SNodes: TChartSeries);
var
  ResidualSeries: TLineSeries;
  i, M: Integer;
  x, fval, uval: Double;
begin
  SaveSeriesToCSV(Prefix + 'f.csv', SFunc);
  SaveSeriesToCSV(Prefix + 'u.csv', SInterp);
  SaveSeriesToCSV(Prefix + 'nodes.csv', SNodes);

  ResidualSeries := TLineSeries.Create(nil);
  try
    M := 400;
    for i := 0 to M do
    begin
      x := -1.0 + 2.0 * i / M;
      fval := GetSelectedFunction(x, FuncIndex);
      uval := EvalInterpolant(x, Coefs);
      ResidualSeries.AddXY(x, fval - uval);
    end;

    SaveSeriesToCSV(Prefix + 'r.csv', ResidualSeries);
  finally
    ResidualSeries.Free;
  end;

  SaveMethodMeta(Prefix + 'meta.txt', MethodName, N, FuncIndex);
end;

procedure TForm1.ExportSingleMethodKind2(const Prefix, MethodName: string;
  const N, FuncIndex: Integer;
  const Coefs: TDynamicDoubleArray;
  const SFunc, SInterp, SNodes: TChartSeries);
var
  ResidualSeries: TLineSeries;
  i, M: Integer;
  x, fval, uval: Double;
begin
  SaveSeriesToCSV(Prefix + 'f.csv', SFunc);
  SaveSeriesToCSV(Prefix + 'u.csv', SInterp);
  SaveSeriesToCSV(Prefix + 'nodes.csv', SNodes);

  ResidualSeries := TLineSeries.Create(nil);
  try
    M := 400;
    for i := 0 to M do
    begin
      x := -1.0 + 2.0 * i / M;
      fval := GetSelectedFunction(x, FuncIndex);
      uval := EvalInterpolantSecondKind(x, Coefs);
      ResidualSeries.AddXY(x, fval - uval);
    end;

    SaveSeriesToCSV(Prefix + 'r.csv', ResidualSeries);
  finally
    ResidualSeries.Free;
  end;

  SaveMethodMeta(Prefix + 'meta.txt', MethodName, N, FuncIndex);
end;

procedure TForm1.ClearMatrixGrid(const Grid: TStringGrid);
begin
  if Grid = nil then Exit;

  Grid.RowCount := 2;
  Grid.ColCount := 2;
  Grid.FixedRows := 1;
  Grid.FixedCols := 1;

  Grid.Cells[0,0] := '';
  Grid.Cells[1,0] := '';
  Grid.Cells[0,1] := '';
  Grid.Cells[1,1] := '';
end;

procedure TForm1.SendRawAndWeightedToPreview(const A: TMatrix; const Aw: TMatrix; const HasWeights: Boolean);
begin
  // StringGrid3 -> raw A
  if Length(A) > 0 then
    DisplayMatrixInGrid(A, StringGrid3)
  else
    ClearMatrixGrid(StringGrid3);

  // StringGrid4 -> weighted A (only when applicable)
  if HasWeights and (Length(Aw) > 0) then
    DisplayMatrixInGrid(Aw, StringGrid4)
  else
    ClearMatrixGrid(StringGrid4);
end;

procedure TForm1.FillNodesGrid_Lobatto(const n: Integer; const Grid: TStringGrid);
var
  k: Integer;
  theta: Double;
begin
  Grid.ColCount := 2;
  Grid.RowCount := (n + 1) + 1;
  Grid.Cells[0, 0] := 'k';
  Grid.Cells[1, 0] := 'Points';

  for k := 0 to n do
  begin
    theta := k * Pi / n;
    Grid.Cells[0, k + 1] := IntToStr(k);
    Grid.Cells[1, k + 1] := FloatToStrF(Cos(theta), ffFixed, 15, 6);
  end;
end;

procedure TForm1.FillNodesGrid_Gauss(const n: Integer; const Grid: TStringGrid);
var
  k: Integer;
  theta: Double;
begin
  Grid.ColCount := 2;
  Grid.RowCount := n + 1;
  Grid.Cells[0, 0] := 'k';
  Grid.Cells[1, 0] := 'Points';

  for k := 0 to n - 1 do
  begin
    theta := (k + 0.5) * Pi / n;
    Grid.Cells[0, k + 1] := IntToStr(k);
    Grid.Cells[1, k + 1] := FloatToStrF(Cos(theta), ffFixed, 15, 6);
  end;
end;

procedure TForm1.FillNodesGrid_SecondKind(const n: Integer; const Grid: TStringGrid);
var
  k: Integer;
  theta: Double;
begin
  Grid.ColCount := 2;
  Grid.RowCount := n + 1;
  Grid.Cells[0, 0] := 'k';
  Grid.Cells[1, 0] := 'Points';

  for k := 1 to n do
  begin
    theta := k * Pi / (n + 1);
    Grid.Cells[0, k] := IntToStr(k);
    Grid.Cells[1, k] := FloatToStrF(Cos(theta), ffFixed, 15, 6);
  end;
end;

procedure TForm1.RecalcLobattoCoeffs(const n, FuncIndex: Integer);
var
  A, AT, G, EmptyW: TMatrix;
  ftilde, Tt_f, TTdiag, ccoef: TDynamicDoubleArray;
  i: Integer;
begin
  SetLength(ftilde, n + 1);
  SetLength(Tt_f, n + 1);
  SetLength(TTdiag, n + 1);
  SetLength(ccoef, n + 1);

  CalculateLobattoSystemWithFunction(n, FuncIndex, A, AT, G, ftilde, Tt_f, TTdiag, ccoef);

  SetLength(FLobattoCoeffs, Length(ccoef));
  for i := 0 to High(ccoef) do
    FLobattoCoeffs[i] := ccoef[i];

  DisplayMatrixInGrid(G, StringGridMatrix1);
  SendRawAndWeightedToPreview(A, EmptyW, False);

end;

procedure TForm1.RecalcGaussCoeffs(const n, FuncIndex: Integer);
var
  A, AT, G, EmptyW: TMatrix;
  fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray;
  i: Integer;
begin
  SetLength(fvec, n);
  SetLength(Tt_f, n);
  SetLength(TTdiag, n);
  SetLength(ccoef, n);

  CalculateGaussSystemWithFunction(n, FuncIndex, A, AT, G, fvec, Tt_f, TTdiag, ccoef);

  SetLength(FGaussCoeffs, Length(ccoef));
  for i := 0 to High(ccoef) do
    FGaussCoeffs[i] := ccoef[i];

  DisplayMatrixInGrid(G, StringGridMatrix2);
  SendRawAndWeightedToPreview(A, EmptyW, False);
end;

procedure TForm1.RecalcSecondKindCoeffs(const n, FuncIndex: Integer);
var
  k, i: Integer;
  theta, val, x: Double;
  A, AT, G, Aw: TMatrix;
  fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray;
begin
  // Build node grid (UI part)
  FillNodesGrid_SecondKind(n, StringGridU2);

  // Matrix U_j(x_k)
  SetLength(A, n, n);
  SetLength(AT, n, n);

  for k := 0 to n - 1 do
  begin
    theta := (k + 1) * Pi / (n + 1);
    for i := 0 to n - 1 do
    begin
      if Sin(theta) <> 0 then
        val := Sin((i + 1) * theta) / Sin(theta)
      else
        val := (i + 1);

      A[k][i] := val;
      AT[i][k] := val;
    end;
  end;

  // Weighted orthogonality diagnostic
  SetLength(Aw, n, n);
  for k := 0 to n - 1 do
  begin
    theta := (k + 1) * Pi / (n + 1);
    val := Sin(theta) * Sin(theta);
    for i := 0 to n - 1 do
      Aw[k][i] := Sqrt(val) * A[k][i];
  end;

  G := MultiplyMatrices(TransposeMatrix(Aw), Aw);
  DisplayMatrixInGrid(G, StringGridMatrixU2);
  SendRawAndWeightedToPreview(A, Aw, True);

  // Coeffs
  SetLength(fvec, n);
  SetLength(Tt_f, n);
  SetLength(TTdiag, n);
  SetLength(ccoef, n);

  for k := 0 to n - 1 do
  begin
    theta := (k + 1) * Pi / (n + 1);
    x := Cos(theta);
    fvec[k] := GetSelectedFunction(x, FuncIndex);
  end;

  for i := 0 to n - 1 do
  begin
    Tt_f[i] := 0.0;
    for k := 0 to n - 1 do
    begin
      theta := (k + 1) * Pi / (n + 1);
      Tt_f[i] := Tt_f[i] + AT[i][k] * fvec[k] * Sin(theta) * Sin(theta);
    end;
    ccoef[i] := Tt_f[i] * 2.0 / (n + 1);
  end;

  SetLength(FSecondKindCoeffs, Length(ccoef));
  for i := 0 to High(ccoef) do
    FSecondKindCoeffs[i] := ccoef[i];
end;

{ ===================== Comparison chart methods ===================== }

procedure TForm1.SetChart4Titles;
begin
  Series10.Title := 'Lobatto interpolant u_L(x)';
  Series11.Title := 'Gauss interpolant u_G(x)';

  if FCompareFuncSet then
    Series13.Title := 'Original function f(x) = ' + FuncNameByIndex(FCompareFuncId)
  else
    Series13.Title := 'Original function f(x)';

  Series12.Title := 'Lobatto nodes';
  Series14.Title := 'Gauss nodes';

  if Series12 is TPointSeries then
  begin
    TPointSeries(Series12).Pointer.Visible := True;
    TPointSeries(Series12).Marks.Visible := False;
  end;

  if Series14 is TPointSeries then
  begin
    TPointSeries(Series14).Pointer.Visible := True;
    TPointSeries(Series14).Marks.Visible := False;
  end;

  Series15.Title := 'Lobatto error r_L(x)';
  Series16.Title := 'Gauss error r_G(x)';
end;

procedure TForm1.DrawErrorCurvesOnChart4;
var
  i, M: Integer;
  x, fval, uL, uG, rL, rG: Double;
  eLmax, eGmax, eMax: Double;
begin
  if not FCompareFuncSet then
  begin
    Series15.Clear;
    Series16.Clear;
    lblErrL.Caption := '';
    lblErrG.Caption := '';
    lblWinner.Caption := '';
    Exit;
  end;

  Series15.Clear;
  Series16.Clear;

  eLmax := 0.0;
  eGmax := 0.0;
  M := 400;

  for i := 0 to M do
  begin
    x := -1.0 + 2.0 * i / M;
    fval := GetSelectedFunction(x, FCompareFuncId);

    // Only compute Lobatto residual if Lobatto was transferred to Chart4
    if Chart4HasLobatto and (Length(FLobattoCoeffs) > 0) then
      uL := EvalInterpolant(x, FLobattoCoeffs)
    else
      uL := NaN;

    // Only compute Gauss residual if Gauss was transferred to Chart4
    if Chart4HasGauss and (Length(FGaussCoeffs) > 0) then
      uG := EvalInterpolant(x, FGaussCoeffs)
    else
      uG := NaN;

    if not IsNan(uL) then
    begin
      rL := fval - uL;
      Series15.AddXY(x, rL);
      if Abs(rL) > eLmax then
        eLmax := Abs(rL);
    end;

    if not IsNan(uG) then
    begin
      rG := fval - uG;
      Series16.AddXY(x, rG);
      if Abs(rG) > eGmax then
        eGmax := Abs(rG);
    end;
  end;

  // show max errors even if only one method exists
  if Chart4HasLobatto and (Length(FLobattoCoeffs) > 0) then
    lblErrL.Caption := 'Lobatto max |r_L(x)| = ' + FormatSci(eLmax)
  else
    lblErrL.Caption := '';

  if Chart4HasGauss and (Length(FGaussCoeffs) > 0) then
    lblErrG.Caption := 'Gauss max |r_G(x)| = ' + FormatSci(eGmax)
  else
    lblErrG.Caption := '';

  // winner text only if both exist
  if Chart4HasLobatto and Chart4HasGauss and (eLmax > 0) and (eGmax > 0) then
  begin
    if eLmax < eGmax then
      lblWinner.Caption := 'More accurate method: Lobatto'
    else if eGmax < eLmax then
      lblWinner.Caption := 'More accurate method: Gauss'
    else
      lblWinner.Caption := 'Both methods have similar accuracy';
  end
  else
    lblWinner.Caption := '';

  eMax := 0.0;
  if Chart4HasLobatto then eMax := Max(eMax, eLmax);
  if Chart4HasGauss then   eMax := Max(eMax, eGmax);

  if eMax <= 0 then
    eMax := 1.0E-12;

  with Chart4.RightAxis do
  begin
    Automatic := False;
    Minimum := -eMax;
    Maximum := eMax;
    Increment := eMax / 2.0;
  end;
end;

procedure TForm1.UpdateComparisonView;
begin
  Series10.Active := Chart4HasLobatto;
  Series12.Active := not SeriesIsEmpty(Series12);

  Series11.Active := Chart4HasGauss;
  Series14.Active := not SeriesIsEmpty(Series14);

  Series13.Active := not SeriesIsEmpty(Series13);

  // Residuals only if the method exists
  Series15.Active := Chart4HasLobatto;
  Series16.Active := Chart4HasGauss;

  DrawErrorCurvesOnChart4;
end;

procedure TForm1.Chart4GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
  ValueIndex: Integer; var LabelText: string);
var
  v, mant: Double;
  expo: Integer;
begin
  if Sender <> Chart4.RightAxis then Exit;
  if LabelText = '' then Exit;
  if not TryStrToFloat(LabelText, v) then Exit;

  if Abs(v) < 1.0E-20 then
  begin
    LabelText := '0';
    Exit;
  end;

  expo := Floor(Log10(Abs(v)));
  mant := v / Power(10, expo);
  LabelText := FormatFloat('0.00', mant) + '×10^' + IntToStr(expo);
end;

{ ===================== Second-kind Comparison chart methods ===================== }

procedure TForm1.SetChart6Titles;
begin
  LineSeries1.Title := 'Second-kind Lobatto u_L(x)';
  LineSeries2.Title := 'Second-kind Gauss u_G(x)';

  if FCompare2FuncSet then
    LineSeries3.Title := 'Original function f(x) = ' + FuncNameByIndex(FCompare2FuncId)
  else
    LineSeries3.Title := 'Original function f(x)';

  PointSeries2.Title := 'Second-kind Lobatto nodes';
  PointSeries3.Title := 'Second-kind Gauss nodes';

  if PointSeries2 is TPointSeries then
  begin
    TPointSeries(PointSeries2).Pointer.Visible := True;
    TPointSeries(PointSeries2).Marks.Visible := False;
  end;

  if PointSeries3 is TPointSeries then
  begin
    TPointSeries(PointSeries3).Pointer.Visible := True;
    TPointSeries(PointSeries3).Marks.Visible := False;
  end;

  FastLineSeries3.Title := 'Lobatto residual r_L(x)';
  FastLineSeries4.Title := 'Gauss residual r_G(x)';
end;

procedure TForm1.DrawSecondErrorCurvesOnChart6;
var
  i, M: Integer;
  x, fval, uL, uG, rL, rG: Double;
  eLmax, eGmax, eMax: Double;
  hasL, hasG: Boolean;
begin
  if not FCompare2FuncSet then
  begin
    FastLineSeries3.Clear;
    FastLineSeries4.Clear;
    Label21.Caption := '';
    Label22.Caption := '';
    Label23.Caption := '';
    Exit;
  end;

  FastLineSeries3.Clear;
  FastLineSeries4.Clear;

  hasL := Chart6HasLobatto;
  hasG := Chart6HasGauss;

  eLmax := 0.0;
  eGmax := 0.0;
  M := 400;

  for i := 0 to M do
  begin
    x := -1.0 + 2.0 * i / M;
    fval := GetSelectedFunction(x, FCompare2FuncId);

    // evaluate only if that method is actually present on Chart6
    if hasL and (Length(FSecondKindLobattoCoeffs) > 0) then
      uL := EvalInterpolantSecondKind(x, FSecondKindLobattoCoeffs)
    else
      uL := NaN;

    if hasG and (Length(FSecondKindCoeffs) > 0) then
      uG := EvalInterpolantSecondKind(x, FSecondKindCoeffs)
    else
      uG := NaN;

    if not IsNan(uL) then
    begin
      rL := fval - uL;
      FastLineSeries3.AddXY(x, rL);
      if Abs(rL) > eLmax then
        eLmax := Abs(rL);
    end;

    if not IsNan(uG) then
    begin
      rG := fval - uG;
      FastLineSeries4.AddXY(x, rG);
      if Abs(rG) > eGmax then
        eGmax := Abs(rG);
    end;
  end;

  // show max errors even if only one method exists
  if hasL and (Length(FSecondKindLobattoCoeffs) > 0) then
    Label21.Caption := 'Lobatto max |r_L(x)| = ' + FormatSci(eLmax)
  else
    Label21.Caption := '';

  if hasG and (Length(FSecondKindCoeffs) > 0) then
    Label22.Caption := 'Gauss max |r_G(x)| = ' + FormatSci(eGmax)
  else
    Label22.Caption := '';

  // winner only if both exist
  if hasL and hasG and (eLmax > 0) and (eGmax > 0) then
  begin
    if eLmax < eGmax then
      Label23.Caption := 'More accurate method: Lobatto'
    else if eGmax < eLmax then
      Label23.Caption := 'More accurate method: Gauss'
    else
      Label23.Caption := 'Both methods have similar accuracy';
  end
  else
    Label23.Caption := '';

  // right axis scaling from what exists
  eMax := 0.0;
  if hasL then eMax := Max(eMax, eLmax);
  if hasG then eMax := Max(eMax, eGmax);

  if eMax <= 0 then
    eMax := 1.0E-12;

  with Chart6.RightAxis do
  begin
    Automatic := False;
    Minimum := -eMax;
    Maximum :=  eMax;
    Increment := eMax / 2.0;
  end;
end;

{ ===================== Events ===================== }

procedure TForm1.FormShow(Sender: TObject);
begin
  if FStarted then Exit;
  FStarted := True;

  SpinEdit1.Value := 4;
  SpinEdit2.Value := 4;
  SpinEdit3.Value := 4;
  SpinEdit4.Value := 4;

  FValueN1 := 4;
  FValueN2 := 4;
  FValueN3 := 4;
  FValueN4 := 4;

  ListBox1.Items.Clear;
  ListBox1.Items.Add('1. exp(alpha*(x^2-1))');
  ListBox1.Items.Add('2. sin(omega*x)*exp(-x^2)');
  ListBox1.Items.Add('3. sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)');
  ListBox1.Items.Add('4. |x - a|');
  ListBox1.Items.Add('5. |x^2 - a_1| * |x^2 - a_2|');
  ListBox1.Items.Add('6. |x - a_1| * |x - a_2|');

  ListBox2.Items.Clear;
  ListBox2.Items.AddStrings(ListBox1.Items);

  ListBox3.Items.Clear;
  ListBox3.Items.AddStrings(ListBox1.Items);

  ListBox4.Items.Clear;
  ListBox4.Items.AddStrings(ListBox1.Items);

  ListBox1.ItemIndex := 2;
  ListBox2.ItemIndex := 2;
  ListBox3.ItemIndex := 2;
  ListBox4.ItemIndex := 2;

  FSelectedFunc1 := 2;
  FSelectedFunc2 := 2;
  FSelectedFunc3 := 2;
  FSelectedFunc4 := 2;

  SetLength(FLobattoCoeffs, 0);
  SetLength(FGaussCoeffs, 0);
  SetLength(FSecondKindCoeffs, 0);
  SetLength(FSecondKindLobattoCoeffs, 0);

  ClearMatrixGrid(StringGrid3);
  ClearMatrixGrid(StringGrid4);

  // initial comparison state
  FCompareFuncSet := False;
  FCompareFuncId := -1;

  // configure comparison chart right axis
  SetChart4Titles;

  lblErrL.Caption := '';
  lblErrG.Caption := '';
  lblWinner.Caption := '';

  Series15.Active := False;
  Series16.Active := False;

  with Chart4.RightAxis do
  begin
    Visible := True;
    Title.Caption := 'residual r(x)';
    Automatic := True;
    Grid.Visible := False;
    Axis.Color := clRed;
    LabelsFont.Color := clRed;
    Title.Font.Color := clRed;
  end;

  Series15.VertAxis := aRightAxis;
  Series16.VertAxis := aRightAxis;

  Chart4.RightAxis.AxisValuesFormat := '0.0000000000E-0';
  Chart4.OnGetAxisLabel := Chart4GetAxisLabel;

  // store layout ratios
  if PanelMain1.ClientWidth > 0 then
  begin
    FLobLeftRatio := PanelLeft1.Width / PanelMain1.ClientWidth;
    FLobRightRatio := PanelRight1.Width / PanelMain1.ClientWidth;
  end
  else
  begin
    FLobLeftRatio := 0.2;
    FLobRightRatio := 0.2;
  end;

  if PanelCenter1.ClientHeight > 0 then
    FLobTopRatio := PanelTop1.Height / PanelCenter1.ClientHeight
  else
    FLobTopRatio := 0.5;

  if PanelMain2.ClientWidth > 0 then
  begin
    FGaussLeftRatio := PanelLeft2.Width / PanelMain2.ClientWidth;
    FGaussRightRatio := PanelRight2.Width / PanelMain2.ClientWidth;
  end
  else
  begin
    FGaussLeftRatio := 0.2;
    FGaussRightRatio := 0.2;
  end;

  if PanelCenter2.ClientHeight > 0 then
    FGaussTopRatio := PanelTop2.Height / PanelCenter2.ClientHeight
  else
    FGaussTopRatio := 0.5;

  if PanelMain3.ClientWidth > 0 then
  begin
    FSecondLeftRatio := PanelLeft3.Width / PanelMain3.ClientWidth;
    FSecondRightRatio := PanelRight3.Width / PanelMain3.ClientWidth;
  end
  else
  begin
    FSecondLeftRatio := 0.2;
    FSecondRightRatio := 0.2;
  end;

  if PanelCenter3.ClientHeight > 0 then
    FSecondTopRatio := PanelTop3.Height / PanelCenter3.ClientHeight
  else
    FSecondTopRatio := 0.5;

    // ===== second comparison init =====
  FCompare2FuncSet := False;
  FCompare2FuncId := -1;

  SetChart6Titles;

  Label21.Caption := '';
  Label22.Caption := '';
  Label23.Caption := '';

  // error curves on right axis (same idea as Chart4)
  FastLineSeries3.VertAxis := aRightAxis;
  FastLineSeries4.VertAxis := aRightAxis;

  with Chart6.RightAxis do
  begin
    Visible := True;
    Title.Caption := 'residual r(x)';
    Automatic := True;
    Grid.Visible := False;
    Axis.Color := clRed;
    LabelsFont.Color := clRed;
    Title.Font.Color := clRed;
  end;

  // at start, hide error curves until both methods are transferred
  FastLineSeries3.Active := False;
  FastLineSeries4.Active := False;



  // build everything initially
  MatrixClick(nil);
  GraphClick(nil);

  Matrix2Click(nil);
  Graph2Click(nil);

  Matrix3Click(nil);
  PlotClick(nil);

  Matrix4Click(nil);
  Plot2Click(nil);

  // ======== both-kinds comparison state (Chart7) ========
  FBothFuncId := -1;
  FBothFuncSet := False;
  FBothHasFirstKind := False;
  FBothHasSecondKind := False;

  FCompareBothFuncId := -1;
  FCompareBothFuncSet := False;

end;

procedure TForm1.UpdateSecondComparisonView;
begin
  LineSeries1.Active := True;
  LineSeries2.Active := True;
  PointSeries2.Active := True;
  LineSeries3.Active := True;
  PointSeries3.Active := True;

  FastLineSeries3.Active := Chart6HasLobatto;
  FastLineSeries4.Active := Chart6HasGauss;

  DrawSecondErrorCurvesOnChart6;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  FValueN1 := SpinEdit1.Value;
  if FValueN1 < 1 then FValueN1 := 1;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  FValueN2 := SpinEdit2.Value;
  if FValueN2 < 1 then FValueN2 := 1;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
  FValueN3 := SpinEdit3.Value;
  if FValueN3 < 1 then FValueN3 := 1;
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
  FValueN4 := SpinEdit4.Value;
  if FValueN4 < 1 then FValueN4 := 1;
end;

procedure TForm1.MatrixClick(Sender: TObject);
var
  n: Integer;
begin
  n := FValueN1;
  if n < 1 then Exit;

  FSelectedFunc1 := GetFuncIndexSafe(ListBox1, 0);

  FillNodesGrid_Lobatto(n, StringGridPoint1);
  RecalcLobattoCoeffs(n, FSelectedFunc1);
end;

procedure TForm1.Matrix2Click(Sender: TObject);
var
  n: Integer;
begin
  n := FValueN2;
  if n < 1 then Exit;

  FSelectedFunc2 := GetFuncIndexSafe(ListBox2, 0);

  FillNodesGrid_Gauss(n, StringGridPoint2);
  RecalcGaussCoeffs(n, FSelectedFunc2);
end;

procedure TForm1.Matrix3Click(Sender: TObject);
var
  n: Integer;
begin
  n := FValueN3;
  if n < 1 then Exit;

  FSelectedFunc3 := GetFuncIndexSafe(ListBox3, 0);

  // second kind recalculation includes grid + matrix display
  RecalcSecondKindCoeffs(n, FSelectedFunc3);
end;

procedure TForm1.GraphClick(Sender: TObject);
begin
  if FValueN1 < 1 then Exit;
  if not EnsureFunctionSelected(ListBox1, 'Chebyshev–Lobatto') then Exit;

  FSelectedFunc1 := ListBox1.ItemIndex;

  PlotKind1(
    FValueN1, FSelectedFunc1, FLobattoCoeffs,
    Series1, Series2, Series3,
    'f(x) = ', 'Interpolant u(x)', 'Cheb points',
    nmLobatto
  );
end;

procedure TForm1.Graph2Click(Sender: TObject);
begin
  if FValueN2 < 1 then Exit;
  if not EnsureFunctionSelected(ListBox2, 'Gauss') then Exit;

  FSelectedFunc2 := ListBox2.ItemIndex;

  PlotKind1(
    FValueN2, FSelectedFunc2, FGaussCoeffs,
    Series4, Series5, Series6,
    'f(x) = ', 'Interpolant u(x)', 'Gauss points',
    nmGauss
  );
end;

procedure TForm1.PlotClick(Sender: TObject);
begin
  if FValueN3 < 1 then Exit;
  if not EnsureFunctionSelected(ListBox3, 'Second kind (U_n)') then Exit;

  FSelectedFunc3 := ListBox3.ItemIndex;

  PlotKind2(
    FValueN3, FSelectedFunc3, FSecondKindCoeffs,
    Series7, Series8, Series9,
    'f(x) = ', 'Interpolant u(x) - Second Kind', 'Second Kind points'
  );
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  n, NewFunc: Integer;
begin
  NewFunc := GetFuncIndexSafe(ListBox1, 0);
  if NewFunc = FSelectedFunc1 then Exit;

  FSelectedFunc1 := NewFunc;
  n := FValueN1;
  if n < 1 then Exit;

  // update coeffs only
  RecalcLobattoCoeffs(n, FSelectedFunc1);
end;

procedure TForm1.ListBox2Click(Sender: TObject);
var
  n, NewFunc: Integer;
begin
  NewFunc := GetFuncIndexSafe(ListBox2, 0);
  if NewFunc = FSelectedFunc2 then Exit;

  FSelectedFunc2 := NewFunc;
  n := FValueN2;
  if n < 1 then Exit;

  RecalcGaussCoeffs(n, FSelectedFunc2);
end;

procedure TForm1.ListBox3Click(Sender: TObject);
var
  n, NewFunc: Integer;
begin
  NewFunc := GetFuncIndexSafe(ListBox3, 0);
  if NewFunc = FSelectedFunc3 then Exit;

  FSelectedFunc3 := NewFunc;
  n := FValueN3;
  if n < 1 then Exit;

  RecalcSecondKindCoeffs(n, FSelectedFunc3);
end;

procedure TForm1.ListBox4Click(Sender: TObject);
var
  n, NewFunc: Integer;
begin
  NewFunc := GetFuncIndexSafe(ListBox4, 0);
  if NewFunc = FSelectedFunc4 then Exit;

  FSelectedFunc4 := NewFunc;

  n := SpinEdit4.Value;
  if n < 1 then Exit;

  // Update coefficients immediately like other tabs
  Matrix4Click(nil);
end;

procedure TForm1.trans1Click(Sender: TObject);
begin
  if not ChartHasAnyData(Series1, Series2, Series3) then
  begin
    ShowMessage('Tab "Chebyshev–Lobatto": nothing to transfer. Please plot the graph first.');
    Exit;
  end;

    // Auto-erase if Chart4 is FULL (both methods) AND function differs
  if FCompareFuncSet and Chart4HasBothMethods and (FSelectedFunc1 <> FCompareFuncId) then
    EraseClick(nil);

  if FCompareFuncSet and (FSelectedFunc1 <> FCompareFuncId) then
  begin
    ShowMessage(
      'The function on tab "Chebyshev–Lobatto" does not match the current comparison function.' + sLineBreak +
      'Please choose the same function as in "Comparison" and transfer again.'
    );
    Exit;
  end;

  CopySeriesXY(Series1, Series13);
  CopySeriesXY(Series2, Series10);
  CopySeriesXY(Series3, Series12);

  SetChart4Titles;

  if not FCompareFuncSet then
  begin
    FCompareFuncId := FSelectedFunc1;
    FCompareFuncSet := True;
  end;

  UpdateComparisonView;
end;

procedure TForm1.Trans2Click(Sender: TObject);
begin
  if not ChartHasAnyData(Series4, Series5, Series6) then
  begin
    ShowMessage('Tab "Gauss": nothing to transfer. Please plot the graph first.');
    Exit;
  end;

    // Auto-erase if Chart4 is FULL (both methods) AND function differs
  if FCompareFuncSet and Chart4HasBothMethods and (FSelectedFunc2 <> FCompareFuncId) then
    EraseClick(nil);

  if not FCompareFuncSet then
  begin
    CopySeriesXY(Series4, Series13);
    CopySeriesXY(Series5, Series11);
    CopySeriesXY(Series6, Series14);

    SetChart4Titles;

    FCompareFuncId := FSelectedFunc2;
    FCompareFuncSet := True;

    UpdateComparisonView;
    Exit;
  end;

  if FSelectedFunc2 <> FCompareFuncId then
  begin
    ShowMessage(
      'The function on tab "Gauss" does not match the current comparison function.' + sLineBreak +
      'Please choose the same function as in "Comparison" and transfer again.'
    );
    Exit;
  end;

  CopySeriesXY(Series5, Series11);
  CopySeriesXY(Series6, Series14);

  SetChart4Titles;
  UpdateComparisonView;


  // ===== both-kinds comparison init =====
  FCompareBothFuncSet := False;
  FCompareBothFuncId := -1;
  FBothHasFirstKind := False;
  FBothHasSecondKind := False;

  FirstLobattomax.Caption := '';
  FirstGaussmax.Caption := '';
  SecondLobattolmax.Caption := '';
  SecondGaussmax.Caption := '';
  bestmethod.Caption := '';

  // right axis style (like Chart4)
  Chart7.RightAxis.Visible := True;
  Chart7.RightAxis.Title.Caption := 'residual r(x)';
  Chart7.RightAxis.Grid.Visible := False;
  Chart7.RightAxis.Automatic := True;
  Chart7.OnGetAxisLabel := Chart7GetAxisLabel;

  // put residual series on right axis
  FastLineSeries5.VertAxis := aRightAxis;
  FastLineSeries6.VertAxis := aRightAxis;
  Series21.VertAxis := aRightAxis;
  Series22.VertAxis := aRightAxis;

  SetChart7Titles;

  end;

  procedure TForm1.EraseClick(Sender: TObject);
  begin
    Series10.Clear;
    Series11.Clear;
    Series12.Clear;
    Series13.Clear;
    Series14.Clear;
    Series15.Clear;
    Series16.Clear;

    FCompareFuncSet := False;
    FCompareFuncId := -1;

    with Chart4.RightAxis do
    begin
      Automatic := True;
      Minimum := 0;
      Maximum := 0;
      Increment := 0;
    end;

    Chart4.Invalidate;

    lblErrL.Caption := '';
    lblErrG.Caption := '';
    lblWinner.Caption := '';

    SetChart4Titles;

    Series15.Active := True;
    Series16.Active := True;

    // ===== both-kinds comparison init =====
    FCompareBothFuncSet := False;
    FCompareBothFuncId := -1;
    FBothHasFirstKind := False;
    FBothHasSecondKind := False;

    FirstLobattomax.Caption := '';
    FirstGaussmax.Caption := '';
    SecondLobattolmax.Caption := '';
    SecondGaussmax.Caption := '';
    bestmethod.Caption := '';

    // right axis style (like Chart4)
    Chart7.RightAxis.Visible := True;
    Chart7.RightAxis.Title.Caption := 'residual r(x)';
    Chart7.RightAxis.Grid.Visible := False;
    Chart7.RightAxis.Automatic := True;
    Chart7.OnGetAxisLabel := Chart7GetAxisLabel;

    // put residual series on right axis
    FastLineSeries5.VertAxis := aRightAxis;
    FastLineSeries6.VertAxis := aRightAxis;
    Series21.VertAxis := aRightAxis;
    Series22.VertAxis := aRightAxis;

    SetChart7Titles;

end;

procedure TForm1.FormResize(Sender: TObject);

  procedure ApplyLayout(AMain, ALeft, ARight, ACenter, ATop: TPanel;
                        ALeftRatio, ARightRatio, ATopRatio: Double);
  var
    W, H: Integer;
  begin
    if (AMain = nil) or (ALeft = nil) or (ARight = nil) or
       (ACenter = nil) or (ATop = nil) then
      Exit;

    W := AMain.ClientWidth;
    if W > 0 then
    begin
      ALeft.Width := Round(W * ALeftRatio);
      ARight.Width := Round(W * ARightRatio);
    end;

    H := ACenter.ClientHeight;
    if H > 0 then
      ATop.Height := Round(H * ATopRatio);
  end;

begin
  ApplyLayout(PanelMain1, PanelLeft1, PanelRight1, PanelCenter1, PanelTop1,
              FLobLeftRatio, FLobRightRatio, FLobTopRatio);

  ApplyLayout(PanelMain2, PanelLeft2, PanelRight2, PanelCenter2, PanelTop2,
              FGaussLeftRatio, FGaussRightRatio, FGaussTopRatio);

  ApplyLayout(PanelMain3, PanelLeft3, PanelRight3, PanelCenter3, PanelTop3,
              FSecondLeftRatio, FSecondRightRatio, FSecondTopRatio);
end;

procedure TForm1.BtnExportCSVClick(Sender: TObject);
var
  prefix: string;
begin
  if not ChartHasAnyData(Series10, Series11, Series13) then
  begin
    ShowMessage('Nothing to export. Send data to Comparison tab first (Send for comparison>>>).');
    Exit;
  end;

  if not FCompareFuncSet then
  begin
    ShowMessage('Please transfer results to the Comparing tab first.');
    Exit;
  end;

  UpdateComparisonView;

  prefix := 'compare_';

  SaveSeriesToCSV(prefix + 'f.csv', Series13);
  SaveSeriesToCSV(prefix + 'uL.csv', Series10);
  SaveSeriesToCSV(prefix + 'uG.csv', Series11);

  SaveSeriesToCSV(prefix + 'nodesL.csv', Series12);
  SaveSeriesToCSV(prefix + 'nodesG.csv', Series14);

  SaveSeriesToCSV(prefix + 'rL.csv', Series15);
  SaveSeriesToCSV(prefix + 'rG.csv', Series16);

  ShowMessage('Export done (CSV files saved next to the .exe).');
end;

procedure TForm1.Matrix4Click(Sender: TObject);
var
  n, i: Integer;
  A, AT, G, Aw: TMatrix;
  fvec, Tt_f, TTdiag, ccoef: TDynamicDoubleArray;
begin
  n := SpinEdit4.Value;
  if n < 1 then Exit;

  FSelectedFunc4 := GetFuncIndexSafe(ListBox4, 0);

  // UI nodes
  FillNodesGrid_SecondKindLobatto(n, StringGrid1);

  // Math
  CalculateSecondKindLobattoSystemWithFunction(n, FSelectedFunc4, A, AT, G, Aw, fvec, Tt_f, TTdiag, ccoef);

  // show diagnostic matrix
  DisplayMatrixInGrid(G, StringGrid2);

  // send raw A and weighted Aw to TabSheet3
  SendRawAndWeightedToPreview(A, Aw, True);

  // store coeffs
  SetLength(FSecondKindLobattoCoeffs, Length(ccoef));
  for i := 0 to High(ccoef) do
    FSecondKindLobattoCoeffs[i] := ccoef[i];
end;


procedure TForm1.Plot2Click(Sender: TObject);
var
  n, k, i, M: Integer;
  x, theta: Double;
begin
  n := SpinEdit4.Value;
  if n < 1 then Exit;
  if not EnsureFunctionSelected(ListBox4, 'Second kind (U_n) – Lobatto') then Exit;

  if Length(FSecondKindLobattoCoeffs) = 0 then
  begin
    ShowMessage('Please build the matrix first.');
    Exit;
  end;

  PrepareSeriesForPlot(FastLineSeries1, FastLineSeries2, PointSeries1,
    'f(x) = ' + FuncNameByIndex(ListBox4.ItemIndex),
    'Interpolant u(x) - Second Kind (Lobatto)',
    'Lobatto points');

  // nodes
  for k := 0 to n do
  begin
    theta := k * Pi / n;
    x := Cos(theta);
    PointSeries1.AddXY(x, GetSelectedFunction(x, ListBox4.ItemIndex));
  end;

  // curves
  M := 400;
  for i := 0 to M do
  begin
    x := -1.0 + 2.0 * i / M;
    FastLineSeries1.AddXY(x, GetSelectedFunction(x, ListBox4.ItemIndex));
    FastLineSeries2.AddXY(x, EvalInterpolantSecondKind(x, FSecondKindLobattoCoeffs));
  end;
end;

procedure TForm1.stran1Click(Sender: TObject);
begin
  // From Second kind – Gauss tab (Chart3: Series7, Series8, Series9)
  if not ChartHasAnyData(Series7, Series8, Series9) then
  begin
    ShowMessage('Tab "Second kind – Gauss": nothing to transfer. Please plot the graph first.');
    Exit;
  end;

  // Auto-erase if Chart6 is FULL (both methods) AND function differs
  if FCompare2FuncSet and Chart6HasBothMethods and (FSelectedFunc3 <> FCompare2FuncId) then
    Erase2Click(nil);

  // If this is the first transfer, lock function id
  if not FCompare2FuncSet then
  begin
    CopySeriesXY(Series7, LineSeries3);   // f(x)
    CopySeriesXY(Series8, LineSeries2);   // u_G(x)
    CopySeriesXY(Series9, PointSeries3);  // nodes (Gauss)

    FCompare2FuncId := FSelectedFunc3;
    FCompare2FuncSet := True;

    SetChart6Titles;
    UpdateSecondComparisonView;
    Exit;
  end;

  // Enforce same function like first comparison tab
  if FSelectedFunc3 <> FCompare2FuncId then
  begin
    ShowMessage(
      'The function on tab "Second kind – Gauss" does not match the current comparison function.' + sLineBreak +
      'Please choose the same function as in "SecondComparison" and transfer again.'
    );
    Exit;
  end;

  // Update only Gauss data
  CopySeriesXY(Series8, LineSeries2);
  CopySeriesXY(Series9, PointSeries3);

  SetChart6Titles;
  UpdateSecondComparisonView;
end;

procedure TForm1.stran2Click(Sender: TObject);
begin
  // From Second kind – Lobatto tab (Chart5: FastLineSeries1, FastLineSeries2, PointSeries1)
  if not ChartHasAnyData(FastLineSeries1, FastLineSeries2, PointSeries1) then
  begin
    ShowMessage('Tab "Second kind – Lobatto": nothing to transfer. Please plot the graph first.');
    Exit;
  end;

  // Auto-erase if Chart6 is FULL (both methods) AND function differs
  if FCompare2FuncSet and Chart6HasBothMethods and (FSelectedFunc4 <> FCompare2FuncId) then
    Erase2Click(nil);

  // If comparison already started with some function, enforce same one
  if FCompare2FuncSet and (FSelectedFunc4 <> FCompare2FuncId) then
  begin
    ShowMessage(
      'The function on tab "Second kind – Lobatto" does not match the current comparison function.' + sLineBreak +
      'Please choose the same function as in "SecondComparison" and transfer again.'
    );
    Exit;
  end;

  // Copy (if first time, also sets f(x))
  if not FCompare2FuncSet then
  begin
    CopySeriesXY(FastLineSeries1, LineSeries3); // f(x)
    FCompare2FuncId := FSelectedFunc4;
    FCompare2FuncSet := True;
  end;

  CopySeriesXY(FastLineSeries2, LineSeries1); // u_L(x)
  CopySeriesXY(PointSeries1, PointSeries2);   // nodes (Lobatto)

  SetChart6Titles;
  UpdateSecondComparisonView;
end;


procedure TForm1.Erase2Click(Sender: TObject);
begin
  LineSeries1.Clear;
  LineSeries2.Clear;
  PointSeries2.Clear;
  LineSeries3.Clear;
  PointSeries3.Clear;
  FastLineSeries3.Clear;
  FastLineSeries4.Clear;

  FCompare2FuncSet := False;
  FCompare2FuncId := -1;

  with Chart6.RightAxis do
  begin
    Automatic := True;
    Minimum := 0;
    Maximum := 0;
    Increment := 0;
  end;

  Chart6.Invalidate;

  Label21.Caption := '';
  Label22.Caption := '';
  Label23.Caption := '';

  SetChart6Titles;

  FastLineSeries3.Active := False;
  FastLineSeries4.Active := False;
end;

procedure TForm1.BtnExportCSV2Click(Sender: TObject);
var
  prefix: string;
begin
  // Require something meaningful on the chart
  if not ChartHasAnyData(LineSeries1, LineSeries2, LineSeries3) then
  begin
    ShowMessage('Nothing to export. Send data to SecondComparison tab first.');
    Exit;
  end;

  if not FCompare2FuncSet then
  begin
    ShowMessage('Please transfer results to the SecondComparison tab first.');
    Exit;
  end;

  UpdateSecondComparisonView;

  prefix := 'compare2_';

  SaveSeriesToCSV(prefix + 'f.csv', LineSeries3);
  SaveSeriesToCSV(prefix + 'uL.csv', LineSeries1);
  SaveSeriesToCSV(prefix + 'uG.csv', LineSeries2);

  SaveSeriesToCSV(prefix + 'nodesL.csv', PointSeries2);
  SaveSeriesToCSV(prefix + 'nodesG.csv', PointSeries3);

  SaveSeriesToCSV(prefix + 'rL.csv', FastLineSeries3);
  SaveSeriesToCSV(prefix + 'rG.csv', FastLineSeries4);

  ShowMessage('Export done (CSV files saved next to the .exe).');
end;


{ ===================== BOTH-KINDS Comparison (Chart7) ===================== }

function TForm1.SeriesMaxAbsY(const S: TChartSeries): Double;
var
  i: Integer;
  v: Double;
begin
  Result := 0.0;
  if (S = nil) or (S.Count = 0) then Exit;

  for i := 0 to S.Count - 1 do
  begin
    v := Abs(S.YValue[i]);
    if v > Result then
      Result := v;
  end;
end;

procedure TForm1.SetChart7Titles;
begin
  // Shared original
  if FCompareBothFuncSet then
    LineSeries6.Title := 'Original f(x) = ' + FuncNameByIndex(FCompareBothFuncId)
  else
    LineSeries6.Title := 'Original f(x)';

  // First kind (T_n)
  LineSeries4.Title := 'First kind Lobatto u_L(x)';
  LineSeries5.Title := 'First kind Gauss u_G(x)';
  PointSeries4.Title := 'First kind Lobatto nodes';
  PointSeries5.Title := 'First kind Gauss nodes';
  FastLineSeries5.Title := 'First kind residual r_L(x)';
  FastLineSeries6.Title := 'First kind residual r_G(x)';

  if PointSeries4 is TPointSeries then
  begin
    TPointSeries(PointSeries4).Pointer.Visible := True;
    TPointSeries(PointSeries4).Marks.Visible := False;
  end;

  if PointSeries5 is TPointSeries then
  begin
    TPointSeries(PointSeries5).Pointer.Visible := True;
    TPointSeries(PointSeries5).Marks.Visible := False;
  end;

  // Second kind (U_n)
  Series17.Title := 'Second kind Lobatto u_L(x)';
  Series19.Title := 'Second kind Gauss u_G(x)';
  Series18.Title := 'Second kind Lobatto nodes';
  Series20.Title := 'Second kind Gauss nodes';
  Series21.Title := 'Second kind residual r_L(x)';
  Series22.Title := 'Second kind residual r_G(x)';

  if Series18 is TPointSeries then
  begin
    TPointSeries(Series18).Pointer.Visible := True;
    TPointSeries(Series18).Marks.Visible := False;
  end;

  if Series20 is TPointSeries then
  begin
    TPointSeries(Series20).Pointer.Visible := True;
    TPointSeries(Series20).Marks.Visible := False;
  end;
end;

procedure TForm1.RecalcBothLabelsAndAxis;
var
  e1L, e1G, e2L, e2G, eMax: Double;
  bestName: string;
  bestVal: Double;

  procedure Consider(const name: string; val: Double);
  begin
    if (val <= 0) then Exit;
    if (bestVal <= 0) or (val < bestVal) then
    begin
      bestVal := val;
      bestName := name;
    end;
  end;

begin
  // compute maxima (only if that block exists)
  e1L := SeriesMaxAbsY(FastLineSeries5);
  e1G := SeriesMaxAbsY(FastLineSeries6);
  e2L := SeriesMaxAbsY(Series21);
  e2G := SeriesMaxAbsY(Series22);

  if FBothHasFirstKind then
  begin
    FirstLobattomax.Caption := 'First kind Lobatto max |r_L(x)| = ' + FormatSci(e1L);
    FirstGaussmax.Caption   := 'First kind Gauss max |r_G(x)| = ' + FormatSci(e1G);
  end
  else
  begin
    FirstLobattomax.Caption := '';
    FirstGaussmax.Caption := '';
  end;

  if FBothHasSecondKind then
  begin
    SecondLobattolmax.Caption := 'Second kind Lobatto max |r_L(x)| = ' + FormatSci(e2L);
    SecondGaussmax.Caption    := 'Second kind Gauss max |r_G(x)| = ' + FormatSci(e2G);
  end
  else
  begin
    SecondLobattolmax.Caption := '';
    SecondGaussmax.Caption := '';
  end;

  // best of 4
  bestVal := -1.0;
  bestName := '';

  if FBothHasFirstKind then
  begin
    Consider('First kind Lobatto', e1L);
    Consider('First kind Gauss', e1G);
  end;

  if FBothHasSecondKind then
  begin
    Consider('Second kind Lobatto', e2L);
    Consider('Second kind Gauss', e2G);
  end;

  if bestName <> '' then
    bestmethod.Caption := 'Best method: ' + bestName
  else
    bestmethod.Caption := '';

  // Right axis scaling from the maximum residual among available systems
  eMax := 0.0;
  if FBothHasFirstKind then
    eMax := Max(eMax, Max(e1L, e1G));
  if FBothHasSecondKind then
    eMax := Max(eMax, Max(e2L, e2G));

  if eMax <= 0 then
  begin
    Chart7.RightAxis.Automatic := True;
    Exit;
  end;

  Chart7.RightAxis.Automatic := False;
  Chart7.RightAxis.Minimum := -eMax;
  Chart7.RightAxis.Maximum :=  eMax;
  Chart7.RightAxis.Increment := eMax / 2.0;
end;

procedure TForm1.UpdateBothComparisonView;
begin
  SetChart7Titles;
  RecalcBothLabelsAndAxis;
end;

procedure TForm1.Chart7GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
  ValueIndex: Integer; var LabelText: string);
var
  v, mant: Double;
  expo: Integer;
begin
  if Sender <> Chart7.RightAxis then Exit;
  if LabelText = '' then Exit;
  if not TryStrToFloat(LabelText, v) then Exit;

  if Abs(v) < 1.0E-20 then
  begin
    LabelText := '0';
    Exit;
  end;

  expo := Floor(Log10(Abs(v)));
  mant := v / Power(10, expo);
  LabelText := FormatFloat('0.00', mant) + '×10^' + IntToStr(expo);
end;

procedure TForm1.tocomp1Click(Sender: TObject);
begin
  // Must have first-kind comparison fully ready
  if not FCompareFuncSet then
  begin
    ShowMessage('First-kind comparison has no locked function. Transfer Lobatto/Gauss to the First-kind Comparison tab first.');
    Exit;
  end;

  if SeriesIsEmpty(Series13) or SeriesIsEmpty(Series10) or SeriesIsEmpty(Series11) then
  begin
    ShowMessage('First-kind comparison must contain f(x), Lobatto u_L(x), and Gauss u_G(x) before sending.');
    Exit;
  end;

  // AUTO-ERASE: Direct check for BOTH kinds present (more reliable than state flags)
  if FBothFuncSet and
     (not SeriesIsEmpty(LineSeries4)) and (not SeriesIsEmpty(Series17)) and  // Both interpolants present
     (FCompareFuncId <> FBothFuncId)
  then
    Erase3Click(nil);

  // Ensure error curves are up to date
  UpdateComparisonView;

  // If Chart7 already has a function locked, enforce match
  if FBothFuncSet and (FBothFuncId <> FCompareFuncId) then
  begin
    ShowMessage(
      'Both-kinds Comparison already contains a different function.' + sLineBreak +
      'Press Erase on Both-kinds Comparison or send the same function.'
    );
    Exit;
  end;

  // If Chart7 has data but is not locked yet, lock it NOW using first-kind function
  if (not FBothFuncSet) and Chart7HasAnyData then
  begin
    FBothFuncId := FCompareFuncId;
    FBothFuncSet := True;
  end;

  // If still not locked, lock it (empty chart case)
  if not FBothFuncSet then
  begin
    FBothFuncId := FCompareFuncId;
    FBothFuncSet := True;
  end;

  // Copy shared original ONLY if empty OR same function (we already enforced same)
  CopySeriesXY(Series13, LineSeries6); // f(x)

  // Copy first-kind data
  CopySeriesXY(Series10, LineSeries4);      // u_L(x) first kind
  CopySeriesXY(Series11, LineSeries5);      // u_G(x) first kind
  CopySeriesXY(Series12, PointSeries4);     // nodes L first kind
  CopySeriesXY(Series14, PointSeries5);     // nodes G first kind
  CopySeriesXY(Series15, FastLineSeries5);  // r_L(x) first kind
  CopySeriesXY(Series16, FastLineSeries6);  // r_G(x) first kind

  FBothHasFirstKind := True;

  // Switch to Chart7 tab if you want
  //PageControl1.ActivePage := TabSheet1;

  // call your “update labels + axis range” routine for Chart7 (you will have it)
  // UpdateBothKindsComparisonView;

  // keep the "comparison function" variables in sync (used by SetChart7Titles)
  FCompareBothFuncId := FBothFuncId;
  FCompareBothFuncSet := True;

  // update titles + captions + right axis
  UpdateBothComparisonView;
end;



procedure TForm1.tocomp2Click(Sender: TObject);
begin
  // Must have second-kind comparison fully ready
  if not FCompare2FuncSet then
  begin
    ShowMessage('Second-kind comparison has no locked function. Transfer Lobatto/Gauss to the Second-kind Comparison tab first.');
    Exit;
  end;

  if SeriesIsEmpty(LineSeries3) or SeriesIsEmpty(LineSeries1) or SeriesIsEmpty(LineSeries2) then
  begin
    ShowMessage('Second-kind comparison must contain f(x), Lobatto u_L(x), and Gauss u_G(x) before sending.');
    Exit;
  end;

  // AUTO-ERASE: Direct check for BOTH kinds present (more reliable than state flags)
  if FBothFuncSet and
     (not SeriesIsEmpty(LineSeries4)) and (not SeriesIsEmpty(Series17)) and  // Both interpolants present
     (FCompare2FuncId <> FBothFuncId)
  then
    Erase3Click(nil);

  // Ensure residuals are up to date (your function already computes them)
  UpdateSecondComparisonView;

  // Enforce Chart7 function match
  if FBothFuncSet and (FBothFuncId <> FCompare2FuncId) then
  begin
    ShowMessage(
      'Both-kinds Comparison already contains a different function.' + sLineBreak +
      'Press Erase on Both-kinds Comparison or send the same function.'
    );
    Exit;
  end;

  // Lock Chart7 function if needed
  if (not FBothFuncSet) and Chart7HasAnyData then
  begin
    FBothFuncId := FCompare2FuncId;
    FBothFuncSet := True;
  end;

  if not FBothFuncSet then
  begin
    FBothFuncId := FCompare2FuncId;
    FBothFuncSet := True;
  end;

  // Copy shared original function
  CopySeriesXY(LineSeries3, LineSeries6); // f(x)

  // Copy second-kind data
  CopySeriesXY(LineSeries1, Series17);     // u_L(x) second kind
  CopySeriesXY(LineSeries2, Series19);     // u_G(x) second kind
  CopySeriesXY(PointSeries2, Series18);    // nodes L second kind
  CopySeriesXY(PointSeries3, Series20);    // nodes G second kind
  CopySeriesXY(FastLineSeries3, Series21); // r_L(x) second kind
  CopySeriesXY(FastLineSeries4, Series22); // r_G(x) second kind

  FBothHasSecondKind := True;

  //PageControl1.ActivePage := TabSheet1;

  // UpdateBothKindsComparisonView;
  // keep the "comparison function" variables in sync (used by SetChart7Titles)
  FCompareBothFuncId := FBothFuncId;
  FCompareBothFuncSet := True;


// update titles + captions + right axis
UpdateBothComparisonView;
end;


procedure TForm1.Erase3Click(Sender: TObject);
begin
  LineSeries4.Clear;
  LineSeries5.Clear;
  LineSeries6.Clear;
  PointSeries4.Clear;
  PointSeries5.Clear;
  FastLineSeries5.Clear;
  FastLineSeries6.Clear;

  Series17.Clear;
  Series18.Clear;
  Series19.Clear;
  Series20.Clear;
  Series21.Clear;
  Series22.Clear;

  FBothFuncId := -1;
  FBothFuncSet := False;
  FBothHasFirstKind := False;
  FBothHasSecondKind := False;

  FCompareBothFuncId := -1;
  FCompareBothFuncSet := False;

  FirstLobattomax.Caption := '';
  FirstGaussmax.Caption := '';
  SecondLobattolmax.Caption := '';
  SecondGaussmax.Caption := '';
  bestmethod.Caption := '';

  // reset right axis if you customized it
  with Chart7.RightAxis do
  begin
    Automatic := True;
    Minimum := 0;
    Maximum := 0;
    Increment := 0;
  end;

  Chart7.Invalidate;
end;


procedure TForm1.BtnExportCSV3Click(Sender: TObject);
var
  prefix: string;
begin
  if not ChartHasAnyData(LineSeries6, LineSeries4, LineSeries5) and
     not ChartHasAnyData(LineSeries6, Series17, Series19) then
  begin
    ShowMessage('Nothing to export. Send results to Both-kinds Comparison first.');
    Exit;
  end;

  prefix := 'compare_both_';

  // shared original
  SaveSeriesToCSV(prefix + 'f.csv', LineSeries6);

  // first kind
  if FBothHasFirstKind then
  begin
    SaveSeriesToCSV(prefix + 'first_uL.csv', LineSeries4);
    SaveSeriesToCSV(prefix + 'first_uG.csv', LineSeries5);
    SaveSeriesToCSV(prefix + 'first_nodesL.csv', PointSeries4);
    SaveSeriesToCSV(prefix + 'first_nodesG.csv', PointSeries5);
    SaveSeriesToCSV(prefix + 'first_rL.csv', FastLineSeries5);
    SaveSeriesToCSV(prefix + 'first_rG.csv', FastLineSeries6);
  end;

  // second kind
  if FBothHasSecondKind then
  begin
    SaveSeriesToCSV(prefix + 'second_uL.csv', Series17);
    SaveSeriesToCSV(prefix + 'second_uG.csv', Series19);
    SaveSeriesToCSV(prefix + 'second_nodesL.csv', Series18);
    SaveSeriesToCSV(prefix + 'second_nodesG.csv', Series20);
    SaveSeriesToCSV(prefix + 'second_rL.csv', Series21);
    SaveSeriesToCSV(prefix + 'second_rG.csv', Series22);
  end;

  ShowMessage('Export done (CSV files saved next to the .exe).');
end;

function TForm1.Chart7HasAnyData: Boolean;
begin
  Result :=
    (not SeriesIsEmpty(LineSeries6)) or // f(x)
    (not SeriesIsEmpty(LineSeries4)) or (not SeriesIsEmpty(LineSeries5)) or
    (not SeriesIsEmpty(PointSeries4)) or (not SeriesIsEmpty(PointSeries5)) or
    (not SeriesIsEmpty(FastLineSeries5)) or (not SeriesIsEmpty(FastLineSeries6)) or
    (not SeriesIsEmpty(Series17)) or (not SeriesIsEmpty(Series19)) or
    (not SeriesIsEmpty(Series18)) or (not SeriesIsEmpty(Series20)) or
    (not SeriesIsEmpty(Series21)) or (not SeriesIsEmpty(Series22));
end;

procedure TForm1.ExpCVS2Click(Sender: TObject);
begin
  ExportSingleMethodKind1(
    'first_lobatto_',
    'First kind Lobatto',
    FValueN1,
    FSelectedFunc1,
    FLobattoCoeffs,
    Series1, Series2, Series3
  );

  ShowMessage('Export done: first kind Lobatto CSV files saved next to the .exe.');
end;

procedure TForm1.ExpCVS1Click(Sender: TObject);
begin
  ExportSingleMethodKind1(
    'first_gauss_',
    'First kind Gauss',
    FValueN2,
    FSelectedFunc2,
    FGaussCoeffs,
    Series4, Series5, Series6
  );

  ShowMessage('Export done: first kind Gauss CSV files saved next to the .exe.');
end;

procedure TForm1.ExpCVS3Click(Sender: TObject);
begin
  ExportSingleMethodKind2(
    'second_gauss_',
    'Second kind Gauss',
    FValueN3,
    FSelectedFunc3,
    FSecondKindCoeffs,
    Series7, Series8, Series9
  );

  ShowMessage('Export done: second kind Gauss CSV files saved next to the .exe.');
end;

procedure TForm1.ExpCVS4Click(Sender: TObject);
begin
  ExportSingleMethodKind2(
    'second_lobatto_',
    'Second kind Lobatto',
    FValueN4,
    FSelectedFunc4,
    FSecondKindLobattoCoeffs,
    FastLineSeries1, FastLineSeries2, PointSeries1
  );

  ShowMessage('Export done: second kind Lobatto CSV files saved next to the .exe.');
end;
end.

