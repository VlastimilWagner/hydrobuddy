unit hb_freedom;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TFreedomForm }

  TFreedomForm = class(TForm)
    OKButton: TButton;
    ElementComboBox: TComboBox;
    InputLabel: TLabel;
    InstructionsLabel: TLabel;
    procedure OKButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FreedomForm: TFreedomForm;

implementation

{ TFreedomForm }

procedure TFreedomForm.OKButtonClick(Sender: TObject);
begin
  FreedomForm.Visible := false ;
end;

initialization
  {$I hb_freedom.lrs}

end.

