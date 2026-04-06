object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 714
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1066
    Height = 714
    Hint = 'Compute nodes and Gram matrix for the selected function and n.'
    ActivePage = points1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1064
    ExplicitHeight = 706
    object points2: TTabSheet
      Caption = 'First kind - Gauss'
      ImageIndex = 1
      object PanelMain2: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        object Splitter7: TSplitter
          Left = 161
          Top = 1
          Height = 682
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object Splitter8: TSplitter
          Left = 845
          Top = 1
          Height = 682
          Align = alRight
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object PanelLeft2: TPanel
          Left = 1
          Top = 1
          Width = 160
          Height = 682
          Align = alLeft
          TabOrder = 0
          object Label6: TLabel
            Left = 1
            Top = 1
            Width = 160
            Height = 30
            Align = alTop
            Caption = 'Chebyshev'#8211'Gauss collocation '#13#10'points (no endpoints).'
          end
          object StringGridPoint2: TStringGrid
            Left = 1
            Top = 31
            Width = 158
            Height = 650
            Align = alClient
            TabOrder = 0
          end
        end
        object PanelRight2: TPanel
          Left = 848
          Top = 1
          Width = 209
          Height = 682
          Align = alRight
          TabOrder = 1
          object ScrollBox2: TScrollBox
            Left = 1
            Top = 1
            Width = 207
            Height = 680
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            object Label5: TLabel
              Left = 57
              Top = 250
              Width = 106
              Height = 30
              Caption = 'Polynomial degree '#13#10'(number of modes).'
            end
            object Label9: TLabel
              Left = 16
              Top = 17
              Width = 185
              Height = 15
              Caption = 'Choose the function to interpolate.'
            end
            object Graph2: TButton
              Left = 40
              Top = 431
              Width = 121
              Height = 57
              Caption = 'Plot'
              TabOrder = 0
              OnClick = Graph2Click
            end
            object ListBox2: TListBox
              Left = 24
              Top = 38
              Width = 161
              Height = 185
              ItemHeight = 15
              Items.Strings = (
                '1. exp(alpha*(x^2-1))'
                '2. sin(omega*x)*exp(-x^2)'
                '3. sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)'
                '4. |x - a|'
                '5. |x^2 - a_1| * |x^2 - a_2|'
                '6. |x - a_1| * |x - a_2|')
              TabOrder = 1
              OnClick = ListBox2Click
            end
            object Matrix2: TButton
              Left = 40
              Top = 346
              Width = 121
              Height = 57
              Caption = 'Build matrix'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = Matrix2Click
            end
            object SpinEdit2: TSpinEdit
              Left = 80
              Top = 286
              Width = 49
              Height = 31
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxValue = 100
              MinValue = 1
              ParentFont = False
              TabOrder = 3
              Value = 1
              OnChange = SpinEdit2Change
            end
            object Trans2: TButton
              Left = 32
              Top = 520
              Width = 153
              Height = 57
              Caption = 'Send for comparison>>>'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = Trans2Click
            end
            object ExpCVS2: TButton
              Left = 56
              Top = 608
              Width = 91
              Height = 41
              Caption = 'Export CVS'
              TabOrder = 5
              OnClick = ExpCVS1Click
            end
          end
        end
        object PanelCenter2: TPanel
          Left = 164
          Top = 1
          Width = 681
          Height = 682
          Align = alClient
          TabOrder = 2
          object Splitter9: TSplitter
            Left = 1
            Top = 346
            Width = 679
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 335
          end
          object PanelTop2: TPanel
            Left = 1
            Top = 1
            Width = 679
            Height = 345
            Align = alTop
            TabOrder = 0
            object Label8: TLabel
              Left = 1
              Top = 1
              Width = 223
              Height = 15
              Align = alTop
              Caption = 'Matrix of Chebyshev basis at Gauss nodes.'
            end
            object StringGridMatrix2: TStringGrid
              Left = 1
              Top = 16
              Width = 677
              Height = 328
              Align = alClient
              TabOrder = 0
              ColWidths = (
                64
                64
                64
                64
                64)
              RowHeights = (
                24
                24
                24
                24
                24)
            end
          end
          object PanelBottom2: TPanel
            Left = 1
            Top = 349
            Width = 679
            Height = 332
            Align = alClient
            TabOrder = 1
            object Chart2: TChart
              Left = 1
              Top = 1
              Width = 677
              Height = 330
              Legend.Alignment = laBottom
              Title.Text.Strings = (
                'Chebyshev'#8211'Gauss Interpolation on ['#8722'1,1]')
              View3D = False
              Align = alClient
              TabOrder = 0
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object Series4: TFastLineSeries
                HoverElement = []
                LinePen.Color = 10708548
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series5: TFastLineSeries
                HoverElement = []
                LinePen.Color = 3513587
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series6: TPointSeries
                HoverElement = [heCurrent]
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object points1: TTabSheet
      Caption = 'First kind - Lobatto '
      object PanelMain1: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1056
        ExplicitHeight = 676
        object Splitter4: TSplitter
          Left = 161
          Top = 1
          Height = 682
          ExplicitLeft = 209
        end
        object Splitter5: TSplitter
          Left = 845
          Top = 1
          Height = 682
          Align = alRight
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object PanelLeft1: TPanel
          Left = 1
          Top = 1
          Width = 160
          Height = 682
          Align = alLeft
          Caption = 'PanelLeft'
          Padding.Top = 3
          TabOrder = 0
          ExplicitHeight = 674
          object Label1: TLabel
            Left = 1
            Top = 4
            Width = 158
            Height = 30
            Align = alTop
            Caption = 'Chebyshev'#8211'Lobatto '#13#10'collocation points on [-1,1]'
            ExplicitWidth = 143
          end
          object StringGridPoint1: TStringGrid
            Left = 1
            Top = 34
            Width = 158
            Height = 647
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 639
            RowHeights = (
              24
              24
              24
              28
              24)
          end
        end
        object PanelRight1: TPanel
          Left = 848
          Top = 1
          Width = 209
          Height = 682
          Align = alRight
          TabOrder = 1
          ExplicitLeft = 846
          ExplicitHeight = 674
          object ScrollBox1: TScrollBox
            Left = 1
            Top = 1
            Width = 207
            Height = 680
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitHeight = 672
            object Label3: TLabel
              Left = 14
              Top = 33
              Width = 185
              Height = 15
              Caption = 'Choose the function to interpolate.'
            end
            object Label4: TLabel
              Left = 46
              Top = 261
              Width = 106
              Height = 30
              Caption = 'Polynomial degree'#13#10'(number of modes).'
            end
            object Graph: TButton
              Left = 40
              Top = 463
              Width = 121
              Height = 58
              Caption = 'Plot'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              OnClick = GraphClick
            end
            object ListBox1: TListBox
              Left = 24
              Top = 54
              Width = 161
              Height = 185
              ItemHeight = 15
              Items.Strings = (
                '1. exp(alpha*(x^2-1))'
                '2. sin(omega*x)*exp(-x^2)'
                '3. sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)'
                '4. |x - a|'
                '5. |x^2 - a_1| * |x^2 - a_2|'
                '6. |x - a_1| * |x - a_2|')
              TabOrder = 1
              OnClick = ListBox1Click
            end
            object Matrix: TButton
              Left = 40
              Top = 382
              Width = 121
              Height = 57
              Hint = 'Compute nodes and Gram matrix for the selected function and n.'
              Caption = 'Build matrix'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = MatrixClick
            end
            object SpinEdit1: TSpinEdit
              Left = 80
              Top = 314
              Width = 49
              Height = 31
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxValue = 100
              MinValue = 1
              ParentFont = False
              TabOrder = 3
              Value = 1
              OnChange = SpinEdit1Change
            end
            object trans1: TButton
              Left = 24
              Top = 544
              Width = 153
              Height = 57
              Caption = 'Send for comparison>>>'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = trans1Click
            end
            object ExpCVS1: TButton
              Left = 56
              Top = 616
              Width = 91
              Height = 41
              Caption = 'Export CVS'
              TabOrder = 5
              OnClick = ExpCVS2Click
            end
          end
        end
        object PanelCenter1: TPanel
          Left = 164
          Top = 1
          Width = 681
          Height = 682
          Align = alClient
          TabOrder = 2
          ExplicitWidth = 679
          ExplicitHeight = 674
          object Splitter6: TSplitter
            Left = 1
            Top = 346
            Width = 679
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 335
          end
          object PanelTop1: TPanel
            Left = 1
            Top = 1
            Width = 679
            Height = 345
            Align = alTop
            Caption = 'PanelTop'
            TabOrder = 0
            ExplicitWidth = 677
            object Label2: TLabel
              Left = 1
              Top = 1
              Width = 677
              Height = 15
              Align = alTop
              Caption = 'Matrix of the scaled Chebyshev basis at Lobatto nodes.'
              ExplicitWidth = 289
            end
            object StringGridMatrix1: TStringGrid
              Left = 1
              Top = 16
              Width = 677
              Height = 328
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 675
            end
          end
          object PanelBottom1: TPanel
            Left = 1
            Top = 349
            Width = 679
            Height = 332
            Align = alClient
            Caption = 'PanelBottom'
            TabOrder = 1
            ExplicitWidth = 677
            ExplicitHeight = 324
            object Chart1: TChart
              Left = 1
              Top = 1
              Width = 677
              Height = 330
              Legend.Alignment = laBottom
              Title.Text.Strings = (
                'Chebyshev'#8211'Lobatto Interpolation on ['#8722'1,1]')
              View3D = False
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 675
              ExplicitHeight = 322
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object Series1: TFastLineSeries
                HoverElement = []
                LinePen.Color = 10708548
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series2: TFastLineSeries
                HoverElement = []
                LinePen.Color = 3513587
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series3: TPointSeries
                HoverElement = [heCurrent]
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'First kind - Comparison'
      ImageIndex = 2
      object CPanelMain1: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        object Splitter16: TSplitter
          Left = 1
          Top = 559
          Width = 1056
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitLeft = 138
          ExplicitTop = 1
          ExplicitWidth = 561
        end
        object CPanelBottom1: TPanel
          Left = 1
          Top = 562
          Width = 1056
          Height = 121
          Align = alBottom
          TabOrder = 0
          object lblErrG: TLabel
            Left = 495
            Top = 32
            Width = 108
            Height = 15
            Caption = 'Gauss max |r_G(x)| ='
          end
          object lblErrL: TLabel
            Left = 275
            Top = 34
            Width = 116
            Height = 15
            Caption = 'Lobatto max |r_L(x)| ='
          end
          object lblWinner: TLabel
            Left = 736
            Top = 34
            Width = 158
            Height = 15
            Caption = 'More accurate method: Gauss'
          end
          object Erase: TButton
            Left = 512
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Erase'
            TabOrder = 0
            OnClick = EraseClick
          end
          object BtnExportCSV: TButton
            Left = 688
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Export CSV'
            TabOrder = 1
            OnClick = BtnExportCSVClick
          end
          object tocomp1: TButton
            Left = 819
            Top = 72
            Width = 118
            Height = 25
            Caption = 'Send to Both-Kinds'
            TabOrder = 2
            OnClick = tocomp1Click
          end
        end
        object CPanelCenter1: TPanel
          Left = 1
          Top = 1
          Width = 1056
          Height = 558
          Align = alClient
          TabOrder = 1
          object Chart4: TChart
            Left = 1
            Top = 1
            Width = 1054
            Height = 556
            Legend.Alignment = laBottom
            Title.Text.Strings = (
              'Comparison of First kind Lobatto and Gauss Interpolants')
            RightAxis.AxisValuesFormat = '0.00E-00'
            View3D = False
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            PrintMargins = (
              15
              22
              15
              22)
            ColorPaletteIndex = 13
            object Series10: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlue
              Title = 'orig'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series11: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clRed
              Title = 'p1ord'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series12: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt1ord'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series13: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlack
              Title = 'p2ord'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series14: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt2ord'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series15: TFastLineSeries
              HoverElement = []
              SeriesColor = 12615680
              Title = 'r_L(x)'
              LinePen.Color = 12615680
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series16: TFastLineSeries
              HoverElement = []
              SeriesColor = 4227327
              Title = 'r_G(x)'
              LinePen.Color = 4227327
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
          end
        end
      end
    end
    object SecondGauss: TTabSheet
      Caption = 'Second kind '#8211' Gauss'
      ImageIndex = 3
      object PanelMain3: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1056
        ExplicitHeight = 676
        object Splitter10: TSplitter
          Left = 161
          Top = 1
          Height = 682
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object Splitter11: TSplitter
          Left = 845
          Top = 1
          Height = 682
          Align = alRight
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object PanelLeft3: TPanel
          Left = 1
          Top = 1
          Width = 160
          Height = 682
          Align = alLeft
          TabOrder = 0
          ExplicitHeight = 674
          object Label7: TLabel
            Left = 1
            Top = 1
            Width = 135
            Height = 30
            Align = alTop
            Caption = 'Chebyshev nodes of '#13#10'the second kind on ['#8722'1,1]'
          end
          object StringGridU2: TStringGrid
            Left = 1
            Top = 31
            Width = 158
            Height = 650
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 642
          end
        end
        object PanelRight3: TPanel
          Left = 848
          Top = 1
          Width = 209
          Height = 682
          Align = alRight
          TabOrder = 1
          ExplicitLeft = 846
          ExplicitHeight = 674
          object ScrollBox3: TScrollBox
            Left = 1
            Top = 1
            Width = 207
            Height = 680
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitHeight = 672
            object Label10: TLabel
              Left = 62
              Top = 266
              Width = 106
              Height = 30
              Caption = 'Polynomial degree '#13#10'(number of modes).'
            end
            object Label11: TLabel
              Left = 16
              Top = 27
              Width = 185
              Height = 15
              Caption = 'Choose the function to interpolate.'
            end
            object ListBox3: TListBox
              Left = 24
              Top = 48
              Width = 169
              Height = 185
              ItemHeight = 15
              Items.Strings = (
                '1. exp(alpha*(x^2-1))'
                '2. sin(omega*x)*exp(-x^2)'
                '3. sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)'
                '4. |x - a|'
                '5. |x^2 - a_1| * |x^2 - a_2|'
                '6. |x - a_1| * |x - a_2|')
              TabOrder = 0
              OnClick = ListBox3Click
            end
            object Matrix3: TButton
              Left = 48
              Top = 372
              Width = 121
              Height = 57
              Hint = 'Compute nodes and Gram matrix for the selected function and n.'
              Caption = 'Build matrix'
              TabOrder = 1
              OnClick = Matrix3Click
            end
            object Plot: TButton
              Left = 48
              Top = 447
              Width = 121
              Height = 57
              Caption = 'Plot'
              TabOrder = 2
              OnClick = PlotClick
            end
            object SpinEdit3: TSpinEdit
              Left = 88
              Top = 325
              Width = 49
              Height = 31
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxValue = 100
              MinValue = 1
              ParentFont = False
              TabOrder = 3
              Value = 1
              OnChange = SpinEdit3Change
            end
            object stran2: TButton
              Left = 32
              Top = 528
              Width = 153
              Height = 57
              Caption = 'Send for comparison>>>'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = stran1Click
            end
            object ExpCVS3: TButton
              Left = 64
              Top = 608
              Width = 91
              Height = 41
              Caption = 'Export CVS'
              TabOrder = 5
              OnClick = ExpCVS3Click
            end
          end
        end
        object PanelCenter3: TPanel
          Left = 164
          Top = 1
          Width = 681
          Height = 682
          Align = alClient
          TabOrder = 2
          ExplicitWidth = 679
          ExplicitHeight = 674
          object Splitter12: TSplitter
            Left = 1
            Top = 346
            Width = 679
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 335
          end
          object PanelTop3: TPanel
            Left = 1
            Top = 1
            Width = 679
            Height = 345
            Align = alTop
            TabOrder = 0
            ExplicitWidth = 677
            object Label12: TLabel
              Left = 1
              Top = 1
              Width = 282
              Height = 15
              Align = alTop
              Caption = 'Matrix for Chebyshev polynomials of the second kind'
            end
            object StringGridMatrixU2: TStringGrid
              Left = 1
              Top = 16
              Width = 677
              Height = 328
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 675
            end
          end
          object PanelBottom3: TPanel
            Left = 1
            Top = 349
            Width = 679
            Height = 332
            Align = alClient
            TabOrder = 1
            ExplicitWidth = 677
            ExplicitHeight = 324
            object Chart3: TChart
              Left = 1
              Top = 1
              Width = 677
              Height = 330
              Legend.Alignment = laBottom
              Title.Text.Strings = (
                
                  'Chebyshev Polynomials of the Second Kind '#8211' Interpolation on ['#8722'1,' +
                  '1]')
              View3D = False
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 675
              ExplicitHeight = 322
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object Series7: TFastLineSeries
                HoverElement = []
                LinePen.Color = 10708548
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series8: TFastLineSeries
                HoverElement = []
                LinePen.Color = 3513587
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object Series9: TPointSeries
                HoverElement = [heCurrent]
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object SecondLobatto: TTabSheet
      Caption = 'Second kind '#8211' Lobatto'
      ImageIndex = 4
      object PanelMain4: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        object Splitter13: TSplitter
          Left = 161
          Top = 1
          Height = 682
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object Splitter14: TSplitter
          Left = 845
          Top = 1
          Height = 682
          Align = alRight
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object PanelLeft4: TPanel
          Left = 1
          Top = 1
          Width = 160
          Height = 682
          Align = alLeft
          TabOrder = 0
          object Label17: TLabel
            Left = 1
            Top = 1
            Width = 135
            Height = 30
            Align = alTop
            Caption = 'Chebyshev nodes of '#13#10'the second kind on ['#8722'1,1]'
          end
          object StringGrid1: TStringGrid
            Left = 1
            Top = 31
            Width = 158
            Height = 650
            Align = alClient
            TabOrder = 0
          end
        end
        object PanelRight4: TPanel
          Left = 848
          Top = 1
          Width = 209
          Height = 682
          Align = alRight
          TabOrder = 1
          object ScrollBox4: TScrollBox
            Left = 1
            Top = 1
            Width = 207
            Height = 680
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            object Label18: TLabel
              Left = 62
              Top = 266
              Width = 106
              Height = 30
              Caption = 'Polynomial degree '#13#10'(number of modes).'
            end
            object Label19: TLabel
              Left = 16
              Top = 27
              Width = 185
              Height = 15
              Caption = 'Choose the function to interpolate.'
            end
            object ListBox4: TListBox
              Left = 24
              Top = 48
              Width = 169
              Height = 185
              ItemHeight = 15
              Items.Strings = (
                '1. exp(alpha*(x^2-1))'
                '2. sin(omega*x)*exp(-x^2)'
                '3. sin(3*pi*x)*cos(2*pi*x^2)+0.3*sin(6*pi*|x|)'
                '4. |x - a|'
                '5. |x^2 - a_1| * |x^2 - a_2|'
                '6. |x - a_1| * |x - a_2|')
              TabOrder = 0
              OnClick = ListBox4Click
            end
            object Matrix4: TButton
              Left = 48
              Top = 372
              Width = 121
              Height = 57
              Hint = 'Compute nodes and Gram matrix for the selected function and n.'
              Caption = 'Build matrix'
              TabOrder = 1
              OnClick = Matrix4Click
            end
            object Plot2: TButton
              Left = 48
              Top = 447
              Width = 121
              Height = 57
              Caption = 'Plot'
              TabOrder = 2
              OnClick = Plot2Click
            end
            object SpinEdit4: TSpinEdit
              Left = 88
              Top = 325
              Width = 49
              Height = 31
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxValue = 100
              MinValue = 1
              ParentFont = False
              TabOrder = 3
              Value = 1
              OnChange = SpinEdit4Change
            end
            object stran1: TButton
              Left = 32
              Top = 520
              Width = 153
              Height = 57
              Caption = 'Send for comparison>>>'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = stran2Click
            end
            object ExpCVS4: TButton
              Left = 64
              Top = 608
              Width = 91
              Height = 41
              Caption = 'Export CVS'
              TabOrder = 5
              OnClick = ExpCVS4Click
            end
          end
        end
        object PanelCenter4: TPanel
          Left = 164
          Top = 1
          Width = 681
          Height = 682
          Align = alClient
          TabOrder = 2
          object Splitter15: TSplitter
            Left = 1
            Top = 346
            Width = 679
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 335
          end
          object PanelTop4: TPanel
            Left = 1
            Top = 1
            Width = 679
            Height = 345
            Align = alTop
            TabOrder = 0
            object Label20: TLabel
              Left = 1
              Top = 1
              Width = 282
              Height = 15
              Align = alTop
              Caption = 'Matrix for Chebyshev polynomials of the second kind'
            end
            object StringGrid2: TStringGrid
              Left = 1
              Top = 16
              Width = 677
              Height = 328
              Align = alClient
              TabOrder = 0
            end
          end
          object PanelBottom4: TPanel
            Left = 1
            Top = 349
            Width = 679
            Height = 332
            Align = alClient
            TabOrder = 1
            object Chart5: TChart
              Left = 1
              Top = 1
              Width = 677
              Height = 330
              Legend.Alignment = laBottom
              Title.Text.Strings = (
                
                  'Chebyshev Polynomials of the Second Kind '#8211' Interpolation on ['#8722'1,' +
                  '1]')
              View3D = False
              Align = alClient
              TabOrder = 0
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object FastLineSeries1: TFastLineSeries
                HoverElement = []
                LinePen.Color = 10708548
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object FastLineSeries2: TFastLineSeries
                HoverElement = []
                LinePen.Color = 3513587
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object PointSeries1: TPointSeries
                HoverElement = [heCurrent]
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object SecondComparison: TTabSheet
      Caption = 'Second kind '#8211' Comparison'
      ImageIndex = 6
      object CPanelMain2: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        object Splitter17: TSplitter
          Left = 1
          Top = 559
          Width = 1056
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitLeft = 138
          ExplicitTop = 1
          ExplicitWidth = 561
        end
        object CPanelBottom2: TPanel
          Left = 1
          Top = 562
          Width = 1056
          Height = 121
          Align = alBottom
          TabOrder = 0
          object Label21: TLabel
            Left = 495
            Top = 32
            Width = 108
            Height = 15
            Caption = 'Gauss max |r_G(x)| ='
          end
          object Label22: TLabel
            Left = 275
            Top = 34
            Width = 116
            Height = 15
            Caption = 'Lobatto max |r_L(x)| ='
          end
          object Label23: TLabel
            Left = 736
            Top = 34
            Width = 158
            Height = 15
            Caption = 'More accurate method: Gauss'
          end
          object Erase2: TButton
            Left = 512
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Erase'
            TabOrder = 0
            OnClick = Erase2Click
          end
          object BtnExportCSV2: TButton
            Left = 688
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Export CSV'
            TabOrder = 1
            OnClick = BtnExportCSV2Click
          end
          object tocomp2: TButton
            Left = 819
            Top = 72
            Width = 118
            Height = 25
            Caption = 'Send to Both-Kinds'
            TabOrder = 2
            OnClick = tocomp2Click
          end
        end
        object CPanelCenter2: TPanel
          Left = 1
          Top = 1
          Width = 1056
          Height = 558
          Align = alClient
          TabOrder = 1
          object Chart6: TChart
            Left = 1
            Top = 1
            Width = 1054
            Height = 556
            Legend.Alignment = laBottom
            Title.Text.Strings = (
              'Comparison of Second Kind Lobatto and Gauss Interpolants')
            RightAxis.AxisValuesFormat = '0.00E-00'
            View3D = False
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            PrintMargins = (
              15
              22
              15
              22)
            ColorPaletteIndex = 13
            object LineSeries1: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlue
              Title = 'orig2'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object LineSeries2: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clRed
              Title = 'p1ord2'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object PointSeries2: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt1ord2'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object LineSeries3: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlack
              Title = 'p2ord2'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object PointSeries3: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt2ord2'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object FastLineSeries3: TFastLineSeries
              HoverElement = []
              SeriesColor = 12615680
              Title = 'r_L(x)2'
              LinePen.Color = 12615680
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object FastLineSeries4: TFastLineSeries
              HoverElement = []
              SeriesColor = 4227327
              Title = 'r_G(x)2'
              LinePen.Color = 4227327
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Comparison of both kinds'
      ImageIndex = 7
      object CPanelMain3: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 684
        Align = alClient
        TabOrder = 0
        object Splitter18: TSplitter
          Left = 1
          Top = 559
          Width = 1056
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitLeft = 138
          ExplicitTop = 1
          ExplicitWidth = 561
        end
        object CPanelBottom3: TPanel
          Left = 1
          Top = 562
          Width = 1056
          Height = 121
          Align = alBottom
          TabOrder = 0
          object FirstGaussmax: TLabel
            Left = 59
            Top = 55
            Width = 163
            Height = 15
            Caption = 'First Kind  Gauss max |r_G(x)| ='
          end
          object FirstLobattomax: TLabel
            Left = 59
            Top = 26
            Width = 168
            Height = 15
            Caption = 'First Kind Lobatto max |r_L(x)| ='
          end
          object bestmethod: TLabel
            Left = 600
            Top = 42
            Width = 158
            Height = 15
            Caption = 'More accurate method: Gauss'
          end
          object SecondLobattolmax: TLabel
            Left = 307
            Top = 28
            Width = 184
            Height = 15
            Caption = 'Second kind Lobatto max |r_L(x)| ='
          end
          object SecondGaussmax: TLabel
            Left = 307
            Top = 57
            Width = 176
            Height = 15
            Caption = 'Second kind Gauss max |r_G(x)| ='
          end
          object Erase3: TButton
            Left = 888
            Top = 32
            Width = 75
            Height = 25
            Caption = 'Erase'
            TabOrder = 0
            OnClick = Erase3Click
          end
          object BtnExportCSV3: TButton
            Left = 888
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Export CSV'
            TabOrder = 1
            OnClick = BtnExportCSV3Click
          end
        end
        object CPanelCenter3: TPanel
          Left = 1
          Top = 1
          Width = 1056
          Height = 558
          Align = alClient
          TabOrder = 1
          object Chart7: TChart
            Left = 1
            Top = 1
            Width = 1054
            Height = 556
            Legend.Alignment = laBottom
            Title.Text.Strings = (
              
                'Comparison of First and Second kind Lobatto and Gauss Interpolan' +
                'ts')
            RightAxis.AxisValuesFormat = '0.00E-00'
            View3D = False
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            PrintMargins = (
              15
              22
              15
              22)
            ColorPaletteIndex = 13
            object LineSeries4: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlue
              Title = 'orig'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object LineSeries5: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clRed
              Title = 'p1ord2'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object PointSeries4: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt1ord2'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object LineSeries6: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlack
              Title = 'p2ord2'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object PointSeries5: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt2ord2'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object FastLineSeries5: TFastLineSeries
              HoverElement = []
              SeriesColor = 12615680
              Title = 'r_L(x)2'
              LinePen.Color = 12615680
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object FastLineSeries6: TFastLineSeries
              HoverElement = []
              SeriesColor = 4227327
              Title = 'r_G(x)2'
              LinePen.Color = 4227327
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series17: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clRed
              Title = 'p1ord1'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series18: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt1ord1'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series19: TLineSeries
              HoverElement = [heCurrent]
              SeriesColor = clBlack
              Title = 'p2ord1'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series20: TPointSeries
              HoverElement = [heCurrent]
              Title = 'pt2ord1'
              ClickableLine = False
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series21: TFastLineSeries
              HoverElement = []
              SeriesColor = 12615680
              Title = 'r_L(x)1'
              LinePen.Color = 12615680
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series22: TFastLineSeries
              HoverElement = []
              SeriesColor = 4227327
              Title = 'r_G(x)1'
              LinePen.Color = 4227327
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 7
      object StringGrid3: TStringGrid
        Left = 3
        Top = 0
        Width = 1038
        Height = 337
        TabOrder = 0
      end
      object StringGrid4: TStringGrid
        Left = 3
        Top = 344
        Width = 1038
        Height = 337
        TabOrder = 1
      end
    end
  end
end
