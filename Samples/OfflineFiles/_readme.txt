������: ��������� OfflineFiles.

��������� ����� �� WinSxS/Manifests.
Mum- � cat-����� � Servicing/Packages

������ � CBS:
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~~6.1.7601.17514
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~en-US~6.1.7601.17514
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~ja-JP~6.1.7601.17514
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~ru-RU~6.1.7601.17514

�� ���� ������� ��������������� InstallName � �������:
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~~6.1.7601.17514.mum
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~en-US~6.1.7601.17514.mum
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~ja-JP~6.1.7601.17514.mum
  Microsoft-Windows-OfflineFiles-Package~31bf3856ad364e35~amd64~ru-RU~6.1.7601.17514.mum


� �������� mum-�����:
  parent: ������������ �����
  component: Microsoft-Windows-OfflineFiles-D

�������� mum-����� �������� ����� � ��� �� ������ assembly, �� �������� language ��������� ����.
  parent: �������� ��������� language=neutral [parent disposition="detect" integrate="separate"]
  component: Microsoft-Windows-OfflineFiles-D-LanguagePack

����� �������, �������� ����� ��� �������� ����� (�� ���������� ����� �� ������), ������� �������� �������������� ��������� (-LanguagePack), ����������������� ������.

��������������� ���������� (���������):
  amd64_microsoft-windows-offlinefiles-d_31bf3856ad364e35_6.1.7601.17514_none_a55282151f509c32
  amd64_microsoft-windows-o..iles-d-languagepack_31bf3856ad364e35_6.1.7601.17514_en-us_21df27d5020f95d8
  amd64_microsoft-windows-o..iles-d-languagepack_31bf3856ad364e35_6.1.7601.17514_ja-jp_50af700bbf559538
  amd64_microsoft-windows-o..iles-d-languagepack_31bf3856ad364e35_6.1.7601.17514_ru-ru_6b003f895314917f


�������� ��������:
  dependency: Microsoft-Windows-OfflineFiles-ShellUI
  dependency: Microsoft-Windows-OfflineFiles-Extend-APIs
  dependency: Microsoft-Windows-OfflineFiles-Service
  dependency: Microsoft-Windows-OfflineFiles-Core
  dependency: Microsoft-Windows-OfflineFiles-Extend-APIs /x86
��� dependency ������� ��� discoverable="no" > dependentAssembly type="install".

�������� ������:
  dependency: Microsoft-Windows-OfflineFiles-ShellUI.Resources /en-US
  dependency: Microsoft-Windows-OfflineFiles-Extend-APIs.Resources /en-US
  dependency: Microsoft-Windows-OfflineFiles-Service.Resources /en-US
  dependency: Microsoft-Windows-OfflineFiles-Core.Resources /en-US
  dependency: Microsoft-Windows-OfflineFiles-Extend-APIs.Resources /x86 /en-US
��� dependency ������� ��� ������, �� discoverable="yes"

����� ������� ����� ��������:
  <languagePack xmlns="urn:schemas-microsoft-com:asm.internal.v1" xmlns:auto-ns1="urn:schemas-microsoft-com:asm.v3">
    <sequence type="full" value="ru-RU;en-US" />
    <bilingualComponents>
      <component name="Microsoft-Windows-Autochk.Resources" />
      <component name="Microsoft-Windows-Autoconv.Resources" />
      ... //����� ����� � ���� �� ��������� �����������, �� ����� �� ���� language-pack
    </bilingualComponents>
  </languagePack>


�������� OfflineFiles-Core:
  dependency discoverable="no" resourceType="Resources" > dependentAssembly dependencyType="prerequisite": Microsoft-Windows-OfflineFiles-Core.Resources /language=*
  file: csc.sys
  file: CscMig.dll
  file: Microsoft-Windows-OfflineFiles-Core-ppdlic.xrm-ms
  directory: Windows\CSC\
  category: Microsoft.Windows.Categories.Services /typeName:Service
    service: CSC [+ ��� �����������]
  category: Microsoft.Windows.Categories /typeName:BootRecovery
  localization/stringTable:
    description="..."
    displayName="..."


<assemblyIdentity name="Microsoft-Windows-OfflineFiles-Package" buildType="release" language="neutral" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" version="6.1.7601.17514" />
<assemblyIdentity name="Microsoft-Windows-OfflineFiles-Core"    buildType="release" language="neutral" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" version="6.1.7601.17514" versionScope="nonSxS" />