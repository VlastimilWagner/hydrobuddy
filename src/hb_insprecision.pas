unit hb_insprecision;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TInsPrecisionForm }

  TInsPrecisionForm = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
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

procedure TInsPrecisionForm.Button1Click(Sender: TObject);
begin

InsPrecisionForm.Visible := false ;

end;

procedure TInsPrecisionForm.FormCreate(Sender: TObject);
begin

end;

initialization
  {$I hb_insprecision.lrs}

end.

