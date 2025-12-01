unit hb_ph;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TAlkalinityForm }

  TAlkalinityForm = class(TForm)
    AddAcidButton: TButton;
    AcidComboBox: TComboBox;
    TotalAlkalinityEdit: TEdit;
    AcidLabel: TLabel;
    TotalAlkalinityLabel: TLabel;
    procedure AddAcidButtonClick(Sender: TObject);
    procedure AcidComboBoxChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AlkalinityForm: TAlkalinityForm;

implementation

uses HB_Main;

{ TAlkalinityForm }

procedure TAlkalinityForm.AddAcidButtonClick(Sender: TObject);
var
  total_alkalinity: double;
  ppm_contribution: double;
begin

  //see here https://ag.umass.edu/greenhouse-floriculture/fact-sheets/adjusting-alkalinity-with-acids

  total_alkalinity := StrToFloat(TotalAlkalinityEdit.Text);

  if AcidComboBox.ItemIndex = 0 then
  begin
        ppm_contribution := total_alkalinity*0.7*(0.033814/1)*(25.6);
        MainForm.Edit3.Text := FloatToStr(StrToFloat(MainForm.Edit3.Text)+ppm_contribution);
  end;

  if AcidComboBox.ItemIndex = 1 then
  begin
       ppm_contribution := total_alkalinity*0.23*(0.033814/1)*(43.6);
       MainForm.Edit7.Text := FloatToStr(StrToFloat(MainForm.Edit7.Text)+ppm_contribution);
  end;

  if AcidComboBox.ItemIndex = 2 then
  begin
       ppm_contribution := total_alkalinity*0.56*(0.033814/1)*(14.6);
       MainForm.Edit1.Text := FloatToStr(StrToFloat(MainForm.Edit1.Text)+ppm_contribution);
  end;


  AlkalinityForm.Visible := false ;
end;

procedure TAlkalinityForm.AcidComboBoxChange(Sender: TObject);
begin

end;

initialization
  {$I hb_ph.lrs}

end.

