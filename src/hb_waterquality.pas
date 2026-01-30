unit hb_waterquality;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, hb_ph, DOM, XMLRead, XMLWrite, db_watterquality, CustomHelpFunctions;

type

  { TWatterQualityForm }

  TWatterQualityForm = class(TForm)
    SaveToDBButton: TBitBtn;
    RemoveFromDBButton: TBitBtn;
    SetAsDefaultButton: TBitBtn;
    Button4: TButton;
    Button5: TButton;
    SelectWQDataComboBox: TComboBox;
    Edit1: TEdit;
    Edit12: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit13: TEdit;
    Edit16: TEdit;
    Edit25: TEdit;
    Edit9: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    NameLabel: TLabel;
    InputLabel: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SaveToXMLButton: TSpeedButton;
    LoadFromXMLButton: TSpeedButton;
    procedure SaveToDBButtonClick(Sender: TObject);
    procedure RemoveFromDBButtonClick(Sender: TObject);
    procedure SetAsDefaultButtonClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SelectWQDataComboBoxChange(Sender: TObject);
    procedure SelectWQDataComboBoxSelect(Sender: TObject);
    procedure SaveToXMLButtonClick(Sender: TObject);
  private
    { private declarations }
    procedure LoadFromDB;
  public
    { public declarations }
    procedure UpdateComboBox ;
    procedure SelectByName(WQName:string);
    procedure SelectDefault;
  end;

var
  WatterQualityForm: TWatterQualityForm;

implementation

uses HB_Main;

procedure TWatterQualityForm.SaveToDBButtonClick(Sender: TObject);
begin
  DBWatterQuality.Name := Edit25.Text ;
  DBWatterQuality.N_NO3 := StrtoFloatAnySeparator(Edit1.Text);
  DBWatterQuality.N_NH4 := StrtoFloatAnySeparator(Edit2.Text);
  DBWatterQuality.P := StrtoFloatAnySeparator(Edit3.Text);
  DBWatterQuality.K := StrtoFloatAnySeparator(Edit4.Text);
  DBWatterQuality.Mg := StrtoFloatAnySeparator(Edit5.Text);
  DBWatterQuality.Ca := StrtoFloatAnySeparator(Edit6.Text);
  DBWatterQuality.S := StrtoFloatAnySeparator(Edit7.Text);
  DBWatterQuality.Fe := StrtoFloatAnySeparator(Edit8.Text);
  DBWatterQuality.Mn := StrtoFloatAnySeparator(Edit9.Text);
  DBWatterQuality.Zn := StrtoFloatAnySeparator(Edit10.Text);
  DBWatterQuality.B := StrtoFloatAnySeparator(Edit11.Text);
  DBWatterQuality.Cu := StrtoFloatAnySeparator(Edit12.Text);
  DBWatterQuality.Si := StrtoFloatAnySeparator(Edit13.Text);
  DBWatterQuality.Mo := StrtoFloatAnySeparator(Edit14.Text);
  DBWatterQuality.Na := StrtoFloatAnySeparator(Edit15.Text);
  DBWatterQuality.Cl := StrtoFloatAnySeparator(Edit16.Text);
  DBWatterQuality.Default := 0;
  DBWatterQuality.Insert;

  ShowMessage('Water Quality data named ' + Edit25.Text + ' has been saved to the Database');

  WatterQualityForm.UpdateComboBox ;

  SetAsDefaultButton.Enabled := True ;
  RemoveFromDBButton.Enabled := true ;
end;

procedure TWatterQualityForm.RemoveFromDBButtonClick(Sender: TObject);
begin
  DBWatterQuality.Delete('Name', SelectWQDataComboBox.Items[SelectWQDataComboBox.ItemIndex]);
  SelectWQDataComboBox.Items.Delete(SelectWQDataComboBox.ItemIndex) ;

  if SelectWQDataComboBox.Items.Count = 0 then begin
     SelectWQDataComboBox.Text := 'Select Water Quality Data From DB' ;
     RemoveFromDBButton.Enabled := false ;
  end;

end;

procedure TWatterQualityForm.SetAsDefaultButtonClick(Sender: TObject);
begin
  DBWatterQuality.SearchFirst;

  while not DBWatterQuality.EOF do begin
    DBWatterQuality.Default := 0;
    DBWatterQuality.Update('Name',DBWatterQuality.Name);
    DBWatterQuality.next;
  end;

  DBWatterQuality.SearchByField('Name', Edit25.Text, True);
  DBWatterQuality.Default := 1 ;
  DBWatterQuality.Update('Name', Edit25.Text);

  ShowMessage(Edit25.Text + ' set as default water quality set') ;
end;

procedure TWatterQualityForm.Button4Click(Sender: TObject);
begin

WatterQualityForm.Visible := false ;

end;

procedure TWatterQualityForm.Button5Click(Sender: TObject);
begin
  hb_ph.AlkalinityForm.Visible := true ;
end;

procedure TWatterQualityForm.SelectWQDataComboBoxChange(Sender: TObject);
begin

end;

procedure TWatterQualityForm.LoadFromDB;
begin
  if not DBWatterQuality.EOF then begin
    Edit25.text := DBWatterQuality.Name;
    Edit1.text := floattostr(DBWatterQuality.N_NO3);
    Edit2.text := floattostr(DBWatterQuality.N_NH4);
    Edit3.text := floattostr(DBWatterQuality.P);
    Edit4.text := floattostr(DBWatterQuality.K);
    Edit5.text := floattostr(DBWatterQuality.Mg);
    Edit6.text := floattostr(DBWatterQuality.Ca);
    Edit7.text := floattostr(DBWatterQuality.S);
    Edit8.text := floattostr(DBWatterQuality.Fe);
    Edit9.text := floattostr(DBWatterQuality.Mn);
    Edit10.text := floattostr(DBWatterQuality.Zn);
    Edit11.text := floattostr(DBWatterQuality.B);
    Edit12.text := floattostr(DBWatterQuality.Cu);
    Edit13.text := floattostr(DBWatterQuality.Si);
    Edit14.text := floattostr(DBWatterQuality.Mo);
    Edit15.text := floattostr(DBWatterQuality.Na);
    Edit16.text := floattostr(DBWatterQuality.Cl);
  end;
end;


procedure TWatterQualityForm.SelectByName(WQName:string);
begin
  if DBWatterQuality.SearchByField('Name', WQName, True) then begin
    LoadFromDB;
  end;
end;


procedure TWatterQualityForm.SelectDefault;
begin
  if DBWatterQuality.SearchByField('Default', '1', True) then begin
    LoadFromDB;
  end;
end;

procedure TWatterQualityForm.SelectWQDataComboBoxSelect(Sender: TObject);
begin
  SelectByName(SelectWQDataComboBox.Items[SelectWQDataComboBox.ItemIndex]);
  SetAsDefaultButton.Enabled := True ;
end;

procedure TWatterQualityForm.SaveToXMLButtonClick(Sender: TObject);
var  MyXML: TXMLDocument;
     RootNode, Node, Value: TDOMNode;
begin
     try
        MyXML := TXMLDocument.Create;

        RootNode := MyXML.CreateElement('waterquality');
        MyXML.Appendchild(RootNode);                           // save root node

        Node := MyXML.CreateElement('Name');
        Value := MyXML.CreateTextNode('Fernando');         // insert a value to node
        RootNode.Appendchild(Value);                         // save node

        writeXMLFile(MyXML, 'test.xml');
     finally
       MyXML.Free;
     end;
end;


procedure TWatterQualityForm.UpdateComboBox ;
begin

  SelectWQDataComboBox.Items.Clear ;

  DBWatterQuality.SearchFirst;
  while not DBWatterQuality.EOF do begin
    SelectWQDataComboBox.Items.Add(DBWatterQuality.Name);
    DBWatterQuality.Next;
  end;

end ;


initialization
  {$I hb_waterquality.lrs}

end.

