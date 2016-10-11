inherited AssemblyResourcesForm: TAssemblyResourcesForm
  Caption = 'Resources'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Tree: TVirtualStringTree
    Header.MainColumn = 0
    Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    Images = NodeImages
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
    OnCompareNodes = TreeCompareNodes
    OnFreeNode = TreeFreeNode
    OnGetText = TreeGetText
    OnGetImageIndexEx = TreeGetImageIndexEx
    OnInitNode = TreeInitNode
    Columns = <
      item
        Position = 0
        Width = 378
        WideText = 'Resource'
      end
      item
        Position = 1
        Width = 80
        WideText = 'Type'
      end>
  end
  object NodeImages: TImageList
    Left = 16
    Top = 16
    Bitmap = {
      494C010104000800140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00DDDDDD00000000000000000000000000DCDCDC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00DCDCDC000000000000000000000000000000000000000000000000000000
      0000E1E1E100CECECE00CCCCCC00CCCCCC00CCCCCC00CECECE00E1E1E1000000
      000000000000000000000000000000000000CFCFCF00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D0D0D0000000000000000000BABAB800AFAFAD00AEAEAB00ADAD
      AB00ADADAB00AEAEAC00B1B1AE00B6B6B400B7B8B600B9BAB700797776007A78
      7700C3C4C200CCCCCC00CCCCCC0000000000BF9C5D00B6812400B57F2000B47F
      1F00B67F1E00C0831B004D68800047668600478FE200CA861700BD831F00B882
      2400BF9C5D000000000000000000000000000000000000000000F1F1F100CCCC
      CC00A2A09F0083817F00817E7C00817E7C00817E7C0083817F00A2A09F00CCCC
      CC00F1F1F1000000000000000000000000004E9DD3004398D2004094D0003E92
      CF003E92CE003F92CE003F92CE003F92CE003F92CE003F92CE003F92CE003F92
      CE003F93CF004C9AD100F1F1F10000000000B0B0AD0000000000000000000000
      000000000000000000000000000078757300817E7C00DDDCDD00A5A3A200A7A5
      A400A4A3A100878583008684820000000000B681240000000000000000000000
      00000000000000000000507E9F007EA6B7008AD4FF0023619F00000000000000
      0000B882240000000000000000000000000000000000F1F1F100B9B8B8008683
      8100AFAEAD00D1CFCF00DCDBDC00DBDBDB00DCDBDC00D1CFCF00AFAEAD008683
      8100B9B8B800F1F1F10000000000000000004499D2003F94D000ABFBFF009BF3
      FF0092F1FF0093F1FF0093F1FF0093F1FF0093F1FF0093F1FF0093F1FF0093F1
      FF00A6F8FF0065B8E300B2CADA0000000000AEAEAB0000000000FDFDFD00FCFC
      FD00FCFDFD00000000000000000084817F00CCCAC90094929100C5C3C200C6C4
      C30096949300D0CECD008B898800F5F5F500B57F200000000000E6D6AE00E6D7
      B000E8D8B100F2DCB00037A9F40088E5FF007ED3FF000D96FF00255E95000000
      0000BD83200000000000000000000000000000000000BAB9B9008E8B8900C7C7
      C500C5C3C300ACA9A700A29F9D00A19E9C00A29F9D00ACA9A700C5C3C300C7C7
      C5008E8B8900BAB9B90000000000000000004398D2004FA6D9008EDAF500A2EE
      FF0082E5FE0084E5FE0084E5FE0085E6FE0085E6FE0085E6FE0085E6FE0084E6
      FE0096EBFF008CD8F50070A7CF0000000000ADADAB0000000000FAF8F800F9F8
      F800FAF9F900FEFDFD00E1E1E000C2C1C00095939200B5B3B2008D8B89008D8B
      8800B5B3B20099979600ABAAA900BDBDBC00B47E1F0000000000E6D6AF00E7D7
      B200E8D8B300EDDAB200FADFAF001E70C8003EC4FF0029A9FF001399FF002964
      9F00CC881A00000000000000000000000000E1E1E1008F8C8A00C3C1BF00BAB7
      B500ADACAB00E8E8EB00000000000000000000000000E8E9EB00ADACAB00BAB7
      B500C3C1BF008F8C8A00E1E1E100000000004296D1006BBEE8006DBDE600BBF2
      FF0075DEFD0077DEFC0078DEFC007BDFFC007DDFFC007DDFFC007DDFFC007CDF
      FC0080E0FD00ADF0FF004D9DD300F1F1F100ADADAB0000000000F6F6F600F6F6
      F600F7F8F800FEFFFF00726F6D00AAA8A700CAC8C7008E8C8B00000000000000
      00008E8C8B00CBC9C800B0AEAD008E8C8A00B47E1E0000000000E6D5AD00E6D6
      AF00E6D7B000E8D7B000EED9AF00FCDFAB002271C50042C5FF002BABFF00129C
      FF00296AA900CCCCCC000000000000000000ADACAA00AFACAB00BEBBB900ACAA
      AA0000000000F5E2CC00EBC9A000EBC9A100EBC9A000F3DFC700FEFFFF00ADAA
      AB00BEBBB900AFACAB00ADACAA00000000004095D0008AD7F50044A1D800DDFD
      FF00DAFAFF00DBFAFF00DEFAFF0074DCFC0076DBFA0075DAFA0074DAFA0074DA
      FA0072D9FA00A1E8FF007CBFE600B3CADB00ADADAB0000000000F4F4F300F4F4
      F300F5F6F400FCFCFB0073706E00ABA9A800CCCAC900918F8D00E1E1E100ECEC
      EB00918F8C00CDCBCB00B1AFAE008F8D8B00B47E1E0000000000F8F4E700F8F4
      E800F8F4E900F8F4E900F9F5E800FFF7E800FFFEE6002271C3003FC5FF0020AA
      FF0083B0D8007E797300CCCCCC00000000009A979500C0BDBC00A8A5A400E4E5
      E600EFDDC900E2BF9300EAD1A600EED4A800EBD1A600E2C09400ECD5BA00E5E6
      E700A9A6A400C0BDBC009A979500000000003E94D000ABF0FF00449DD600368C
      CB00368CCB00368CCB00378BCB005CBEEA006FD9FB006AD6FA0068D5F90067D4
      F90066D4F90082DEFC00AAE0F6006FA6CE00ADADAB0000000000F2F1F000F2F1
      F000F3F1F000F6F5F400FFFEFD00B6B3B3009B999600BCBAB90092908F009290
      8F00BCBAB9009E9C9A00A5A5A30000000000B47E1E0000000000F4EDDD00F4ED
      DD00F4EDDE00F4EDDE00F4EDDE00F6EEDE00FCF1DE00FFF8DE001B70C700ACD9
      EF0092887F00C1BFB800777C6E00CCCCCC009D9A9800C0BEBC00A19E9C000000
      0000D5AE7D00E7CCA000EFD3A500585E6600F1D3A400EBCE9F00D5A973000000
      0000A19E9C00C0BEBC009D9A9800000000003D92CF00B9F4FF0073DBFB006BCC
      F2006CCDF3006CCEF3006DCEF300479CD40056BAE900DAF8FF00D7F6FF00D6F6
      FF00D5F6FF00D5F7FF00DBFCFF003E94D000ADADAB0000000000EFEFEE00EFEF
      EE00EFEFEE00F1F1F000F7F8F7008B898700D8D5D5009B999600D0CECD00D1CF
      CE009D9B9900DCDAD900918F8D0000000000B47E1E0000000000F3EAD600F3EA
      D700F3EAD700F3EAD700F3EAD700F3EAD700F5EAD700FAEDD700FFF3D9007F79
      7400E9E7E300888C8200BA7AB6009869CA00A29E9C00BFBCBA009F9C9B00FDFF
      FF00C7986100E8CD9E005A606900A8AAAF005C5E63007C766C00A9ACB000D5D5
      D700A09D9B00BFBCBA00A29E9C00000000003C92CF00C0F3FF0071DAFB0074DB
      FB0075DBFC0075DBFC0076DCFC0073DAFA00449CD400378CCB00368CCB00358C
      CC00348DCC003890CE003D94D00052A0D600ADADAB0000000000ECEBEA00EDEC
      EB00EDECEB00EEEDEC00F3F2F1007B7977008C898700CBCAC800B2AFAD00B5B2
      B000A3A3A100979593008D8B890000000000B47E1E0000000000F1E6CE00F1E7
      CF00F1E7D000F1E7D000F1E7CF00F0E6CE00F0E6CD00F1E6CD00F4E9CE000000
      00007B7F7C00E1B1E300CB96C700AE7DCE00A4A3A100C9C6C5009E9B9A00FBFF
      FF00BB894A00E0C49400E9CB97005D60640000000000F9FAFA00F7F7F700FAFB
      FA009E9B9900C9C6C500A4A3A100000000003B92CF00CAF6FF0069D5F9006CD5
      F9006BD5F90069D5F90069D5FA006AD7FB0068D4FA005EC7F1005EC7F2005DC8
      F200B4E3F8003D94D000B0D1E80000000000ADADAB0000000000E9E9E800EAEA
      E900EAEAE900EAEAE900ECECEB00FAFAF90000000000000000007B7976007E7B
      7900B8B8B600000000000000000000000000B47E1E0000000000EEE3C800EFE4
      C900EFE4CA00EFE4CA00EEE3C800F6F0E1000000000000000000000000000000
      0000B67D0B00BF89DE00BE8AD50000000000AAA6A400CDCCC900A8A5A300DCDD
      DF00D0B28F00BA8C4C00DEC08900797C8100F7F7F700F1F0EF00F2F1F000DAD8
      D700A7A4A200CDCCC900AAA6A400000000003B92CF00D5F7FF0060D1F90061D0
      F800B4EBFD00D9F6FF00DAF8FF00DAF8FF00DBF9FF00DCFAFF00DCFAFF00DCFB
      FF00E0FFFF003E95D000DAEBF60000000000ADAEAB0000000000E7E5E400E8E7
      E600E8E7E600E8E7E600E7E6E50000000000CDCDCC00AAAAA800ADADAB000000
      0000B3B3B100000000000000000000000000B47E1E0000000000ECE0C100EDE1
      C300EDE1C400EDE1C300ECDFC10000000000CFAC7000AD720A00AC7006000000
      0000B5801400000000000000000000000000CECDCC00C3C1C100C8C6C400A6A4
      A400ECEBEA00C3A07400A6681B009EA1A400F2F2F100EFEEED00ECEBEA00A4A2
      A000C8C6C400C3C1C100CECDCC00000000003D94D000DCFCFF00D8F7FF00D8F7
      FF00DBFAFF00358ECD003991CE003A92CF003A92CF003A92CF003A92CF003B92
      CF003D94D00060A8D9000000000000000000AEAEAB0000000000E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E20000000000A7A7A500ECECEB0000000000EAEA
      EA00CACAC900000000000000000000000000B47E1E0000000000EADCB900EADD
      BC00EBDDBD00EADDBC00E9DCB90000000000AD720A00FDFCF60000000000EBDC
      C200CFAC6A0000000000000000000000000000000000AFADAB00DAD9D800BEBE
      BC00A4A3A300D8D9DB00F4F6FA00C3C3C500F1F0F000D5D2D200A2A09E00BEBD
      BB00DAD9D800AFADAB0000000000000000007DB8E0003D94D0003A92CF003A92
      CF003D94D00063A9D90000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAC0000000000E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE0000000000A5A5A30000000000E8E8E800CACA
      C80000000000000000000000000000000000B57F1F0000000000E7D8B100E7D8
      B200E7D9B300E7D8B200E7D8B00000000000AC71070000000000EADABF00CEAB
      6C000000000000000000000000000000000000000000E4E4E300B7B5B200E1E0
      E000D2D1D100A8A6A4009895940095918F0097949200A7A5A300D2D1D000E0E0
      E000B7B5B200EAEAE90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD0000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900CACAC8000000
      000000000000000000000000000000000000B681240000000000000000000000
      00000000000000000000000000000000000000000000EBDCC300CEAB6D000000
      0000000000000000000000000000000000000000000000000000EBEAEA00B7B5
      B300D4D4D100EBEAE900F3F2F200F3F2F200F3F2F200EBEAE900D4D4D100B7B5
      B300EBEAEA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7B7B500B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B6B6B400000000000000
      000000000000000000000000000000000000BD8E3A00B6812400B57F1F00B47E
      1E00B47E1E00B47E1E00B47E1E00B47F1F00B5802200BC8D3800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D6D500BDBBB900BCBAB800BCBAB800BCBAB800BDBBB900D7D6D5000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF00070007F01F000300010007C007
      00017E017C378003000146004017800300014000400703810000403040030801
      0000400040010001000040014000101100004001400000010000400140100081
      000140C740F100010001411741170001000341274127800303FF414F414F8003
      FFFF7F9F7F9FC007FFFF003F003FF01F00000000000000000000000000000000
      000000000000}
  end
end
