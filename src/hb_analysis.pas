unit hb_analysis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TAnalysisForm }

  TAnalysisForm = class(TForm)
    CloseButton: TButton;
    StringGrid: TStringGrid;
    procedure CloseButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AnalysisForm: TAnalysisForm;

implementation

{ TAnalysisForm }

procedure TAnalysisForm.CloseButtonClick(Sender: TObject);
begin

AnalysisForm.Visible := false ;

end;

initialization
  {$I hb_analysis.lrs}

end.

