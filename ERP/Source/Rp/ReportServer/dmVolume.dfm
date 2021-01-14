object Datamodule1: TDatamodule1
  OldCreateOrder = False
  Left = 192
  Top = 122
  Height = 216
  Width = 444
  object tblFolder: TADOTable
    Connection = euDatabase
    CursorType = ctStatic
    TableName = 'rb_folder'
    Left = 21
    Top = 27
  end
  object dsFolder: TDataSource
    DataSet = tblFolder
    Left = 83
    Top = 27
  end
  object plFolder: TppDBPipeline
    DataSource = dsFolder
    RefreshAfterPost = True
    UserName = 'plFolder'
    Visible = False
    Left = 146
    Top = 27
  end
  object plItem: TppDBPipeline
    DataSource = dsItem
    RefreshAfterPost = True
    UserName = 'plItem'
    Visible = False
    Left = 149
    Top = 110
  end
  object dsItem: TDataSource
    DataSet = tblItem
    Left = 86
    Top = 110
  end
  object tblItem: TADOTable
    Connection = euDatabase
    CursorType = ctStatic
    TableName = 'rb_item'
    Left = 23
    Top = 109
  end
  object rsReportExplorerVolume1: TrsReportExplorerVolume
    DirectoryOptions.EnableCaching = True
    DirectoryOptions.RefreshInterval = 60
    VolumeName = 'Report Explorer Database'
    FolderFieldNames.FolderId = 'folder_id'
    FolderFieldNames.Name = 'folder_name'
    FolderFieldNames.ParentId = 'parent_id'
    FolderPipeline = plFolder
    ItemFieldNames.Deleted = 'deleted'
    ItemFieldNames.FolderId = 'folder_id'
    ItemFieldNames.ItemId = 'item_id'
    ItemFieldNames.Modified = 'modified'
    ItemFieldNames.Name = 'item_name'
    ItemFieldNames.Size = 'item_size'
    ItemFieldNames.Template = 'template'
    ItemFieldNames.ItemType = 'item_type'
    ItemPipeline = plItem
    PublishingOptions.MaxPages = 1000
    PublishingOptions.MaxTime = 0
    PublishingOptions.PageCacheType = pcFile
    PublishingOptions.PageCacheDirectory = '($Temp)'
    PublishingOptions.PublishingMode = pmIncremental
    Left = 260
    Top = 68
  end
  object euDatabase: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=SA;Initial Catalog=MageSoft;Data Source=DEVSVR;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=DM400'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 365
    Top = 68
  end
end
