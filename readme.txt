

C:\Windows\winsxs
  �������� �������� ��� ������ assembly, � ������� ����� ��� ����������� � ��� �����.

C:\Windows\winsxs\Manifests
  �������� ��������� ��� ���� assemblies.
  Windows 7: � �������� ����.

HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages
  ����������� ��� ������ � �������. ��� ������� ������� �������� mum-����� � InstallName

C:\Windows\servicing\Packages
  �������� mum � cat-����� ��� ������� ������.

� mum-����� ���������:
  assembly (� assemblyIdentity), � ��� update, � ��� ���� ��� ��������� component, ������� ��������� �� assemblyIdentity ����������.


��� ���������� ������ �� assemblies?
� ��, � ������ ��������:
  <assembly>
    <assemblyIdentity ... />
    <!-- contents -->
    ...
  </assembly>
����������� contents.

� ������ �����:
  <package>
    <parent><assemblyIdentity /></parent>
    <update>
      <component><assemblyIdentity /></component>
    </update>
  </package>

� assembly �����:
  <dependency><dependentAssembly><assemblyIdentity /></dependentAssembly></dependency>
  <file name="csc.sys">...</file>
  <directories>
    <directory ... />
  </directories>
  <memberships>
    <categoryMembership>...</categoryMembership>
    <categoryMembership>...</categoryMembership>
  </memberships>
  <trustInfo>...</trustInfo>
  <localization>...</localization>
  <configuration>...</configuration>