unit hb_commercialnutrient;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Buttons, hb_comparison, db_substances, customhelpfunctions;

type

  { TCommercialNutrientForm }

  TCommercialNutrientForm = class(TForm)
    Button1: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit14: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label29: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel1: TPanel ;
    CheckBox1: TCheckBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
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


procedure TCommercialNutrientForm.Button1Click(Sender: TObject);
var
i : integer ;
varnames : array of string ;
result : array of double ;
test : double ;
Volume : double ;
begin

SetLength (varnames, 16) ;
SetLength (result, 16) ;

if  RadioButton3.Checked then
Volume := 1      ;

if RadioButton4.Checked then
Volume := 3.78541178 ;

for i := 1 to 16 do
 begin

 // load all element names (this time we don't need to discriminate as
 // we simply calculate for everyone
 varnames[ i - 1 ] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption ;

 end;


    for i := 1 to 16 do

    begin

      test := StrtoFloat(((FindComponent('Edit' + IntToStr(i)) as TEdit).Text)) ;
      result[i - 1] := round2((0.01 * test * StrtoFloat(Edit17.Text) * 1000 )/Volume, 2) ;

    end;

    MainForm.cleanresults ;
    MainForm.ConcUnitsRadioGroup.ItemIndex := 0 ;


    // finally copy values to edit boxes



           if CheckBox1.Checked = false then

           begin

          MainForm.Edit1.Text := FloattoStr(result[0]) ;
          MainForm.Edit3.Text := FloattoStr(result[2]) ;
          MainForm.Edit2.Text := FloattoStr(result[1]) ;
          MainForm.Edit14.Text := FloattoStr(result[13]) ;
          MainForm.Edit4.Text := FloattoStr(result[3]) ;
          MainForm.Edit5.Text := FloattoStr(result[4]) ;
          MainForm.Edit6.Text := FloattoStr(result[5]) ;
          MainForm.Edit7.Text := FloattoStr(result[6]) ;
          MainForm.Edit8.Text := FloattoStr(result[7]) ;
          MainForm.Edit9.Text := FloattoStr(result[8]) ;
          MainForm.Edit10.Text := FloattoStr(result[9]) ;
          MainForm.Edit11.Text := FloattoStr(result[10]) ;
          MainForm.Edit12.Text := FloattoStr(result[11]) ;
          MainForm.Edit13.Text := FloattoStr(result[12]) ;
          MainForm.Edit15.Text := FloattoStr(result[14]) ;
          MainForm.Edit16.Text := FloattoStr(result[15]) ;

          end ;




          if CheckBox1.Checked then

          begin

          MainForm.Edit1.Text := FloattoStr(result[0]+ StrtoFloat(MainForm.Edit1.Text)) ;

          MainForm.Edit3.Text := FloattoStr(result[2]+ StrtoFloat(MainForm.Edit3.Text)) ;

          MainForm.Edit2.Text := FloattoStr(result[1]+ StrtoFloat(MainForm.Edit2.Text)) ;  ;

          MainForm.Edit13.Text := FloattoStr(result[13]+ StrtoFloat(MainForm.Edit13.Text)) ;




          MainForm.Edit4.Text := FloattoStr(result[3]+ StrtoFloat(MainForm.Edit4.Text)) ;
          MainForm.Edit5.Text := FloattoStr(result[4]+ StrtoFloat(MainForm.Edit5.Text)) ;
          MainForm.Edit6.Text := FloattoStr(result[5]+ StrtoFloat(MainForm.Edit6.Text)) ;
          MainForm.Edit7.Text := FloattoStr(result[6]+ StrtoFloat(MainForm.Edit7.Text)) ;
          MainForm.Edit8.Text := FloattoStr(result[7]+ StrtoFloat(MainForm.Edit8.Text)) ;
          MainForm.Edit9.Text := FloattoStr(result[8]+ StrtoFloat(MainForm.Edit9.Text)) ;
          MainForm.Edit10.Text := FloattoStr(result[9]+ StrtoFloat(MainForm.Edit10.Text)) ;
          MainForm.Edit11.Text := FloattoStr(result[10]+ StrtoFloat(MainForm.Edit11.Text));
          MainForm.Edit12.Text := FloattoStr(result[11]+ StrtoFloat(MainForm.Edit12.Text));
          MainForm.Edit13.Text := FloattoStr(result[12]+ StrtoFloat(MainForm.Edit13.Text));
          MainForm.Edit14.Text := FloattoStr(result[13]+ StrtoFloat(MainForm.Edit14.Text));
          MainForm.Edit15.Text := FloattoStr(result[14]+ StrtoFloat(MainForm.Edit15.Text));
          MainForm.Edit16.Text :=FloattoStr(result[15]+ StrtoFloat(MainForm.Edit16.Text));

          end ;


          CommercialNutrientForm.Visible := false ;


          end ;

procedure TCommercialNutrientForm.Button2Click(Sender: TObject);
var
i : integer ;
varnames : array of string ;
result : array of double ;
test : double ;
Volume : double ;
colCount: integer;
addition_units: string;
s:TTextStyle;
begin


SetLength (varnames, 16) ;
SetLength (result, 16) ;

if (is_liquid = True) and (RadioButton4.Checked) then addition_units := 'mL/gal' ;
if (is_liquid = False) and (RadioButton4.Checked) then addition_units := 'g/gal' ;
if (is_liquid = True) and (RadioButton3.Checked) then addition_units := 'mL/L'   ;
if (is_liquid = False) and (RadioButton3.Checked) then addition_units := 'g/L'   ;

if  RadioButton3.Checked then
Volume := 1      ;

if RadioButton4.Checked then
Volume := 3.78541178 ;

for i := 1 to 16 do
 begin

 // load all element names (this time we don't need to discriminate as
 // we simply calculate for everyone
 varnames[ i - 1 ] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption ;

 end;


    for i := 1 to 16 do

    begin

    test := StrtoFloat(((FindComponent('Edit' + IntToStr(i)) as TEdit).Text)) ;
    result[i - 1] := round2((0.01 * test * StrtoFloat(Edit17.Text) * 1000 )/Volume, 2) ;

    end;


    // finally copy values for comparison

    ComparisonForm.StringGrid.ColCount:= ComparisonForm.StringGrid.ColCount + 1 ;

    colCount := ComparisonForm.StringGrid.ColCount ;

    ComparisonForm.StringGrid.Cells[ColCount-1, 0] := ComboBox4.Items[ComboBox4.ItemIndex] ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 1] := FloattoStr(result[0]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 2] := FloattoStr(result[1]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 3] := FloattoStr(result[2]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 4] := FloattoStr(result[3]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 5] := FloattoStr(result[4]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 6] := FloattoStr(result[5]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 7] := FloattoStr(result[6]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 8] := FloattoStr(result[7]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 9] := FloattoStr(result[8]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 10] := FloattoStr(result[9]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 11] := FloattoStr(result[10]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 12] := FloattoStr(result[11]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 13] := FloattoStr(result[12]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 14] := FloattoStr(result[13]);
    ComparisonForm.StringGrid.Cells[ColCount-1, 15] := FloattoStr(result[14]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 16] := FloattoStr(result[15]) ;
    ComparisonForm.StringGrid.Cells[ColCount-1, 17] := Edit17.Text + addition_units ;

    ShowMessage('Product final ppm values added to comparison chart') ;
    ComparisonForm.StringGrid.AutoSizeColumn(colCount-1);
    s := ComparisonForm.StringGrid.DefaultTextStyle;
    s.Alignment:=taCenter;
    ComparisonForm.StringGrid.DefaultTextStyle := s;
end;

procedure TCommercialNutrientForm.Button3Click(Sender: TObject);
begin
  ComparisonForm.Visible := true ;
end;

procedure TCommercialNutrientForm.ComboBox4Change(Sender: TObject);
begin

  DBSubstances.SearchByField('Name', ComboBox4.Items[ComboBox4.ItemIndex], True);

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


    if DBSubstances.IsLiquid then
    begin
         is_liquid := True ;
         Label20.Caption := 'Volume of addition (mL)'
    end else begin
         is_liquid := False ;
         Label20.Caption := 'Mass of addition (g)'
    end;


end;


initialization
  {$I hb_commercialnutrient.lrs}

end.

