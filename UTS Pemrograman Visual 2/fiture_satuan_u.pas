unit fiture_satuan_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tsatuan = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrdsatuan: TDBGrid;
    lbl9: TLabel;
    edt6: TEdit;
    procedure setawal;
    procedure bersih;
    procedure FormCreate(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbgrdsatuanCellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  satuan: Tsatuan;
  a: string;

implementation

uses Unit1;

{$R *.dfm}

procedure Tsatuan.setawal;
begin
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  edt1.Enabled:= True;
  edt2.Enabled:= True;

  dbgrdsatuan.Columns[0].Visible:= False;
  dbgrdsatuan.Columns[1].Width:= 150;
  dbgrdsatuan.Columns[2].Width:= 375;
end;

procedure Tsatuan.FormCreate(Sender: TObject);
begin
  setawal;
end;

procedure Tsatuan.btn5Click(Sender: TObject);
begin
  setawal;
  bersih;
end;

procedure Tsatuan.dbgrdsatuanCellClick(Column: TColumn);
begin
  btn2.Enabled:= False;
  btn3.Enabled:= True;
  btn4.Enabled:= True;
  btn5.Enabled:= True;
  edt1.Enabled:= True;
  edt2.Enabled:= True;
  a:= dmsatuan.zqrysatuan.Fields[0].AsString;
  edt1.Text:= dmsatuan.zqrysatuan.Fields[1].AsString;
  edt2.Text:= dmsatuan.zqrysatuan.Fields[2].AsString;
end;

procedure Tsatuan.btn2Click(Sender: TObject);
begin
  if edt1.text='' then
  begin
    ShowMessage('Isi Nama Terlebih Dahulu!');
  end else if edt2.Text='' then
  begin
    ShowMessage('Isi Deskripsi Terlebih Dahulu!');
  end else if dmsatuan.zqrysatuan.locate('nama',edt1.Text,[]) then
  begin
    ShowMessage('Nama Sudah Ada!');
  end else
  begin
    //memasukkan data/simpan
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('insert into satuan values(null, "'+edt1.text+'", "'+edt2.text+'")');
    dmsatuan.zqrysatuan.ExecSQL;
    //menampilkan data/view
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('select * from satuan');
    dmsatuan.zqrysatuan.Open;
    setawal;
    bersih;
    ShowMessage('Data Berhasil Disimpan!');
  end;
end;

procedure Tsatuan.btn3Click(Sender: TObject);
begin
  if (dmsatuan.zqrysatuan.Fields[1].AsString<>edt1.Text)or(dmsatuan.zqrysatuan.Fields[2].AsString<>edt2.Text) then
  begin
    //memperbarui data/update
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('update satuan set nama="'+edt1.Text+'", deskripsi="'+edt2.Text+'" where id = "'+a+'"');
    dmsatuan.zqrysatuan.ExecSQL;
    //menampilkan data/view
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('select * from satuan');
    dmsatuan.zqrysatuan.Open;
    setawal;
    bersih;
    ShowMessage('Data Berhasil Diupdate!');
  end else
  begin
    ShowMessage('Data Tidak Ada Perubahan');
    setawal;
    bersih;
  end;
end;

procedure Tsatuan.btn4Click(Sender: TObject);
begin
  if MessageDlg('Apakah Anda Ingin Menghapus Data Ini ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    //menghapus data/delete
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('delete from satuan where id = "'+a+'"');
    dmsatuan.zqrysatuan.ExecSQL;
    //menampilkan data/view
    dmsatuan.zqrysatuan.SQL.Clear;
    dmsatuan.zqrysatuan.SQL.Add('select * from satuan');
    dmsatuan.zqrysatuan.Open;
    setawal;
    bersih;
    ShowMessage('Data Berhasil Dihapus!');
  end else
  begin
    ShowMessage('Data Batal Dihapus!');
    setawal;
    bersih;
  end;

end;

procedure Tsatuan.bersih;
begin
  edt1.Text:='';
  edt2.Text:='';
end;

procedure Tsatuan.edt6Change(Sender: TObject);
begin
  with dmsatuan.zqrysatuan do
  begin
    SQL.Clear;
    SQL.Add('select * from satuan where nama like "%'+edt6.Text+'%"');
    Open;
  end;
end;

end.
