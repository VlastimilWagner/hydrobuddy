unit db_substances_used;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base, customhelpfunctions;

type


  TDBSubstancesUsed = class(TDBBase)
  private
    procedure Createdb; override;
    procedure AssignFields; override;
    procedure AssignRowData; override;
    procedure InsertDataFromCSVRes;
    procedure InsertDataFromDBVer100;
  public
    NAME: string;
    FORMULA: string;
    SOURCE: string;
    PURITY: double;
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
    ISLIQUID: boolean;
    DENSITY: double;
    COST: double;
    WEIGHT: double;
    CONCTYPE: string;
    constructor Create;
  end;

  var DBSubstancesUsed: TDBSubstancesUsed;


implementation

constructor TDBSubstancesUsed.Create;
begin
  inherited Create('substances_used.dbf');
end;



procedure TDBSubstancesUsed.Createdb;
begin
  Dbf.fielddefs.Clear;
  Dbf.TableLevel := 7;
  With Dbf.FieldDefs do begin
    Add('NAME', ftString, 80, True);
    Add('FORMULA', ftString, 80, False);
    Add('SOURCE', ftString, 200, False);
    Add('PURITY', ftFloat, 0, False);
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
    Add('ISLIQUID', ftBoolean, 0, False);
    Add('DENSITY', ftFloat, 0, False);
    Add('COST', ftFloat, 0, False);
    Add('WEIGHT', ftFloat, 0, False);
    Add('CONCTYPE', ftString, 80, False);
  End;
  Dbf.CreateTable;
  Dbf.Open;
  Dbf.AddIndex('name', 'Name', [ixCaseInsensitive]);
  Dbf.Active := true ;
  InsertDataFromCSVRes;
end;

procedure TDBSubstancesUsed.AssignFields;
begin
  try
    Dbf.FieldByName('NAME').AsString:= NAME;
    Dbf.FieldByName('FORMULA').AsString:= FORMULA;
    Dbf.FieldByName('SOURCE').AsString:= SOURCE;
    Dbf.FieldByName('PURITY').AsFloat:= PURITY;
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
    Dbf.FieldByName('ISLIQUID').AsBoolean:= IsLiquid;
    Dbf.FieldByName('DENSITY').AsFloat:= Density;
    Dbf.FieldByName('COST').AsFloat:= Cost;
    Dbf.FieldByName('WEIGHT').AsFloat:= Weight;
    Dbf.FieldByName('CONCTYPE').AsString:= ConcType;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBSubstancesUsed.AssignRowData;
begin
  try
    NAME := Dbf.FieldByName('NAME').AsString;
    FORMULA := Dbf.FieldByName('FORMULA').AsString;
    SOURCE := Dbf.FieldByName('SOURCE').AsString;
    PURITY := Dbf.FieldByName('PURITY').AsFloat;
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
    ISLIQUID := Dbf.FieldByName('ISLIQUID').AsBoolean;
    DENSITY := Dbf.FieldByName('DENSITY').AsFloat;
    COST := Dbf.FieldByName('COST').AsFloat;
    WEIGHT := Dbf.FieldByName('WEIGHT').AsFloat;
    CONCTYPE := Dbf.FieldByName('CONCTYPE').AsString;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign from DBF Error: %s', [E.Message]);
  end;
end;

{===Public methods===}

procedure TDBSubstancesUsed.InsertDataFromDBVer100;
begin


end;

procedure TDBSubstancesUsed.InsertDataFromCSVRes;
var
   RS: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
   IsLiquidCSV: boolean;
begin
   RS := TLazarusResourceStream.Create('dbsubstances_used', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(RS);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       if Doc.Cells[Doc.IndexOfCol('ISLIQUID',0),i]='True' then IsLiquidCSV := True else IsLiquidCSV := False;
       NAME := Doc.Cells[Doc.IndexOfCol('NAME',0),i];
       FORMULA := Doc.Cells[Doc.IndexOfCol('FORMULA',0),i];
       SOURCE := Doc.Cells[Doc.IndexOfCol('SOURCE',0),i];
       PURITY := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('PURITY',0),i]);
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
       ISLIQUID := IsLiquidCSV;
       DENSITY := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('DENSITY',0),i]);
       COST := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('COST',0),i]);
       WEIGHT := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('WEIGHT',0),i]);
       CONCTYPE := Doc.Cells[Doc.IndexOfCol('CONCTYPE',0),i];
       Insert;
     end;

   finally
     Doc.Free;
   end;
end;



begin
  {$I db_substances_used_csv.lrs}
  DBSubstancesUsed := TDbSubstancesUsed.Create;
end.

