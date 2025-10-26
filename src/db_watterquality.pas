unit db_watterquality;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base, customhelpfunctions;

type
  TWatterQualityRecord = record
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
  end;


  TDBWatterQuality = class(TDBBase)
  private
    FRowData: TWatterQualityRecord;
    procedure Createdb; override;
    procedure AssignFields; override;
    procedure AssignRowData; override;
    procedure InsertDataFromCSVRes;
    procedure InsertDataFromDBVer100;
  public
    constructor Create;
    property RowData: TWatterQualityRecord read FRowData write FRowData;
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
     Dbf.FieldByName('NAME').AsString:= fRowData.NAME;
     Dbf.FieldByName('N(NO3-)').AsFloat:= fRowData.N_NO3;
     Dbf.FieldByName('N(NH4+)').AsFloat:= fRowData.N_NH4;
     Dbf.FieldByName('P').AsFloat:= fRowData.P;
     Dbf.FieldByName('K').AsFloat:= fRowData.K;
     Dbf.FieldByName('Mg').AsFloat:= fRowData.Mg;
     Dbf.FieldByName('Ca').AsFloat:= fRowData.Ca;
     Dbf.FieldByName('S').AsFloat:= fRowData.S;
     Dbf.FieldByName('B').AsFloat:= fRowData.B;
     Dbf.FieldByName('Fe').AsFloat:= fRowData.Fe;
     Dbf.FieldByName('Zn').AsFloat:= fRowData.Zn;
     Dbf.FieldByName('Mn').AsFloat:= fRowData.Mn;
     Dbf.FieldByName('Cu').AsFloat:= fRowData.Cu;
     Dbf.FieldByName('Mo').AsFloat:= fRowData.Mo;
     Dbf.FieldByName('Na').AsFloat:= fRowData.Na;
     Dbf.FieldByName('Si').AsFloat:= fRowData.Si;
     Dbf.FieldByName('Cl').AsFloat:= fRowData.Cl;
     Dbf.FieldByName('DEFAULT').AsInteger:= fRowData.DEFAULT;
     Dbf.FieldByName('PH').AsFloat:= fRowData.PH;
     Dbf.FieldByName('GH').AsFloat:= fRowData.GH;
     Dbf.FieldByName('KH').AsFloat:= fRowData.KH;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBWatterQuality.AssignRowData;
begin
  try
    fRowData.NAME := Dbf.FieldByName('NAME').AsString;
    fRowData.N_NO3 := Dbf.FieldByName('N(NO3-)').AsFloat;
    fRowData.N_NH4 := Dbf.FieldByName('N(NH4+)').AsFloat;
    fRowData.P := Dbf.FieldByName('P').AsFloat;
    fRowData.K := Dbf.FieldByName('K').AsFloat;
    fRowData.Mg := Dbf.FieldByName('Mg').AsFloat;
    fRowData.Ca := Dbf.FieldByName('Ca').AsFloat;
    fRowData.S := Dbf.FieldByName('S').AsFloat;
    fRowData.B := Dbf.FieldByName('B').AsFloat;
    fRowData.Fe := Dbf.FieldByName('Fe').AsFloat;
    fRowData.Zn := Dbf.FieldByName('Zn').AsFloat;
    fRowData.Mn := Dbf.FieldByName('Mn').AsFloat;
    fRowData.Cu := Dbf.FieldByName('Cu').AsFloat;
    fRowData.Mo := Dbf.FieldByName('Mo').AsFloat;
    fRowData.Na := Dbf.FieldByName('Na').AsFloat;
    fRowData.Si := Dbf.FieldByName('Si').AsFloat;
    fRowData.Cl := Dbf.FieldByName('Cl').AsFloat;
    fRowData.DEFAULT := Dbf.FieldByName('DEFAULT').AsInteger;
    fRowData.PH := Dbf.FieldByName('PH').AsFloat;
    fRowData.GH := Dbf.FieldByName('GH').AsFloat;
    fRowData.KH := Dbf.FieldByName('KH').AsFloat;
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
   S: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
   IsLiquid: boolean;
begin
   S := TLazarusResourceStream.Create('dbwatterquality', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(S);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       if Doc.Cells[Doc.IndexOfCol('ISLIQUID',0),i]='True' then IsLiquid := True else IsLiquid := False;
       fRowData.NAME := Doc.Cells[Doc.IndexOfCol('NAME',0),i];
       fRowData.N_NO3 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NO3-)',0),i]);
       fRowData.N_NH4 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NH4+)',0),i]);
       fRowData.P := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('P',0),i]);
       fRowData.K := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('K',0),i]);
       fRowData.MG := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MG',0),i]);
       fRowData.CA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CA',0),i]);
       fRowData.S := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('S',0),i]);
       fRowData.B := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('B',0),i]);
       fRowData.FE := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('FE',0),i]);
       fRowData.ZN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('ZN',0),i]);
       fRowData.MN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MN',0),i]);
       fRowData.CU := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CU',0),i]);
       fRowData.MO := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MO',0),i]);
       fRowData.NA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('NA',0),i]);
       fRowData.SI := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('SI',0),i]);
       fRowData.CL := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CL',0),i]);
       fRowData.DEFAULT := StrtoInt(Doc.Cells[Doc.IndexOfCol('DEFAULT',0),i]);
       fRowData.PH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('PH',0),i]);
       fRowData.GH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('GH',0),i]);
       fRowData.KH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('KH',0),i]);
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

