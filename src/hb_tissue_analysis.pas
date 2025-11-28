unit hb_tissue_analysis;

{$mode objfpc}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Grids, CustomHelpFunctions, db_tissue_analysis;

type

  { TTissueAnalysisForm }

  TTissueAnalysisForm = class(TForm)
    SaveToDBButton: TBitBtn;
    RemoveFromDBButton: TBitBtn;
    CopyToTargetsButton: TBitBtn;
    AddNewButton: TBitBtn;
    UpdateValuesButton: TBitBtn;
    NEdit: TEdit;
    ZnEdit: TEdit;
    BEdit: TEdit;
    EditCu: TEdit;
    SiEdit: TEdit;
    MoEdit: TEdit;
    NaEdit: TEdit;
    ClEdit: TEdit;
    WaterUseEdit: TEdit;
    TisuueReferencsEdit: TEdit;
    NameEdit: TEdit;
    PEdit: TEdit;
    KEdit: TEdit;
    MgEdit: TEdit;
    CaEdit: TEdit;
    SEdit: TEdit;
    FeEdit: TEdit;
    MnEdit: TEdit;
    NLabel: TLabel;
    ZnLabel: TLabel;
    BLabel: TLabel;
    CuLabel: TLabel;
    SiLabel: TLabel;
    MoLabel: TLabel;
    NaLabel: TLabel;
    ClLabel: TLabel;
    WaterUseLabel: TLabel;
    NameLabel: TLabel;
    CompositionLabel: TLabel;
    PLabel: TLabel;
    TaDatabaseLabel: TLabel;
    SoluionPPMLabel: TLabel;
    KLabel: TLabel;
    MgLabel: TLabel;
    CaLabel: TLabel;
    SLabel: TLabel;
    FeLabel: TLabel;
    MnLabel: TLabel;
    TADatabaseListBox: TListBox;
    SolutionPPMStringGrid: TStringGrid;
    procedure SaveToDBButtonClick(Sender: TObject);
    procedure RemoveFromDBButtonClick(Sender: TObject);
    procedure CopyToTargetsButtonClick(Sender: TObject);
    procedure AddNewButtonClick(Sender: TObject);
    procedure UpdateValuesButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TADatabaseListBoxClick(Sender: TObject);
    procedure TADatabaseListBoxSelectionChange(Sender: TObject; User: boolean);
  private

  public
      procedure UpdateTissueList;
  end;

var
  TissueAnalysisForm: TTissueAnalysisForm;

implementation

uses HB_Main ;

{ TTissueAnalysisForm }

procedure  TTissueAnalysisForm.UpdateTissueList;
begin

  TADatabaseListBox.Items.Clear;

  DBTissueAnalysis.SearchFirst;
  while not DBTissueAnalysis.EOF do
  begin
    TADatabaseListBox.Items.Add(DBTissueAnalysis.Name);
    DBTissueAnalysis.Next;
  end;

end;

procedure TTissueAnalysisForm.FormCreate(Sender: TObject);
begin

end;

procedure TTissueAnalysisForm.TADatabaseListBoxClick(Sender: TObject);
begin

end;

procedure TTissueAnalysisForm.TADatabaseListBoxSelectionChange(Sender: TObject; User: boolean);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
  wue: double;
begin

  item_selected := false ;
  wue := StrtoFloatAnySeparator(WaterUseEdit.Text)  ;

  for i := 0 to TADatabaseListBox.Items.Count - 1 do begin
    if (TADatabaseListBox.Selected [i]) then begin
         selected_idx := i;
         item_selected := true ;
    end;
  end ;

  if item_selected then begin

    DBTissueAnalysis.SearchByField('Name',TADatabaseListBox.Items[selected_idx],True);

    NameEdit.Text :=  TADatabaseListBox.Items[selected_idx];

    NEdit.Text :=  FloattoStr(DBTissueAnalysis.N);
    PEdit.Text :=  FloattoStr(DBTissueAnalysis.P);
    KEdit.Text :=  FloattoStr(DBTissueAnalysis.K);
    MgEdit.Text :=  FloattoStr(DBTissueAnalysis.Mg);
    CaEdit.Text :=  FloattoStr(DBTissueAnalysis.Ca);
    SEdit.Text :=  FloattoStr(DBTissueAnalysis.S);
    SiEdit.Text :=  FloattoStr(DBTissueAnalysis.Si);
    FeEdit.Text :=  FloattoStr(DBTissueAnalysis.Fe);
    MnEdit.Text :=  FloattoStr(DBTissueAnalysis.Mn);
    ZnEdit.Text :=  FloattoStr(DBTissueAnalysis.Zn);
    BEdit.Text :=  FloattoStr(DBTissueAnalysis.B);
    EditCu.Text :=  FloattoStr(DBTissueAnalysis.Cu);
    MoEdit.Text :=  FloattoStr(DBTissueAnalysis.Mo);
    NaEdit.Text :=  FloattoStr(DBTissueAnalysis.Na);
    ClEdit.Text :=  FloattoStr(DBTissueAnalysis.Cl);

    SolutionPPMStringGrid.Cells[1,1] :=  FloattoStr((DBTissueAnalysis.N/100.0)*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,2] :=  FloattoStr((DBTissueAnalysis.P/100.0)*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,3] :=  FloattoStr((DBTissueAnalysis.K/100.0)*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,4] :=  FloattoStr((DBTissueAnalysis.Mg/100.0)*(wue*1000));
    SolutionPPMStringGrid.Cells[1,5] :=  FloattoStr((DBTissueAnalysis.Ca/100.0)*(wue*1000))   ;
    SolutionPPMStringGrid.Cells[1,6] :=  FloattoStr((DBTissueAnalysis.S/100.0)*(wue*1000));
    SolutionPPMStringGrid.Cells[1,7] :=  FloattoStr((DBTissueAnalysis.Fe/(10000*100.0))*(wue*1000))   ;
    SolutionPPMStringGrid.Cells[1,8] :=  FloattoStr((DBTissueAnalysis.Mn/(10000*100.0))*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,9] :=  FloattoStr((DBTissueAnalysis.Zn/(10000*100.0))*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,10] :=  FloattoStr((DBTissueAnalysis.B/(10000*100.0))*(wue*1000));
    SolutionPPMStringGrid.Cells[1,11] :=  FloattoStr((DBTissueAnalysis.Cu/(10000*100.0))*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,12] :=  FloattoStr((DBTissueAnalysis.Si/100.0)*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,13] :=  FloattoStr((DBTissueAnalysis.Mo/(10000*100.0))*(wue*1000)) ;
    SolutionPPMStringGrid.Cells[1,14] :=  FloattoStr((DBTissueAnalysis.Na/(10000*100.0))*(wue*1000));
    SolutionPPMStringGrid.Cells[1,15] :=  FloattoStr((DBTissueAnalysis.Cl/(10000*100.0))*(wue*1000)) ;

    SaveToDBButton.Enabled := False ;
    RemoveFromDBButton.Enabled := True ;
    AddNewButton.Enabled := True ;
    UpdateValuesButton.Enabled := True ;
    CopyToTargetsButton.Enabled := True ;
  end ;

  if item_selected = False then begin
    SaveToDBButton.Enabled := True ;
    RemoveFromDBButton.Enabled := False ;
    AddNewButton.Enabled := True ;
    UpdateValuesButton.Enabled := False ;
    CopyToTargetsButton.Enabled := False ;

    for i := 1 to SolutionPPMStringGrid.RowCount - 1 do SolutionPPMStringGrid.Cells[1,i] := '';

    NEdit.Text := '0';
    PEdit.Text := '0';
    KEdit.Text := '0';
    MgEdit.Text := '0';
    CaEdit.Text := '0';
    SEdit.Text := '0';
    FeEdit.Text := '0';
    MnEdit.Text := '0';
    ZnEdit.Text := '0';
    BEdit.Text := '0';
    EditCu.Text := '0';
    SiEdit.Text := '0';
    MoEdit.Text := '0';
    NaEdit.Text := '0';
    ClEdit.Text := '0';
    NameEdit.Text := 'Name for DB';
  end;
end;

procedure TTissueAnalysisForm.SaveToDBButtonClick(Sender: TObject);
begin
  DBTissueAnalysis.Name := NameEdit.Text ;
  DBTissueAnalysis.N := StrtoFloatAnySeparator(NEdit.Text);
  DBTissueAnalysis.P := StrtoFloatAnySeparator(PEdit.Text);
  DBTissueAnalysis.K := StrtoFloatAnySeparator(KEdit.Text);
  DBTissueAnalysis.Mg := StrtoFloatAnySeparator(MgEdit.Text);
  DBTissueAnalysis.Ca := StrtoFloatAnySeparator(CaEdit.Text);
  DBTissueAnalysis.S := StrtoFloatAnySeparator(SEdit.Text);
  DBTissueAnalysis.Fe := StrtoFloatAnySeparator(FeEdit.Text);
  DBTissueAnalysis.Mn := StrtoFloatAnySeparator(MnEdit.Text);
  DBTissueAnalysis.Zn := StrtoFloatAnySeparator(ZnEdit.Text);
  DBTissueAnalysis.B := StrtoFloatAnySeparator(BEdit.Text);
  DBTissueAnalysis.Cu := StrtoFloatAnySeparator(EditCu.Text);
  DBTissueAnalysis.Si := StrtoFloatAnySeparator(SiEdit.Text);
  DBTissueAnalysis.Mo := StrtoFloatAnySeparator(MoEdit.Text);
  DBTissueAnalysis.Na := StrtoFloatAnySeparator(NaEdit.Text);
  DBTissueAnalysis.Cl := StrtoFloatAnySeparator(ClEdit.Text);

  DBTissueAnalysis.Insert;

  TissueAnalysisForm.UpdateTissueList ;
end;

procedure TTissueAnalysisForm.RemoveFromDBButtonClick(Sender: TObject);
var
   i : integer ;
   selected_item : integer ;
begin

   if TADatabaseListBox.SelCount = 0 then // No ítems selected
     Exit;

   For i := 0 to TADatabaseListBox.Items.Count - 1 do begin
      if TADatabaseListBox.Selected [i] then selected_item := i ;
   end;

   ShowMessage('Deleting ' + TADatabaseListBox.Items[selected_item] + ' from database');
   DBTissueAnalysis.Delete('Name', TADatabaseListBox.Items[selected_item]) ;

   TADatabaseListBox.Items.Delete(selected_item);

   end;

procedure TTissueAnalysisForm.CopyToTargetsButtonClick(Sender: TObject);
var
     i,selected_idx : integer ;
     item_selected : boolean ;
     wue: double;
begin

  item_selected := false ;
  wue := StrtoFloatAnySeparator(WaterUseEdit.Text)  ;

  for i := 0 to TADatabaseListBox.Items.Count - 1 do begin
       if (TADatabaseListBox.Selected [i]) then begin
          selected_idx := i;
          item_selected := true ;
       end;
  end;

  if item_selected then begin

     DBTissueAnalysis.SearchByField('Name',TADatabaseListBox.Items[selected_idx],True);

     MainForm.Edit1.Text :=  FloattoStr((DBTissueAnalysis.N/100.0)*(wue*1000)) ;
     MainForm.Edit3.Text :=  FloattoStr((DBTissueAnalysis.P/100.0)*(wue*1000)) ;
     MainForm.Edit4.Text :=  FloattoStr((DBTissueAnalysis.K/100.0)*(wue*1000)) ;
     MainForm.Edit5.Text :=  FloattoStr((DBTissueAnalysis.Mg/100.0)*(wue*1000));
     MainForm.Edit6.Text :=  FloattoStr((DBTissueAnalysis.Ca/100.0)*(wue*1000))   ;
     MainForm.Edit7.Text :=  FloattoStr((DBTissueAnalysis.S/100.0)*(wue*1000));
     MainForm.Edit13.Text :=  FloattoStr((DBTissueAnalysis.Si/100.0)*(wue*1000)) ;
     MainForm.Edit8.Text :=  FloattoStr((DBTissueAnalysis.Fe/(10000*100.0))*(wue*1000))   ;
     MainForm.Edit9.Text :=  FloattoStr((DBTissueAnalysis.Mn/(10000*100.0))*(wue*1000)) ;
     MainForm.Edit10.Text :=  FloattoStr((DBTissueAnalysis.Zn/(10000*100.0))*(wue*1000)) ;
     MainForm.Edit11.Text :=  FloattoStr((DBTissueAnalysis.B/(10000*100.0))*(wue*1000));
     MainForm.Edit12.Text :=  FloattoStr((DBTissueAnalysis.Cu/(10000*100.0))*(wue*1000)) ;
     MainForm.Edit14.Text :=  FloattoStr((DBTissueAnalysis.Mo/(10000*100.0))*(wue*1000)) ;
     MainForm.Edit15.Text :=  FloattoStr((DBTissueAnalysis.Na/(10000*100.0))*(wue*1000));
     MainForm.Edit16.Text :=  FloattoStr((DBTissueAnalysis.Cl/(10000*100.0))*(wue*1000)) ;
  end ;

  if item_selected = False then begin
     SaveToDBButton.Enabled := True ;
     RemoveFromDBButton.Enabled := False ;
     AddNewButton.Enabled := True ;
     UpdateValuesButton.Enabled := False ;
     CopyToTargetsButton.Enabled := False ;
     for i := 1 to SolutionPPMStringGrid.RowCount - 1 do SolutionPPMStringGrid.Cells[1,i] := '';
     NEdit.Text := '0';
     PEdit.Text := '0';
     KEdit.Text := '0';
     MgEdit.Text := '0';
     CaEdit.Text := '0';
     SEdit.Text := '0';
     FeEdit.Text := '0';
     MnEdit.Text := '0';
     ZnEdit.Text := '0';
     BEdit.Text := '0';
     EditCu.Text := '0';
     SiEdit.Text := '0';
     MoEdit.Text := '0';
     NaEdit.Text := '0';
     ClEdit.Text := '0';
     NameEdit.Text := 'Name for DB';
  end;

end;

procedure TTissueAnalysisForm.AddNewButtonClick(Sender: TObject);
var
  i: integer;
begin
    TADatabaseListBox.Clear;
    UpdateTissueList;
    SaveToDBButton.Enabled := True ;
    RemoveFromDBButton.Enabled := False ;
    AddNewButton.Enabled := True ;
    UpdateValuesButton.Enabled := False ;
    CopyToTargetsButton.Enabled := False ;
    for i := 1 to SolutionPPMStringGrid.RowCount - 1 do SolutionPPMStringGrid.Cells[1,i] := '';
    NEdit.Text := '0';
    PEdit.Text := '0';
    KEdit.Text := '0';
    MgEdit.Text := '0';
    CaEdit.Text := '0';
    SEdit.Text := '0';
    FeEdit.Text := '0';
    MnEdit.Text := '0';
    ZnEdit.Text := '0';
    BEdit.Text := '0';
    EditCu.Text := '0';
    SiEdit.Text := '0';
    MoEdit.Text := '0';
    NaEdit.Text := '0';
    ClEdit.Text := '0';
    NameEdit.Text := 'Name for DB';
end;

procedure TTissueAnalysisForm.UpdateValuesButtonClick(Sender: TObject);
var
  selected_item, i : integer ;
begin
   if TADatabaseListBox.SelCount = 0 then // No ítems selected
      Exit;

   For i := 0 to TADatabaseListBox.Items.Count - 1 do begin
      if TADatabaseListBox.Selected [i] then selected_item := i ;
   end;

   DBTissueAnalysis.Name := NameEdit.Text ;
   DBTissueAnalysis.N := StrtoFloatAnySeparator(NEdit.Text);
   DBTissueAnalysis.P := StrtoFloatAnySeparator(PEdit.Text);
   DBTissueAnalysis.K := StrtoFloatAnySeparator(KEdit.Text);
   DBTissueAnalysis.Mg := StrtoFloatAnySeparator(MgEdit.Text);
   DBTissueAnalysis.Ca := StrtoFloatAnySeparator(CaEdit.Text);
   DBTissueAnalysis.S := StrtoFloatAnySeparator(SEdit.Text);
   DBTissueAnalysis.Fe := StrtoFloatAnySeparator(FeEdit.Text);
   DBTissueAnalysis.Mn := StrtoFloatAnySeparator(MnEdit.Text);
   DBTissueAnalysis.Zn := StrtoFloatAnySeparator(ZnEdit.Text);
   DBTissueAnalysis.B := StrtoFloatAnySeparator(BEdit.Text);
   DBTissueAnalysis.Cu := StrtoFloatAnySeparator(EditCu.Text);
   DBTissueAnalysis.Si := StrtoFloatAnySeparator(SiEdit.Text);
   DBTissueAnalysis.Mo := StrtoFloatAnySeparator(MoEdit.Text);
   DBTissueAnalysis.Na := StrtoFloatAnySeparator(NaEdit.Text);
   DBTissueAnalysis.Cl := StrtoFloatAnySeparator(ClEdit.Text);
   DBTissueAnalysis.Update('Name', TADatabaseListBox.Items[selected_item]);

   UpdateTissueList ;
end;

initialization
  {$I hb_tissue_analysis.lrs}

end.

