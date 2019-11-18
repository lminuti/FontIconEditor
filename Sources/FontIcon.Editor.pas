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
unit FontIcon.Editor;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls, DesignIntf,
  DesignEditors, ImgEdit;

type
  TImageListCompEditor = class (TComponentEditor)
  private
    procedure AddFontIcon(const FontName, Character: string; Color: TColor);
  public
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

{ TImageListCompEditor }

uses
  FontIcon.Picker;

procedure TImageListCompEditor.Edit;
begin
  inherited;
end;

procedure TImageListCompEditor.AddFontIcon(const FontName, Character: string; Color: TColor);
var
  Bitmap: TBitmap;
  ImageList: TImageList;
begin
  ImageList := Component as TImageList;
  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := ImageList.Width;
    Bitmap.Height := ImageList.Height;
    CopyIconFont(FontName, Character, Bitmap.Width, Bitmap.Height, Color, Bitmap.Canvas);
    ImageList.AddMasked(Bitmap, clWhite);
  finally
    Bitmap.Free;
  end;
end;

procedure TImageListCompEditor.ExecuteVerb(Index: Integer);
begin
  inherited;
  if Index = 0 then
  begin
    if EditImageList(Component as TImageList) then
      Designer.Modified;
  end
  else if Index = 1 then
  begin
    frmFontIconPicker := TfrmFontIconPicker.Create(nil);
    try
      if frmFontIconPicker.ShowModal = mrOk then
      begin
        AddFontIcon(frmFontIconPicker.FontName, frmFontIconPicker.Character, frmFontIconPicker.FontColor);
        Designer.Modified;
      end;
    finally
      frmFontIconPicker.Free;
    end;
  end;
end;

function TImageListCompEditor.GetVerb(Index: Integer): string;
begin
  Result := '';
  case Index of
    0: Result := 'I&mageList Editor...';
    1: Result := 'Add font &icons...';
  end;
end;

function TImageListCompEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

procedure Register;
begin
  RegisterComponentEditor(TImageList, TImageListCompEditor);
end;

end.
