unit db_settings;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, Dbf, db, Dbf_Common, LResources, csvdocument, db_base;

type

  TDBsettings = class(TDBBase)
  private
    procedure Createdb; override;
    procedure AssignFields; override;
    procedure AssignRowData; override;
    procedure InsertDataFromCSVRes;
    procedure InsertDataFromDBVer100;
  public
    GROUP: string;
    KEY: string;
    VALUE: string;
    constructor Create;
    function LoadSettingsValue(const GroupName, KeyName, DefaultValue: string): String;
    procedure SaveSettingsValue(const GroupName, KeyName, NewValue: string);
  end;

  var DBsettings: TDBsettings;


implementation

constructor TDBsettings.Create;
begin
  inherited Create('settings.dbf');
end;

procedure TDBsettings.Createdb;
begin
  Dbf.fielddefs.Clear;
  Dbf.TableLevel := 7;
  With Dbf.FieldDefs do begin
    Add('GROUP', ftString, 80, True);
    Add('KEY', ftString, 80, True);
    Add('VALUE', ftString, 80, True);
  End;
  Dbf.CreateTable;
  Dbf.Open;
  Dbf.Active := true ;
//  InsertDataFromCSVRes;
end;

procedure TDBsettings.AssignFields;
begin
  try
    Dbf.FieldByName('GROUP').AsString:= GROUP;
    Dbf.FieldByName('KEY').AsString:= KEY;
    Dbf.FieldByName('VALUE').AsString:= VALUE;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign DBF data Error: %s', [E.Message]);
  end;
end;

procedure TDBsettings.AssignRowData;
begin
  try
    GROUP := Dbf.FieldByName('GROUP').AsString;
    KEY := Dbf.FieldByName('KEY').AsString;
    VALUE := Dbf.FieldByName('VALUE').AsString;
  except
    on E:Exception do
       raise Exception.CreateFmt('Assign from DBF Error: %s', [E.Message]);
  end;
end;

{===Public methods===}

procedure TDBsettings.InsertDataFromDBVer100;
begin


end;

procedure TDBsettings.InsertDataFromCSVRes;
var
   RS: TLazarusResourceStream;
   Doc: TCSVDocument;
   ListFields: array[0..100] of string;
   i:integer;
begin
   RS := TLazarusResourceStream.Create('dbsettings', 'CSV');
   Doc := TCSVDocument.Create;
   try
     Doc.Delimiter := ',';
     Doc.LoadFromStream(RS);
     for i:= 0 to Doc.ColCount[0]-1 do ListFields[i] := Doc.Cells[i,0];

     for i:= 1 to Doc.RowCount-1 do begin
       GROUP := Doc.Cells[Doc.IndexOfCol('GROUP',0),i];
       KEY := Doc.Cells[Doc.IndexOfCol('KEY',0),i];
       VALUE := Doc.Cells[Doc.IndexOfCol('VALUE',0),i];
       Insert;
     end;

   finally
     Doc.Free;
   end;
end;

function TDBsettings.LoadSettingsValue(const GroupName, KeyName, DefaultValue: string): String;
begin
  Dbf.First;
  while not Dbf.EOF do
  begin
    if SameText(Dbf.FieldByName('GROUP').AsString, GroupName) and SameText(Dbf.FieldByName('KEY').AsString, KeyName) then begin
      Exit(Dbf.FieldByName('VALUE').AsString);
    end;
    Dbf.Next;
  end;
  // Not found
  Exit(DefaultValue);
end;

procedure TDBsettings.SaveSettingsValue(const GroupName, KeyName, NewValue: string);
begin
  Dbf.First;
  while not Dbf.EOF do
  begin
    if SameText(Dbf.FieldByName('GROUP').AsString, GroupName) and SameText(Dbf.FieldByName('KEY').AsString, KeyName) then begin
      AssignRowData;
      VALUE := NewValue;
      Dbf.Edit;
      AssignFields;
      Dbf.Post;
      Exit;
    end;
    Dbf.Next;
  end;
  // No found -> insert
  GROUP := GroupName;
  KEY := KeyName;
  VALUE := NewValue;
  Dbf.Append;
  AssignFields;
  Dbf.Post;
end;


begin
//  {$I db_settings_csv.lrs}
  DBsettings := TDbsettings.Create;
end.

