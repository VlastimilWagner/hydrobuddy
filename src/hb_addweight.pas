unit hb_addweight;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, Dbf, db, Dbf_Common ;

type

  { TAddWeightForm }

  TAddWeightForm = class(TForm)
    CancelButton: TBitBtn;
    MassEdit: TEdit;
    MassLabel: TLabel;
    SubstanceNameLabel: TLabel;
    OKButton: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure MassEditKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
    is_liquid: boolean;
  end; 

var
  AddWeightForm: TAddWeightForm;

implementation

{ TAddWeightForm }



procedure TAddWeightForm.MassEditKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #27 then begin
    ModalResult := mrCancel;
    Close;
  end;
end;

procedure TAddWeightForm.FormActivate(Sender: TObject);
begin
  MassEdit.SetFocus;
end;

initialization
  {$I hb_addweight.lrs}

end.

