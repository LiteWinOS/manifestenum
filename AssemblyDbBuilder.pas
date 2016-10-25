unit AssemblyDbBuilder;

{$DEFINE PROFILE}

interface
uses AssemblyDb, ManifestParser;

function SxSDir: string;
function SxSManifestDir: string;

procedure InitAssemblyDb(ADb: TAssemblyDb; const AFilename: string; AAutoRebuild: boolean = true);
procedure ImportAssemblyManifests(ADb: TAssemblyDb);
procedure RebuildAssemblyDatabase(ADb: TAssemblyDb; const AFilename: string);

implementation
uses Windows, SysUtils, Classes, FilenameUtils, ManifestEnum_Progress;

function SxSDir: string;
begin
  Result := GetWindowsDir()+'\WinSxS';
end;

function SxSManifestDir: string;
begin
  Result := GetWindowsDir()+'\WinSxS\Manifests';
end;

procedure InitAssemblyDb(ADb: TAssemblyDb; const AFilename: string; AAutoRebuild: boolean);
begin
  if AAutoRebuild and not FileExists(AFilename) then
    RebuildAssemblyDatabase(ADb, AFilename)
  else
    ADb.Open(AFilename);
end;

//������ TStringList � ��������� ��� ������� �� �����, �� �����
function FilesByMask(const AMask: string): TStringList;
var sr: TSearchRec;
  res: integer;
begin
  Result := TStringList.Create;
  res := FindFirst(AMask, faAnyFile and not faDirectory, sr);
  while res = 0 do begin
    Result.Add(sr.Name);
    res := FindNext(sr);
  end;
  SysUtils.FindClose(sr);
end;

//Parses all manifests in WinSxS\Manifests and adds/updates their data in the database.
//Displays progress form.
procedure ImportAssemblyManifests(ADb: TAssemblyDb);
var baseDir: string;
  fnames: TStringList;
  i: integer;
  progress: TProgressForm;
  parser: TManifestParser;
 {$IFDEF PROFILE}
  tm1: cardinal;
 {$ENDIF}
begin
  baseDir := SxSManifestDir()+'\';
  fnames := nil;
  parser := nil;

  progress := TProgressForm.Create(nil);
  try
    progress.Show;

   {$IFDEF PROFILE}
    tm1 := GetTickCount();
   {$ENDIF}

    //���������� ������ ������
    progress.Start('Building file list');
    fnames := FilesByMask(baseDir+'\*.manifest');

    ADb.BeginTransaction;
    parser := TManifestParser.Create(ADb);

    //������ ��������� ����������.
    progress.Start('Reading manifests', fnames.Count-1);
    for i := 0 to fnames.Count-1 do begin
      parser.ImportManifest(baseDir+'\'+fnames[i]);
      progress.Step();
    end;

   {$IFDEF PROFILE}
    tm1 := GetTickCount-tm1;
    MessageBox(0, PChar('Total time: '+IntToStr(tm1)), PChar('Import completed'), MB_OK);
   {$ENDIF}

    ADb.CommitTransaction;
  finally
    FreeAndNil(parser);
    FreeAndNil(fnames);
    FreeAndNil(progress);
  end;
end;

procedure RebuildAssemblyDatabase(ADb: TAssemblyDb; const AFilename: string);
begin
  ADb.Close;
  DeleteFile(AFilename);
  ADb.Open(AFilename);
  ImportAssemblyManifests(ADb);
end;

end.
