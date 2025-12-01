unit hb_comparison;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Grids, StdCtrls;

type

  { TComparisonForm }

  TComparisonForm = class(TForm)
    CloseButton: TButton;
    ClearButton: TButton;
    StringGrid: TStringGrid;
    procedure CloseButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  ComparisonForm: TComparisonForm;

implementation

{ TComparisonForm }

procedure TComparisonForm.ClearButtonClick(Sender: TObject);
begin
  StringGrid.ColCount := 1 ;
end;

procedure TComparisonForm.CloseButtonClick(Sender: TObject);
begin
  ComparisonForm.Visible := false ;
end;

initialization
  {$I hb_comparison.lrs}

end.

