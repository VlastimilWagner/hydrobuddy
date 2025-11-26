unit hb_tissue_analysis;

{$mode objfpc}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Grids, CustomHelpFunctions, db_tissue_analysis;

type

  { TForm16 }

  TForm16 = class(TForm)
    Button1: TBitBtn;
    Button2: TBitBtn;
    Button3: TBitBtn;
    Button4: TBitBtn;
    Button5: TBitBtn;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit2: TEdit;
    Edit25: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
  private

  public
      procedure UpdateTissueList;
  end;

var
  Form16: TForm16;

implementation

uses HB_Main ;

{ TForm16 }

procedure  TForm16.UpdateTissueList;
begin

  ListBox1.Items.Clear;

  DBTissueAnalysis.SearchFirst;
  while not DBTissueAnalysis.EOF do
  begin
    ListBox1.Items.Add(DBTissueAnalysis.Name);
    DBTissueAnalysis.Next;                                     // use .next here NOT .findnext!
  end;

end;

procedure TForm16.FormCreate(Sender: TObject);
begin

end;

procedure TForm16.ListBox1Click(Sender: TObject);
begin

end;

procedure TForm16.ListBox1SelectionChange(Sender: TObject; User: boolean);
var
  i,selected_idx : integer ;
  item_selected : boolean ;
  wue: double;
begin

  item_selected := false ;
  wue := StrtoFloatAnySeparator(Edit17.Text)  ;

  for i := 0 to ListBox1.Items.Count - 1 do begin
    if (ListBox1.Selected [i]) then begin
         selected_idx := i;
         item_selected := true ;
    end;
  end ;

  if item_selected then begin

    DBTissueAnalysis.SearchByField('Name',ListBox1.Items[selected_idx],True);

    Edit25.Text :=  ListBox1.Items[selected_idx];

    Edit1.Text :=  FloattoStr(DBTissueAnalysis.N);
    Edit3.Text :=  FloattoStr(DBTissueAnalysis.P);
    Edit4.Text :=  FloattoStr(DBTissueAnalysis.K);
    Edit5.Text :=  FloattoStr(DBTissueAnalysis.Mg);
    Edit6.Text :=  FloattoStr(DBTissueAnalysis.Ca);
    Edit7.Text :=  FloattoStr(DBTissueAnalysis.S);
    Edit13.Text :=  FloattoStr(DBTissueAnalysis.Si);
    Edit8.Text :=  FloattoStr(DBTissueAnalysis.Fe);
    Edit9.Text :=  FloattoStr(DBTissueAnalysis.Mn);
    Edit10.Text :=  FloattoStr(DBTissueAnalysis.Zn);
    Edit11.Text :=  FloattoStr(DBTissueAnalysis.B);
    Edit12.Text :=  FloattoStr(DBTissueAnalysis.Cu);
    Edit14.Text :=  FloattoStr(DBTissueAnalysis.Mo);
    Edit15.Text :=  FloattoStr(DBTissueAnalysis.Na);
    Edit16.Text :=  FloattoStr(DBTissueAnalysis.Cl);

    StringGrid1.Cells[1,1] :=  FloattoStr((DBTissueAnalysis.N/100.0)*(wue*1000)) ;
    StringGrid1.Cells[1,2] :=  FloattoStr((DBTissueAnalysis.P/100.0)*(wue*1000)) ;
    StringGrid1.Cells[1,3] :=  FloattoStr((DBTissueAnalysis.K/100.0)*(wue*1000)) ;
    StringGrid1.Cells[1,4] :=  FloattoStr((DBTissueAnalysis.Mg/100.0)*(wue*1000));
    StringGrid1.Cells[1,5] :=  FloattoStr((DBTissueAnalysis.Ca/100.0)*(wue*1000))   ;
    StringGrid1.Cells[1,6] :=  FloattoStr((DBTissueAnalysis.S/100.0)*(wue*1000));
    StringGrid1.Cells[1,7] :=  FloattoStr((DBTissueAnalysis.Fe/(10000*100.0))*(wue*1000))   ;
    StringGrid1.Cells[1,8] :=  FloattoStr((DBTissueAnalysis.Mn/(10000*100.0))*(wue*1000)) ;
    StringGrid1.Cells[1,9] :=  FloattoStr((DBTissueAnalysis.Zn/(10000*100.0))*(wue*1000)) ;
    StringGrid1.Cells[1,10] :=  FloattoStr((DBTissueAnalysis.B/(10000*100.0))*(wue*1000));
    StringGrid1.Cells[1,11] :=  FloattoStr((DBTissueAnalysis.Cu/(10000*100.0))*(wue*1000)) ;
    StringGrid1.Cells[1,12] :=  FloattoStr((DBTissueAnalysis.Si/100.0)*(wue*1000)) ;
    StringGrid1.Cells[1,13] :=  FloattoStr((DBTissueAnalysis.Mo/(10000*100.0))*(wue*1000)) ;
    StringGrid1.Cells[1,14] :=  FloattoStr((DBTissueAnalysis.Na/(10000*100.0))*(wue*1000));
    StringGrid1.Cells[1,15] :=  FloattoStr((DBTissueAnalysis.Cl/(10000*100.0))*(wue*1000)) ;

    Button1.Enabled := False ;
    Button2.Enabled := True ;
    Button4.Enabled := True ;
    Button5.Enabled := True ;
    Button3.Enabled := True ;
  end ;

if item_selected = False then
begin
    Button1.Enabled := True ;
    Button2.Enabled := False ;
    Button4.Enabled := True ;
    Button5.Enabled := False ;
    Button3.Enabled := False ;

    for i := 1 to StringGrid1.RowCount - 1 do StringGrid1.Cells[1,i] := '';

    Edit1.Text := '0';
    Edit3.Text := '0';
    Edit4.Text := '0';
    Edit5.Text := '0';
    Edit6.Text := '0';
    Edit7.Text := '0';
    Edit8.Text := '0';
    Edit9.Text := '0';
    Edit10.Text := '0';
    Edit11.Text := '0';
    Edit12.Text := '0';
    Edit13.Text := '0';
    Edit14.Text := '0';
    Edit15.Text := '0';
    Edit16.Text := '0';
    Edit25.Text := 'Name for DB';
end;


end;

procedure TForm16.Button1Click(Sender: TObject);
begin
DBTissueAnalysis.Name := Edit25.Text ;
DBTissueAnalysis.N := StrtoFloatAnySeparator(Edit1.Text);
DBTissueAnalysis.P := StrtoFloatAnySeparator(Edit3.Text);
DBTissueAnalysis.K := StrtoFloatAnySeparator(Edit4.Text);
DBTissueAnalysis.Mg := StrtoFloatAnySeparator(Edit5.Text);
DBTissueAnalysis.Ca := StrtoFloatAnySeparator(Edit6.Text);
DBTissueAnalysis.S := StrtoFloatAnySeparator(Edit7.Text);
DBTissueAnalysis.Fe := StrtoFloatAnySeparator(Edit8.Text);
DBTissueAnalysis.Mn := StrtoFloatAnySeparator(Edit9.Text);
DBTissueAnalysis.Zn := StrtoFloatAnySeparator(Edit10.Text);
DBTissueAnalysis.B := StrtoFloatAnySeparator(Edit11.Text);
DBTissueAnalysis.Cu := StrtoFloatAnySeparator(Edit12.Text);
DBTissueAnalysis.Si := StrtoFloatAnySeparator(Edit13.Text);
DBTissueAnalysis.Mo := StrtoFloatAnySeparator(Edit14.Text);
DBTissueAnalysis.Na := StrtoFloatAnySeparator(Edit15.Text);
DBTissueAnalysis.Cl := StrtoFloatAnySeparator(Edit16.Text);

DBTissueAnalysis.Insert;

Form16.UpdateTissueList ;
end;

procedure TForm16.Button2Click(Sender: TObject);
var
   i : integer ;
   selected_item : integer ;
begin

   if ListBox1.SelCount = 0 then // No ítems selected
     Exit;

   For i := 0 to ListBox1.Items.Count - 1 do begin
      if ListBox1.Selected [i] then selected_item := i ;
   end;

   ShowMessage('Deleting ' + ListBox1.Items[selected_item] + ' from database');
   DBTissueAnalysis.Delete('Name', ListBox1.Items[selected_item]) ;

   ListBox1.Items.Delete(selected_item);

   end;

procedure TForm16.Button3Click(Sender: TObject);
var
     i,selected_idx : integer ;
     item_selected : boolean ;
     wue: double;
begin

  item_selected := false ;
  wue := StrtoFloatAnySeparator(Edit17.Text)  ;

  for i := 0 to ListBox1.Items.Count - 1 do begin
       if (ListBox1.Selected [i]) then begin
          selected_idx := i;
          item_selected := true ;
       end;
  end;

  if item_selected then begin

     DBTissueAnalysis.SearchByField('Name',ListBox1.Items[selected_idx],True);

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
     Button1.Enabled := True ;
     Button2.Enabled := False ;
     Button4.Enabled := True ;
     Button5.Enabled := False ;
     Button3.Enabled := False ;
     for i := 1 to StringGrid1.RowCount - 1 do StringGrid1.Cells[1,i] := '';
     Edit1.Text := '0';
     Edit3.Text := '0';
     Edit4.Text := '0';
     Edit5.Text := '0';
     Edit6.Text := '0';
     Edit7.Text := '0';
     Edit8.Text := '0';
     Edit9.Text := '0';
     Edit10.Text := '0';
     Edit11.Text := '0';
     Edit12.Text := '0';
     Edit13.Text := '0';
     Edit14.Text := '0';
     Edit15.Text := '0';
     Edit16.Text := '0';
     Edit25.Text := 'Name for DB';
  end;

end;

procedure TForm16.Button4Click(Sender: TObject);
var
  i: integer;
begin
    ListBox1.Clear;
    UpdateTissueList;
    Button1.Enabled := True ;
    Button2.Enabled := False ;
    Button4.Enabled := True ;
    Button5.Enabled := False ;
    Button3.Enabled := False ;
    for i := 1 to StringGrid1.RowCount - 1 do StringGrid1.Cells[1,i] := '';
    Edit1.Text := '0';
    Edit3.Text := '0';
    Edit4.Text := '0';
    Edit5.Text := '0';
    Edit6.Text := '0';
    Edit7.Text := '0';
    Edit8.Text := '0';
    Edit9.Text := '0';
    Edit10.Text := '0';
    Edit11.Text := '0';
    Edit12.Text := '0';
    Edit13.Text := '0';
    Edit14.Text := '0';
    Edit15.Text := '0';
    Edit16.Text := '0';
    Edit25.Text := 'Name for DB';
end;

procedure TForm16.Button5Click(Sender: TObject);
var
  selected_item, i : integer ;
begin
   if ListBox1.SelCount = 0 then // No ítems selected
      Exit;

   For i := 0 to ListBox1.Items.Count - 1 do begin
      if ListBox1.Selected [i] then selected_item := i ;
   end;

   DBTissueAnalysis.Name := Edit25.Text ;
   DBTissueAnalysis.N := StrtoFloatAnySeparator(Edit1.Text);
   DBTissueAnalysis.P := StrtoFloatAnySeparator(Edit3.Text);
   DBTissueAnalysis.K := StrtoFloatAnySeparator(Edit4.Text);
   DBTissueAnalysis.Mg := StrtoFloatAnySeparator(Edit5.Text);
   DBTissueAnalysis.Ca := StrtoFloatAnySeparator(Edit6.Text);
   DBTissueAnalysis.S := StrtoFloatAnySeparator(Edit7.Text);
   DBTissueAnalysis.Fe := StrtoFloatAnySeparator(Edit8.Text);
   DBTissueAnalysis.Mn := StrtoFloatAnySeparator(Edit9.Text);
   DBTissueAnalysis.Zn := StrtoFloatAnySeparator(Edit10.Text);
   DBTissueAnalysis.B := StrtoFloatAnySeparator(Edit11.Text);
   DBTissueAnalysis.Cu := StrtoFloatAnySeparator(Edit12.Text);
   DBTissueAnalysis.Si := StrtoFloatAnySeparator(Edit13.Text);
   DBTissueAnalysis.Mo := StrtoFloatAnySeparator(Edit14.Text);
   DBTissueAnalysis.Na := StrtoFloatAnySeparator(Edit15.Text);
   DBTissueAnalysis.Cl := StrtoFloatAnySeparator(Edit16.Text);
   DBTissueAnalysis.Update('Name', ListBox1.Items[selected_item]);

   UpdateTissueList ;




   end;

initialization
  {$I hb_tissue_analysis.lrs}

end.

