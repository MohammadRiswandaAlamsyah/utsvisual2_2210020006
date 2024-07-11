unit Unit1;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tdmsatuan = class(TDataModule)
    consatuan: TZConnection;
    zqrysatuan: TZQuery;
    dssatuan: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmsatuan: Tdmsatuan;

implementation

{$R *.dfm}

end.
