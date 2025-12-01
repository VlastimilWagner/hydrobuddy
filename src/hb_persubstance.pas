unit hb_persubstance;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TPerSubstanceForm }

  TPerSubstanceForm = class(TForm)
    CloseButton: TButton;
    StringGrid: TStringGrid;
    procedure CloseButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  PerSubstanceForm: TPerSubstanceForm;

implementation

{ TPerSubstanceForm }

procedure TPerSubstanceForm.CloseButtonClick(Sender: TObject);
begin

PerSubstanceForm.Visible := false ;

end;


initialization
  {$I hb_persubstance.lrs}

end.

