unit hb_persubstance;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TPerSubstanceForm }

  TPerSubstanceForm = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  PerSubstanceForm: TPerSubstanceForm;

implementation

{ TPerSubstanceForm }

procedure TPerSubstanceForm.Button1Click(Sender: TObject);
begin

PerSubstanceForm.Visible := false ;

end;


initialization
  {$I hb_persubstance.lrs}

end.

