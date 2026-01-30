unit hb_newcustomsalt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, Dbf, DOM, XMLRead, XMLWrite, CustomHelpFunctions, db_substances, hb_constants;

type

  { TCustomSaltForm }

  TCustomSaltForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    AddSubstanceCheckBox: TCheckBox;
    PComboBox: TComboBox;
    KComboBox: TComboBox;
    SiComboBox: TComboBox;
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
    procedure AddSubstanceCheckBoxChange(Sender: TObject);
    procedure PComboBoxChange(Sender: TObject);
    procedure KComboBoxChange(Sender: TObject);
    procedure SiComboBoxChange(Sender: TObject);
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
    PComboBox.ItemIndex := 0;
    KComboBox.ItemIndex := 0 ;
    SiComboBox.ItemIndex := 0 ;
    AddSubstanceCheckBox.Checked := false;
    OKButton.Enabled := True ;
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
begin
   DBSubstances.SearchByField('NAME', ItemName, True);

   NameEdit.Text := DBSubstances.Name;
   FormulaEdit.text := DBSubstances.FORMULA;
   SourceEdit.text := DBSubstances.SOURCE;
   PurityEdit.text := floattostr(DBSubstances.PURITY*100);
   N_NO3Edit.text := floattostr(DBSubstances.N_NO3);
   N_NH4Edit.text := floattostr(DBSubstances.N_NH4);
   PEdit.text := floattostr(DBSubstances.P);
   KEdit.text := floattostr(DBSubstances.K);
   MgEdit.text := floattostr(DBSubstances.Mg);
   CaEdit.text := floattostr(DBSubstances.Ca);
   SEdit.text := floattostr(DBSubstances.S);
   FeEdit.text := floattostr(DBSubstances.Fe);
   MnEdit.text := floattostr(DBSubstances.Mn);
   ZnEdit.text := floattostr(DBSubstances.Zn);
   BEdit.text := floattostr(DBSubstances.B);
   CuEdit.text := floattostr(DBSubstances.Cu);
   SiEdit.text := floattostr(DBSubstances.Si);
   MoEdit.text := floattostr(DBSubstances.Mo);
   NaEdit.text := floattostr(DBSubstances.Na);
   ClEdit.text := floattostr(DBSubstances.Cl);
   CostEdit.text := floattostr(DBSubstances.Cost);
   ConcentratedTypeComboBox.text := DBSubstances.CONCTYPE;
   AddSubstanceCheckBox.Checked := DBSubstances.ISLIQUID;

   SaltDBName := ItemName;

   PComboBox.ItemIndex := 0 ;
   KComboBox.ItemIndex := 0 ;
   SiComboBox.ItemIndex := 0 ;

   EditMode := True;
end;

procedure TCustomSaltForm.OKButtonClick(Sender: TObject);
begin
  DBSubstances.NAME := NameEdit.Text;
  DBSubstances.FORMULA := FormulaEdit.Text;
  DBSubstances.PURITY := StrtoFloatAnySeparator(PurityEdit.Text)/100;

  if PComboBox.ItemIndex = 0 then
       DBSubstances.P := StrtoFloatAnySeparator(PEdit.Text)
  else
       DBSubstances.P := StrtoFloatAnySeparator(PEdit.Text) * P2O5toPConstant;

  if KComboBox.ItemIndex = 0 then
       DBSubstances.K := StrtoFloatAnySeparator(KEdit.Text)
  else
       DBSubstances.K := StrtoFloatAnySeparator(KEdit.Text) * K2OtoKConstant;

  if SiComboBox.ItemIndex = 0 then
       DBSubstances.Si := StrtoFloatAnySeparator(SiEdit.Text)
  else
       DBSubstances.Si := StrtoFloatAnySeparator(SiEdit.Text) * SiO2toSiConstant;

  DBSubstances.ISLIQUID := AddSubstanceCheckBox.Checked;
  DBSubstances.N_NO3 := StrtoFloatAnySeparator(N_NO3Edit.Text);
  DBSubstances.N_NH4 := StrtoFloatAnySeparator(N_NH4Edit.Text);
  DBSubstances.Mg := StrtoFloatAnySeparator(MgEdit.Text);
  DBSubstances.Ca := StrtoFloatAnySeparator(CaEdit.Text);
  DBSubstances.S := StrtoFloatAnySeparator(SEdit.Text);
  DBSubstances.Fe := StrtoFloatAnySeparator(FeEdit.Text);
  DBSubstances.Mn := StrtoFloatAnySeparator(MnEdit.Text);
  DBSubstances.Zn := StrtoFloatAnySeparator(ZnEdit.Text);
  DBSubstances.B := StrtoFloatAnySeparator(BEdit.Text);
  DBSubstances.Cu := StrtoFloatAnySeparator(CuEdit.Text);
  DBSubstances.Mo := StrtoFloatAnySeparator(MoEdit.Text);
  DBSubstances.Na := StrtoFloatAnySeparator(NaEdit.Text);
  DBSubstances.Cl := StrtoFloatAnySeparator(ClEdit.Text);
  DBSubstances.COST := StrtoFloatAnySeparator(CostEdit.Text);
  DBSubstances.CONCTYPE := ConcentratedTypeComboBox.Text;

  if PComboBox.ItemIndex = 1  then
     ShowMessage('P will be converted and saved as P%, to see P2O5 again in the future simply select it from the dropbox for automatic conversion');

  if KComboBox.ItemIndex = 1  then
     ShowMessage('K will be converted and saved as K%, to see K2O again in the future simply select it from the dropbox for automatic conversion');

  if KComboBox.ItemIndex = 1  then
     ShowMessage('Si will be converted and saved as Si%, to see SiO2 again in the future simply select it from the dropbox for automatic conversion');

  if EditMode then DBSubstances.Update('NAME',SaltDBName) else DBSubstances.Insert;

  ModalResult := mrOK;
  close;
end;

procedure TCustomSaltForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  close;
end;


procedure TCustomSaltForm.AddSubstanceCheckBoxChange(Sender: TObject);
begin

if AddSubstanceCheckBox.Checked
   then
       PleaseLabel.Caption := 'Please input values as W/V%'
   else
       PleaseLabel.Caption := 'Please input values as W/W%';

end;

procedure TCustomSaltForm.PComboBoxChange(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := PComboBox.ItemIndex;
   if EditMode then
        if currentVal = 1 then
           PEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(PEdit.Text)*2.2915, 3))
        else
           PEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(PEdit.Text)*(1/2.2915), 3));
end;

procedure TCustomSaltForm.KComboBoxChange(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := KComboBox.ItemIndex;
   if EditMode then
        if currentVal = 1 then
            KEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(KEdit.Text)*1.2047, 3))
        else
            KEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(KEdit.Text)*(1/1.2047), 3));
end;

procedure TCustomSaltForm.SiComboBoxChange(Sender: TObject);
var
   currentVal: integer;
begin
   currentVal := KComboBox.ItemIndex;
   if EditMode then
        if currentVal = 1 then
             SiEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(SiEdit.Text)*2.1348, 3))
        else
             SiEdit.Text := FloattoStr(round2(StrtoFloatAnySeparator(SiEdit.Text)*(1/2.1348), 3));
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

        if PComboBox.ItemIndex=0 then currentValP := 'P' else currentValP := 'P2O5';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'P', PEdit.Text, 'Val', currentValP);

        if KComboBox.ItemIndex=0 then currentValK := 'K' else currentValK := 'K2O';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'K', KEdit.Text, 'Val', currentValK);

        if SiComboBox.ItemIndex=0 then currentValSi := 'Si' else currentValSi := 'SiO2';
        AddNodeWithAttributeToXML(MyXML, RootNode, 'Si', SiEdit.Text, 'Val', currentValSi);

        if AddSubstanceCheckBox.Checked = false
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

        writeXMLFile(MyXML, NameEdit.Text+'.xml');
     finally
       MyXML.Free;
     end;
end;

initialization
  {$I hb_newcustomsalt.lrs}

end.

