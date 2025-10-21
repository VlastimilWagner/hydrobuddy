unit db_watterquality;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, customhelpfunctions;

type
  TDBwatterquality = object
  private
    const DBName = 'watterquality.dbf';
    procedure BasicPost(var MyDbf: TDbf);
    procedure Createdb;
    procedure InsertDataFromXMLRes(var MyDbf: TDbf);
    procedure InsertDataFromDBVer100(var MyDbf: TDbf);
  public
    RowData : RECORD
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
    constructor Init;
    procedure Insert;
    procedure Update;
    procedure Delete;
    function SearchByName(Name: string):boolean;
  end;

  var DBwatterquality: TDBwatterquality;


implementation

constructor TDBwatterquality.Init;
begin
  Createdb;
end;


procedure TDBwatterquality.BasicPost(var MyDbf: TDbf);
begin
   MyDbf.FieldByName('NAME').AsString:= RowData.NAME;
   MyDbf.FieldByName('N(NO3-)').AsFloat:= RowData.N_NO3;
   MyDbf.FieldByName('N(NH4+)').AsFloat:= RowData.N_NH4;
   MyDbf.FieldByName('P').AsFloat:= RowData.P;
   MyDbf.FieldByName('K').AsFloat:= RowData.K;
   MyDbf.FieldByName('Mg').AsFloat:= RowData.Mg;
   MyDbf.FieldByName('Ca').AsFloat:= RowData.Ca;
   MyDbf.FieldByName('S').AsFloat:= RowData.S;
   MyDbf.FieldByName('B').AsFloat:= RowData.B;
   MyDbf.FieldByName('Fe').AsFloat:= RowData.Fe;
   MyDbf.FieldByName('Zn').AsFloat:= RowData.Zn;
   MyDbf.FieldByName('Mn').AsFloat:= RowData.Mn;
   MyDbf.FieldByName('Cu').AsFloat:= RowData.Cu;
   MyDbf.FieldByName('Mo').AsFloat:= RowData.Mo;
   MyDbf.FieldByName('Na').AsFloat:= RowData.Na;
   MyDbf.FieldByName('Si').AsFloat:= RowData.Si;
   MyDbf.FieldByName('Cl').AsFloat:= RowData.Cl;
   MyDbf.FieldByName('DEFAULT').AsInteger:= RowData.DEFAULT;
   MyDbf.FieldByName('PH').AsFloat:= RowData.PH;
   MyDbf.FieldByName('GH').AsFloat:= RowData.GH;
   MyDbf.FieldByName('KH').AsFloat:= RowData.KH;
   MyDbf.Post ;
end;

procedure TDBwatterquality.Insert;
var
   MyDbf: TDbf;
begin
  MyDbf := TDbf.Create(nil);
  try
    MyDbf.FilePath := '';
    MyDbf.Exclusive := True;
    MyDbf.TableName := DBName;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Insert ;
    BasicPost(MyDbf);
    MyDbf.Close;
  finally
    MyDbf.Free;
  end;
end;

procedure TDBwatterquality.Update;
var
   MyDbf: TDbf;
begin
  MyDbf := TDbf.Create(nil);
  try
    MyDbf.FilePath := '';
    MyDbf.Exclusive := True;
    MyDbf.TableName := DBName;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Filter := 'Name=' + QuotedStr(RowData.NAME) ;
    MyDbf.Filtered := true;
    MyDbf.First;
    MyDbf.Edit ;
    BasicPost(MyDbf);
    MyDbf.Close;
  finally
    MyDbf.Free;
  end;
end;

procedure TDBwatterquality.Delete;
var
   MyDbf: TDbf;
begin
  MyDbf := TDbf.Create(nil);
  try
    MyDbf.FilePath := '';
    MyDbf.Exclusive := True;
    MyDbf.TableName := DBName;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Filter := 'Name=' + QuotedStr(RowData.NAME) ;
    MyDbf.Filtered := true;
    MyDbf.First;
    MyDbf.Delete ;
    MyDbf.Close;
  finally
    MyDbf.Free;
  end;
end;


function TDBwatterquality.SearchByName(Name: string):boolean;
var
   MyDbf: TDbf;
   Res: boolean;
begin
  MyDbf := TDbf.Create(nil);
  Res := False;
  try
    MyDbf.FilePath := '';
    MyDbf.Exclusive := True;
    MyDbf.TableName := DBName;
    MyDbf.Open             ;
    MyDbf.Active := true ;
    MyDbf.Filter := 'Name=' + QuotedStr(Name) ;
    MyDbf.Filtered := true;
    MyDbf.First;

    if not MyDbf.EOF then begin
      RowData.NAME := MyDbf.FieldByName('NAME').AsString;
      RowData.N_NO3 := MyDbf.FieldByName('N(NO3-)').AsFloat;
      RowData.N_NH4 := MyDbf.FieldByName('N(NH4+)').AsFloat;
      RowData.P := MyDbf.FieldByName('P').AsFloat;
      RowData.K := MyDbf.FieldByName('K').AsFloat;
      RowData.Mg := MyDbf.FieldByName('Mg').AsFloat;
      RowData.Ca := MyDbf.FieldByName('Ca').AsFloat;
      RowData.S := MyDbf.FieldByName('S').AsFloat;
      RowData.B := MyDbf.FieldByName('B').AsFloat;
      RowData.Fe := MyDbf.FieldByName('Fe').AsFloat;
      RowData.Zn := MyDbf.FieldByName('Zn').AsFloat;
      RowData.Mn := MyDbf.FieldByName('Mn').AsFloat;
      RowData.Cu := MyDbf.FieldByName('Cu').AsFloat;
      RowData.Mo := MyDbf.FieldByName('Mo').AsFloat;
      RowData.Na := MyDbf.FieldByName('Na').AsFloat;
      RowData.Si := MyDbf.FieldByName('Si').AsFloat;
      RowData.Cl := MyDbf.FieldByName('Cl').AsFloat;
      RowData.DEFAULT := MyDbf.FieldByName('DEFAULT').AsInteger;
      RowData.PH := MyDbf.FieldByName('PH').AsFloat;
      RowData.GH := MyDbf.FieldByName('GH').AsFloat;
      RowData.KH := MyDbf.FieldByName('KH').AsFloat;
      Res:=True;
    end else begin
      Res:=False;
    end;

    MyDbf.Close;
  finally
    MyDbf.Free;
  end;
  SearchByName := Res;
end;

procedure TDBwatterquality.InsertDataFromDBVer100(var MyDbf: TDbf);
begin


end;

procedure TDBwatterquality.InsertDataFromXMLRes(var MyDbf: TDbf);
var
   S: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
begin
   S := TLazarusResourceStream.Create('dbwatterquality', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(S);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       MyDbf.Insert ;
       RowData.NAME := Doc.Cells[Doc.IndexOfCol('NAME',0),i];
       RowData.N_NO3 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NO3-)',0),i]);
       RowData.N_NH4 := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('N(NH4+)',0),i]);
       RowData.P := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('P',0),i]);
       RowData.K := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('K',0),i]);
       RowData.MG := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MG',0),i]);
       RowData.CA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CA',0),i]);
       RowData.S := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('S',0),i]);
       RowData.B := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('B',0),i]);
       RowData.FE := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('FE',0),i]);
       RowData.ZN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('ZN',0),i]);
       RowData.MN := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MN',0),i]);
       RowData.CU := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CU',0),i]);
       RowData.MO := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('MO',0),i]);
       RowData.NA := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('NA',0),i]);
       RowData.SI := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('SI',0),i]);
       RowData.CL := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('CL',0),i]);
       RowData.DEFAULT := StrtoInt(Doc.Cells[Doc.IndexOfCol('DEFAULT',0),i]);
       RowData.PH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('PH',0),i]);
       RowData.GH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('GH',0),i]);
       RowData.KH := StrtoFloatAnySeparator(Doc.Cells[Doc.IndexOfCol('KH',0),i]);
       BasicPost(MyDbf);
     end;

   finally
     Doc.Free;
   end;
end;


procedure TDBwatterquality.Createdb;
var
  MyDbf: TDbf;
begin
  if not fileexists(DBName) then begin
    MyDbf := TDbf.Create(nil);
    try
      MyDbf.FilePath := '';
      MyDbf.TableLevel := 7;
      MyDbf.Exclusive := True;
      MyDbf.TableName := DBName;
      With MyDbf.FieldDefs do begin
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
      MyDbf.CreateTable;
      MyDbf.Open;
      MyDbf.AddIndex('name', 'Name', [ixCaseInsensitive]);
      MyDbf.Active := true ;

      InsertDataFromXMLRes(MyDbf);

      MyDbf.Close;
    finally
      MyDbf.Free;
    end;
  end;
end;

begin
  {$I db_watterquality_csv.lrs}
  DBwatterquality.Init;
end.

