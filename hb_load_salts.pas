unit hb_load_salts;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, PopupNotifier, Dbf, db, Dbf_Common, hb_newcustomsalt;

type

  { TSubstanceSelectionForm }

  TSubstanceSelectionForm = class(TForm)
    Button1: TBitBtn;
    Button10: TBitBtn;
    Button2: TBitBtn;
    Button3: TBitBtn;
    Button4: TBitBtn;
    Button5: TBitBtn;
    Button6: TBitBtn;
    Button7: TBitBtn;
    Button8: TBitBtn;
    Button9: TBitBtn;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    PopupNotifier1: TPopupNotifier;
    SaveDialog1: TSaveDialog;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure ListBox2SelectionChange(Sender: TObject; User: boolean);
  private
    { private declarations }
  public
    { public declarations }
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

procedure TSubstanceSelectionForm.ListBox1SelectionChange(Sender: TObject; User: boolean);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
  MyDbf: TDbf;
begin

item_selected := false ;

for i := 0 to ListBox1.Items.Count - 1 do

    begin

    if (ListBox1.Selected [i]) then
    begin
         selected_idx := i;
         item_selected := true ;
    end;

    end ;

if item_selected then

begin

    for i := 0 to ListBox2.Items.Count - 1 do

        begin

        if (ListBox2.Selected [i]) then
        ListBox2.Selected [i] := false ;

        end ;

    MyDbf := TDbf.Create(nil) ;
    MyDbf.FilePathFull := '';
    MyDbf.TableName := Form1.substances_db;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox1.Items[selected_idx]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data


    PopupNotifier1.Title := ListBox1.Items[selected_idx] + ' - '+ 'ConcType ' + MyDbf.FieldByName('ConcType').AsString ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 0 then
    PopupNotifier1.Text := 'Solid, composition is in %W/W' ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 1 then
    PopupNotifier1.Text := 'Liquid, composition is in %W/V';

    PopupNotifier1.Text := PopupNotifier1.Text + LineEnding + ' Purity ' + FloattoStr(MyDbf.FieldByName('Purity').AsFloat*100) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| N (NO3-)' + ' - ' + FloattoStr(MyDbf.FieldByName('N (NO3-)').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| N (NH4+)' + ' - ' + FloattoStr(MyDbf.FieldByName('N (NH4+)').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| K' + ' - ' + FloattoStr(MyDbf.FieldByName('K').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| P' + ' - ' + FloattoStr(MyDbf.FieldByName('P').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mg' + ' - ' + FloattoStr(MyDbf.FieldByName('Mg').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Ca' + ' - ' + FloattoStr(MyDbf.FieldByName('Ca').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| S' + ' - ' + FloattoStr(MyDbf.FieldByName('S').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Fe' + ' - ' + FloattoStr(MyDbf.FieldByName('Fe').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| B' + ' - ' + FloattoStr(MyDbf.FieldByName('B').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Zn' + ' - ' + FloattoStr(MyDbf.FieldByName('Zn').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mn' + ' - ' + FloattoStr(MyDbf.FieldByName('Mn').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Cu' + ' - ' + FloattoStr(MyDbf.FieldByName('Cu').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mo' + ' - ' + FloattoStr(MyDbf.FieldByName('Mo').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Si' + ' - ' + FloattoStr(MyDbf.FieldByName('Si').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Cl' + ' - ' + FloattoStr(MyDbf.FieldByName('Cl').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Na' + ' - ' + FloattoStr(MyDbf.FieldByName('Na').AsFloat) ;

    MyDbf.Close ;
    MyDbf.Free ;

    if checkbox1.Checked then PopupNotifier1.Show;

    Button1.Enabled := True ;
    Button4.Enabled := True ;
    Button5.Enabled := True ;
    Button6.Enabled := False ;
    Button2.Enabled := False ;
    Button10.Enabled := False;

end ;

end;


procedure TSubstanceSelectionForm.ListBox2SelectionChange(Sender: TObject; User: boolean);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
  MyDbf: TDbf;
begin


item_selected := false ;

for i := 0 to ListBox2.Items.Count - 1 do

    begin

    if (ListBox2.Selected [i]) then
    begin
        item_selected := true ;
        selected_idx := i;
    end;

    end ;

if item_selected then

begin

for i := 0 to ListBox1.Items.Count - 1 do

    begin

    if (ListBox1.Selected [i]) then
    ListBox1.Selected [i] := false ;

    end ;


    MyDbf := TDbf.Create(nil) ;
    MyDbf.FilePathFull := '';
    MyDbf.TableName := Form1.substances_used_db;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox2.Items[selected_idx]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data


    PopupNotifier1.Title := ListBox2.Items[selected_idx] + ' - '+ 'ConcType ' + MyDbf.FieldByName('ConcType').AsString ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 0 then
    PopupNotifier1.Text := 'Solid, composition is in %W/W' ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 1 then
    PopupNotifier1.Text := 'Liquid, composition is in %W/V';

    PopupNotifier1.Text := PopupNotifier1.Text + LineEnding + ' Purity ' + FloattoStr(MyDbf.FieldByName('Purity').AsFloat*100) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| N (NO3-)' + ' - ' + FloattoStr(MyDbf.FieldByName('N (NO3-)').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| N (NH4+)' + ' - ' + FloattoStr(MyDbf.FieldByName('N (NH4+)').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| K' + ' - ' + FloattoStr(MyDbf.FieldByName('K').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| P' + ' - ' + FloattoStr(MyDbf.FieldByName('P').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mg' + ' - ' + FloattoStr(MyDbf.FieldByName('Mg').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Ca' + ' - ' + FloattoStr(MyDbf.FieldByName('Ca').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| S' + ' - ' + FloattoStr(MyDbf.FieldByName('S').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Fe' + ' - ' + FloattoStr(MyDbf.FieldByName('Fe').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| B' + ' - ' + FloattoStr(MyDbf.FieldByName('B').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Zn' + ' - ' + FloattoStr(MyDbf.FieldByName('Zn').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mn' + ' - ' + FloattoStr(MyDbf.FieldByName('Mn').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Cu' + ' - ' + FloattoStr(MyDbf.FieldByName('Cu').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Mo' + ' - ' + FloattoStr(MyDbf.FieldByName('Mo').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Si' + ' - ' + FloattoStr(MyDbf.FieldByName('Si').AsFloat)  ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Cl' + ' - ' + FloattoStr(MyDbf.FieldByName('Cl').AsFloat) ;
    PopupNotifier1.Text := PopupNotifier1.Text + ' ' + '| Na' + ' - ' + FloattoStr(MyDbf.FieldByName('Na').AsFloat) ;

    MyDbf.Close ;
    MyDbf.Free ;

    if checkbox1.Checked then PopupNotifier1.Show;

Button1.Enabled := False ;
Button4.Enabled := False ;
Button5.Enabled := False ;
Button2.Enabled := True ;
Button6.Enabled := True ;
Button10.Enabled := True ;

end ;

end;

procedure TSubstanceSelectionForm.Button1Click(Sender: TObject);
var
MyDbf: TDbf;
MyDbf_used: TDbf;
i, j : integer ;
selected_items : array of integer ;
values_to_copy : array of double ;
name1 : string ;
conctype : string ;
formula1 : string ;
source: string;
begin

if ListBox1.SelCount = 0 then // No ítems selected
     Exit;

SetLength(values_to_copy, 20) ;

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := Form1.substances_db;
MyDbf.ReadOnly := False ;
MyDbf.Open;

MyDbf_used := TDbf.Create(nil) ;
MyDbf_used.FilePathFull := '';
MyDbf_used.TableName := Form1.substances_used_db;
MyDbf_used.Open             ;
MyDbf_used.Active := true ;

For i := 0 to ListBox1.Items.Count - 1 do

         begin
                               if ListBox1.Selected [i] then
                               begin
                                SetLength(selected_items, Length(selected_items)+1);
                                selected_items[Length(selected_items)-1] := i ;
                               end;
         end;

For i := 0 to Length(selected_items)-1 do
begin
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox1.Items[selected_items[i]]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data
    name1 :=  MyDbf.FieldByName('Name').AsString ;
    formula1 := MyDbf.FieldByName('Formula').AsString ;
    values_to_copy[0] := MyDbf.FieldByName('Purity').AsFloat ;
    values_to_copy[1] := MyDbf.FieldByName('N (NO3-)').AsFloat ;
    values_to_copy[2] := MyDbf.FieldByName('P').AsFloat ;
    values_to_copy[3] := MyDbf.FieldByName('K').AsFloat ;
    values_to_copy[4] := MyDbf.FieldByName('Mg').AsFloat ;
    values_to_copy[5] := MyDbf.FieldByName('Ca').AsFloat ;
    values_to_copy[6] := MyDbf.FieldByName('S').AsFloat ;
    values_to_copy[7] := MyDbf.FieldByName('B').AsFloat ;
    values_to_copy[8] := MyDbf.FieldByName('Fe').AsFloat ;
    values_to_copy[9] := MyDbf.FieldByName('Zn').AsFloat ;
    values_to_copy[10] := MyDbf.FieldByName('Cu').AsFloat ;
    values_to_copy[11] := MyDbf.FieldByName('Mo').AsFloat ;
    values_to_copy[12] := MyDbf.FieldByName('Na').AsFloat ;
    values_to_copy[13] := MyDbf.FieldByName('Si').AsFloat ;
    values_to_copy[14] := MyDbf.FieldByName('Cl').AsFloat ;
    values_to_copy[15] := MyDbf.FieldByName('Mn').AsFloat ;
    values_to_copy[16] := MyDbf.FieldByName('N (NH4+)').AsFloat ;
    values_to_copy[17] := MyDbf.FieldByName('Cost').AsFloat ;
    values_to_copy[18] := MyDbf.FieldByName('IsLiquid').AsFloat ;
    values_to_copy[19] := MyDbf.FieldByName('Density').AsFloat ;
    source := MyDbf.FieldByName('Source').AsString ;
    conctype := MyDbf.FieldByName('ConcType').AsString ;

    MyDbf_used.Insert ;

    MyDbf_used.FieldByName('Name').AsString:= name1 ;
    MyDbf_used.FieldByName('Formula').AsString:= formula1;
    MyDbf_used.FieldByName('Purity').AsFloat:=values_to_copy[0] ;
    MyDbf_used.FieldByName('N (NO3-)').AsFloat:=values_to_copy[1];
    MyDbf_used.FieldByName('P').AsFloat:=values_to_copy[2];
    MyDbf_used.FieldByName('K').AsFloat:=values_to_copy[3];
    MyDbf_used.FieldByName('Mg').AsFloat:=values_to_copy[4];
    MyDbf_used.FieldByName('Ca').AsFloat:=values_to_copy[5];
    MyDbf_used.FieldByName('S').AsFloat:=values_to_copy[6];
    MyDbf_used.FieldByName('B').AsFloat:=values_to_copy[7];
    MyDbf_used.FieldByName('Fe').AsFloat:=values_to_copy[8];
    MyDbf_used.FieldByName('Zn').AsFloat:=values_to_copy[9];
    MyDbf_used.FieldByName('Cu').AsFloat:=values_to_copy[10];
    MyDbf_used.FieldByName('Mo').AsFloat:=values_to_copy[11];
    MyDbf_used.FieldByName('Na').AsFloat:=values_to_copy[12];
    MyDbf_used.FieldByName('Si').AsFloat:=values_to_copy[13];
    MyDbf_used.FieldByName('Cl').AsFloat:=values_to_copy[14];
    MyDbf_used.FieldByName('Mn').AsFloat:=values_to_copy[15];
    MyDbf_used.FieldByName('N (NH4+)').AsFloat:=values_to_copy[16];
    MyDbf_used.FieldByName('Weight').AsFloat:=0;
    MyDbf_used.FieldByName('Cost').AsFloat:= values_to_copy[17] ;
    MyDbf_used.FieldByName('IsLiquid').AsInteger:=Round(values_to_copy[18]);
    MyDbf_used.FieldByName('Density').AsFloat := values_to_copy[19] ;
    MyDbf_used.FieldByName('Source').AsString := source ;
    MyDbf_used.FieldByName('ConcType').AsString:= conctype ;

    MyDbf_used.Post ;

end;

MyDbf.Close ;
MyDbf.Free ;

MyDbf_used.Close;
MyDbf_used.Free;


For i := 0 to Length(selected_items)-1 do
begin
     ListBox2.Items.Add(ListBox1.Items[selected_items[i]]);
     ListBox1.Items.Delete(selected_items[i]);
     For j := 0 to Length(selected_items)-1 do
     begin
          if (j > i) and (selected_items[j] > selected_items[i]) then
             selected_items[j] := selected_items[j] - 1;
     end;

end;

end;

procedure TSubstanceSelectionForm.Button10Click(Sender: TObject);
var
MyDbf: TDbf;
i, j : integer ;
selected_items : array of integer ;
begin

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := Form1.substances_used_db;
MyDbf.Open;
MyDbf.ReadOnly := False;
MyDbf.Active := true ;

For i := 0 to ListBox2.Items.Count - 1 do
         begin
             SetLength(selected_items, Length(selected_items)+1);
             selected_items[Length(selected_items)-1] := i ;
         end;

For i := 0 to Length(selected_items)-1 do
begin
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox2.Items[selected_items[i]]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data
    ListBox1.Items.Add(MyDbf.FieldByName('Name').AsString) ;
    MyDbf.Delete ;
end;

MyDbf.Close ;

MyDbf.Free ;

HB_Main.Form1.Button10.Enabled := false ;

For i := 0 to Length(selected_items)-1 do
begin
     ListBox2.Items.Delete(selected_items[i]);
     For j := 0 to Length(selected_items)-1 do
     begin
          if (j > i) and (selected_items[j] > selected_items[i]) then
             selected_items[j] := selected_items[j] - 1;
     end;
end;


end;

procedure TSubstanceSelectionForm.Button2Click(Sender: TObject);
var
MyDbf: TDbf;
i, j : integer ;
selected_items : array of integer ;
begin

if ListBox2.SelCount = 0 then // No ítems selected
     Exit;

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := Form1.substances_used_db;
MyDbf.Open;
MyDbf.ReadOnly := False;
MyDbf.Active := true ;

For i := 0 to ListBox2.Items.Count - 1 do

         begin
                               if ListBox2.Selected [i] then
                               begin
                               SetLength(selected_items, Length(selected_items)+1);
                               selected_items[Length(selected_items)-1] := i ;
                               end;
         end;

For i := 0 to Length(selected_items)-1 do
begin
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox2.Items[selected_items[i]]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data
    ListBox1.Items.Add(MyDbf.FieldByName('Name').AsString) ;
    MyDbf.Delete ;
end;

MyDbf.Close ;

MyDbf.Free ;

HB_Main.Form1.Button10.Enabled := false ;

For i := 0 to Length(selected_items)-1 do
begin
     ListBox2.Items.Delete(selected_items[i]);
     For j := 0 to Length(selected_items)-1 do
     begin
          if (j > i) and (selected_items[j] > selected_items[i]) then
             selected_items[j] := selected_items[j] - 1;
     end;
end;


end;

procedure TSubstanceSelectionForm.Button3Click(Sender: TObject);
var
   i: integer;
begin

  hb_newcustomsalt.CustomSaltForm.ComboBox1.ItemIndex := 0;

  hb_newcustomsalt.CustomSaltForm.ComboBox2.ItemIndex := 0 ;

  hb_newcustomsalt.CustomSaltForm.ComboBox3.ItemIndex := 0 ;

  hb_newcustomsalt.CustomSaltForm.CheckBox2.Checked := false;

  hb_newcustomsalt.CustomSaltForm.Button1.Enabled := True ;

  hb_newcustomsalt.CustomSaltForm.Button2.Enabled := False ;

  hb_newcustomsalt.CustomSaltForm.NameEdit.Text := 'Input Fertilizer Name Here' ;
  hb_newcustomsalt.CustomSaltForm.FormulaEdit.Text := 'Input Formula Here' ;
  hb_newcustomsalt.CustomSaltForm.CostEdit.Text := '100' ;
  hb_newcustomsalt.CustomSaltForm.PurityEdit.Text := '100' ;

  hb_newcustomsalt.CustomSaltForm.N_NO3Edit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.ClEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.PEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.N_NH4Edit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.KEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.MgEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.CaEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.SEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.FeEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.MnEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.ZnEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.BEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.CuEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.SiEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.MoEdit.Text := '0' ;
  hb_newcustomsalt.CustomSaltForm.NaEdit.Text := '0' ;

  hb_newcustomsalt.CustomSaltForm.Visible := true ;


end;

procedure TSubstanceSelectionForm.Button4Click(Sender: TObject);
var
MyDbf: TDbf;
i : integer ;
selected_item : integer ;
begin

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := Form1.substances_db;
MyDbf.Open             ;
MyDbf.Active := true ;

if ListBox1.SelCount = 0 then // No ítems selected
     Exit;

For i := 0 to ListBox1.Items.Count - 1 do

         begin
                               if ListBox1.Selected [i] then
                               begin
                                selected_item := i ;
                               end;
         end;

MyDbf.Filter := 'Name=' + QuotedStr(ListBox1.Items[selected_item]) ;

    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data
    ShowMessage('Deleting ' + MyDbf.FieldByName('Name').AsString + ' from database');
    MyDbf.Delete ;

MyDbf.Close ;

MyDbf.Free ;

ListBox1.Items.Delete(selected_item);

end;

procedure TSubstanceSelectionForm.Button5Click(Sender: TObject);
var
i : integer ;
selected_item : integer ;
MyDbf: TDbf;
begin

   if ListBox1.SelCount = 0 then // No ítems selected
     Exit;

     For i := 0 to ListBox1.Items.Count - 1 do

         begin
                               if ListBox1.Selected [i] then
                               begin
                                selected_item := i ;
                               end;
         end;

   MyDbf := TDbf.Create(nil) ;
   MyDbf.FilePathFull := '';
   MyDbf.TableName := Form1.substances_db;
   MyDbf.Open             ;
   MyDbf.Active := true ;


         MyDbf.Filter := 'Name=' + QuotedStr(ListBox1.Items[selected_item]) ;

    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data

    hb_newcustomsalt.CustomSaltForm.NameEdit.text := MyDbf.FieldByName('Name').AsString;
    hb_newcustomsalt.CustomSaltForm.FormulaEdit.text := MyDbf.FieldByName('Formula').AsString;
    hb_newcustomsalt.CustomSaltForm.PurityEdit.text := FloattoStr(MyDbf.FieldByName('Purity').AsFloat*100) ;
    hb_newcustomsalt.CustomSaltForm.N_NO3Edit.text := MyDbf.FieldByName('N (NO3-)').AsString ;
    hb_newcustomsalt.CustomSaltForm.N_NH4Edit.text := MyDbf.FieldByName('N (NH4+)').AsString ;
    hb_newcustomsalt.CustomSaltForm.PEdit.text := MyDbf.FieldByName('P').AsString ;
    hb_newcustomsalt.CustomSaltForm.KEdit.text := MyDbf.FieldByName('K').AsString ;
    hb_newcustomsalt.CustomSaltForm.MgEdit.text := MyDbf.FieldByName('Mg').AsString ;
    hb_newcustomsalt.CustomSaltForm.CaEdit.text := MyDbf.FieldByName('Ca').AsString ;
    hb_newcustomsalt.CustomSaltForm.SEdit.text := MyDbf.FieldByName('S').AsString ;
    hb_newcustomsalt.CustomSaltForm.FeEdit.text := MyDbf.FieldByName('Fe').AsString ;
    hb_newcustomsalt.CustomSaltForm.MnEdit.text := MyDbf.FieldByName('Mn').AsString ;
    hb_newcustomsalt.CustomSaltForm.ZnEdit.text := MyDbf.FieldByName('Zn').AsString ;
    hb_newcustomsalt.CustomSaltForm.BEdit.text := MyDbf.FieldByName('B').AsString ;
    hb_newcustomsalt.CustomSaltForm.CuEdit.text := MyDbf.FieldByName('Cu').AsString ;
    hb_newcustomsalt.CustomSaltForm.SiEdit.text := MyDbf.FieldByName('Si').AsString ;
    hb_newcustomsalt.CustomSaltForm.MoEdit.text := MyDbf.FieldByName('Mo').AsString ;
    hb_newcustomsalt.CustomSaltForm.NaEdit.text := MyDbf.FieldByName('Na').AsString ;
    hb_newcustomsalt.CustomSaltForm.ClEdit.text := MyDbf.FieldByName('Cl').AsString ;
    hb_newcustomsalt.CustomSaltForm.CostEdit.text := MyDbf.FieldByName('Cost').AsString ;

    hb_newcustomsalt.CustomSaltForm.ConcentratedTypeComboBox.text := MyDbf.FieldByName('ConcType').AsString ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 0 then
    hb_newcustomsalt.CustomSaltForm.CheckBox2.Checked := false ;

    if MyDbf.FieldByName('IsLiquid').AsInteger = 1 then
    hb_newcustomsalt.CustomSaltForm.CheckBox2.Checked := true ;

    MyDbf.Close ;

    MyDbf.Free ;

    if hb_newcustomsalt.CustomSaltForm.Checkbox2.Checked = false then

   begin

   end;

  hb_newcustomsalt.CustomSaltForm.Button1.Enabled := False ;

  hb_newcustomsalt.CustomSaltForm.Button2.Enabled := True;

  hb_newcustomsalt.CustomSaltForm.SaltDBName := ListBox1.Items[selected_item] ;

  hb_newcustomsalt.CustomSaltForm.ComboBox1.ItemIndex := 0;

  hb_newcustomsalt.CustomSaltForm.ComboBox2.ItemIndex := 0 ;

  hb_newcustomsalt.CustomSaltForm.ComboBox3.ItemIndex := 0 ;

  hb_newcustomsalt.CustomSaltForm.Visible := True ;

end;

procedure TSubstanceSelectionForm.Button6Click(Sender: TObject);
var
i : integer ;
selected_item : integer ;
MyDbf: TDbf;
begin

   if ListBox2.SelCount = 0 then // No ítems selected
     Exit;

     For i := 0 to ListBox2.Items.Count - 1 do

         begin
                               if ListBox2.Selected [i] then
                               begin
                                selected_item := i ;
                               end;
         end;

   MyDbf := TDbf.Create(nil) ;
   MyDbf.FilePathFull := '';
   MyDbf.TableName := Form1.substances_used_db;
   MyDbf.Open             ;
   MyDbf.Active := true ;

    MyDbf.Filter := 'Name=' + QuotedStr(ListBox2.Items[selected_item]) ;

    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data

    hb_addweight.Form4.Edit1.text := MyDbf.FieldByName('Weight').AsString;
    hb_addweight.Form4.is_liquid := MyDbf.FieldByName('IsLiquid').AsInteger;

    MyDbf.Close ;

    MyDbf.Free ;

if (hb_addweight.Form4.is_liquid = 0) and (hb_main.Form1.RadioButton9.checked) then hb_addweight.Form4.Label1.Caption := 'Mass of substance (oz)';
if (hb_addweight.Form4.is_liquid = 0) and (hb_main.Form1.RadioButton8.checked) then hb_addweight.Form4.Label1.Caption := 'Mass of substance (g)';
if (hb_addweight.Form4.is_liquid = 1) then hb_addweight.Form4.Label1.Caption := 'Volume of substance (mL)';

hb_addweight.Form4.Label2.Caption := ListBox2.Items[selected_item] ;

hb_addweight.Form4.Visible := True ;

end;

procedure TSubstanceSelectionForm.Button7Click(Sender: TObject);
var
i : integer ;
selected_item : integer ;
MyDbf: TDbf;
begin


   MyDbf := TDbf.Create(nil) ;
   MyDbf.FilePathFull := '';
   MyDbf.TableName := Form1.substances_used_db;
   MyDbf.Open             ;
   MyDbf.Active := true ;


    while not MyDbf.EOF do
    begin

    MyDbf.Edit;

    MyDbf.FieldByName('Weight').AsFloat := 0;

    MyDbf.Post;

     MyDbf.Next;

    end;

    MyDbf.Close ;

    MyDbf.Free ;

 ShowMessage('All used substance weights have been reset to zero') ;

end;

procedure TSubstanceSelectionForm.Button8Click(Sender: TObject);
var
   saltList : TStringList  ;
   i: integer;
begin
   saltList := TStringList.Create;

   if ListBox2.Items.Count = 0 then
   begin
      ShowMessage('No substances have been loaded');
      exit;
   end;

   For i := 0 to ListBox2.Items.Count - 1 do
         begin
              saltList.Add(ListBox2.Items[i]);
         end;

   SaveDialog1.Execute;

   ShowMessage(SaveDialog1.FileName) ;
   saltList.SaveToFile(SaveDialog1.FileName);
   saltList.Free();
end;

procedure TSubstanceSelectionForm.Button9Click(Sender: TObject);
var
   saltList : TStringList  ;
   MyDbf: TDbf;
  MyDbf_used: TDbf;
  i, j : integer ;
  selected_items : array of integer ;
  selected_items2 : array of integer ;
  values_to_copy : array of double ;
  name1 : string ;
  conctype : string ;
  formula1 : string ;
begin

    MyDbf := TDbf.Create(nil) ;
    MyDbf.FilePathFull := '';
    MyDbf.TableName := Form1.substances_used_db;
    MyDbf.Open;
    MyDbf.ReadOnly := False;
    MyDbf.Active := true ;

    For i := 0 to ListBox2.Items.Count - 1 do
    begin
         SetLength(selected_items2, Length(selected_items2)+1);
         selected_items2[Length(selected_items2)-1] := i ;
    end;

    For i := 0 to Length(selected_items2)-1 do
    begin
        MyDbf.Filter := 'Name=' + QuotedStr(ListBox2.Items[selected_items2[i]]) ;
        MyDbf.Filtered := true;       // This selects the filtered set
        MyDbf.First;                  // moves the the first filtered data
        ListBox1.Items.Add(MyDbf.FieldByName('Name').AsString) ;
        MyDbf.Delete ;
    end;

    MyDbf.Close ;
    MyDbf.Free ;

    HB_Main.Form1.Button10.Enabled := false ;

    For i := 0 to Length(selected_items2)-1 do
    begin
         ListBox2.Items.Delete(selected_items2[i]);
         For j := 0 to Length(selected_items2)-1 do
         begin
              if (j > i) and (selected_items2[j] > selected_items2[i]) then
                 selected_items2[j] := selected_items2[j] - 1;
         end;
    end;

   OpenDialog1.Execute;
   saltList := TStringList.Create;
   saltList.LoadFromFile(OpenDialog1.FileName);

For j := 0 to ListBox1.Items.Count - 1 do
begin
    ListBox1.Selected [j] := False;
end;

 For i := 0 to saltList.Count - 1 do
 begin
      For j := 0 to ListBox1.Items.Count - 1 do
      begin
           if ListBox1.Items[j] = saltList[i] then
           begin
               SetLength(selected_items, Length(selected_items)+1);
               selected_items[Length(selected_items)-1] := j ;
           end;
      end;
 end;

  SetLength(values_to_copy, 20) ;

  MyDbf := TDbf.Create(nil) ;
  MyDbf.FilePathFull := '';
  MyDbf.TableName := Form1.substances_db;
  MyDbf.ReadOnly := False ;
  MyDbf.Open;

  MyDbf_used := TDbf.Create(nil) ;
  MyDbf_used.FilePathFull := '';
  MyDbf_used.TableName := Form1.substances_used_db;
  MyDbf_used.Open             ;
  MyDbf_used.Active := true ;

  For i := 0 to Length(selected_items)-1 do
  begin
    MyDbf.Filter := 'Name=' + QuotedStr(ListBox1.Items[selected_items[i]]) ;
    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;                  // moves the the first filtered data
    name1 :=  MyDbf.FieldByName('Name').AsString ;
    formula1 := MyDbf.FieldByName('Formula').AsString ;
    values_to_copy[0] := MyDbf.FieldByName('Purity').AsFloat ;
    values_to_copy[1] := MyDbf.FieldByName('N (NO3-)').AsFloat ;
    values_to_copy[2] := MyDbf.FieldByName('P').AsFloat ;
    values_to_copy[3] := MyDbf.FieldByName('K').AsFloat ;
    values_to_copy[4] := MyDbf.FieldByName('Mg').AsFloat ;
    values_to_copy[5] := MyDbf.FieldByName('Ca').AsFloat ;
    values_to_copy[6] := MyDbf.FieldByName('S').AsFloat ;
    values_to_copy[7] := MyDbf.FieldByName('B').AsFloat ;
    values_to_copy[8] := MyDbf.FieldByName('Fe').AsFloat ;
    values_to_copy[9] := MyDbf.FieldByName('Zn').AsFloat ;
    values_to_copy[10] := MyDbf.FieldByName('Cu').AsFloat ;
    values_to_copy[11] := MyDbf.FieldByName('Mo').AsFloat ;
    values_to_copy[12] := MyDbf.FieldByName('Na').AsFloat ;
    values_to_copy[13] := MyDbf.FieldByName('Si').AsFloat ;
    values_to_copy[14] := MyDbf.FieldByName('Cl').AsFloat ;
    values_to_copy[15] := MyDbf.FieldByName('Mn').AsFloat ;
    values_to_copy[16] := MyDbf.FieldByName('N (NH4+)').AsFloat ;
    values_to_copy[17] := MyDbf.FieldByName('Cost').AsFloat ;
    values_to_copy[18] := MyDbf.FieldByName('IsLiquid').AsFloat ;
    values_to_copy[19] := MyDbf.FieldByName('Density').AsFloat ;
    conctype := MyDbf.FieldByName('ConcType').AsString ;

    MyDbf_used.Insert ;

    MyDbf_used.FieldByName('Name').AsString:= name1 ;
    MyDbf_used.FieldByName('Formula').AsString:= formula1;
    MyDbf_used.FieldByName('Purity').AsFloat:=values_to_copy[0] ;
    MyDbf_used.FieldByName('N (NO3-)').AsFloat:=values_to_copy[1];
    MyDbf_used.FieldByName('P').AsFloat:=values_to_copy[2];
    MyDbf_used.FieldByName('K').AsFloat:=values_to_copy[3];
    MyDbf_used.FieldByName('Mg').AsFloat:=values_to_copy[4];
    MyDbf_used.FieldByName('Ca').AsFloat:=values_to_copy[5];
    MyDbf_used.FieldByName('S').AsFloat:=values_to_copy[6];
    MyDbf_used.FieldByName('B').AsFloat:=values_to_copy[7];
    MyDbf_used.FieldByName('Fe').AsFloat:=values_to_copy[8];
    MyDbf_used.FieldByName('Zn').AsFloat:=values_to_copy[9];
    MyDbf_used.FieldByName('Cu').AsFloat:=values_to_copy[10];
    MyDbf_used.FieldByName('Mo').AsFloat:=values_to_copy[11];
    MyDbf_used.FieldByName('Na').AsFloat:=values_to_copy[12];
    MyDbf_used.FieldByName('Si').AsFloat:=values_to_copy[13];
    MyDbf_used.FieldByName('Cl').AsFloat:=values_to_copy[14];
    MyDbf_used.FieldByName('Mn').AsFloat:=values_to_copy[15];
    MyDbf_used.FieldByName('N (NH4+)').AsFloat:=values_to_copy[16];
    MyDbf_used.FieldByName('Weight').AsFloat:=0;
    MyDbf_used.FieldByName('Cost').AsFloat:= values_to_copy[17] ;
    MyDbf_used.FieldByName('IsLiquid').AsInteger:=Round(values_to_copy[18]);
    MyDbf_used.FieldByName('Density').AsFloat := values_to_copy[19] ;
    MyDbf_used.FieldByName('ConcType').AsString:= conctype ;

    MyDbf_used.Post ;

  end;

  MyDbf.Close ;
  MyDbf.Free ;

  MyDbf_used.Close;
  MyDbf_used.Free;


  For i := 0 to Length(selected_items)-1 do
  begin
       ListBox2.Items.Add(ListBox1.Items[selected_items[i]]);
       ListBox1.Items.Delete(selected_items[i]);
       For j := 0 to Length(selected_items)-1 do
       begin
            if (j > i) and (selected_items[j] > selected_items[i]) then
               selected_items[j] := selected_items[j] - 1;
       end;

  end;

   saltList.Free();

end;

procedure TSubstanceSelectionForm.CheckBox1Change(Sender: TObject);
begin
  PopupNotifier1.Hide;
end;




initialization
  {$I hb_load_salts.lrs}

end.

