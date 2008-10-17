unit FileSearch;
{
See also in SysUtils unit:

function FileIsReadOnly(const FileName: string): Boolean; inline;
function FileSetReadOnly(const FileName: string; ReadOnly: Boolean): Boolean;
}

interface

uses
  Windows, SysUtils, Classes;

procedure SearchFiles(const PathName, FileName: String; const InDir: Boolean; List: TStrings);

implementation

procedure SearchFiles(const PathName, FileName: String; const InDir: Boolean; List: TStrings);
var
  Rec: TSearchRec;
  Path: String;
begin
  Path := IncludeTrailingBackslash(PathName);
  if FindFirst(Path + FileName, faAnyFile - faDirectory, Rec) = 0 then
    try
      repeat
        List.Add(Path + Rec.Name);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;

  if not InDir then
    Exit;

  if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
    try
      repeat
        if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name <> '.') and (Rec.Name <> '..') then
          SearchFiles(Path + Rec.Name, FileName, True, List);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;
end;

end.
