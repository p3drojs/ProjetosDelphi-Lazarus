unit dataModuleU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TdataModuleMD }

  TdataModuleMD = class(TDataModule)
    mainConnection: TZConnection;
    qryGenerica: TZQuery;
  private

  public
     function getSequence(const pNomeSequence: String): String;
  end;

var
  dataModuleMD: TdataModuleMD;

implementation

{$R *.lfm}

function TdataModuleMD.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGenerica.close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGenerica.Open;
     Result := qryGenerica.FieldByName('CODIGO').AsString;
 finally
   qryGenerica.Close;
 end;
end;

end.

