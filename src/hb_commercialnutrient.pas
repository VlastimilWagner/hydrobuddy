unit hb_commercialnutrient;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Buttons, hb_comparison, db_substances, customhelpfunctions, hb_constants;

type

  { TCommercialNutrientForm }

  TCommercialNutrientForm = class(TForm)
    CalculateButton: TBitBtn;
    AddProductButton: TButton;
    VolumeRadioGroup: TRadioGroup;
    SeeAllComparedButton: TButton;
    SubstancesComboBox: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    VolumeEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SelectSubstanceLabel: TLabel;
    CompositionValuesLabel: TLabel;
    VolumeLabel: TLabel;
    VolumePanel: TPanel ;
    AddToCurrentCheckBox: TCheckBox;
    procedure CalculateButtonClick(Sender: TObject);
    procedure AddProductButtonClick(Sender: TObject);
    procedure SeeAllComparedButtonClick(Sender: TObject);
    procedure SubstancesComboBoxChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    is_liquid: boolean;
  end; 

var
  CommercialNutrientForm: TCommercialNutrientForm;

implementation

uses HB_Main ;

{ TCommercialNutrientForm }


procedure TCommercialNutrientForm.CalculateButtonClick(Sender: TObject);
var
  i : integer ;
  varnames : array[0..NumOfElements-1] of string ;
  result : array[0..NumOfElements-1] of double ;
  test : double ;
  Volume : double ;
begin
  if VolumeRadioGroup.ItemIndex = 0 then Volume := 1      ;
  if VolumeRadioGroup.ItemIndex = 1 then Volume := GaltoLConstant ;

  for i := 1 to NumOfElements do begin
    // load all element names (this time we don't need to discriminate as
    // we simply calculate for everyone
    varnames[ i - 1 ] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption ;
  end;

  for i := 1 to NumOfElements do begin
    test := StrtoFloat(((FindComponent('Edit' + IntToStr(i)) as TEdit).Text)) ;
    result[i - 1] := round2((0.01 * test * StrtoFloat(VolumeEdit.Text) * 1000 )/Volume, 2) ;
  end;

  MainForm.cleanresults ;
  MainForm.ConcUnitsRadioGroup.ItemIndex := 0 ;

  // finally copy values to edit boxes
  for i := 1 to NumOfElements do
    if AddToCurrentCheckBox.Checked then
      (FindComponent('MainForm.Edit' + IntToStr(i)) as TEdit).Text := FloattoStr(result[i-1] + StrtoFloat((FindComponent('MainForm.Edit' + IntToStr(i)) as TEdit).Text))
    else
      (FindComponent('MainForm.Edit' + IntToStr(i)) as TEdit).Text := FloattoStr(result[i-1]) ;

  CommercialNutrientForm.Visible := false ;
end ;

procedure TCommercialNutrientForm.AddProductButtonClick(Sender: TObject);
var
  i : integer ;
  varnames : array[0..NumOfElements-1] of string ;
  result : array[0..NumOfElements-1] of double ;
  test : double ;
  Volume : double ;
  colCount: integer;
  addition_units: string;
  s:TTextStyle;
begin
  if (is_liquid = True) and (VolumeRadioGroup.ItemIndex = 1) then addition_units := 'mL/gal' ;
  if (is_liquid = False) and (VolumeRadioGroup.ItemIndex = 1) then addition_units := 'g/gal' ;
  if (is_liquid = True) and (VolumeRadioGroup.ItemIndex = 0) then addition_units := 'mL/L'   ;
  if (is_liquid = False) and (VolumeRadioGroup.ItemIndex = 0) then addition_units := 'g/L'   ;

  if VolumeRadioGroup.ItemIndex = 0 then Volume := 1;
  if VolumeRadioGroup.ItemIndex = 1 then Volume := GaltoLConstant ;

  // load all element names (this time we don't need to discriminate as
  // we simply calculate for everyone
  for i := 1 to NumOfElements do varnames[ i - 1 ] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption ;
  for i := 1 to NumOfElements do begin
    test := StrtoFloat(((FindComponent('Edit' + IntToStr(i)) as TEdit).Text)) ;
    result[i - 1] := round2((0.01 * test * StrtoFloat(VolumeEdit.Text) * 1000 )/Volume, 2) ;
  end;

  // finally copy values for comparison
  ComparisonForm.StringGrid.ColCount:= ComparisonForm.StringGrid.ColCount + 1 ;

  colCount := ComparisonForm.StringGrid.ColCount ;

  ComparisonForm.StringGrid.Cells[ColCount-1, 0] := SubstancesComboBox.Items[SubstancesComboBox.ItemIndex] ;

  for i := 1 to NumOfElements do
    ComparisonForm.StringGrid.Cells[ColCount-1, i] := FloattoStr(result[i-1]);

  ComparisonForm.StringGrid.Cells[ColCount-1, 17] := VolumeEdit.Text + addition_units ;

  ShowMessage('Product final ppm values added to comparison chart') ;
  ComparisonForm.StringGrid.AutoSizeColumn(colCount-1);
  s := ComparisonForm.StringGrid.DefaultTextStyle;
  s.Alignment:=taCenter;
  ComparisonForm.StringGrid.DefaultTextStyle := s;
end;

procedure TCommercialNutrientForm.SeeAllComparedButtonClick(Sender: TObject);
begin
  ComparisonForm.Visible := true ;
end;

procedure TCommercialNutrientForm.SubstancesComboBoxChange(Sender: TObject);
begin
  DBSubstances.SearchByField('Name', SubstancesComboBox.Items[SubstancesComboBox.ItemIndex], True);

  Edit1.text := FloatToStr(DBSubstances.N_NO3);
  Edit2.text := FloatToStr(DBSubstances.N_NH4);
  Edit3.text := FloatToStr(DBSubstances.P);
  Edit4.text := FloatToStr(DBSubstances.K);
  Edit5.text := FloatToStr(DBSubstances.Mg);
  Edit6.text := FloatToStr(DBSubstances.Ca);
  Edit7.text := FloatToStr(DBSubstances.S);
  Edit8.text := FloatToStr(DBSubstances.Fe);
  Edit9.text := FloatToStr(DBSubstances.Mn);
  Edit10.text := FloatToStr(DBSubstances.Zn);
  Edit11.text := FloatToStr(DBSubstances.B);
  Edit12.text := FloatToStr(DBSubstances.Cu);
  Edit13.text := FloatToStr(DBSubstances.Si);
  Edit14.text := FloatToStr(DBSubstances.Mo);
  Edit15.text := FloatToStr(DBSubstances.Na);
  Edit16.text := FloatToStr(DBSubstances.Cl);

  if DBSubstances.IsLiquid then begin
     is_liquid := True ;
     VolumeLabel.Caption := 'Volume of addition (mL)'
  end else begin
     is_liquid := False ;
     VolumeLabel.Caption := 'Mass of addition (g)'
  end;
end;


initialization
  {$I hb_commercialnutrient.lrs}

end.

