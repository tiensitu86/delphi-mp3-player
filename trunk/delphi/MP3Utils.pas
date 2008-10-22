unit MP3Utils;

interface

uses
  Classes, SysUtils;

function GetID3TagInformation(mp3File: String; var Title, Artist, Album,
  Year, Track: String): Boolean;

implementation

uses ID3v2;

type
  TID3Rec = packed record
    Tag     : array[0..2] of Char;
    Title   : array[0..29] of Char;
    Artist  : array[0..29] of Char;
    Album   : array[0..29] of Char;
    Year    : array[0..3] of Char;
  end;

function GetID3TagInformation(mp3File: String; var Title, Artist, Album,
  Year, Track: String): Boolean;
var
  ID3: TID3Rec;
  fmp3: TFileStream;
  FileTag: TID3v2;
begin
  Title  := '';
  Artist := '';
  Album  := '';
  Year   := '';
  Track  := '';

  // Try first to retrieve id3 tag v2 info
  FileTag := TID3v2.Create;
  try
    if FileTag.ReadFromFile(mp3File) then begin
      if FileTag.Exists then begin
        Title  := FileTag.Title;
        Artist := FileTag.Artist;
        Album  := FileTag.Album;
        if FileTag.Track > 0 then
          Track := IntToStr(FileTag.Track);
        Year := FileTag.Year;
        Result := True;
      end else
        Result := False;
    end;
  finally
    FileTag.Free;
  end;

  // If not succeed or incomplete data fields then
  // try to retrieve id3 tag v1 info
  if (not Result) or (Title = '') or (Artist = '') or (Album = '') or (Year = '') then begin
    fmp3 := TFileStream.Create(mp3File, fmOpenRead);
    try
      fmp3.Position := fmp3.Size - 128;
      fmp3.Read(ID3, SizeOf(ID3));
    finally
      fmp3.free;
    end;
    if ID3.Tag = 'TAG' then begin
      if Title <> '' then
        Title  := ID3.Title;
      if Artist <> '' then
        Artist := ID3.Artist;
      if Album <> '' then
        Album  := ID3.Album;
      if Year <> '' then
        Year   := ID3.Year;
      Result := True;
    end;
  end;
end;

end.
