unit CustomHelpFunctions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DOM, XMLRead, XMLWrite;

procedure AddNodeWithAttributeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string; AtribName: string; AtribValue: string);
procedure AddNodeToXML(var ObjXML: TXMLDocument; var ParentNode:TDOMNode; NodeName: string; NodeValue: string);
function StrtoFloatAnySeparator(s:string):extended;

implementation

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

