unit hb_load_salts;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, PopupNotifier, Dbf, hb_newcustomsalt, db_substances, db_substances_used, CustomHelpFunctions;

type

  { TSubstanceSelectionForm }

  TSubstanceSelectionForm = class(TForm)
    AddToUsedButton: TBitBtn;
    DoNotUseAllButton: TBitBtn;
    DoNotUseButton: TBitBtn;
    AddNewButton: TBitBtn;
    DeleteFromDBButton: TBitBtn;
    EditSelectButton: TBitBtn;
    SetAmountButton: TBitBtn;
    ResetAmountsButton: TBitBtn;
    SaveToFileButton: TBitBtn;
    LoadFromFileButton: TBitBtn;
    SummaryPopupsCheckBox: TCheckBox;
    SubstanceDatabaseLabel: TLabel;
    SubstancesUsedLabel: TLabel;
    SubstanceDatabaseListBox: TListBox;
    SubstancesUsedListBox: TListBox;
    OpenDialog: TOpenDialog;
    PopupNotifier: TPopupNotifier;
    SaveDialog: TSaveDialog;
    procedure DoNotUseAllButtonClick(Sender: TObject);
    procedure AddToUsedButtonClick(Sender: TObject);
    procedure DoNotUseButtonClick(Sender: TObject);
    procedure AddNewButtonClick(Sender: TObject);
    procedure DeleteFromDBButtonClick(Sender: TObject);
    procedure EditSelectButtonClick(Sender: TObject);
    procedure SetAmountButtonClick(Sender: TObject);
    procedure ResetAmountsButtonClick(Sender: TObject);
    procedure SaveToFileButtonClick(Sender: TObject);
    procedure LoadFromFileButtonClick(Sender: TObject);
    procedure SummaryPopupsCheckBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SubstanceDatabaseListBoxSelectionChange(Sender: TObject);
    procedure SubstancesUsedListBoxSelectionChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure UpdateLists;
  end;

var
  SubstanceSelectionForm: TSubstanceSelectionForm;

implementation

uses HB_Main, hb_addweight, hb_analysis ;

{ TSubstanceSelectionForm }

procedure TSubstanceSelectionForm.FormCreate(Sender: TObject);
begin

end;

procedure TSubstanceSelectionForm.ListBox1Click(Sender: TObject);
begin

end;

procedure TSubstanceSelectionForm.SubstanceDatabaseListBoxSelectionChange(Sender: TObject);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
begin
  item_selected := false ;

  for i := 0 to SubstanceDatabaseListBox.Items.Count - 1 do begin
    if (SubstanceDatabaseListBox.Selected [i]) then begin
       selected_idx := i;
       item_selected := true ;
    end;
  end ;

  if item_selected then  begin
    for i := 0 to SubstancesUsedListBox.Items.Count - 1 do begin
        if (SubstancesUsedListBox.Selected [i]) then SubstancesUsedListBox.Selected [i] := false ;
    end ;
    DBSubstances.SearchByField('NAME', SubstanceDatabaseListBox.Items[selected_idx], True);

    PopupNotifier.Title := SubstanceDatabaseListBox.Items[selected_idx] + ' - '+ 'ConcType ' + DBSubstances.CONCTYPE;
    if DBSubstances.ISLIQUID then PopupNotifier.Text := 'Liquid, composition is in %W/V'
     else PopupNotifier.Text := 'Solid, composition is in %W/W';

    PopupNotifier.Text := PopupNotifier.Text + LineEnding + ' Purity ' + FloattoStr(DBSubstances.PURITY*100) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| N (NO3-)' + ' - ' + FloattoStr(DBSubstances.N_NO3)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| N (NH4+)' + ' - ' + FloattoStr(DBSubstances.N_NH4)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| K' + ' - ' + FloattoStr(DBSubstances.K) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| P' + ' - ' + FloattoStr(DBSubstances.P)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mg' + ' - ' + FloattoStr(DBSubstances.Mg)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Ca' + ' - ' + FloattoStr(DBSubstances.Ca)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| S' + ' - ' + FloattoStr(DBSubstances.S) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Fe' + ' - ' + FloattoStr(DBSubstances.Fe)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| B' + ' - ' + FloattoStr(DBSubstances.B) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Zn' + ' - ' + FloattoStr(DBSubstances.Zn) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mn' + ' - ' + FloattoStr(DBSubstances.Mn)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Cu' + ' - ' + FloattoStr(DBSubstances.Cu) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mo' + ' - ' + FloattoStr(DBSubstances.Mo) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Si' + ' - ' + FloattoStr(DBSubstances.Si)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Cl' + ' - ' + FloattoStr(DBSubstances.Cl) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Na' + ' - ' + FloattoStr(DBSubstances.Na) ;

    if SummaryPopupsCheckBox.Checked then PopupNotifier.Show;

    AddToUsedButton.Enabled := True ;
    DeleteFromDBButton.Enabled := True ;
    EditSelectButton.Enabled := True ;
    SetAmountButton.Enabled := False ;
    DoNotUseButton.Enabled := False ;
    DoNotUseAllButton.Enabled := False;
  end ;

end;


procedure TSubstanceSelectionForm.SubstancesUsedListBoxSelectionChange(Sender: TObject);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
begin
  item_selected := false ;

  for i := 0 to SubstancesUsedListBox.Items.Count - 1 do begin
    if (SubstancesUsedListBox.Selected [i]) then begin
        item_selected := true ;
        selected_idx := i;
    end;
  end ;

  if item_selected then begin
     for i := 0 to SubstanceDatabaseListBox.Items.Count - 1 do begin
        if (SubstanceDatabaseListBox.Selected [i]) then
        SubstanceDatabaseListBox.Selected [i] := false ;
     end ;

    DBSubstancesUsed.SearchByField('NAME', SubstancesUsedListBox.Items[selected_idx], True);
    PopupNotifier.Title := SubstancesUsedListBox.Items[selected_idx] + ' - '+ 'ConcType ' + DBSubstancesUsed.CONCTYPE ;

    if DBSubstancesUsed.ISLIQUID then PopupNotifier.Text := 'Liquid, composition is in %W/V'
      else PopupNotifier.Text := 'Solid, composition is in %W/W' ;

    PopupNotifier.Text := PopupNotifier.Text + LineEnding + ' Purity ' + FloattoStr(DBSubstancesUsed.PURITY*100) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| N (NO3-)' + ' - ' + FloattoStr(DBSubstancesUsed.N_NO3)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| N (NH4+)' + ' - ' + FloattoStr(DBSubstancesUsed.N_NH4)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| K' + ' - ' + FloattoStr(DBSubstancesUsed.K) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| P' + ' - ' + FloattoStr(DBSubstancesUsed.P)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mg' + ' - ' + FloattoStr(DBSubstancesUsed.Mg)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Ca' + ' - ' + FloattoStr(DBSubstancesUsed.Ca)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| S' + ' - ' + FloattoStr(DBSubstancesUsed.S) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Fe' + ' - ' + FloattoStr(DBSubstancesUsed.Fe)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| B' + ' - ' + FloattoStr(DBSubstancesUsed.B) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Zn' + ' - ' + FloattoStr(DBSubstancesUsed.Zn) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mn' + ' - ' + FloattoStr(DBSubstancesUsed.Mn)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Cu' + ' - ' + FloattoStr(DBSubstancesUsed.Cu) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Mo' + ' - ' + FloattoStr(DBSubstancesUsed.Mo) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Si' + ' - ' + FloattoStr(DBSubstancesUsed.Si)  ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Cl' + ' - ' + FloattoStr(DBSubstancesUsed.Cl) ;
    PopupNotifier.Text := PopupNotifier.Text + ' ' + '| Na' + ' - ' + FloattoStr(DBSubstancesUsed.Na) ;

    if SummaryPopupsCheckBox.Checked then PopupNotifier.Show;

    AddToUsedButton.Enabled := False ;
    DeleteFromDBButton.Enabled := False ;
    EditSelectButton.Enabled := False ;
    DoNotUseButton.Enabled := True ;
    SetAmountButton.Enabled := True ;
    DoNotUseAllButton.Enabled := True ;
  end ;
end;

procedure TSubstanceSelectionForm.AddToUsedButtonClick(Sender: TObject);
var
i : integer ;
begin
  if SubstanceDatabaseListBox.SelCount = 0 then Exit; // No ítems selected

  For i := 0 to SubstanceDatabaseListBox.Items.Count - 1 do begin
    if SubstanceDatabaseListBox.Selected[i] then begin
       DBSubstances.SearchByField('NAME', SubstanceDatabaseListBox.Items[i], True);
       DBSubstancesUsed.NAME := DBSubstances.NAME;
       DBSubstancesUsed.FORMULA  := DBSubstances.FORMULA;
       DBSubstancesUsed.SOURCE := DBSubstances.SOURCE;
       DBSubstancesUsed.PURITY := DBSubstances.PURITY;
       DBSubstancesUsed.N_NO3 := DBSubstances.N_NO3;
       DBSubstancesUsed.N_NH4 := DBSubstances.N_NH4;
       DBSubstancesUsed.P := DBSubstances.P;
       DBSubstancesUsed.K := DBSubstances.K;
       DBSubstancesUsed.Mg := DBSubstances.Mg;
       DBSubstancesUsed.Ca := DBSubstances.Ca;
       DBSubstancesUsed.S := DBSubstances.S;
       DBSubstancesUsed.B := DBSubstances.B;
       DBSubstancesUsed.Fe := DBSubstances.Fe;
       DBSubstancesUsed.Zn := DBSubstances.Zn;
       DBSubstancesUsed.Mn := DBSubstances.Mn;
       DBSubstancesUsed.Cu := DBSubstances.Cu;
       DBSubstancesUsed.Mo := DBSubstances.Mo;
       DBSubstancesUsed.Na := DBSubstances.Na;
       DBSubstancesUsed.Si := DBSubstances.Si;
       DBSubstancesUsed.Cl := DBSubstances.Cl;
       DBSubstancesUsed.ISLIQUID := DBSubstances.ISLIQUID;
       DBSubstancesUsed.DENSITY := DBSubstances.DENSITY;
       DBSubstancesUsed.CONCTYPE := DBSubstances.CONCTYPE;
       DBSubstancesUsed.Insert;
       SubstancesUsedListBox.Items.Add(SubstanceDatabaseListBox.Items[i]);
    end;
  end;

  For i := SubstanceDatabaseListBox.Items.Count - 1 downto 0  do begin
    if SubstanceDatabaseListBox.Selected[i] then SubstanceDatabaseListBox.Items.Delete(i);
  end;

end;

procedure TSubstanceSelectionForm.DoNotUseAllButtonClick(Sender: TObject);
var
  i, j : integer ;
  selected_items : array of integer ;
begin
  For i := 0 to SubstancesUsedListBox.Items.Count - 1 do begin
    SetLength(selected_items, Length(selected_items)+1);
    selected_items[Length(selected_items)-1] := i ;
  end;

  For i := 0 to Length(selected_items)-1 do
  begin
    DBSubstancesUsed.SearchByField('NAME', SubstancesUsedListBox.Items[selected_items[i]], True);
    SubstanceDatabaseListBox.Items.Add(DBSubstancesUsed.NAME);
    DBSubstancesUsed.Delete('NAME', SubstancesUsedListBox.Items[selected_items[i]]);
  end;

  MainForm.Button10.Enabled := false ;

  For i := 0 to Length(selected_items)-1 do begin
     SubstancesUsedListBox.Items.Delete(selected_items[i]);
     For j := 0 to Length(selected_items)-1 do begin
       if (j > i) and (selected_items[j] > selected_items[i]) then selected_items[j] := selected_items[j] - 1;
     end;
  end;
end;

procedure TSubstanceSelectionForm.DoNotUseButtonClick(Sender: TObject);
var
i, j : integer ;
selected_items : array of integer ;
begin
  if SubstancesUsedListBox.SelCount = 0 then Exit; // No ítems selected

  For i := 0 to SubstancesUsedListBox.Items.Count - 1 do begin
    if SubstancesUsedListBox.Selected [i] then begin
      SetLength(selected_items, Length(selected_items)+1);
      selected_items[Length(selected_items)-1] := i ;
    end;
  end;

  For i := 0 to Length(selected_items)-1 do begin
    DBSubstancesUsed.SearchByField('NAME', SubstancesUsedListBox.Items[selected_items[i]], True);
    SubstanceDatabaseListBox.Items.Add(DBSubstancesUsed.NAME);
    DBSubstancesUsed.Delete('NAME', SubstancesUsedListBox.Items[selected_items[i]]);
  end;

  MainForm.Button10.Enabled := false ;

  For i := 0 to Length(selected_items)-1 do begin
     SubstancesUsedListBox.Items.Delete(selected_items[i]);
     For j := 0 to Length(selected_items)-1 do begin
       if (j > i) and (selected_items[j] > selected_items[i]) then selected_items[j] := selected_items[j] - 1;
     end;
  end;
end;

procedure TSubstanceSelectionForm.AddNewButtonClick(Sender: TObject);
begin
  CustomSaltForm.InsertPrepare;
  CustomSaltForm.ShowModal;
  UpdateLists;
end;


procedure TSubstanceSelectionForm.DeleteFromDBButtonClick(Sender: TObject);
var
  i : integer ;
  selected_item : integer ;
begin
  if SubstanceDatabaseListBox.SelCount = 0 then Exit; // No ítems selected

  For i := 0 to SubstanceDatabaseListBox.Items.Count - 1 do begin
    if SubstanceDatabaseListBox.Selected [i] then selected_item := i;
  end;

  DBSubstances.Delete('NAME', SubstanceDatabaseListBox.Items[selected_item]);

  SubstanceDatabaseListBox.Items.Delete(selected_item);
end;

procedure TSubstanceSelectionForm.EditSelectButtonClick(Sender: TObject);
var
  i : integer ;
  selected_item : integer ;
begin
   if SubstanceDatabaseListBox.SelCount = 0 then Exit; // No ítems selected

   For i := 0 to SubstanceDatabaseListBox.Items.Count - 1 do begin
     if SubstanceDatabaseListBox.Selected [i] then selected_item := i;
   end;

  CustomSaltForm.UpdatePrepare(SubstanceDatabaseListBox.Items[selected_item]);
  CustomSaltForm.ShowModal;
  UpdateLists;

end;

procedure TSubstanceSelectionForm.SetAmountButtonClick(Sender: TObject);
var
i : integer ;
selected_item : integer ;
begin

   if SubstancesUsedListBox.SelCount = 0 then // No ítems selected
     Exit;

   For i := 0 to SubstancesUsedListBox.Items.Count - 1 do begin
     if SubstancesUsedListBox.Selected [i] then selected_item := i ;
   end;

   DBSubstancesUsed.SearchByField('NAME', SubstancesUsedListBox.Items[selected_item], True);

   AddWeightForm.MassEdit.text := floattostr(DBSubstancesUsed.WEIGHT);
   AddWeightForm.is_liquid := DBSubstancesUsed.IsLiquid;

  if (not AddWeightForm.is_liquid) and (MainForm.RadioButton9.checked) then AddWeightForm.MassLabel.Caption := 'Mass of substance (oz)';
  if (not AddWeightForm.is_liquid) and (MainForm.RadioButton8.checked) then AddWeightForm.MassLabel.Caption := 'Mass of substance (g)';
  if (AddWeightForm.is_liquid) then AddWeightForm.MassLabel.Caption := 'Volume of substance (mL)';

  AddWeightForm.SubstanceNameLabel.Caption := SubstancesUsedListBox.Items[selected_item] ;

  if AddWeightForm.ShowModal = mrOK then begin
     DBSubstancesUsed.WEIGHT := StrtoFloatAnySeparator(AddWeightForm.MassEdit.text);
     DBSubstancesUsed.Update('NAME', SubstancesUsedListBox.Items[selected_item]);
  end;


end;

procedure TSubstanceSelectionForm.ResetAmountsButtonClick(Sender: TObject);
begin

  DBSubstancesUsed.SearchFirst;
  while not DBSubstancesUsed.EOF do begin
    DBSubstancesUsed.WEIGHT := 0;
    DBSubstancesUsed.Update('NAME', DBSubstancesUsed.NAME);
    DBSubstancesUsed.Next;
  end;

 ShowMessage('All used substance weights have been reset to zero') ;

end;

procedure TSubstanceSelectionForm.SaveToFileButtonClick(Sender: TObject);
var
   saltList : TStringList  ;
   i: integer;
begin
   saltList := TStringList.Create;

   if SubstancesUsedListBox.Items.Count = 0 then
   begin
      ShowMessage('No substances have been loaded');
      exit;
   end;

   For i := 0 to SubstancesUsedListBox.Items.Count - 1 do saltList.Add(SubstancesUsedListBox.Items[i]);

   if SaveDialog.Execute then
     begin
         ShowMessage(SaveDialog.FileName) ;
         saltList.SaveToFile(SaveDialog.FileName);
     end;

   saltList.Free();
end;

procedure TSubstanceSelectionForm.LoadFromFileButtonClick(Sender: TObject);
var
   saltList : TStringList  ;
  i, j : integer ;
  selected_items : array of integer ;
begin
 if OpenDialog.Execute then
   begin
     saltList := TStringList.Create;
     saltList.LoadFromFile(OpenDialog.FileName);

     DoNotUseAllButtonClick(Sender);


    For j := 0 to SubstanceDatabaseListBox.Items.Count - 1 do
    begin
        SubstanceDatabaseListBox.Selected [j] := False;
    end;

     For i := 0 to saltList.Count - 1 do
     begin
          For j := 0 to SubstanceDatabaseListBox.Items.Count - 1 do
          begin
               if SubstanceDatabaseListBox.Items[j] = saltList[i] then
               begin
                   SetLength(selected_items, Length(selected_items)+1);
                   selected_items[Length(selected_items)-1] := j ;
               end;
          end;
     end;


  For i := 0 to Length(selected_items)-1 do
  begin
    DBSubstances.SearchByField('NAME', SubstanceDatabaseListBox.Items[i], True);
    DBSubstancesUsed.NAME := DBSubstances.NAME;
    DBSubstancesUsed.FORMULA  := DBSubstances.FORMULA;
    DBSubstancesUsed.SOURCE := DBSubstances.SOURCE;
    DBSubstancesUsed.PURITY := DBSubstances.PURITY;
    DBSubstancesUsed.N_NO3 := DBSubstances.N_NO3;
    DBSubstancesUsed.N_NH4 := DBSubstances.N_NH4;
    DBSubstancesUsed.P := DBSubstances.P;
    DBSubstancesUsed.K := DBSubstances.K;
    DBSubstancesUsed.Mg := DBSubstances.Mg;
    DBSubstancesUsed.Ca := DBSubstances.Ca;
    DBSubstancesUsed.S := DBSubstances.S;
    DBSubstancesUsed.B := DBSubstances.B;
    DBSubstancesUsed.Fe := DBSubstances.Fe;
    DBSubstancesUsed.Zn := DBSubstances.Zn;
    DBSubstancesUsed.Mn := DBSubstances.Mn;
    DBSubstancesUsed.Cu := DBSubstances.Cu;
    DBSubstancesUsed.Mo := DBSubstances.Mo;
    DBSubstancesUsed.Na := DBSubstances.Na;
    DBSubstancesUsed.Si := DBSubstances.Si;
    DBSubstancesUsed.Cl := DBSubstances.Cl;
    DBSubstancesUsed.ISLIQUID := DBSubstances.ISLIQUID;
    DBSubstancesUsed.DENSITY := DBSubstances.DENSITY;
    DBSubstancesUsed.CONCTYPE := DBSubstances.CONCTYPE;
    DBSubstancesUsed.Insert;
  end;

  For i := 0 to Length(selected_items)-1 do
  begin
       SubstancesUsedListBox.Items.Add(SubstanceDatabaseListBox.Items[selected_items[i]]);
       SubstanceDatabaseListBox.Items.Delete(selected_items[i]);
       For j := 0 to Length(selected_items)-1 do
       begin
            if (j > i) and (selected_items[j] > selected_items[i]) then
               selected_items[j] := selected_items[j] - 1;
       end;

  end;

   saltList.Free();
end;

end;

procedure TSubstanceSelectionForm.SummaryPopupsCheckBoxChange(Sender: TObject);
begin
  PopupNotifier.Hide;
end;


procedure TSubstanceSelectionForm.UpdateLists;
var
  i:     integer;
  j:     integer;
begin

  SubstanceDatabaseListBox.Items.Clear;
  SubstancesUsedListBox.Items.Clear;

  DBSubstances.SearchFirst;
  while not DBSubstances.EOF do begin
    SubstanceDatabaseListBox.Items.Add(DBSubstances.NAME);
    DBSubstances.Next;
  end;

  DBSubstancesUsed.SearchFirst;
  while not DBSubstancesUsed.EOF do begin
    SubstancesUsedListBox.Items.Add(DBSubstancesUsed.NAME);
    DBSubstancesUsed.Next;
  end;

  for i := 0 to SubstancesUsedListBox.Items.Count - 1 do
  begin
    j := 0;
    while j <= SubstanceDatabaseListBox.Items.Count - 1 do
    begin
      if (SubstanceDatabaseListBox.Items[j] = SubstancesUsedListBox.Items[i]) then
      begin
        SubstanceDatabaseListBox.Items.Delete(j);
        j := j + 1;
      end;
      j := j + 1;
    end;
  end;
  // sort listboxes
  SubstanceSelectionForm.SubstancesUsedListBox.Sorted := true ;
  SubstanceSelectionForm.SubstanceDatabaseListBox.Sorted := true ;

end;


initialization
  {$I hb_load_salts.lrs}

end.

