object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'BDO file splitter'
  ClientHeight = 227
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 574
    Height = 192
    Align = alClient
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 0
    Top = 192
    Width = 574
    Height = 35
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -4
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 350
    OnTimer = Timer1Timer
    Left = 392
    Top = 24
  end
  object TrayIcon1: TTrayIcon
    Icon.Data = {
      0000010001002828000001002000681A00001600000028000000280000005000
      000001002000000000000000000000000000000000000000000000000000EEEA
      E601EEEAE601EEEAE60100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEA
      E601D9D7D822D0D0D20E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEA
      E60E868FA0B45A6983605C657A14625D67030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E1
      DB24959CAAD368778FC05461796C41424F1D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DED6
      CD1999A1AFCE818FA5F96A788ECD555D6965424C5E0C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9AD
      B6196B7E9BE570829DFA7F8A99F8696F74C460676F56636A710C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008693
      A7195A7194D95C7395FC768496FE8A8E86F7878B84B3999B8E46A89E7B0A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B191
      482C636B72CC465D86FF51688FFF788CADFE8CA1BFEA8599B897B19E6A35C6A3
      4B05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD91
      3105445A809F415983D6445C88FF5D75A5FF819AC4FD89A3CBDA8EA4BA81C1A5
      572ECDA5410300000000CEAB3406000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000937D4C378B7A5177606875D7526A9BFF6A83B0FF829BC5FE8BA5C3E5A5A5
      8C82C9A5472BCDA54023CDAA3110CDAA3107CDAA310500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B48D361B80765CA24D6290E8556C9BFB6981B0FE829BBCFF8BA5
      BFC8A6A58B7CC5A34B2BCDAA322BCDAA3217CDAA320ACCA93605CAA535010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5943C059B81363671716A94606C7FCF4C6598F7687EA5FF8A9F
      B6EC93A9BCCC8297B17DCDAE4150CDAE412FCCAE4321D3B34109DDB73702D5AA
      3401CD9E31010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A48080100000000000000000000000000000000CDBE
      9C020000000000000000AA8C380B947D3C3084785176606C7FD2526592F96F84
      A6FF8BA0B7EC94AABCD5CCB14B8CCCB14B59CBB55634D7C55B27ECCE3D0CE4C1
      3A05D5AA34020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006F5217016E5014036A4809096A4A0C0D6A4C100B6F521B1470541E0CCDBE
      9C0B000000000000000000000000000000009B7F341D7774628259688ADF5C70
      9AFC7387A8FF8BA0B7FEC9C072E2C9BF7096C9BF6F60DAD16B41F6DE4124F0D6
      3F13E4C13A09D2B45E0300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007858
      1B026D4E10066D4E100F6C4C0D1D6A4B0E2F70531D408B765770917E644AC9BE
      9F1900000000000000000000000000000000000000008A7642386B6C6F8F6069
      82D861739CFC6C80A5FFADB89EFBBAC29ED1BABE9699D2CE7D5EF6DE454AF6DE
      4532F1D6431CD6BA480CD7BC5601000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E601F027756
      120A6F5110116F5110236F5110437158286289775C9CADA39BD5B4ABA7AAC5BE
      A421000000000000000000000000000000009D7922019D7B240D86734738726E
      6A99686D7FDB5A6D9CFF728BABFE91A6B4F6ACBEBDCCC3C8999AEEDB576CF6DE
      4A54F6DE4A3BE9D2451DE6CF4413CBAB30080000000000000000000000000000
      00000000000000000000926D15018C66100188681B01846519087D5C120A7958
      101A7355102A73551045705823767D6E5AAC9D938DE8AEA5A1FCBBB4B2DAC5BE
      A42100000000000000000000000000000000000000009C771C029773230B836F
      4844716E6C9F696D7DFE5C77A4FD7C93AEFD9EB2B9EEB8C4ACC8D8D27E8CEFDB
      5663F6DE4A55EFDA4A42EEDA4A2BE8D2451AD3B7370AC4A53106B38F2C020000
      000000000000A27E210198731903936E160787661A09846419177F5F14197B5C
      153371561A5671571C776C5D40B9786C60EE91857DFCA39A95FEBAB3B1DABCAC
      801A000000000000000000000000000000000000000000000000000000009870
      1F08836F48416F6E70AD5A75A4EA647EA7FD8299B0FCA1B4BCEDBDC8AEC2D8D2
      7E87F0DB5472EFDA4A67EEDA4A54EDD94936E9D34526DDC33614CBAD3208C4A4
      3003B2902B04A58124079F7B1F0D977219168B6C1E21896B1E2F8060153C7C5E
      185A6F5929856C5D3DC76A604FF574685BFE8A7D74FE948981F1998E87BBAD9B
      7007000000000000000000000000000000000000000000000000000000000000
      00008D6E240F8A6E284576715CA9687689FE677A98FE7491BBFDA1B6BDEDAFC3
      BEBFB2C4BA8BE2D56572EEDA516FEEDA516BEDD95054EBD64534E3CC3B18DCC3
      300DC5A62310B796251BA984212BA27C1F3B8D7327498A72284C746135707060
      3A9D63594EDF685C4BFB6F6045FF726042FE7F6933E7846C2EA7846C2E3CAC9A
      7001000000000000000000000000000000000000000000000000000000000000
      0000896818018D6E210D7A704F3D77715AAD697686FF6E7E94FE8399B0FDA1B7
      BFEDACC2C5C0CBCB8C7DEBD85684EEDA5286EEDA5170EDD94966EDD94949EAD5
      4437E5D03630D8C12D45C0A12750B998255CA68619708A72297270603A9F5B51
      4BFE625952FE675B4CFF706044EF71603FC567584B696F5D402B816828240000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B691809876A236776715DB064738BF7667DA2FD7289
      A8FF98AFBBEDB2C0B1C0CDCB868FEBD85684EEDA5183EEDA4A78EEDA4A6DEEDA
      4A6DE9D53D6EE6D2316EE6D2316CD2B92B64A3861C7670603AC05A504AFF5B51
      4BFF625952FE675B4CEC716042C47C663087846A2438836A2507000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000866820117D6E4567726F62AA5E7090EA5C70
      95FD788FACFE95AECCF6B3C1B4C0C6C68C7AE3D6686DECD84B63ECD84B69ECD8
      4B71E8D4406AE4D0355EDCC93559B4992D85746339C15A5048FF5A5048FF5C52
      48FC665A48E56E5F43A5846B32668A6E244D9173162C8A6E1F08000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000805F140585671E2A826C3367716C59C2676F
      76F35B7297FB7F96BAFEA6BACEEB9CB0C9B4AEBDC369D7C45245DBC85241E6D2
      524AD9C64D4BC3B1484AA2924683776A44D45C5141FC5A5041FE5B5140F46E5E
      38DA856920968F7220569F7F20449E7D1B339E7B18209E7B180A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007E5B0F02815F140F8165223A7B693C8B716C
      5AD0676F76F3657CA3FD8299BCFFB3C5D4EC94A5B9A4A1935579A99B5549BEAE
      532BA7984C467D6F4489706344D25E5243FA5A4F41FF5A5040E871633CC79E87
      3195A887206A9F7F20519F7F2034A3831D1AA7851B15A7851B09000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5A0F058460112186661D5A7B69
      3CA0716C59D7576D96F9607AABFF93A8C4FE8396B2ED7E7457CF6A6258A16A62
      58855F554D9E544942D9544942F83E3541FF6B5E3DE5887738A9B9A03098CFB0
      2A79CEA62064BB96205AB08D2034B08F1F13AF901E0CAF901E07AF901E030000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000079560C047F5A0F18885F12498966
      248288692FA76C6E75D25C657CF8687081FC757C8BFE85827CF9635E65EF5149
      4EEA403639E7393032E351473AD2776D47B3B5A13A8CD5C24572E7D24276E8D1
      3E58E8CB2D55D9B8285AC7A3223BBD992314BB992509BC9A2506B99725050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076510B0178560D0276510B097B530D1B845911498A5F
      177592671E82706457A6585253F2565052FD696668FF7E7C80FF757274FE645E
      5FFE463D39E0514730A4897F437CC9BD5858E7DA564AECE25D59ECE15C59EADB
      4E37ECDC3838E4CE334CD0AF273DC49F251AC29F2908C29F2902BD9929010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073480801754E0A01744B0904764F0B1478500A2E7F540C528459
      10688A5F17656A5E5176473F40D9443B3CFF564F51FF625A5CFF686264FF7572
      75FC837C5CD2B7AC527FD6CB5D4FE3D76154EDE46252EEE6624CEDE46038EADB
      4E27EEDE3925ECDC383BDDC42E3BCBA8271DC7A32908C6A22904000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000734808027348080973490813754D0A28764B08407B5008548055
      0D5C835810655D4F4196423A3BEE413839FF534B4CFF5D5455FF5D5456FF736E
      72FCB8B37CDEE3D76194E6DA6272E6DA6261EDE4625FEEE66254EDE46030EADB
      4E1BEEDE391AE8D63630DABE2C37CFAD2821C9A5290CC8A42902000000000000
      00000000000000000000000000000000000000000000000000006C4808016A48
      08016A4808016A480712794B01176E480C1E764A043E664818545F4A256F5F4A
      25955F4A25AF5A452EF0594331FE594331FF594435FF524C61FF625A5DFF887C
      52F3B7AD5ECBE4DC5A96E3DA5177E1D93D71E0DA4270E0DB4459E6DE5240E6DD
      4C1EE6DA3910E4D6371BE0C93328D7B83221CBA82F18C8A42D09BE9A29010000
      000000000000000000000000000000000000764B0801744908046C4808046A48
      08116A4808146A4708166B4710396A4610416846126263461B8C4E402CBC4138
      31E8433930F7554130F75E472FBB5F482FB0957424B28E8150C590834FD3A797
      48B7D2C53C93E0D83780E0D83874E0D83664D6D62A63DAD83561DAD83641E0DA
      4028E6DA3911E4D7370CE2CE3515D9BC341CD3B23423CAA72F11BE9A29028B65
      10027A560A0178540902744F0804774C0807754A08097348080C6C4808136847
      092066470B2865460C41644416686143198D533F27AD4D3D2DD94D3E2CE35041
      2BC6644C24AD664D2BA996731F899C771D70D2A51169C9B63D6ED7C23980F6DE
      3177EBDB3568DFD7295FDFD72E5CDED6235DD5D62856D5D62941D5D62A3DDCD8
      3528E6DA3916E6DA390FE3D2360FDFC3371BD6B53525CAA72F16BE9A29088B65
      0D0278560C0673510A04734F0A0C734A0A1271490A1370480A1B65450E296345
      113B57411A5B503E2092584029BE584029E0604625C9826019A89D73158BA97B
      106CB2800D61A77D1768CD9F0E52D8AC0D66FECC0642F8DF2E35F8DF2E35F8DF
      2E34ECDC3233DED72C36DCD5213FDBD42045D5D52A40D5D62B38D5D62B28D8D6
      2E1DE6DA3A1CE6DA3A1CE4D83916E1C83A17D8B73721CCA93018C09B290D0000
      00007556100B75561009715110146A48101C6746112761431541513E1F68503E
      21994C3C22A74C3C22BF7C4D17B6936713A2B78F0C77D9AC0858F0B90836E9B2
      082CEDB50835E6B3084BF0C2084FFFD60845FFD70B2DFFE22923FFE22920FFE2
      291AEFDE3014DED9331AD9D6291DD8D42621D5D52F2AD5D63130D5D6311EDAD8
      3912E6DD3E1DE6DD3E2FE6DD3E26E6CF3F17DEBC3B18D2AD3212C69E290B0000
      00007556100172541016684B142D60431547553E1C684A3823904A3A23A73632
      2EAB493A24836748156395691354CAA30947F8D60143ECC10532ECB40823DEA5
      0814EBB30818F3C4082FEAB9083DE9B80833F4C80A2DF9D62321FFE22919FFE2
      2914F2E0350CE3DD3C0BE1DC390BE1DC390BD8D83A10D8D83A20D8D83C1BE0DC
      4D10EAE04D17EAE04D36E8DE4530E6CF3F18DEBC3B12D6B2350CC69F2A050000
      000073551019644A1636503C1E73493823924335278C4134297C48392462503E
      21405B431B2683550818A87E0F18BC940C1BC49D0A26BE8E0A29C2850823BE80
      0812CF94080DD0960816C68A0825C5890828D0960821E3A90D13F0C51B10F6D1
      2013EBD62C16E3DD3D11E6DF4104E9E24901E2DF5904DDDC4F0BDEDC510FE6E1
      640CF2E76E12F2E76E2AECE25628E6CF3F16E2C23E0FDCB93908CDA72E010000
      0000563D10664F38127B4C361361523911455B40132F6547151D714E1112754C
      0807754B060787580808AB750C07A7720A079966040A9B6506149D6408199D64
      0814AC750F0FA8720D0FA06A030EA56F0C10A8700A0EC0800408CB961809D1A2
      2214DBB73127E5CC4720E8D3540BECDF6D0100000000E4E37B01E4E37B03EAE7
      8804FAF0A40BF9EE951AF4E76218EAD3520BE2BF3C07DDB72E03000000000000
      00004C361033654A1831684A140F6F4B0B057D560E02986A14019F6F15019364
      0E017D4E01017D4E0102996102019C630301A1680602945D0305945D080B945D
      080A96600A0896620408946100059C6A0E049E6B0C02B4750101B6790503BA82
      1008D09C1C14DFAB1C13E3B83405000000000000000000000000000000000000
      0000FCF3B705FAF0A10FF7E9650DECD55A03E4C85C0100000000000000000000
      00008764220373551C0200000000000000000000000000000000000000009869
      1101895A080187580701965E0001AF740B0100000000000000009C670F01945D
      0801945D08019460010194610003946101010000000000000000000000000000
      0000CE981501DEA5100100000000000000000000000000000000000000000000
      0000FDF5CB01F9ED8404F8EC7E04000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009768100196670F01AF740C01CA8C17010000000000000000000000000000
      0000000000000000000000000000AC7D29010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001FFF
      FFFFFF0000001FFFFFFFFF00000007FFFFFFFF00000007FFFFFFFF00000003FF
      FFFFFF00000001FFFFFFFF00000000FFFFFFFF000000007FFFFFFF000000002F
      FFFFFF0000008003FFFFFF000000C000FFFFFF000000C0003FFFEF0000006000
      3FFF8000000078001FFF000000007C000FFE00000000780007E0000000007C00
      00C0000000007F000000000000007F800000000000007F80000000000000FFE0
      000001000000FFF0000001000000FFF0000001000000FFF0000001000000FFF8
      000000000000FFF8000000000000FFE0000000000000FFC0000001000000FFC0
      000001000000FE00000000000000F80000000000000000000000000000000000
      0000000000008000000000000000800000000000000080000000000000008000
      0004010000008000000F830000009F06079F8F000000FF87F7FFFF000000}
    PopupMenu = PopupMenu1
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 456
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 72
    object state1: TMenuItem
      Caption = #1089#1086#1089#1090#1086#1103#1085#1080#1077
      Enabled = False
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object show1: TMenuItem
      Caption = #1088#1072#1079#1074#1077#1088#1085#1091#1090#1100
      OnClick = show1Click
    end
    object close1: TMenuItem
      Caption = #1079#1072#1082#1088#1099#1090#1100
      OnClick = close1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 72
    object N2: TMenuItem
      Caption = #1087#1072#1090#1095
      OnClick = N2Click
    end
    object N8: TMenuItem
      Caption = #1086#1073#1085#1086#1074#1080#1090#1100' '#1087#1072#1090#1095
      OnClick = N8Click
    end
    object N3: TMenuItem
      Caption = #1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      object N4: TMenuItem
        Caption = #1089#1086#1079#1076#1072#1090#1100' '#1083#1086#1075
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1089#1073#1088#1086#1089' '#1083#1072#1091#1085#1095#1077#1088#1072
        OnClick = Button3Click
      end
      object ReShade1: TMenuItem
        Caption = 'ReShade'
        OnClick = ReShade1Click
      end
    end
    object N6: TMenuItem
      Caption = #1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #1089#1074#1077#1088#1085#1091#1090#1100
      OnClick = N7Click
    end
    object N9: TMenuItem
      Caption = #1089#1082#1072#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
      Visible = False
      OnClick = N9Click
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 328
    Top = 72
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 328
    Top = 24
  end
end
