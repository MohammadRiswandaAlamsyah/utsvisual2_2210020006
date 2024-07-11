object dmsatuan: Tdmsatuan
  OldCreateOrder = False
  Left = 1048
  Top = 125
  Height = 150
  Width = 215
  object consatuan: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'D:\Documents\Documents\College\Lainnya\Pemrograman Visual\UTS Pe' +
      'mrograman Visual 2\libmysql.dll'
    Left = 16
    Top = 24
  end
  object zqrysatuan: TZQuery
    Connection = consatuan
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan')
    Params = <>
    Left = 88
    Top = 24
  end
  object dssatuan: TDataSource
    DataSet = zqrysatuan
    Left = 152
    Top = 24
  end
end
