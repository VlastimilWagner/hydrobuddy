unit db_formulations;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base, customhelpfunctions;

type
  TformulationRecord = record
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
      UNITS: string;
  end;


  TDBformulations = class(TDBBase)
  private
    FRowData: TFormulationRecord;
    procedure Createdb; override;
    procedure AssignFields; override;
    procedure AssignRowData; override;
    procedure InsertDataFromCSVRes;
    procedure InsertDataFromDBVer100;
  public
    constructor Create;
    property RowData: TformulationRecord read FRowData write FRowData;
  end;

  var DBformulations: TDBformulations;


implementation

constructor TDBformulations.Create;
begin
  inherited Create('formulations.dbf');
end;



procedure TDBformulations.Createdb;
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
    Add('UNITS', ftString, 80, False);
  End;
  Dbf.CreateTable;
  Dbf.Open;
  Dbf.AddIndex('name', 'Name', [ixCaseInsensitive]);
  Dbf.Active := true ;
  InsertDataFromCSVRes;
end;

procedure TDBformulations.AssignFields;
begin
  try
    Dbf.FieldByName('NAME').AsString:= FRowData.NAME;
    Dbf.FieldByName('N(NO3-)').AsFloat:= FRowData.N_NO3;
    Dbf.FieldByName('N(NH4+)').AsFloat:= FRowData.N_NH4;
    Dbf.FieldByName('P').AsFloat:= FRowData.P;
    Dbf.FieldByName('K').AsFloat:= FRowData.K;
    Dbf.FieldByName('Mg').AsFloat:= FRowData.Mg;
    Dbf.FieldByName('Ca').AsFloat:= FRowData.Ca;
    Dbf.FieldByName('S').AsFloat:= FRowData.S;
    Dbf.FieldByName('B').AsFloat:= FRowData.B;
    Dbf.FieldByName('Fe').AsFloat:= FRowData.Fe;
    Dbf.FieldByName('Zn').AsFloat:= FRowData.Zn;
    Dbf.FieldByName('Mn').AsFloat:= FRowData.Mn;
    Dbf.FieldByName('Cu').AsFloat:= FRowData.Cu;
    Dbf.FieldByName('Mo').AsFloat:= FRowData.Mo;
    Dbf.FieldByName('Na').AsFloat:= FRowData.Na;
    Dbf.FieldByName('Si').AsFloat:= FRowData.Si;
    Dbf.FieldByName('Cl').AsFloat:= FRowData.Cl;
    Dbf.FieldByName('UNITS').AsString:= FRowData.UNITS;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBformulations.AssignRowData;
begin
  try
    FRowData.NAME := Dbf.FieldByName('NAME').AsString;
    FRowData.N_NO3 := Dbf.FieldByName('N(NO3-)').AsFloat;
    FRowData.N_NH4 := Dbf.FieldByName('N(NH4+)').AsFloat;
    FRowData.P := Dbf.FieldByName('P').AsFloat;
    FRowData.K := Dbf.FieldByName('K').AsFloat;
    FRowData.Mg := Dbf.FieldByName('Mg').AsFloat;
    FRowData.Ca := Dbf.FieldByName('Ca').AsFloat;
    FRowData.S := Dbf.FieldByName('S').AsFloat;
    FRowData.B := Dbf.FieldByName('B').AsFloat;
    FRowData.Fe := Dbf.FieldByName('Fe').AsFloat;
    FRowData.Zn := Dbf.FieldByName('Zn').AsFloat;
    FRowData.Mn := Dbf.FieldByName('Mn').AsFloat;
    FRowData.Cu := Dbf.FieldByName('Cu').AsFloat;
    FRowData.Mo := Dbf.FieldByName('Mo').AsFloat;
    FRowData.Na := Dbf.FieldByName('Na').AsFloat;
    FRowData.Si := Dbf.FieldByName('Si').AsFloat;
    FRowData.Cl := Dbf.FieldByName('Cl').AsFloat;
    FRowData.UNITS := Dbf.FieldByName('UNITS').AsString;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign from DBF Error: %s', [E.Message]);
  end;
end;

{===Public methods===}

procedure TDBformulations.InsertDataFromDBVer100;
begin


end;

procedure TDBformulations.InsertDataFromCSVRes;
var
   S: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
begin
   S := TLazarusResourceStream.Create('dbformulations', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(S);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       FRowData.NAME := Doc.Cells[Doc.IndexOfCol('NAME',0),i];
       FRowData.N_NO3 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NO3-)',0),i]);
       FRowData.N_NH4 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NH4+)',0),i]);
       FRowData.P := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('P',0),i]);
       FRowData.K := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('K',0),i]);
       FRowData.MG := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MG',0),i]);
       FRowData.CA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CA',0),i]);
       FRowData.S := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('S',0),i]);
       FRowData.B := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('B',0),i]);
       FRowData.FE := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('FE',0),i]);
       FRowData.ZN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('ZN',0),i]);
       FRowData.MN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MN',0),i]);
       FRowData.CU := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CU',0),i]);
       FRowData.MO := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MO',0),i]);
       FRowData.NA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('NA',0),i]);
       FRowData.SI := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('SI',0),i]);
       FRowData.CL := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CL',0),i]);
       FRowData.UNITS := Doc.Cells[Doc.IndexOfCol('UNITS',0),i];
       Insert;
     end;

   finally
     Doc.Free;
   end;
end;



begin
  {$I db_formulations_csv.lrs}
  DBformulations := TDbFormulations.Create;
end.

