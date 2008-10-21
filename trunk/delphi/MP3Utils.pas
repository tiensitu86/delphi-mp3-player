unit MP3Utils;

interface

uses
  Classes, SysUtils;

function GetID3TagInformation(mp3File: String; var Title, Artist, Album, Year: String): Boolean;

implementation

type
  TID3Rec = packed record
    Tag     : array[0..2] of Char;
    Title   : array[0..29] of Char;
    Artist  : array[0..29] of Char;
    Album   : array[0..29] of Char;
    Year    : array[0..3] of Char;
  end;

function GetID3TagInformation(mp3File: String; var Title, Artist, Album, Year: String): Boolean;
var
  ID3: TID3Rec;
  fmp3: TFileStream;
begin
  fmp3 := TFileStream.Create(mp3File, fmOpenRead);
  try
    fmp3.Position := fmp3.Size - 128;
    fmp3.Read(ID3, SizeOf(ID3));
  finally
    fmp3.free;
  end;

  if ID3.Tag = 'TAG' then begin
    Title  := ID3.Title;
    Artist := ID3.Artist;
    Album  := ID3.Album;
    Year   := ID3.Year;
    Result := True;
  end else begin
    Title  := '';
    Artist := '';
    Album  := '';
    Year   := '';
    Result := False;
  end;
end;

end.
