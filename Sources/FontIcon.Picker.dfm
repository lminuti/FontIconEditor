object frmFontIconPicker: TfrmFontIconPicker
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Icon picker'
  ClientHeight = 398
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    286
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 18
    Width = 22
    Height = 13
    Caption = 'Font'
  end
  object Label3: TLabel
    Left = 16
    Top = 68
    Width = 115
    Height = 13
    Caption = 'Choose character (HEX)'
  end
  object Label2: TLabel
    Left = 16
    Top = 373
    Width = 94
    Height = 13
    Cursor = crHandPoint
    Caption = 'Segoe MDL2 Assets'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object Label4: TLabel
    Left = 16
    Top = 354
    Width = 71
    Height = 13
    Cursor = crHandPoint
    Caption = 'Character map'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label4Click
  end
  object Label8: TLabel
    Left = 16
    Top = 114
    Width = 25
    Height = 13
    Caption = 'Color'
  end
  object cmbFonts: TComboBox
    Left = 16
    Top = 35
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'cmbFonts'
    OnChange = cmbFontsChange
  end
  object Button1: TButton
    Left = 203
    Top = 33
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Insert'
    TabOrder = 4
    OnClick = Button1Click
  end
  object btnCancel: TButton
    Left = 203
    Top = 313
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object edtChar: TEdit
    Left = 16
    Top = 84
    Width = 169
    Height = 21
    Hint = 'Length must be 4'
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 1
    OnChange = edtCharChange
    OnKeyPress = edtCharKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 160
    Width = 169
    Height = 178
    Caption = 'Preview'
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label5: TLabel
      Left = 54
      Top = 30
      Width = 30
      Height = 13
      Caption = '16x16'
    end
    object Label6: TLabel
      Left = 72
      Top = 62
      Width = 30
      Height = 13
      Caption = '32x32'
    end
    object Label7: TLabel
      Left = 100
      Top = 122
      Width = 30
      Height = 13
      Caption = '64x64'
    end
    object Panel1: TPanel
      Left = 16
      Top = 27
      Width = 20
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Panel16x16'
      ShowCaption = False
      TabOrder = 0
      object Image16x16: TImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Align = alClient
        ExplicitLeft = -4
        ExplicitTop = -4
      end
    end
    object Panel32x32: TPanel
      Left = 16
      Top = 53
      Width = 36
      Height = 36
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Panel32x32'
      ShowCaption = False
      TabOrder = 1
      object Image32x32: TImage
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Align = alClient
        ExplicitLeft = -4
        ExplicitTop = -4
        ExplicitWidth = 16
        ExplicitHeight = 16
      end
    end
    object Panel64x64: TPanel
      Left = 16
      Top = 98
      Width = 66
      Height = 66
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Panel64x64'
      ShowCaption = False
      TabOrder = 2
      object Image64x64: TImage
        Left = 0
        Top = 0
        Width = 62
        Height = 62
        Align = alClient
        ExplicitLeft = 24
        ExplicitTop = 8
      end
    end
  end
  object edtColor: TColorBox
    Left = 16
    Top = 131
    Width = 169
    Height = 22
    TabOrder = 2
    OnChange = edtColorChange
  end
  object Button2: TButton
    Left = 203
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 5
  end
end
