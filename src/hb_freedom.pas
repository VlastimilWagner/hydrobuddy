unit hb_freedom;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TFreedomForm }

  TFreedomForm = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FreedomForm: TFreedomForm;

implementation

{ TFreedomForm }

procedure TFreedomForm.Button1Click(Sender: TObject);
begin
  FreedomForm.Visible := false ;
end;

initialization
  {$I hb_freedom.lrs}

end.

