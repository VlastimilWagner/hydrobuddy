unit hb_stockanalysis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TStockAnalysisForm }

  TStockAnalysisForm = class(TForm)
    Button1: TButton;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  StockAnalysisForm: TStockAnalysisForm;

implementation

{ TStockAnalysisForm }

procedure TStockAnalysisForm.Button1Click(Sender: TObject);
begin

StockAnalysisForm.Visible := false ;

end;



initialization
  {$I hb_stockanalysis.lrs}

end.

