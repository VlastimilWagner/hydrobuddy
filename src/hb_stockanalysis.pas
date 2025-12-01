unit hb_stockanalysis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TStockAnalysisForm }

  TStockAnalysisForm = class(TForm)
    CloseButton: TButton;
    CompositionLabel: TLabel;
    StringGrid: TStringGrid;
    procedure CloseButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  StockAnalysisForm: TStockAnalysisForm;

implementation

{ TStockAnalysisForm }

procedure TStockAnalysisForm.CloseButtonClick(Sender: TObject);
begin

StockAnalysisForm.Visible := false ;

end;



initialization
  {$I hb_stockanalysis.lrs}

end.

