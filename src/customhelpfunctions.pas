unit CustomHelpFunctions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, Objects, SysUtils, DOM, XMLRead, XMLWrite, Grids, db_settings;

procedure SaveStringGridToDBSettings(var SG: TStringGrid; Group: string);
procedure LoadToStringGridFromDBSettings(var SG: TStringGrid; Group: string);
procedure AddNodeWithAttributeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string; AtribName: string; AtribValue: string);
procedure AddNodeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string);
function StrtoFloatAnySeparator(s:string):extended;

implementation

procedure SaveStringGridToDBSettings(var SG: TStringGrid; Group: string);
var i,j: integer;
    c: TStrings;
begin
  DBsettings.SaveSettingsValue(Group,'COLCOUNT',IntToStr(SG.ColCount));
  DBsettings.SaveSettingsValue(Group,'ROWCOUNT',IntToStr(SG.RowCount));
  DBsettings.SaveSettingsValue(Group,'FIXEDCOLS',IntToStr(SG.FixedCols));
  DBsettings.SaveSettingsValue(Group,'FIXEDROWS',IntToStr(SG.FixedRows));
  for i := SG.FixedCols to SG.ColCount-1 do begin
     for j := SG.FixedRows to SG.RowCount-1 do begin
         DBsettings.SaveSettingsValue(Group,'Value_'+IntToStr(i)+'_'+IntToStr(j),SG.Cells[i,j]);
     end;
  end;
end;

procedure LoadToStringGridFromDBSettings(var SG: TStringGrid; Group: string);
var i,j: integer;
    c: TStrings;
    sgcolums, sgrows: integer;
    fixedcols, fixedrows: integer;
begin
  sgcolums := StrToInt(DBsettings.LoadSettingsValue(Group,'COLCOUNT','0'));
  sgrows := StrToInt(DBsettings.LoadSettingsValue(Group,'ROWCOUNT','0'));
  fixedcols := StrToInt(DBsettings.LoadSettingsValue(Group,'FIXEDCOLS','0'));
  fixedrows := StrToInt(DBsettings.LoadSettingsValue(Group,'FIXEDROWS','0'));
  while SG.ColCount<sgcolums do SG.ColCount:= SG.ColCount + 1;
  while SG.RowCount<sgrows do SG.RowCount:= SG.RowCount + 1;
  for i := fixedcols to sgcolums-1 do begin
      for j := fixedrows to sgrows-1 do begin
            SG.Cells[i,j] := DBsettings.LoadSettingsValue(Group,'Value_'+IntToStr(i)+'_'+IntToStr(j),'');
      end;
  end;
end;

procedure AddNodeWithAttributeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string; AtribName: string; AtribValue: string);
var Node: TDOMNode;
begin
  Node := ObjXML.CreateElement(NodeName);
  Node.AppendChild(ObjXML.CreateTextNode(NodeValue));
  TDOMElement(Node).SetAttribute(AtribName, AtribValue);
  ParentNode.Appendchild(Node);
end;



procedure AddNodeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string);
var Node: TDOMNode;
begin
  Node := ObjXML.CreateElement(NodeName);
  Node.AppendChild(ObjXML.CreateTextNode(NodeValue));
  ParentNode.Appendchild(Node);
end;


function StrtoFloatAnySeparator(s:string):extended;
var
  x: Extended;
  fs: TFormatSettings;
begin
  x := 0;
  fs := FormatSettings;
  fs.DecimalSeparator := ',';
  fs.ThousandSeparator := '.';
  if not TryStrToFloat(s, x, fs) then begin
    fs := FormatSettings;
    fs.DecimalSeparator := '.';
    fs.ThousandSeparator := ',';
    if not TryStrToFloat(s, x, fs) then
      x := 0;
  end;
  StrtoFloatAnySeparator := x;
end;

end.

