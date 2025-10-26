unit hb_analysis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TAnalysisForm }

  TAnalysisForm = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AnalysisForm: TAnalysisForm;

implementation

{ TAnalysisForm }

procedure TAnalysisForm.Button1Click(Sender: TObject);
begin

AnalysisForm.Visible := false ;

end;

initialization
  {$I hb_analysis.lrs}

end.

