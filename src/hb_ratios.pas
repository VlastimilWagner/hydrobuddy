unit hb_ratios;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids, customhelpfunctions, hb_constants;

type

  { TRatioForm }

  TRatioForm = class(TForm)
    AddCustomRatioButton: TButton;
    CloseButton: TButton;
    NComboBox: TComboBox;
    KComboBox: TComboBox;
    PComboBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid: TStringGrid;
    procedure AddCustomRatioButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    function getratio(first: string; second: string; third: string; items: integer): string ;
    { private declarations }
  public
    procedure SetPostRatios(WithKCA: boolean);
    { public declarations }
  end; 

var
  RatioForm: TRatioForm;

implementation

{ TRatioForm }

uses HB_Main ;

procedure TRatioForm.CloseButtonClick(Sender: TObject);
begin
  RatioForm.Visible := false ;
end;


procedure TRatioForm.AddCustomRatioButtonClick(Sender: TObject);
var
i : integer ;
j : integer ;
names : array[0..2] of string ;
begin

  names[0] := NComboBox.Items[NComboBox.ItemIndex] ;
  names[1] := KComboBox.Items[KComboBox.ItemIndex] ;
  names[2] := PComboBox.Items[PComboBox.ItemIndex] ;

  StringGrid.Cells[0, StringGrid.RowCount-1] := (names[0] + ': ' + names[1] + ': ' + names[2]) ;
  StringGrid.Cells[1, StringGrid.RowCount-2] := (getratio(names[0], names[1], names[2], 3)) ;

end;

function TRatioForm.getratio(first: string; second: string; third: string; items: integer): string ;
var
  i: integer ;
  j: integer ;
  ratio: array[0..2] of double ;
  temp : array [0..3] of double ;
  names: array[0..3] of string ;
  special: array[0..2] of integer ;
begin

  StringGrid.RowCount := StringGrid.RowCount + 1 ;

  temp[0] := 0 ;
  temp[1] := 0 ;
  temp[2] := 0 ;
  temp[3] := 0 ;

  names[0] := first ;
  names[1] := second ;
  names[2] := third ;

  special[0] := -1 ;
  special[1] := -1 ;
  special[2] := -1 ;

  if (items > 3) or (items < 2) then Result := 'no result' ;

  for i := 0 to 3 do begin
    if names[i] = 'N' then  begin
      names[i] := 'N (NO3-)' ;
      names[3]  := 'N (NH4+)' ;
      special[0] := i ;
    end ;

    if names[i] = 'P2O5' then begin
      names[i] := 'P' ;
      special[1] := i ;
    end ;

    if names[i] = 'K2O' then begin
      names[i] := 'K' ;
      special[2] := i ;
    end ;

  end;

  for i:= 1 to NumOfElements do begin
    for j := 0 to 3 do begin
         if StringGrid.Cells[0,i] = names[j] then temp[j] := StrtoFloatAnySeparator(StringGrid.Cells[1,i]) ;
    end;
  end ;

  if (temp[0] > 0) and (temp[1] > 0) and (temp[2] > 0) then begin
     if (special[0] <> -1) and (names[special[0]] = 'N (NO3-)') then temp[special[0]] := temp[3]+temp[special[0]] ;
     if (special[1] <> -1) and (names[special[1]] = 'P') then temp[special[1]] := temp[special[1]]*2.2915 ;
     if (special[2] <> -1) and (names[special[2]] = 'K') then temp[special[2]] := temp[special[2]]*1.2047 ;

     ratio[0] := 1 ;
     ratio[1] := round2(temp[1]/temp[0],2) ;
     ratio[2] := round2(temp[2]/temp[0],2) ;

     if Items = 2 then Result := FloatToStr(ratio[0]) + ': ' + FloatToStr(ratio[1]) ;
     if Items = 3 then Result := FloatToStr(ratio[0]) + ': ' + FloatToStr(ratio[1]) + ': ' + FloatToStr(ratio[2]) ;
  end;
end;


procedure TRatioForm.SetPostRatios(WithKCA: boolean);
begin
  // post ratios based on results posted on listboxes above
  StringGrid.Cells[0, StringGrid.RowCount - 1] :=('N: P: K') ;
  StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('N', 'P', 'K', 3)) ;
  StringGrid.Cells[0, StringGrid.RowCount - 1] :=('N: P2O5: K2O') ;
  StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('N', 'P2O5', 'K2O', 3)) ;
  StringGrid.Cells[0, StringGrid.RowCount - 1] :=('N: K') ;
  StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('N', 'K', 'K', 2) ) ;
  StringGrid.Cells[0, StringGrid.RowCount - 1] :=('N (NO3-): N (NH4+)') ;
  StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('N (NO3-)', 'N (NH4+)', 'K', 2) ) ;
  StringGrid.Cells[0, StringGrid.RowCount - 1] :=('Ca: Mg') ;
  StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('Ca', 'Mg', 'K', 2) ) ;
  if WithKCA then begin
    StringGrid.Cells[0, StringGrid.RowCount - 1] :=('K: Ca') ;
    StringGrid.Cells[1, StringGrid.RowCount - 2] :=(getratio('K', 'Ca', 'Ca', 2) ) ;
  end;
end;

initialization
  {$I hb_ratios.lrs}

end.

