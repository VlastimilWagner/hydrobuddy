unit hb_newcustomsalt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, Dbf, db, Dbf_Common, DOM, XMLRead, XMLWrite, CustomHelpFunctions ;

type

  { TCustomSaltForm }

  TCustomSaltForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ConcentratedTypeComboBox: TComboBox;
    SourceEdit: TEdit;
    SourceLabel: TLabel;
    N_NO3Edit: TEdit;
    ZnEdit: TEdit;
    BEdit: TEdit;
    CuEdit: TEdit;
    SiEdit: TEdit;
    MoEdit: TEdit;
    NameEdit: TEdit;
    PurityEdit: TEdit;
    FormulaEdit: TEdit;
    NaEdit: TEdit;
    ClEdit: TEdit;
    N_NH4Edit: TEdit;
    CostEdit: TEdit;
    PEdit: TEdit;
    KEdit: TEdit;
    MgEdit: TEdit;
    CaEdit: TEdit;
    SEdit: TEdit;
    FeEdit: TEdit;
    MnEdit: TEdit;
    N_NO3Label: TLabel;
    CuLabel: TLabel;
    MoLabel: TLabel;
    NaLabel: TLabel;
    SiLabel: TLabel;
    ClLabel: TLabel;
    NameLabel: TLabel;
    PurityLabel: TLabel;
    FormulaLabel: TLabel;
    MnLabel: TLabel;
    N_NH4Label: TLabel;
    ConcentratedTypeLabel: TLabel;
    CostLabel: TLabel;
    PleaseLabel: TLabel;
    MgLabel: TLabel;
    CaLabel: TLabel;
    SLabel: TLabel;
    FeLabel: TLabel;
    ZnLabel: TLabel;
    BLabel: TLabel;
    LoadFromXMLButton: TSpeedButton;
    SaveToXMLButton: TSpeedButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SaveToXMLButtonClick(Sender: TObject);
    procedure InsertPrepare;
    procedure UpdatePrepare(ItemName: string);
  private
    { private declarations }
  public
    { public declarations }
    SaltDBName: string;
    EditMode: boolean;
    end;

var
  CustomSaltForm: TCustomSaltForm;

implementation

uses HB_Main ;

{ TCustomSaltForm }

procedure TCustomSaltForm.InsertPrepare;
begin
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0 ;
    ComboBox3.ItemIndex := 0 ;
    CheckBox2.Checked := false;
    OKButton.Enabled := True ;
    CancelButton.Enabled := False ;
    NameEdit.Text := '';
    FormulaEdit.Text := '';
    SourceEdit.Text := '';
    CostEdit.Text := '100' ;
    PurityEdit.Text := '100' ;
    N_NO3Edit.Text := '0' ;
    ClEdit.Text := '0' ;
    PEdit.Text := '0' ;
    N_NH4Edit.Text := '0' ;
    KEdit.Text := '0' ;
    MgEdit.Text := '0' ;
    CaEdit.Text := '0' ;
    SEdit.Text := '0' ;
    FeEdit.Text := '0' ;
    MnEdit.Text := '0' ;
    ZnEdit.Text := '0' ;
    BEdit.Text := '0' ;
    CuEdit.Text := '0' ;
    SiEdit.Text := '0' ;
    MoEdit.Text := '0' ;
    NaEdit.Text := '0' ;

    EditMode := False;
end;

procedure TCustomSaltForm.UpdatePrepare(ItemName: string);
var
   MyDbf: TDbf;
begin
   MyDbf := TDbf.Create(nil) ;
   MyDbf.FilePathFull := '';
   MyDbf.TableName := MainForm.substances_db;
   MyDbf.Open             ;
   MyDbf.Active := true ;
   MyDbf.Filter := 'Name=' + QuotedStr(ItemName) ;
   MyDbf.Filtered := true;       // This selects the filtered set
   MyDbf.First;                  // moves the the first filtered data

   NameEdit.text := MyDbf.FieldByName('Name').AsString;
   FormulaEdit.text := MyDbf.FieldByName('Formula').AsString;
   SourceEdit.text := MyDbf.FieldByName('Source').AsString;
   PurityEdit.text := FloattoStr(MyDbf.FieldByName('Purity').AsFloat*100) ;
   N_NO3Edit.text := MyDbf.FieldByName('N (NO3-)').AsString ;
   N_NH4Edit.text := MyDbf.FieldByName('N (NH4+)').AsString ;
   PEdit.text := MyDbf.FieldByName('P').AsString ;
   KEdit.text := MyDbf.FieldByName('K').AsString ;
   MgEdit.text := MyDbf.FieldByName('Mg').AsString ;
   CaEdit.text := MyDbf.FieldByName('Ca').AsString ;
   SEdit.text := MyDbf.FieldByName('S').AsString ;
   FeEdit.text := MyDbf.FieldByName('Fe').AsString ;
   MnEdit.text := MyDbf.FieldByName('Mn').AsString ;
   ZnEdit.text := MyDbf.FieldByName('Zn').AsString ;
   BEdit.text := MyDbf.FieldByName('B').AsString ;
   CuEdit.text := MyDbf.FieldByName('Cu').AsString ;
   SiEdit.text := MyDbf.FieldByName('Si').AsString ;
   MoEdit.text := MyDbf.FieldByName('Mo').AsString ;
   NaEdit.text := MyDbf.FieldByName('Na').AsString ;
   ClEdit.text := MyDbf.FieldByName('Cl').AsString ;
   CostEdit.text := MyDbf.FieldByName('Cost').AsString ;

   ConcentratedTypeComboBox.text := MyDbf.FieldByName('ConcType').AsString;

   if MyDbf.FieldByName('IsLiquid').AsInteger = 0 then
      CheckBox2.Checked := false
   else
      CheckBox2.Checked := true ;

   MyDbf.Close ;
   MyDbf.Free ;

   SaltDBName := ItemName;
   ComboBox1.ItemIndex := 0;
   ComboBox2.ItemIndex := 0 ;
   ComboBox3.ItemIndex := 0 ;

   EditMode := True;
end;

procedure TCustomSaltForm.OKButtonClick(Sender: TObject);
var
MyDbf: TDbf;
currentValP: integer;
currentValK: Integer;
currentValSi: Integer;
begin

currentValP := ComboBox1.ItemIndex;
currentValK := ComboBox2.ItemIndex;
currentValSi := ComboBox3.ItemIndex;

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := MainForm.substances_db ;
MyDbf.Open             ;
MyDbf.Active := true ;

MyDbf.Insert ;

MyDbf.FieldByName('Name').AsString:= NameEdit.Text ;
MyDbf.FieldByName('Formula').AsString:= FormulaEdit.Text;
MyDbf.FieldByName('Purity').AsFloat:=StrtoFloatAnySeparator(PurityEdit.Text)/100 ;

if currentValP = 0 then
MyDbf.FieldByName('P').AsFloat:=StrtoFloatAnySeparator(PEdit.Text);

if currentValK = 0 then
MyDbf.FieldByName('K').AsFloat:=StrtoFloatAnySeparator(KEdit.Text);

if currentValSi = 0 then
MyDbf.FieldByName('Si').AsFloat:=StrtoFloatAnySeparator(SiEdit.Text);

if currentValP = 1 then
MyDbf.FieldByName('P').AsFloat:=(StrtoFloatAnySeparator(PEdit.Text)*0.4364);

if currentValK = 1 then
MyDbf.FieldByName('K').AsFloat:=(StrtoFloatAnySeparator(KEdit.Text)*0.8301);

if currentValSi = 1 then
MyDbf.FieldByName('Si').AsFloat:=(StrtoFloatAnySeparator(SiEdit.Text)*0.4684);


if CheckBox2.Checked = false then
   MyDbf.FieldByName('IsLiquid').AsInteger:=0;


if CheckBox2.Checked  then
   MyDbf.FieldByName('IsLiquid').AsInteger:=1;

MyDbf.FieldByName('N (NO3-)').AsFloat:=StrtoFloatAnySeparator(N_NO3Edit.Text);
MyDbf.FieldByName('N (NH4+)').AsFloat:=StrtoFloatAnySeparator(N_NH4Edit.Text);
MyDbf.FieldByName('Mg').AsFloat:=StrtoFloatAnySeparator(MgEdit.Text);
MyDbf.FieldByName('Ca').AsFloat:=StrtoFloatAnySeparator(CaEdit.Text);
MyDbf.FieldByName('S').AsFloat:=StrtoFloatAnySeparator(SEdit.Text);
MyDbf.FieldByName('Fe').AsFloat:=StrtoFloatAnySeparator(FeEdit.Text);
MyDbf.FieldByName('Mn').AsFloat:=StrtoFloatAnySeparator(MnEdit.Text);
MyDbf.FieldByName('Zn').AsFloat:=StrtoFloatAnySeparator(ZnEdit.Text);
MyDbf.FieldByName('B').AsFloat:=StrtoFloatAnySeparator(BEdit.Text);
MyDbf.FieldByName('Cu').AsFloat:=StrtoFloatAnySeparator(CuEdit.Text);
MyDbf.FieldByName('Mo').AsFloat:=StrtoFloatAnySeparator(MoEdit.Text);
MyDbf.FieldByName('Na').AsFloat:=StrtoFloatAnySeparator(NaEdit.Text);
MyDbf.FieldByName('Cl').AsFloat:=StrtoFloatAnySeparator(ClEdit.Text);

MyDbf.FieldByName('Cost').AsFloat:=StrtoFloatAnySeparator(CostEdit.Text);
MyDbf.FieldByName('ConcType').AsString:=ConcentratedTypeComboBox.Text;

MyDbf.Post ;

MyDbf.Close ;

MyDbf.Free ;

MainForm.UpdateList ;

if currentValP = 1  then
ShowMessage('P will be converted and saved as P%, to see P2O5 again in the future simply select it from the dropbox for automatic conversion');

if currentValK = 1  then
ShowMessage('K will be converted and saved as K%, to see K2O again in the future simply select it from the dropbox for automatic conversion');

if currentValSi = 1  then
ShowMessage('Si will be converted and saved as Si%, to see SiO2 again in the future simply select it from the dropbox for automatic conversion');

ComboBox1.ItemIndex := 0;

ComboBox2.ItemIndex := 0 ;

ComboBox3.ItemIndex := 0 ;

CustomSaltForm.Visible := False ;

end;

procedure TCustomSaltForm.CancelButtonClick(Sender: TObject);
var
MyDbf: TDbf;
currentValP: integer;
currentValK: Integer;
currentValSi: Integer;
begin

currentValP := ComboBox1.ItemIndex;
currentValK := ComboBox2.ItemIndex;
currentValSi := ComboBox3.ItemIndex;

MyDbf := TDbf.Create(nil) ;
MyDbf.FilePathFull := '';
MyDbf.TableName := MainForm.substances_db;
MyDbf.Open             ;
MyDbf.Active := true ;

MyDbf.Filter := 'Name=' + QuotedStr(SaltDbName) ;

    MyDbf.Filtered := true;       // This selects the filtered set
    MyDbf.First;

    MyDbf.Edit;

    MyDbf.FieldByName('Name').AsString:= NameEdit.Text ;
    MyDbf.FieldByName('Formula').AsString:= FormulaEdit.Text;
    MyDbf.FieldByName('Purity').AsFloat:=StrtoFloatAnySeparator(PurityEdit.Text)/100 ;
    MyDbf.FieldByName('N (NO3-)').AsFloat:=StrtoFloatAnySeparator(N_NO3Edit.Text);
    MyDbf.FieldByName('N (NH4+)').AsFloat:=StrtoFloatAnySeparator(N_NH4Edit.Text);

    if currentValP = 0 then
    MyDbf.FieldByName('P').AsFloat:=StrtoFloatAnySeparator(PEdit.Text);

    if currentValK = 0 then
    MyDbf.FieldByName('K').AsFloat:=StrtoFloatAnySeparator(KEdit.Text);

    if currentValSi = 0 then
    MyDbf.FieldByName('Si').AsFloat:=StrtoFloatAnySeparator(SiEdit.Text);

    if currentValP = 1 then
    MyDbf.FieldByName('P').AsFloat:=(StrtoFloatAnySeparator(PEdit.Text)*0.4364);

    if currentValK = 1 then
    MyDbf.FieldByName('K').AsFloat:=(StrtoFloatAnySeparator(KEdit.Text)*0.8301);

    if currentValSi = 1 then
    MyDbf.FieldByName('Si').AsFloat:=(StrtoFloatAnySeparator(SiEdit.Text)*0.4684);

    if CheckBox2.Checked = false then
    MyDbf.FieldByName('IsLiquid').AsInteger:=0;


   if CheckBox2.Checked  then
   MyDbf.FieldByName('IsLiquid').AsInteger:=1;

   MyDbf.FieldByName('Mg').AsFloat:=StrtoFloatAnySeparator(MgEdit.Text);
   MyDbf.FieldByName('Ca').AsFloat:=StrtoFloatAnySeparator(CaEdit.Text);
   MyDbf.FieldByName('S').AsFloat:=StrtoFloatAnySeparator(SEdit.Text);

   MyDbf.FieldByName('Fe').AsFloat:=StrtoFloatAnySeparator(FeEdit.Text);
   MyDbf.FieldByName('Mn').AsFloat:=StrtoFloatAnySeparator(MnEdit.Text);
   MyDbf.FieldByName('Zn').AsFloat:=StrtoFloatAnySeparator(ZnEdit.Text);
   MyDbf.FieldByName('B').AsFloat:=StrtoFloatAnySeparator(BEdit.Text);
   MyDbf.FieldByName('Cu').AsFloat:=StrtoFloatAnySeparator(CuEdit.Text);
   MyDbf.FieldByName('Mo').AsFloat:=StrtoFloatAnySeparator(MoEdit.Text);
   MyDbf.FieldByName('Na').AsFloat:=StrtoFloatAnySeparator(NaEdit.Text);
   MyDbf.FieldByName('Cl').AsFloat:=StrtoFloatAnySeparator(ClEdit.Text);

   MyDbf.FieldByName('Cost').AsFloat:=StrtoFloatAnySeparator(CostEdit.Text);

   MyDbf.FieldByName('ConcType').AsString:=ConcentratedTypeComboBox.Text;

    MyDbf.Post ;

MyDbf.Close ;

MyDbf.Free ;

ComboBox1.ItemIndex := 0;

ComboBox2.ItemIndex := 0 ;

ComboBox3.ItemIndex := 0 ;

MainForm.UpdateList ;

CustomSaltForm.Visible := False ;

end;


procedure TCustomSaltForm.CheckBox2Change(Sender: TObject);
begin

if Checkbox2.Checked
   then
       PleaseLabel.Caption := 'Please input values as W/V%'
   else
       PleaseLabel.Caption := 'Please input values as W/W%';

end;

procedure TCustomSaltForm.ComboBox1Change(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := ComboBox1.ItemIndex;
   if EditMode then
        if currentVal = 1 then
           PEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(PEdit.Text)*2.2915, 3))
        else
           PEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(PEdit.Text)*(1/2.2915), 3));
end;

procedure TCustomSaltForm.ComboBox2Change(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := ComboBox2.ItemIndex;
   if EditMode then
        if currentVal = 1 then
            KEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(KEdit.Text)*1.2047, 3))
        else
            KEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(KEdit.Text)*(1/1.2047), 3));
end;

procedure TCustomSaltForm.ComboBox3Change(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := ComboBox2.ItemIndex;
   if EditMode then
        if currentVal = 1 then
             SiEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(SiEdit.Text)*2.1348, 3))
        else
             SiEdit.Text := FloattoStr(MainForm.round2(StrtoFloatAnySeparator(SiEdit.Text)*(1/2.1348), 3));
end;


procedure TCustomSaltForm.SaveToXMLButtonClick(Sender: TObject);
var  MyXML: TXMLDocument;
     RootNode: TDOMNode;
     currentValP, currentValK, currentValSi: string;
begin
     try
        MyXML := TXMLDocument.Create;

        RootNode := MyXML.CreateElement('substance');
        MyXML.Appendchild(RootNode);                           // save root node
        AddNodeToXML(MyXML, RootNode, 'Name', NameEdit.Text);
        AddNodeToXML(MyXML, RootNode, 'Formula', FormulaEdit.Text);
        AddNodeToXML(MyXML, RootNode, 'Purity', PurityEdit.Text);
        AddNodeToXML(MyXML, RootNode, 'N_NO3', N_NO3Edit.Text);
        AddNodeToXML(MyXML, RootNode, 'N_NH4', N_NH4Edit.Text);

        if ComboBox1.ItemIndex=0 then currentValP := 'P' else currentValP := 'P2O5';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'P', PEdit.Text, 'Val', currentValP);

        if ComboBox2.ItemIndex=0 then currentValK := 'K' else currentValK := 'K2O';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'K', KEdit.Text, 'Val', currentValK);

        if ComboBox3.ItemIndex=0 then currentValSi := 'Si' else currentValSi := 'SiO2';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'Si', SiEdit.Text, 'Val', currentValSi);

        if CheckBox2.Checked = false
           then TDOMElement(RootNode).SetAttribute('IsLiquid', '0')
           else TDOMElement(RootNode).SetAttribute('IsLiquid', '1');

       AddNodeToXML(MyXML, RootNode, 'Mg', MgEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Ca', CaEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'S', SEdit.Text);

       AddNodeToXML(MyXML, RootNode, 'Fe', FeEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Mn', MnEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Zn', ZnEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'B', BEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Cu', CuEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Mo', MoEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Na', NaEdit.Text);
       AddNodeToXML(MyXML, RootNode, 'Cl', ClEdit.Text);

       AddNodeToXML(MyXML, RootNode, 'Cost', CostEdit.Text);

       AddNodeToXML(MyXML, RootNode, 'ConcType', ConcentratedTypeComboBox.Text);

        writeXMLFile(MyXML, 'test.xml');
     finally
       MyXML.Free;
     end;
end;

initialization
  {$I hb_newcustomsalt.lrs}

end.

