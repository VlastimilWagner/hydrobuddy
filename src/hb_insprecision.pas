unit hb_insprecision;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TInsPrecisionForm }

  TInsPrecisionForm = class(TForm)
    OKButton: TButton;
    VolumePrecEdit: TEdit;
    WeightPrecEdit: TEdit;
    VolumePrecLabel: TLabel;
    WeightPrecLabel: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  InsPrecisionForm: TInsPrecisionForm;

implementation

{ TInsPrecisionForm }

procedure TInsPrecisionForm.OKButtonClick(Sender: TObject);
begin

InsPrecisionForm.Visible := false ;

end;

procedure TInsPrecisionForm.FormCreate(Sender: TObject);
begin

end;

initialization
  {$I hb_insprecision.lrs}

end.

