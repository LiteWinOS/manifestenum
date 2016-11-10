unit ServiceBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Dialogs, Vcl.ImgList, DelayLoadTree, VirtualTrees,
  AssemblyDb, CommonResources, AssemblyDb.Assemblies, AssemblyDb.Services;

type
  TNodeType = (ntFolder, ntService);
  TNodeData = record
    DelayLoad: TDelayLoadHeader;
    NodeType: TNodeType;
    Name: string;
    ServiceId: TServiceId;
    Entry: TServiceEntryData;
  end;
  PNodeData = ^TNodeData;

  TServiceBrowserForm = class(TDelayLoadTree)
    lblWhoAdded: TLabel;
    procedure TreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure TreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);
    procedure TreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure TreeGetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer;
      var ImageList: TCustomImageList);
    procedure TreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
  protected
    procedure DelayLoad(ANode: PVirtualNode; ANodeData: pointer); override;
    function AddServiceNode(AParent: PVirtualNode; AId: TServiceId; const AServiceData: TServiceEntryData): PVirtualNode;
  end;

var
  ServiceBrowserForm: TServiceBrowserForm;

implementation
uses Generics.Collections;

{$R *.dfm}

procedure TServiceBrowserForm.DelayLoad(ANode: PVirtualNode; ANodeData: pointer);
var AData: PNodeData absolute ANodeData;
  AList: TServiceList;
  AKey: TServiceId;
begin
  if (AData <> nil) and (AData.NodeType = ntService) then exit;

  AList := TServiceList.Create;
  try
    FDb.Services.GetAllServices(AList);
    for AKey in AList.Keys do
      AddServiceNode(ANode, AKey, AList.Items[AKey]);
  finally
    FreeAndNil(AList);
  end;
end;

function TServiceBrowserForm.AddServiceNode(AParent: PVirtualNode; AId: TServiceId; const AServiceData: TServiceEntryData): PVirtualNode;
var AData: PNodeData;
begin
  Result := inherited AddNode(AParent);
  AData := Tree.GetNodeData(Result);
  AData.NodeType := ntService;
  AData.Name := AServiceData.name;
  AData.ServiceId := AId;
  AData.Entry := AServiceData;
end;

procedure TServiceBrowserForm.TreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TNodeData);
end;

procedure TServiceBrowserForm.TreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var AData: PNodeData;
begin
  inherited;
  AData := Sender.GetNodeData(Node);
  Initialize(AData^);
end;

procedure TServiceBrowserForm.TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var AData: PNodeData;
begin
  inherited;
  AData := Sender.GetNodeData(Node);
  Finalize(AData^);
end;

procedure TServiceBrowserForm.TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var AData: PNodeData;
begin
  inherited;
  if TextType <> ttNormal then exit;

  AData := Sender.GetNodeData(Node);
  case Column of
    NoColumn, 0:
      CellText := AData.Name;
  end;
end;

procedure TServiceBrowserForm.TreeGetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer;
  var ImageList: TCustomImageList);
var AData: PNodeData;
begin
  if not (Kind in [ikNormal, ikSelected]) then exit;
  AData := Sender.GetNodeData(Node);

  case Column of
    NoColumn, 0: begin
      ImageList := ResourceModule.SmallImages;
      case AData.NodeType of
        ntFolder: ImageIndex := imgFolder;
        ntService: ImageIndex := imgService;
      end;
    end;
  end;
end;

procedure TServiceBrowserForm.TreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var AData1, AData2: PNodeData;
begin
  inherited;
  AData1 := Sender.GetNodeData(Node1);
  AData2 := Sender.GetNodeData(Node2);

  Result := integer(AData1.NodeType) - integer(AData2.NodeType);
  if Result = 0 then
    Result := CompareText(AData1.Name, AData2.Name);
end;

procedure TServiceBrowserForm.TreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex);
var AData: PNodeData;
begin
  inherited;
  AData := Sender.GetNodeData(Node);
  if AData.Entry.assemblyId > 0 then
    lblWhoAdded.Caption := 'Component: '+FDb.Assemblies.GetAssembly(AData.Entry.assemblyId).identity.ToString
  else
    lblWhoAdded.Caption := '';
end;


end.
