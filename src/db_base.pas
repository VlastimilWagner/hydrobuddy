unit db_base;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dbf, db;

type
  { === Abstract ancestor for all DBF classes === }
  TDBBase = class
  private
    FDbf: TDbf;
    FDBFileName: string;
  protected
    procedure CreateDB; virtual; abstract;
    procedure AssignFields; virtual; abstract;
    procedure AssignRowData; virtual; abstract;
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;

    procedure Insert;
    procedure Update(const AKeyField, AKeyValue: string);
    procedure Delete(const AKeyField, AKeyValue: string);
    procedure TruncateTable;

    function SearchFirst:boolean;
    function SearchByField(const AFieldName, AValue: string; LoadData: Boolean): Boolean;
    function Next:boolean;
    function EOF:boolean;

    property Dbf: TDbf read FDbf;
    property FileName: string read FDBFileName;
  end;

implementation

{ === TDBBase === }

constructor TDBBase.Create(const AFileName: string);
begin
  inherited Create;
  FDBFileName := AFileName;
  FDbf := TDbf.Create(nil);
  FDbf.TableName := AFileName;

  FDbf.FilePathFull := ExtractFilePath(ParamStr(0));

   if not FileExists(FDbf.FilePathFull + AFileName) then
     CreateDB;

   FDbf.Open;
end;

destructor TDBBase.Destroy;
begin
  if Assigned(FDbf) then
  begin
    if FDbf.Active then
      FDbf.Close;
    FDbf.Free;
  end;
  inherited Destroy;
end;

procedure TDBBase.Insert;
begin
  FDbf.Append;
  AssignFields;
  FDbf.Post;
end;

procedure TDBBase.Update(const AKeyField, AKeyValue: string);
begin
  if not SearchByField(AKeyField, AKeyValue, False) then
    raise Exception.CreateFmt('Record "%s=%s" not found.', [AKeyField, AKeyValue]);

  FDbf.Edit;
  AssignFields;
  FDbf.Post;
end;

procedure TDBBase.Delete(const AKeyField, AKeyValue: string);
begin
  if not SearchByField(AKeyField, AKeyValue, False) then
    raise Exception.CreateFmt('Record "%s=%s" not found..', [AKeyField, AKeyValue]);

  FDbf.Delete;
end;

procedure TDBBase.TruncateTable;
begin
  FDbf.First;
  while not FDbf.EOF do FDbf.Delete;
end;


function TDBBase.SearchFirst:boolean;
begin
  FDbf.First;
  AssignRowData;
end;

function TDBBase.Next:boolean;
var
   MyDbf: TDbf;
   Res: boolean;
begin
  FDbf.Next;
  if FDbf.EOF then Result := False else begin
    AssignRowData;
    Result := True;
  end;
end;


function TDBBase.SearchByField(const AFieldName, AValue: string; LoadData: Boolean): Boolean;
begin
  Result := False;
  FDbf.First;
  while not FDbf.EOF do
  begin
    if SameText(FDbf.FieldByName(AFieldName).AsString, AValue) then begin
      if LoadData then AssignRowData;
      Exit(True);
    end;
    FDbf.Next;
  end;
end;

function TDBBase.EOF:boolean;
begin
  Result := FDbf.EOF;
end;

end.

