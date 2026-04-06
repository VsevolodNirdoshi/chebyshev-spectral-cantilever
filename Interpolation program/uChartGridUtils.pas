unit uChartGridUtils;

interface

uses
  System.SysUtils, System.Classes, VCLTee.Series, VCLTee.TeEngine, Math, System.UITypes;


function SeriesIsEmpty(S: TChartSeries): Boolean;
function ChartHasAnyData(const S1, S2, S3: TChartSeries): Boolean;
procedure CopySeriesXY(const Src, Dst: TChartSeries);
function FuncNameByIndex(idx: Integer): string;
function FormatSci(const v: Double): string;

implementation

function SeriesIsEmpty(S: TChartSeries): Boolean;
begin
  Result := (S = nil) or (S.Count = 0);
end;


function ChartHasAnyData(const S1, S2, S3: TChartSeries): Boolean;
begin
  Result := (not SeriesIsEmpty(S1)) or (not SeriesIsEmpty(S2)) or (not SeriesIsEmpty(S3));
end;

procedure CopySeriesXY(const Src, Dst: TChartSeries);
var
  i: Integer;
begin
  if (Src = nil) or (Dst = nil) then Exit;
  Dst.Clear;
  for i := 0 to Src.Count - 1 do
    Dst.AddXY(Src.XValue[i], Src.YValue[i]);
end;

function FuncNameByIndex(idx: Integer): string;
begin
  case idx of
    0: Result := 'exp(alpha*(x^2-1))';
    1: Result := 'sin(omega*x)*exp(-x^2)';
    2: Result := 'sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)';
    3: Result := '|x-a|';
    4: Result := '|x^2-a1| * |x^2-a2|';
    5: Result := '|x-a1| * |x-a2|';
  else
    Result := 'f(x)';
  end;
end;

function FormatSci(const v: Double): string;
var
  mant: Double;
  expo: Integer;
begin
  if Abs(v) < 1.0E-20 then
    Exit('0');

  expo := Floor(Log10(Abs(v)));
  mant := v / Power(10, expo);

  Result := FormatFloat('0.00', mant) + '×10^' + IntToStr(expo);
end;

end.
