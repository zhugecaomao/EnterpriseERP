object Dataform: TDataform
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 361
  Top = 225
  Height = 150
  Width = 215
  object Table1: TTable
    TableName = 't1.DB'
    Left = 32
    Top = 16
  end
  object Table2: TTable
    TableName = 'T2.db'
    Left = 144
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 128
    Top = 88
  end
end
