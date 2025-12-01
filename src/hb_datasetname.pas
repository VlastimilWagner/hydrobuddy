unit hb_datasetname;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TDatasetNameForm }

  TDatasetNameForm = class(TForm)
    OKButton: TButton;
    NewNameEdit: TEdit;
    InputDataLabel: TLabel;
    procedure OKButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  DatasetNameForm: TDatasetNameForm;

implementation

uses HB_Main ;

{ TDatasetNameForm }

procedure TDatasetNameForm.OKButtonClick(Sender: TObject);

begin

datasetname := NewNameEdit.Text ;

ShowMessage('Data Set name set to ' + NewNameEdit.Text + '. Database creation will finish when you add a data point');

DatasetNameForm.Visible := False ;

end;

initialization
  {$I hb_datasetname.lrs}

end.

