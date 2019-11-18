{******************************************************************************}
{                                                                              }
{       FontIcon Editor: A font icon helper for Delphi                         }
{                                                                              }
{       Copyright (c) 2019 Luca Minut                                          }
{                                                                              }
{       https://github.com/lminuti/FontIconEditor                              }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}
unit FontIcon.Picker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI, Vcl.ExtCtrls;

type
  TfrmFontIconPicker = class(TForm)
    Label1: TLabel;
    cmbFonts: TComboBox;
    Button1: TButton;
    btnCancel: TButton;
    edtChar: TEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Image16x16: TImage;
    Panel32x32: TPanel;
    Image32x32: TImage;
    Panel64x64: TPanel;
    Image64x64: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtColor: TColorBox;
    procedure FormCreate(Sender: TObject);
    procedure edtCharChange(Sender: TObject);
    procedure cmbFontsChange(Sender: TObject);
    procedure edtCharKeyPress(Sender: TObject; var Key: Char);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtColorChange(Sender: TObject);
  private
    FChar: string;
    FFontName: string;
    FFontColor: TColor;
    procedure UpdatePreview;
  public
    property FontName: string read FFontName;
    property FontColor: TColor read FFontColor;
    property Character: string read FChar;
  end;

var
  frmFontIconPicker: TfrmFontIconPicker;

procedure CopyIconFont(const FontName, Character: string; Width, Height: Integer; Color: TColor; Canvas: TCanvas);

implementation

{$R *.dfm}

const
  DefaultFont = 'Segoe MDL2 Assets';

procedure CopyIconFont(const FontName, Character: string; Width, Height: Integer; Color: TColor; Canvas: TCanvas);
var
  CharWidth: Integer;
  CharHeight: Integer;
begin
  Canvas.Font.Name := FontName;
  Canvas.Font.Height := Height;
  Canvas.Font.Color := Color;
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  CharWidth := Canvas.TextWidth(Character);
  CharHeight := Canvas.TextHeight(Character);
  Canvas.TextOut((Width - CharWidth) div 2, (Height - CharHeight) div 2, Character);
end;

procedure TfrmFontIconPicker.Button1Click(Sender: TObject);
begin
  FFontName := cmbFonts.Text;
  FFontColor := edtColor.Selected;
end;

procedure TfrmFontIconPicker.cmbFontsChange(Sender: TObject);
begin
  UpdatePreview;
end;

procedure TfrmFontIconPicker.edtCharChange(Sender: TObject);
begin
  if Length(edtChar.Text) = 4 then
  begin
    FChar := Chr(StrToInt('$' + edtChar.Text));
    UpdatePreview;
  end;
end;

procedure TfrmFontIconPicker.edtCharKeyPress(Sender: TObject; var Key: Char);
begin
  if Key < #32 then
    Exit;

  if Pos(UpperCase(Key), '0123456789ABCDEF') < 1 then
    Key := #0;
end;

procedure TfrmFontIconPicker.edtColorChange(Sender: TObject);
begin
  UpdatePreview;
end;

procedure TfrmFontIconPicker.FormCreate(Sender: TObject);
begin
  cmbFonts.Items := Screen.Fonts;
  edtColor.Selected := clBlack;
  if cmbFonts.Items.IndexOf(DefaultFont) > 0 then
  begin
    cmbFonts.Text := DefaultFont;
    edtChar.Text := 'E8EF';
  end
  else
  begin
    cmbFonts.Text := Font.Name;
    edtChar.Text := '00B6';
  end;
  FChar := Chr(StrToInt('$' + edtChar.Text));
  UpdatePreview;
end;

procedure TfrmFontIconPicker.Label2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://docs.microsoft.com/it-it/windows/uwp/design/style/segoe-ui-symbol-font', '', '', SW_SHOWNORMAL);
end;

procedure TfrmFontIconPicker.Label4Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'charmap', '', '', SW_SHOWNORMAL);
end;

procedure TfrmFontIconPicker.UpdatePreview;
begin
  CopyIconFont(cmbFonts.Text, FChar, 16, 16, edtColor.Selected, Image16x16.Canvas);

  CopyIconFont(cmbFonts.Text, FChar, 32, 32, edtColor.Selected, Image32x32.Canvas);

  CopyIconFont(cmbFonts.Text, FChar, 64, 64, edtColor.Selected, Image64x64.Canvas);

end;

end.
