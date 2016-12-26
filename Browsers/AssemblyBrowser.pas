unit AssemblyBrowser;
// Displays the full list of all assemblies, allows to filter it by various keywords.
// Each assembly can be expanded to show its dependencies (and grand-dependencies and so on).

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Generics.Collections, DelayLoadTree, VirtualTrees, AssemblyDb.Core, AssemblyDb.Assemblies,
  CommonMessages, CommonResources, AssemblyDb.Bundles;

type
  TNodeType = (
    ntBundleFolder,
    ntBundle,
    ntAssembly
  );
  TNodeData = record
    DelayLoad: TDelayLoadHeader;
    Type_: TNodeType;
    Name: string;
    Assembly: TAssemblyData;
    Bundle: TBundleId;
  end;
  PNodeData = ^TNodeData;

  TAssemblyEvent = procedure(Sender: TObject; AAssembly: TAssemblyId) of object;

  TGroupingType = (
    gtFlatList,
    gtBundles
  );
  
  TAssemblyBrowserForm = class(TDelayLoadTree)
    pnlFilterSettings: TPanel;
    cbFilterByName: TCheckBox;
    cbFilterByFiles: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure TreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);
    procedure TreeGetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer;
      var ImageList: TCustomImageList);
    procedure TreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure TreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure TreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure cbFilterByNameClick(Sender: TObject);
  protected
    FGroupingType: TGroupingType;
    FOnSelectionChanged: TNotifyEvent;
    FBundleNodes: TDictionary<TBundleId, PVirtualNode>;
    FFilterText: string;
    procedure DelayLoad(ANode: PVirtualNode; ANodeData: pointer); override;
    procedure LoadAllAssemblies();
    function AddAssemblyNode(AParent: PVirtualNode; const AEntry: TAssemblyData): PVirtualNode;
    procedure AddBundleNodes;
    function GetBundleFolderNode(AParent: PVirtualNode; const AFolderName: string): PVirtualNode;
    procedure GetBundleFolderNode_Callback(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Data: Pointer; var Abort: Boolean);
    function AddBundleNode(AParent: PVirtualNode; const ABundle: TBundleData): PVirtualNode;
    function FindBundleNode(ABundle: TBundleId): PVirtualNode;
    procedure ApplyFilter;
    function GetFocusedAssembly: TAssemblyId;
    function GetSelectedAssemblies: TArray<TAssemblyId>;
    procedure SetGroupingType(const Value: TGroupingType);
    procedure FilterChanged(Sender: TObject); override;
    procedure WmSetQuickfilter(var msg: TWmSetQuickFilter); message WM_SET_QUICKFILTER;
  public
    procedure Clear; override;
    procedure Reload; override;
    property GroupingType: TGroupingType read FGroupingType write SetGroupingType;
    property FocusedAssembly: TAssemblyId read GetFocusedAssembly;
    property SelectedAssemblies: TArray<TAssemblyId> read GetSelectedAssemblies;
    property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
  end;

var
  AssemblyBrowserForm: TAssemblyBrowserForm;

implementation
uses CommonFilters;

{$R *.dfm}

procedure TAssemblyBrowserForm.FormCreate(Sender: TObject);
begin
  inherited;
  FBundleNodes := TDictionary<TBundleId, PVirtualNode>.Create;
end;

procedure TAssemblyBrowserForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBundleNodes);
  inherited;
end;

procedure TAssemblyBrowserForm.Clear;
begin
  inherited;
  FBundleNodes.Clear;
end;

procedure TAssemblyBrowserForm.Reload;
begin
  inherited;
  ApplyFilter;
end;

procedure TAssemblyBrowserForm.FilterChanged(Sender: TObject);
begin
  ApplyFilter;
end;

procedure TAssemblyBrowserForm.WmSetQuickfilter(var msg: TWmSetQuickFilter);
begin
  if FFilterText <> msg.FilterText^ then begin
    FFilterText := msg.FilterText^;
    ApplyFilter;
  end;
end;

procedure TAssemblyBrowserForm.DelayLoad(ANode: PVirtualNode; ANodeData: pointer);
begin
  if ANode = nil then begin
    LoadAllAssemblies();
    exit;
  end;
end;

procedure TAssemblyBrowserForm.LoadAllAssemblies();
var list: TAssemblyList;
  entry: TAssemblyData;
  assocList: TBundleAssociationList;
  assoc: TBundleAssociation;
  asmFound: TDictionary<TAssemblyId, boolean>;
  asmFoundVal: boolean;
  parentNode: PVirtualNode;
begin
 //DelayLoad will be called for each of the root assemblies immediately, which is slow.
 //So we'll try to create root nodes already delay-initialized.

  asmFound := nil;
  list := TAssemblyList.Create;
  try
    //If we're using bundles, add bundle nodes
    if FGroupingType = gtBundles then
      AddBundleNodes();

    FDb.Assemblies.GetAllAssemblies(list);

    asmFound := TDictionary<TAssemblyId, boolean>.Create;

    //If we're using bundles, add assembly instance to every node that has it
    if FGroupingType = gtBundles then begin
      assocList := TBundleAssociationList.Create;
      try
        Db.Bundles.GetAllAssemblyAssociations(assocList);
        for assoc in assocList do begin
          parentNode := Self.FindBundleNode(assoc.bundle);
          AddAssemblyNode(parentNode, list[assoc.assembly]);
          asmFound.AddOrSetValue(assoc.assembly, true);
        end;
      finally
        FreeAndNil(assocList);
      end;
    end;

    //Add the assemblies that had no parents
    for entry in list.Values do begin
      if asmFound.TryGetValue(entry.id, asmFoundVal) then
        continue;
      AddAssemblyNode(nil, entry);
    end;

  finally
    FreeAndNil(list);
    FreeAndNil(asmFound);
  end;
end;

procedure TAssemblyBrowserForm.AddBundleNodes;
var Bundles: TBundleList;
  Bundle: TBundleData;
  Path: TArray<string>;
  Node: PVirtualNode;
  i: integer;
begin
  FBundleNodes.Clear;
  Bundles := TBundleList.Create;
  try
    Db.Bundles.GetAll(Bundles);

    for Bundle in Bundles do begin
      if Bundle.path <> '' then
        Path := Bundle.path.Split(['\'])
      else
        SetLength(Path, 0);
      Node := nil;
      for i := 0 to Length(Path)-1 do
        Node := GetBundleFolderNode(Node, Path[i]);
      FBundleNodes.Add(Bundle.id, AddBundleNode(Node, Bundle));
    end;

  finally
    FreeAndNil(Bundles)
  end;
end;

function TAssemblyBrowserForm.AddAssemblyNode(AParent: PVirtualNode; const AEntry: TAssemblyData): PVirtualNode;
var Data: PNodeData;
begin
  Result := Tree.AddChild(AParent);
  Tree.ReinitNode(Result, false);
  Data := Tree.GetNodeData(Result);
  Data.Type_ := ntAssembly;
  Data.Name := AEntry.identity.ToString;
  Data.Assembly := AEntry;
  Data.DelayLoad.Touched := false;
end;

function TAssemblyBrowserForm.GetBundleFolderNode(AParent: PVirtualNode; const AFolderName: string): PVirtualNode;
var Data: PNodeData;
begin
  Result := Tree.IterateSubtree(AParent, GetBundleFolderNode_Callback, @AFolderName);
  if Result <> nil then exit;

  Result := Tree.AddChild(AParent);
  Tree.ReinitNode(Result, false);
  Data := Tree.GetNodeData(Result);
  Data.Type_ := ntBundleFolder;
  Data.Name := AFolderName;
  Data.DelayLoad.Touched := true;
end;

procedure TAssemblyBrowserForm.GetBundleFolderNode_Callback(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Data: Pointer; var Abort: Boolean);
var NodeData: PNodeData;
begin
  NodeData := Sender.GetNodeData(Node);
  Abort := (NodeData.Name = PString(Data)^);
end;

function TAssemblyBrowserForm.AddBundleNode(AParent: PVirtualNode; const ABundle: TBundleData): PVirtualNode;
var Data: PNodeData;
begin
  Result := Tree.AddChild(AParent);
  Tree.ReinitNode(Result, false);
  Data := Tree.GetNodeData(Result);
  Data.Type_ := ntBundle;
  Data.Name := ABundle.Name;
  Data.Bundle := ABundle.id;
  Data.DelayLoad.Touched := false;
end;

function TAssemblyBrowserForm.GetFocusedAssembly: TAssemblyId;
var Data: PNodeData;
begin
  if Tree.FocusedNode = nil then
    Result := 0
  else begin
    Data := Tree.GetNodeData(Tree.FocusedNode);
    if Data.Type_ <> ntAssembly then
      Result := 0
    else
      Result := Data.Assembly.id;
  end;
end;

function TAssemblyBrowserForm.GetSelectedAssemblies: TArray<TAssemblyId>;
var ANode: PVirtualNode;
  Data: PNodeData;
begin
  SetLength(Result, 0);
  for ANode in Tree.SelectedNodes() do begin
    Data := Tree.GetNodeData(ANode);
    if Data.Type_ <> ntAssembly then continue; //At this moment we don't count other nodes
    SetLength(Result, Length(Result)+1);
    Result[Length(Result)-1] := Data.Assembly.id;
  end;
end;

procedure TAssemblyBrowserForm.SetGroupingType(const Value: TGroupingType);
begin
  if FGroupingType <> Value then begin
    FGroupingType := Value;
    if FGroupingType <> gtFlatList then
      Tree.TreeOptions.PaintOptions := Tree.TreeOptions.PaintOptions + [toShowRoot]
    else
      Tree.TreeOptions.PaintOptions := Tree.TreeOptions.PaintOptions - [toShowRoot];
    
    if Self.Visible then
      Reload;
  end;
end;

function TAssemblyBrowserForm.FindBundleNode(ABundle: TBundleId): PVirtualNode;
begin
  Result := FBundleNodes[ABundle];
end;

procedure TAssemblyBrowserForm.TreeGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TNodeData);
end;

procedure TAssemblyBrowserForm.TreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var Data: PNodeData;
begin
  inherited;
  Data := Sender.GetNodeData(Node);
  Initialize(Data^);
end;

procedure TAssemblyBrowserForm.TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var Data: PNodeData;
begin
  inherited;
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TAssemblyBrowserForm.TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var Data: PNodeData;
begin
  if TextType <> ttNormal then exit;
  Data := Sender.GetNodeData(Node);
  case Column of
    NoColumn, 0: CellText := Data.Name;
  end;
end;

procedure TAssemblyBrowserForm.TreeGetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer;
  var ImageList: TCustomImageList);
var Data: PNodeData;
begin
  if not (Kind in [ikNormal, ikSelected]) then exit;
  Data := Sender.GetNodeData(Node);
  case Column of
    NoColumn, 0: begin
      ImageList := ResourceModule.SmallImages;
      case Data.Type_ of
        ntAssembly: ImageIndex := imgAssembly;
        ntBundleFolder: ImageIndex := imgFolder;
        ntBundle: ImageIndex := imgBundle;
      end;
    end;
  end;
end;

procedure TAssemblyBrowserForm.TreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var Data1, Data2: PNodeData;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case Column of
    NoColumn, 0: begin
      Result := integer(Data1.Type_) - integer(Data2.Type_);
      if Result = 0 then
        Result := CompareText(Data1.Name, Data2.Name);
    end;
  end;
end;

procedure TAssemblyBrowserForm.TreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var Data: PNodeData;
begin
  inherited;
  Data := Tree.GetNodeData(Node);
  if Data.Type_ = ntAssembly then begin
    if Data.Assembly.State <> asInstalled then
      TargetCanvas.Font.Color := clSilver
    else
    if Data.Assembly.IsDeployment then
      TargetCanvas.Font.Color := clBlue
    else
      TargetCanvas.Font.Color := clBlack;
  end;
end;

procedure TAssemblyBrowserForm.TreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex);
var Data: PNodeData;
begin
  inherited;
  Data := Tree.GetNodeData(Node);
  if Assigned(Self.FOnSelectionChanged) then
    Self.FOnSelectionChanged(Self);
end;

// Applies visibility to root nodes according to the current quick-filter
procedure TAssemblyBrowserForm.ApplyFilter;
var list: TAssemblyList;
  filter: string;
  Node: PVirtualNode;
  Data: PNodeData;
  ShowAll: boolean;
  Visible: boolean;
begin
  filter := FFilterText;

  list := TAssemblyList.Create;
  Tree.BeginUpdate;
  try
    ShowAll := ((not cbFilterByName.Checked) and (not cbFilterByFiles.Checked)) or (filter = '');
    if cbFilterByName.Checked and (filter <> '') then
      FDb.FilterAssemblyByName(filter, list);
    if cbFilterByFiles.Checked and (filter <> '') then
      FDb.FilterAssemblyByFile(filter, list);
    for Node in Tree.Nodes() do begin
      Data := Tree.GetNodeData(Node);
      if Data.Type_ <> ntAssembly then continue; //other nodes are always visible atm //TODO: Hide filtered
      Visible := ShowAll or list.ContainsKey(Data.Assembly.id);
      Tree.IsVisible[Node] := Visible and Filters.Test(Data.Assembly);
    end;
  finally
    Tree.EndUpdate;
    FreeAndNil(list);
  end;
end;

procedure TAssemblyBrowserForm.cbFilterByNameClick(Sender: TObject);
begin
  inherited;
  ApplyFilter;
end;

end.
