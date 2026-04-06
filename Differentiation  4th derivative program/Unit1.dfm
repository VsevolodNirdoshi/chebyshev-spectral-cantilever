object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 688
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1097
    Height = 688
    ActivePage = TabFourthSpectral
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1095
    ExplicitHeight = 680
    object TabLobatto: TTabSheet
      Caption = 'TabLobatto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object Splitter1: TSplitter
        Left = 300
        Top = 0
        Height = 648
        ExplicitLeft = 296
        ExplicitTop = 280
        ExplicitHeight = 100
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 648
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Chebyshev-Lobatto Nodes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 222
        end
        object Label2: TLabel
          Left = 1
          Top = 26
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Order N:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 72
        end
        object Label3: TLabel
          Left = 1
          Top = 86
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Function:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 77
        end
        object SpinEdit1: TSpinEdit
          Left = 1
          Top = 51
          Width = 298
          Height = 35
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxValue = 100
          MinValue = 2
          ParentFont = False
          TabOrder = 0
          Value = 2
          OnChange = SpinEdit1Change
        end
        object ListBoxFunc: TListBox
          Left = 1
          Top = 111
          Width = 298
          Height = 137
          Align = alTop
          ItemHeight = 25
          Items.Strings = (
            '1. x'#178
            '2. exp(10*(x'#178'-1))'
            '3. sin(50x)'#183'exp(-x'#178')'
            '4. sin(3'#960'x)'#183'cos(2'#960'x'#178') + 0.3'#183'sin(6'#960'|x|)')
          TabOrder = 1
        end
        object Button1: TButton
          Left = 1
          Top = 248
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Compute'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 1
          Top = 298
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Plot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button2Click
        end
        object CheckBoxIntLobatto: TCheckBox
          Left = 1
          Top = 398
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Nodal integration'
          TabOrder = 4
          OnClick = CheckBoxIntLobattoClick
        end
        object CheckBox1: TCheckBox
          Left = 1
          Top = 348
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Nodal derivative'
          TabOrder = 5
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 1
          Top = 448
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Spectral derivative'
          TabOrder = 6
          OnClick = CheckBox2Click
        end
        object CheckBox3: TCheckBox
          Left = 1
          Top = 498
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Spectral integration'
          TabOrder = 7
          OnClick = CheckBox3Click
        end
      end
      object Panel2: TPanel
        Left = 303
        Top = 0
        Width = 786
        Height = 648
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 1
        object Chart1: TChart
          Left = 1
          Top = 1
          Width = 784
          Height = 646
          Legend.Alignment = laBottom
          Title.CustomPosition = True
          Title.Left = 350
          Title.Text.Strings = (
            'ChartLobatto')
          Title.TextAlignment = taLeftJustify
          Title.Top = 10
          Title.VertMargin = 13
          View3D = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            4
            15
            4)
          ColorPaletteIndex = 13
          object Series1: TFastLineSeries
            HoverElement = []
            Title = 'SeriesFunc'
            LinePen.Color = clGreen
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series2: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clLime
            Title = 'SeriesDerivAnalyt'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series3: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = 16384
            Title = 'SeriesDerivNum'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series4: TPointSeries
            HoverElement = [heCurrent]
            Title = 'SeriesNodes'
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesInt1: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = 33023
            Title = 'SeriesInt1'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesError1: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clRed
            Title = 'SeriesError1'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesSpectralDerivLobatto: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesSpectralDerivLobatto'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesSpectralPointsLobatto: TPointSeries
            HoverElement = [heCurrent]
            Title = 'SeriesSpectralPointsLobatto'
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesIntSpectralLobatto: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesIntSpectralLobatto'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesErrorSpectralLobatto: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesErrorSpectralLobatto'
            Brush.BackColor = clDefault
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
    object TabGauss: TTabSheet
      Caption = 'TabGauss'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Splitter2: TSplitter
        Left = 300
        Top = 0
        Height = 648
        ExplicitLeft = 308
        ExplicitHeight = 726
      end
      object Panel3: TPanel
        Left = 303
        Top = 0
        Width = 786
        Height = 648
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 0
        object Chart2: TChart
          Left = 1
          Top = 1
          Width = 784
          Height = 646
          Legend.Alignment = laBottom
          Title.Text.Strings = (
            'Gauss (N points)')
          View3D = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series5: TFastLineSeries
            HoverElement = []
            Title = 'SeriesGaussFunc'
            LinePen.Color = 10708548
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series6: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clLime
            Title = 'SeriesGaussDerivAnalyt'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series7: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = 16384
            Title = 'SeriesGaussDerivNum'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series8: TPointSeries
            HoverElement = [heCurrent]
            Title = 'SeriesGaussNodes'
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesInt2: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = 33023
            Title = 'SeriesInt2'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesError2: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clRed
            Title = 'SeriesError2'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesSpectralDerivGauss: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesSpectralDerivGauss'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesSpectralPointsGauss: TPointSeries
            HoverElement = [heCurrent]
            Title = 'SeriesSpectralPointsGauss'
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesIntSpectralGauss: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesIntSpectralGauss'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesErrorSpectralGauss: TLineSeries
            HoverElement = [heCurrent]
            Title = 'SeriesErrorSpectralGauss'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 648
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 1
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Chebyshev-Gauss Nodes '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 213
        end
        object Label5: TLabel
          Left = 1
          Top = 26
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Order N:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 72
        end
        object Label6: TLabel
          Left = 1
          Top = 86
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Function:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 77
        end
        object SpinEdit2: TSpinEdit
          Left = 1
          Top = 51
          Width = 298
          Height = 35
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxValue = 100
          MinValue = 2
          ParentFont = False
          TabOrder = 0
          Value = 2
          OnChange = SpinEdit2Change
        end
        object ListBox2: TListBox
          Left = 1
          Top = 111
          Width = 298
          Height = 137
          Align = alTop
          ItemHeight = 25
          Items.Strings = (
            '1. x'#178
            '2. exp(10*(x'#178'-1))'
            '3. sin(50x)'#183'exp(-x'#178')'
            '4. sin(3'#960'x)'#183'cos(2'#960'x'#178') + 0.3'#183'sin(6'#960'|x|)')
          TabOrder = 1
        end
        object Button4: TButton
          Left = 1
          Top = 248
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Compute'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 1
          Top = 298
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Plot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button5Click
        end
        object CheckBoxIntGauss: TCheckBox
          Left = 1
          Top = 398
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Nodal integration'
          TabOrder = 4
          OnClick = CheckBoxIntGaussClick
        end
        object CheckBox4: TCheckBox
          Left = 1
          Top = 348
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Nodal derivative'
          TabOrder = 5
          OnClick = CheckBox4Click
        end
        object CheckBox5: TCheckBox
          Left = 1
          Top = 448
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Spectral derivative'
          TabOrder = 6
          OnClick = CheckBox5Click
        end
        object CheckBox6: TCheckBox
          Left = 1
          Top = 498
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Spectral integration'
          TabOrder = 7
          OnClick = CheckBox6Click
        end
      end
    end
    object TabSecondKind: TTabSheet
      Caption = 'TabSecondKind'
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 300
        Top = 0
        Height = 648
        ExplicitLeft = 308
        ExplicitHeight = 726
      end
      object Panel5: TPanel
        Left = 303
        Top = 0
        Width = 786
        Height = 648
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 0
        object Chart3: TChart
          Left = 1
          Top = 1
          Width = 784
          Height = 646
          Legend.Alignment = laBottom
          Title.Text.Strings = (
            'ChartSecond')
          View3D = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series9: TFastLineSeries
            HoverElement = []
            Title = 'SeriesSecondFunc'
            LinePen.Color = 10708548
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series10: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clLime
            Title = 'SeriesSecondDerivAnalyt'
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
            SeriesColor = 16384
            Title = 'SeriesSecondDerivNum'
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
            Title = 'SeriesSecondNodes'
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesInt3: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = 33023
            Title = 'SeriesInt3'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object SeriesError3: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clRed
            Title = 'SeriesError3'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 648
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 1
        object Label7: TLabel
          Left = 1
          Top = 1
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Chebyshev Polynomials of Second Kind'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 329
        end
        object Label8: TLabel
          Left = 1
          Top = 26
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Order N:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 72
        end
        object Label9: TLabel
          Left = 1
          Top = 86
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Function:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 77
        end
        object SpinEdit3: TSpinEdit
          Left = 1
          Top = 51
          Width = 298
          Height = 35
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxValue = 100
          MinValue = 2
          ParentFont = False
          TabOrder = 0
          Value = 2
          OnChange = SpinEdit3Change
        end
        object ListBox3: TListBox
          Left = 1
          Top = 111
          Width = 298
          Height = 137
          Align = alTop
          ItemHeight = 25
          Items.Strings = (
            '1. x'#178
            '2. exp(10*(x'#178'-1))'
            '3. sin(50x)'#183'exp(-x'#178')'
            '4. sin(3'#960'x)'#183'cos(2'#960'x'#178') + 0.3'#183'sin(6'#960'|x|)')
          TabOrder = 1
        end
        object Button7: TButton
          Left = 1
          Top = 248
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Compute'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 1
          Top = 298
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Plot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button8Click
        end
        object CheckBoxIntSecond: TCheckBox
          Left = 1
          Top = 398
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Integrate'
          TabOrder = 4
          OnClick = CheckBoxIntSecondClick
        end
        object CheckBox7: TCheckBox
          Left = 1
          Top = 498
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'CheckBox7'
          TabOrder = 5
        end
        object CheckBox8: TCheckBox
          Left = 1
          Top = 448
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'CheckBox7'
          TabOrder = 6
        end
        object CheckBox9: TCheckBox
          Left = 1
          Top = 348
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'CheckBox7'
          TabOrder = 7
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabMatrix'
      ImageIndex = 3
      object LabelMatrixInfo: TLabel
        Left = 0
        Top = 0
        Width = 132
        Height = 25
        Align = alTop
        Caption = 'LabelMatrixInfo'
      end
      object PanelMatrixTop: TPanel
        Left = 0
        Top = 25
        Width = 1089
        Height = 120
        Align = alTop
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'PanelMatrixTop'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object RadioGroupMatrixType: TRadioGroup
          Left = 1
          Top = 1
          Width = 808
          Height = 118
          Align = alLeft
          Caption = 'RadioGroupMatrixType'
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 2
          Items.Strings = (
            'Lobatto (N+1 points)'
            'Gauss (N points)'
            'Second Kind (N points)')
          ParentFont = False
          TabOrder = 0
        end
        object SpinEdit4: TSpinEdit
          Left = 815
          Top = 38
          Width = 273
          Height = 35
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxValue = 100
          MinValue = 2
          ParentFont = False
          TabOrder = 1
          Value = 2
          OnChange = SpinEdit4Change
        end
      end
      object PanelMatrixBottom: TPanel
        Left = 0
        Top = 145
        Width = 1089
        Height = 503
        Align = alClient
        TabOrder = 1
        object Button10: TButton
          Left = 1
          Top = 402
          Width = 1087
          Height = 25
          Align = alBottom
          Caption = 'Differentiation Matrix'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button10Click
        end
        object ButtonShowPseudoInv: TButton
          Left = 1
          Top = 427
          Width = 1087
          Height = 25
          Align = alBottom
          Caption = ' Moore-Penrose Pseudo-Inverse'
          TabOrder = 1
          OnClick = ButtonShowPseudoInvClick
        end
        object StringGridMatrix: TStringGrid
          Left = 1
          Top = 1
          Width = 1087
          Height = 401
          Align = alClient
          TabOrder = 2
        end
        object Button11: TButton
          Left = 1
          Top = 452
          Width = 1087
          Height = 25
          Align = alBottom
          Caption = 'Spectral Diff Matrix'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button11Click
        end
        object Button12: TButton
          Left = 1
          Top = 477
          Width = 1087
          Height = 25
          Align = alBottom
          Caption = 'Spectral Int Matrix'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = Button12Click
        end
      end
    end
    object TabFourthSpectral: TTabSheet
      Caption = '4th Spectral Diff-Int'
      ImageIndex = 4
      object Splitter4: TSplitter
        Left = 300
        Top = 0
        Height = 648
        ExplicitLeft = 308
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 648
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 640
        object LabelFourthGrid: TLabel
          Left = 1
          Top = 1
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Grid type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 77
        end
        object LabelFourthN: TLabel
          Left = 1
          Top = 76
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Order N:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 72
        end
        object LabelFourthFunc: TLabel
          Left = 1
          Top = 136
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Function:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 77
        end
        object SpinEditFourthN: TSpinEdit
          Left = 1
          Top = 101
          Width = 298
          Height = 35
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxValue = 100
          MinValue = 4
          ParentFont = False
          TabOrder = 0
          Value = 4
          OnChange = SpinEdit2Change
        end
        object ListBoxFourthFunc: TListBox
          Left = 1
          Top = 161
          Width = 298
          Height = 137
          Align = alTop
          ItemHeight = 25
          Items.Strings = (
            '1. x'#178
            '2. exp(10*(x'#178'-1))'
            '3. sin(50x)'#183'exp(-x'#178')'
            '4. sin(3'#960'x)'#183'cos(2'#960'x'#178') + 0.3'#183'sin(6'#960'|x|)')
          TabOrder = 1
        end
        object ButtonFourthCompute: TButton
          Left = 1
          Top = 298
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Compute'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = ButtonFourthComputeClick
        end
        object ButtonFourthPlot: TButton
          Left = 1
          Top = 348
          Width = 298
          Height = 50
          Align = alTop
          Caption = 'Plot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button5Click
        end
        object CheckBoxFourthShowDeriv4: TCheckBox
          Left = 1
          Top = 404
          Width = 298
          Height = 50
          Caption = 'Show 4th derivative f'#39#39#39#39'(x)'
          TabOrder = 4
          OnClick = CheckBoxFourthShowDeriv4Click
        end
        object CheckBoxFourthShowRecon: TCheckBox
          Left = 0
          Top = 442
          Width = 298
          Height = 50
          Caption = 'Show 4th integration p_rec(x)'
          TabOrder = 5
          OnClick = CheckBoxFourthShowReconClick
        end
        object RadioFourthGauss: TRadioButton
          Left = 1
          Top = 26
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Gauss (1st kind)'
          TabOrder = 6
        end
        object RadioFourthLobatto: TRadioButton
          Left = 1
          Top = 51
          Width = 298
          Height = 25
          Align = alTop
          Caption = 'Lobatto (2nd kind)'
          TabOrder = 7
        end
        object CheckBoxFourthShowError: TCheckBox
          Left = 0
          Top = 482
          Width = 298
          Height = 50
          Caption = 'Show error f'#39#39#39#39'(x) - p_rec(x)'
          TabOrder = 8
          OnClick = CheckBoxFourthShowErrorClick
        end
        object CheckBoxFourthShowInterp: TCheckBox
          Left = 1
          Top = 531
          Width = 264
          Height = 25
          Caption = 'Show interpolant p(x)'
          TabOrder = 9
          OnClick = CheckBoxFourthShowInterpClick
        end
      end
      object Panel8: TPanel
        Left = 303
        Top = 0
        Width = 786
        Height = 648
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 1
        ExplicitWidth = 784
        ExplicitHeight = 640
        object ChartFourth: TChart
          Left = 1
          Top = 1
          Width = 784
          Height = 613
          Legend.Alignment = laBottom
          Title.Text.Strings = (
            'Gauss (N points)')
          View3D = False
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 782
          ExplicitHeight = 605
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object FastLineSeries1: TFastLineSeries
            HoverElement = []
            Title = 'SeriesFourthFunc'
            LinePen.Color = 10708548
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object LineSeries1: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clLime
            Title = 'SeriesFourthDeriv4Analyt'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object PointSeries1: TPointSeries
            HoverElement = [heCurrent]
            Title = 'SeriesFourthNodes'
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
            SeriesColor = 33023
            Title = 'SeriesFourthRecon'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object LineSeries4: TLineSeries
            HoverElement = [heCurrent]
            SeriesColor = clRed
            Title = 'SeriesFourthError'
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
            Title = 'SeriesFourthDeriv4Spectral'
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
            Title = 'SeriesFourthDeriv4Nodes'
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
            SeriesColor = 16711808
            Title = 'LineSeriesDiff'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 614
          Width = 784
          Height = 33
          Align = alBottom
          TabOrder = 1
          ExplicitTop = 606
          ExplicitWidth = 782
          object status: TLabel
            Left = 1
            Top = 1
            Width = 5
            Height = 31
            Align = alLeft
            ExplicitHeight = 25
          end
        end
      end
    end
  end
end
