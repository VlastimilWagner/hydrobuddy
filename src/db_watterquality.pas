unit db_watterquality;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base, customhelpfunctions;

type

  TDBWatterQuality = class(TDBBase)
  private
    procedure Createdb; override;
    procedure AssignFields; override;
    procedure AssignRowData; override;
    procedure InsertDataFromCSVRes;
    procedure InsertDataFromDBVer100;
  public
      NAME: string;
      N_NO3: double;
      N_NH4: double;
      P: double;
      K: double;
      Mg: double;
      Ca: double;
      S: double;
      B: double;
      Fe: double;
      Zn: double;
      Mn: double;
      Cu: double;
      Mo: double;
      Na: double;
      Si: double;
      Cl: double;
      DEFAULT: integer;
      PH: double;
      GH: double;
      KH: double;
    constructor Create;
  end;

  var DBWatterQuality: TDBWatterQuality;


implementation

constructor TDBWatterQuality.Create;
begin
  inherited Create('watterquality.dbf');
end;



procedure TDBWatterQuality.Createdb;
begin
  Dbf.fielddefs.Clear;
  Dbf.TableLevel := 7;
  With Dbf.FieldDefs do begin
     Add('NAME', ftString, 80, True);
     Add('N(NO3-)', ftFloat, 0, False);
     Add('N(NH4+)', ftFloat, 0, False);
     Add('P', ftFloat, 0, False);
     Add('K', ftFloat, 0, False);
     Add('Mg', ftFloat, 0, False);
     Add('Ca', ftFloat, 0, False);
     Add('S', ftFloat, 0, False);
     Add('B', ftFloat, 0, False);
     Add('Fe', ftFloat, 0, False);
     Add('Zn', ftFloat, 0, False);
     Add('Mn', ftFloat, 0, False);
     Add('Cu', ftFloat, 0, False);
     Add('Mo', ftFloat, 0, False);
     Add('Na', ftFloat, 0, False);
     Add('Si', ftFloat, 0, False);
     Add('Cl', ftFloat, 0, False);
     Add('DEFAULT', ftInteger, 0, False);
     Add('PH', ftFloat, 0, False);
     Add('GH', ftFloat, 0, False);
     Add('KH', ftFloat, 0, False);
  End;
  Dbf.CreateTable;
  Dbf.Open;
  Dbf.AddIndex('name', 'Name', [ixCaseInsensitive]);
  Dbf.Active := true ;
  InsertDataFromCSVRes;
end;

procedure TDBWatterQuality.AssignFields;
begin
  try
     Dbf.FieldByName('NAME').AsString:= NAME;
     Dbf.FieldByName('N(NO3-)').AsFloat:= N_NO3;
     Dbf.FieldByName('N(NH4+)').AsFloat:= N_NH4;
     Dbf.FieldByName('P').AsFloat:= P;
     Dbf.FieldByName('K').AsFloat:= K;
     Dbf.FieldByName('Mg').AsFloat:= Mg;
     Dbf.FieldByName('Ca').AsFloat:= Ca;
     Dbf.FieldByName('S').AsFloat:= S;
     Dbf.FieldByName('B').AsFloat:= B;
     Dbf.FieldByName('Fe').AsFloat:= Fe;
     Dbf.FieldByName('Zn').AsFloat:= Zn;
     Dbf.FieldByName('Mn').AsFloat:= Mn;
     Dbf.FieldByName('Cu').AsFloat:= Cu;
     Dbf.FieldByName('Mo').AsFloat:= Mo;
     Dbf.FieldByName('Na').AsFloat:= Na;
     Dbf.FieldByName('Si').AsFloat:= Si;
     Dbf.FieldByName('Cl').AsFloat:= Cl;
     Dbf.FieldByName('DEFAULT').AsInteger:= DEFAULT;
     Dbf.FieldByName('PH').AsFloat:= PH;
     Dbf.FieldByName('GH').AsFloat:= GH;
     Dbf.FieldByName('KH').AsFloat:= KH;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBWatterQuality.AssignRowData;
begin
  try
    NAME := Dbf.FieldByName('NAME').AsString;
    N_NO3 := Dbf.FieldByName('N(NO3-)').AsFloat;
    N_NH4 := Dbf.FieldByName('N(NH4+)').AsFloat;
    P := Dbf.FieldByName('P').AsFloat;
    K := Dbf.FieldByName('K').AsFloat;
    Mg := Dbf.FieldByName('Mg').AsFloat;
    Ca := Dbf.FieldByName('Ca').AsFloat;
    S := Dbf.FieldByName('S').AsFloat;
    B := Dbf.FieldByName('B').AsFloat;
    Fe := Dbf.FieldByName('Fe').AsFloat;
    Zn := Dbf.FieldByName('Zn').AsFloat;
    Mn := Dbf.FieldByName('Mn').AsFloat;
    Cu := Dbf.FieldByName('Cu').AsFloat;
    Mo := Dbf.FieldByName('Mo').AsFloat;
    Na := Dbf.FieldByName('Na').AsFloat;
    Si := Dbf.FieldByName('Si').AsFloat;
    Cl := Dbf.FieldByName('Cl').AsFloat;
    DEFAULT := Dbf.FieldByName('DEFAULT').AsInteger;
    PH := Dbf.FieldByName('PH').AsFloat;
    GH := Dbf.FieldByName('GH').AsFloat;
    KH := Dbf.FieldByName('KH').AsFloat;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign from DBF Error: %s', [E.Message]);
  end;
end;

{===Public methods===}

procedure TDBWatterQuality.InsertDataFromDBVer100;
begin


end;

procedure TDBWatterQuality.InsertDataFromCSVRes;
var
   LRS: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
   IsLiquid: boolean;
begin
   LRS := TLazarusResourceStream.Create('dbwatterquality', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(LRS);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       if Doc.Cells[Doc.IndexOfCol('ISLIQUID',0),i]='True' then IsLiquid := True else IsLiquid := False;
       NAME := Doc.Cells[Doc.IndexOfCol('NAME',0),i];
       N_NO3 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NO3-)',0),i]);
       N_NH4 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NH4+)',0),i]);
       P := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('P',0),i]);
       K := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('K',0),i]);
       MG := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MG',0),i]);
       CA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CA',0),i]);
       S := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('S',0),i]);
       B := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('B',0),i]);
       FE := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('FE',0),i]);
       ZN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('ZN',0),i]);
       MN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MN',0),i]);
       CU := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CU',0),i]);
       MO := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MO',0),i]);
       NA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('NA',0),i]);
       SI := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('SI',0),i]);
       CL := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CL',0),i]);
       DEFAULT := StrtoInt(Doc.Cells[Doc.IndexOfCol('DEFAULT',0),i]);
       PH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('PH',0),i]);
       GH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('GH',0),i]);
       KH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('KH',0),i]);
       Insert;
     end;

   finally
     Doc.Free;
   end;
end;



begin
  {$I db_watterquality_csv.lrs}
  DBWatterQuality := TDbWatterQuality.Create;
end.

