program fiture_satuan;

uses
  Forms,
  fiture_satuan_u in 'fiture_satuan_u.pas' {satuan},
  Unit1 in 'Unit1.pas' {dmsatuan: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tsatuan, satuan);
  Application.CreateForm(Tdmsatuan, dmsatuan);
  Application.Run;
end.
