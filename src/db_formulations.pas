unit db_formulations;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base, customhelpfunctions;

type

  TDBformulations = class(TDBBase)
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
    UNITS: string;
    constructor Create;
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
    Dbf.FieldByName('UNITS').AsString:= UNITS;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBformulations.AssignRowData;
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
    UNITS := Dbf.FieldByName('UNITS').AsString;
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
   RS: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
begin
   RS := TLazarusResourceStream.Create('dbformulations', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(RS);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
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
       UNITS := Doc.Cells[Doc.IndexOfCol('UNITS',0),i];
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

