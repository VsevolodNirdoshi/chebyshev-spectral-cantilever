unit uCsvExport;

interface

uses
  System.SysUtils, System.Classes, VCLTee.TeEngine, VCLTee.Series;

procedure SaveSeriesToCSV(const FileName: string; const S: TChartSeries);

implementation

procedure SaveSeriesToCSV(const FileName: string; const S: TChartSeries);
var
  sl: TStringList;
  i: Integer;
  fs: TFormatSettings;
begin
  if (S = nil) or (S.Count = 0) then Exit;

  fs := TFormatSettings.Create;
  fs.DecimalSeparator := '.';
  fs.ThousandSeparator := #0;

  sl := TStringList.Create;
  try
    sl.Add('x,y');
    for i := 0 to S.Count - 1 do
      sl.Add(
        FormatFloat('0.###############', S.XValue[i], fs) + ',' +
        FormatFloat('0.###############', S.YValue[i], fs)
      );
    sl.SaveToFile(FileName, TEncoding.UTF8);
  finally
    sl.Free;
  end;
end;

end.
