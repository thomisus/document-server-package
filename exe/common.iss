﻿#ifndef sBrandingFolder
  #define sBrandingFolder '..\branding'
#endif

#define sBrandingFile str(sBrandingFolder + "\exe\branding.iss")

#if FileExists(sBrandingFile)
  #include str(sBrandingFile)
#endif

#ifndef sCompanyName
  #define sCompanyName        'ONLYOFFICE'
#endif

#ifndef sIntCompanyName
  #define sIntCompanyName     str(sCompanyName)
#endif

#ifndef sProductName
  #define sProductName        'DocumentServer'
#endif

#ifndef sIntProductName
  #define sIntProductName     'DocumentServer'
#endif

#ifndef sPackageName
  #define sPackageName        str(LowerCase(sCompanyName) + "-" + LowerCase(sProductName))
#endif

#define sLicenseFile str(sBrandingFolder + "\common\documentserver\license\" + sPackageName + "\LICENSE.txt")
#ifnexist sLicenseFile
  #define sLicenseFile str(sBrandingFolder + "\common\documentserver\license\onlyoffice-documentserver\LICENSE.txt")
#endif

#ifndef sPublisherName
  #define sPublisherName      'Ascensio System SIA'
#endif

#ifndef sAppCopyright
  #define sAppCopyright      str("Copyright (C) " + GetDateTimeString('yyyy',,) + " " + sPublisherName)
#endif

#ifndef sPublisherUrl
  #define sPublisherUrl       'https://www.onlyoffice.com/'
#endif

#ifndef sSupportURL
  #define sSupportURL=str(sPublisherUrl + "support.aspx")
#endif

#ifndef sUpdatesURL
  #define sUpdatesURL=str(sPublisherUrl)
#endif

#ifndef sAppName
  #define sAppName            str(sCompanyName + " " + sProductName)
#endif

#ifndef sAppId
	#define sAppId              str(sIntCompanyName + " " + sIntProductName)
#endif

#ifndef sAppPath
  #define sAppPath            str(sIntCompanyName + "\" + sIntProductName)
#endif

#ifndef sAppRegPath
  #define sAppRegPath        str("Software\" + sIntCompanyName + "\" + sIntProductName)
#endif

#define REG_LICENSE_PATH      'LicensePath'
#define REG_DB_HOST           'DbHost'
#define REG_DB_USER           'DbUser'
#define REG_DB_PWD            'DbPwd'
#define REG_DB_NAME           'DbName'
#define REG_RABBITMQ_HOST     'RabbitMqHost'
#define REG_RABBITMQ_USER     'RabbitMqUser'
#define REG_RABBITMQ_PWD      'RabbitMqPwd'
#define REG_RABBITMQ_PROTO    'RabbitMqProto'
#define REG_REDIS_HOST        'RedisHost'
#define REG_DS_PORT           'DsPort'
#define REG_EXAMPLE_PORT      'ExamplePort'
#define REG_DOCSERVICE_PORT   'DocServicePort'
#define REG_FONTS_PATH        'FontsPath'
#define REG_JWT_ENABLED       'JwtEnabled'
#define REG_JWT_SECRET        'JwtSecret'
#define REG_JWT_HEADER        'JwtHeader'

#define iconsExe            'projicons.exe'

#ifndef sAppVerShort
	#define sAppVerShort	'0.0.0'
#endif

#ifndef sAppBuildNumber
	#define sAppBuildNumber	'0'
#endif

#ifndef sAppVersion
  #define sAppVersion         str(sAppVerShort + '.' + sAppBuildNumber)
#endif

#ifndef sDbDefValue
  #define sDbDefValue         'onlyoffice'
#endif

#define NSSM                  '{app}\nssm\nssm.exe'
#define NODE_ENV	          'NODE_ENV=production-windows'
#define NODE_CONFIG_DIR       'NODE_CONFIG_DIR=""{app}\config""'
#define NODE_DISABLE_COLORS   'NODE_DISABLE_COLORS=1'
#define APPLICATION_NAME      str("APPLICATION_NAME=" + sCompanyName)
#define NODE_SRV_ENV          str(NODE_ENV + ' ' + NODE_CONFIG_DIR + ' ' + NODE_DISABLE_COLORS + ' ' + APPLICATION_NAME)

#define LOCAL_SERVICE 'NT Authority\LocalService'

#define CONVERTER_SRV        'DsConverterSvc'
#define CONVERTER_SRV_DISPLAY  str(sAppName + " Converter")
#define CONVERTER_SRV_DESCR  str(sAppName + " Converter Service")
#define CONVERTER_SRV_DIR    '{app}\server\FileConverter'
#define CONVERTER_SRV_LOG_DIR    '{app}\Log\converter'

#define DOCSERVICE_SRV        'DsDocServiceSvc'
#define DOCSERVICE_SRV_DISPLAY  str(sAppName + " DocService")
#define DOCSERVICE_SRV_DESCR  str(sAppName + " DocService Service")
#define DOCSERVICE_SRV_DIR    '{app}\server\docservice'
#define DOCSERVICE_SRV_LOG_DIR    '{app}\Log\docservice'

#define PSQL '{app}\pgsql\bin\psql.exe'
#define POSTGRESQL_DATA_DIR '{userappdata}\postgresql'
#define REDISCLI '{pf64}\Redis\redis-cli.exe'
#define RABBITMQCTL '{pf64}\RabbitMQ Server\rabbitmq_server-3.6.5\sbin\rabbitmqctl.bat'

#define JSON '{app}\npm\json.exe'

#define JSON_PARAMS '-I -q -f ""{app}\config\local.json""'

#define REPLACE '{app}\npm\replace.exe'

#define NGINX_SRV  'DsProxySvc'
#define NGINX_SRV_DISPLAY  str(sAppName + " Proxy")
#define NGINX_SRV_DESCR  str(sAppName + " Proxy Service")
#define NGINX_SRV_DIR  '{app}\nginx'
#define NGINX_SRV_LOG_DIR    '{app}\Log\nginx'
#define NGINX_DS_CONF '{app}\nginx\conf\ds.conf'
#define NGINX_DS_TMPL '{app}\nginx\conf\ds.conf.tmpl'
#define NGINX_DS_SSL_TMPL '{app}\nginx\conf\ds-ssl.conf.tmpl'
#define NGINX_SRV_ENV 'OPENSSL_CONF=openssl\openssl.conf'

#define LICENSE_PATH str("{commonappdata}\" + sIntCompanyName + "\Data")

#define LogRotateTaskName str(sAppName + " Log Rotate Task")
#define LOG_ROTATE_BYTES 10485760

#define public Dependency_NoExampleSetup
#include "InnoDependencyInstaller\CodeDependencies.iss"

[Setup]
AppName                   ={#sAppName}
AppId                     ={#sAppId}
AppVerName                ={#sAppName} {#sAppVerShort}
AppVersion                ={#sAppVersion}
VersionInfoVersion        ={#sAppVersion}
OutputBaseFilename        ={#sPackageName}-{#sAppVersion}

AppPublisher            ={#sPublisherName}
AppPublisherURL         ={#sPublisherUrl}
AppSupportURL           ={#sSupportURL}
AppUpdatesURL           ={#sUpdatesURL}
AppCopyright            ={#sAppCopyright}


ArchitecturesAllowed              =x64
ArchitecturesInstallIn64BitMode   =x64

DefaultGroupName        ={#sCompanyName}
;WizardImageFile         = data\dialogpicture.bmp
;WizardSmallImageFile    = data\dialogicon.bmp


UsePreviousAppDir         = yes
DirExistsWarning          =no
DefaultDirName            ={pf}\{#sAppPath}
DisableProgramGroupPage   = yes
DisableWelcomePage        = no
DEPCompatible             = no
ASLRCompatible            = no
DisableDirPage            = auto
AllowNoIcons              = yes
AlwaysShowDirOnReadyPage  = yes
UninstallDisplayIcon      = {uninstallexe}
OutputDir                 =.\
Compression               =zip
PrivilegesRequired        =admin
ChangesEnvironment        =yes
SetupMutex                =ASC
MinVersion                =6.1.7600
WizardImageFile           = {#sBrandingFolder}\exe\data\dialogpicture.bmp
WizardSmallImageFile      = {#sBrandingFolder}\exe\data\dialogicon.bmp
SetupIconFile             = {#sBrandingFolder}\exe\data\icon.ico
LicenseFile               = 
ShowLanguageDialog        = no

#ifdef ENABLE_SIGNING
SignTool=byparam $p
#endif

[CustomMessages]
en.AddRotateTask=Adding scheduled tasks...
ru.AddRotateTask=Добавление задачи в планировщик...

en.CfgDs=Configuring {#sAppName}...
ru.CfgDs=Настройка {#sAppName}...

en.CfgSrv=Configuring service %1...
ru.CfgSrv=Настройка сервиса %1...

en.CreateDb=Creating database...
ru.CreateDb=Создание базы данных...

en.DependenciesDir={#sAppName} Dependencies
ru.DependenciesDir={#sAppName} Зависимости

en.FireWallExt=Adding firewall extention...
ru.FireWallExt=Добавление исключения в файервол ...

en.GenFonts=Generating AllFonts.js...
ru.GenFonts=Создание AllFonts.js...

en.InstallSrv=Installing service %1...
ru.InstallSrv=Установка сервиса %1...

en.PrevVer=The previous version of {#sAppName} detected, please click 'OK' button to uninstall it, or 'Cancel' to quit setup.
ru.PrevVer=Обнаружена предыдущая версия {#sAppName}, нажмите кнопку 'OK' что бы удалить ей, или 'Отменить' что бы выйти из программы инсталляции.

en.RemoveDb=Removing database...
ru.RemoveDb=Удаление базы данных...

en.StartSrv=Starting service %1...
ru.StartSrv=Запуск сервиса %1...

en.Uninstall=Uninstall {#sAppName}
ru.Uninstall=Удаление {#sAppName}

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
;Name: "de"; MessagesFile: "compiler:Languages\German.isl"
;Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
;Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
;Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
;Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"

[Files]
Source: ..\common\documentserver\home\*;            DestDir: {app}; Flags: ignoreversion recursesubdirs;
Source: ..\common\documentserver\config\*;          DestDir: {app}\config; Flags: ignoreversion recursesubdirs; Permissions: users-readexec
Source: local\local.json;                           DestDir: {app}\config; Flags: onlyifdoesntexist uninsneveruninstall; Permissions: users-modify
Source: ..\common\documentserver\bin\*.bat;         DestDir: {app}\bin; Flags: ignoreversion recursesubdirs
Source: ..\common\documentserver\bin\*.ps1;         DestDir: {app}\bin; Flags: ignoreversion recursesubdirs
Source: nginx\nginx.conf;                           DestDir: {#NGINX_SRV_DIR}\conf; Flags: ignoreversion recursesubdirs
Source: ..\common\documentserver\nginx\includes\*.conf;  DestDir: {#NGINX_SRV_DIR}\conf\includes; Flags: ignoreversion recursesubdirs
Source: ..\common\documentserver\nginx\*.tmpl;  DestDir: {#NGINX_SRV_DIR}\conf; Flags: ignoreversion recursesubdirs
Source: ..\common\documentserver\nginx\ds.conf; DestDir: {#NGINX_SRV_DIR}\conf; Flags: onlyifdoesntexist uninsneveruninstall

[Dirs]
Name: "{app}\server\App_Data";        Permissions: service-modify
Name: "{app}\server\App_Data\cache\files"; Permissions: service-modify
Name: "{app}\server\App_Data\docbuilder"; Permissions: service-modify
Name: "{app}\sdkjs";                  Permissions: users-modify
Name: "{app}\fonts";                  Permissions: users-modify
Name: "{#CONVERTER_SRV_LOG_DIR}";     Permissions: service-modify
Name: "{#DOCSERVICE_SRV_LOG_DIR}";    Permissions: service-modify
Name: "{#NGINX_SRV_DIR}";             Permissions: service-modify
Name: "{#NGINX_SRV_LOG_DIR}";         Permissions: service-modify
Name: "{#NGINX_SRV_DIR}\temp";        Permissions: service-modify
Name: "{#NGINX_SRV_DIR}\logs";        Permissions: service-modify
Name: "{#POSTGRESQL_DATA_DIR}";
Name: "{#LICENSE_PATH}";

[Icons]
Name: "{group}\{cm:Uninstall}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DB_HOST}"; ValueData: "{code:GetDbHost}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DB_USER}"; ValueData: "{code:GetDbUser}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DB_PWD}"; ValueData: "{code:GetDbPwd}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DB_NAME}"; ValueData: "{code:GetDbName}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_HOST}"; ValueData: "{code:GetRabbitMqHost}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_USER}"; ValueData: "{code:GetRabbitMqUser}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_PWD}"; ValueData: "{code:GetRabbitMqPwd}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_PROTO}"; ValueData: "{code:GetRabbitMqProto}";
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_REDIS_HOST}"; ValueData: "{code:GetRedisHost}"; Check: IsCommercial;
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_LICENSE_PATH}"; ValueData: "{code:GetLicensePath}"; Check: not IsStringEmpty(ExpandConstant('{param:LICENSE_PATH}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DS_PORT}"; ValueData: "{code:GetDefaultPort}"; Check: not IsStringEmpty(ExpandConstant('{param:DS_PORT}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_DOCSERVICE_PORT}"; ValueData: "{code:GetDocServicePort}"; Check: not IsStringEmpty(ExpandConstant('{param:DOCSERVICE_PORT}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_FONTS_PATH}"; ValueData: "{code:GetFontsPath}"; Check: not IsStringEmpty(ExpandConstant('{param:FONTS_PATH}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_JWT_ENABLED}"; ValueData: "{code:GetJwtEnabled}"; Check: not IsStringEmpty(ExpandConstant('{param:JWT_ENABLED}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_JWT_SECRET}"; ValueData: "{code:GetJwtSecret}";  Check: not IsStringEmpty(ExpandConstant('{param:JWT_SECRET}'));
Root: HKLM; Subkey: "{#sAppRegPath}"; ValueType: "string"; ValueName: "{#REG_JWT_HEADER}"; ValueData: "{code:GetJwtHeader}"; Check: not IsStringEmpty(ExpandConstant('{param:JWT_HEADER}'));

[Run]
Filename: "{app}\bin\documentserver-generate-allfonts.bat"; Parameters: "true"; Flags: runhidden; StatusMsg: "{cm:GenFonts}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services===undefined)this.services={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring===undefined)this.services.CoAuthoring={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.sql===undefined)this.services.CoAuthoring.sql={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.sql.dbHost===undefined)this.services.CoAuthoring.sql.dbHost = '{code:GetDbHost}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.sql.dbUser===undefined)this.services.CoAuthoring.sql.dbUser = '{code:GetDbUser}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.sql.dbPass===undefined)this.services.CoAuthoring.sql.dbPass = '{code:GetDbPwd}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.sql.dbName===undefined)this.services.CoAuthoring.sql.dbName = '{code:GetDbName}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.rabbitmq===undefined)this.rabbitmq={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.rabbitmq.url===undefined)this.rabbitmq.url = '{code:GetRabbitMqProto}://{code:GetRabbitMqUser}:{code:GetRabbitMqPwd}@{code:GetRabbitMqHost}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.redis===undefined)this.services.CoAuthoring.redis={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.redis.host===undefined)this.services.CoAuthoring.redis.host = '{code:GetRedisHost}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"; Check: IsCommercial;

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.server===undefined)this.services.CoAuthoring.server={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.server.port===undefined)this.services.CoAuthoring.server.port = '{code:GetDocServicePort}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.license===undefined)this.license={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.license.license_file===undefined)this.license.license_file = '{code:GetLicensePath}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.utils===undefined)this.services.CoAuthoring.utils={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.utils.utils_common_fontdir===undefined)this.services.CoAuthoring.utils.utils_common_fontdir = '{code:GetFontsPath}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token===undefined)this.services.CoAuthoring.token={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.enable===undefined)this.services.CoAuthoring.token.enable={{request:{{}}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.enable.browser===undefined)this.services.CoAuthoring.token.enable.browser = {code:GetJwtEnabledBrowser}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.enable.request.inbox===undefined)this.services.CoAuthoring.token.enable.request.inbox = {code:GetJwtEnabledRequestInbox}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.enable.request.outbox===undefined)this.services.CoAuthoring.token.enable.request.outbox = {code:GetJwtEnabledRequestInboxOutbox}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.secret===undefined)this.services.CoAuthoring.secret={{inbox:{{},outbox:{{},session: {{} };"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.secret.inbox.string===undefined)this.services.CoAuthoring.secret.inbox.string = '{code:GetJwtSecretInbox}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.secret.outbox.string===undefined)this.services.CoAuthoring.secret.outbox.string = '{code:GetJwtSecretOutbox}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.secret.session.string===undefined)this.services.CoAuthoring.secret.session.string = '{code:GetJwtSecretSession}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.inbox===undefined)this.services.CoAuthoring.token.inbox={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.inbox.header===undefined)this.services.CoAuthoring.token.inbox.header = '{code:GetJwtHeaderInbox}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.outbox===undefined)this.services.CoAuthoring.token.outbox={{};"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""if(this.services.CoAuthoring.token.outbox.header===undefined)this.services.CoAuthoring.token.outbox.header = '{code:GetJwtHeaderOutbox}'"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#REPLACE}"; Parameters: """(listen .*:)(\d{{2,5}\b)(?! ssl)(.*)"" ""$1""{code:GetDefaultPort}""$3"" ""{#NGINX_DS_CONF}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
; Filename: "{cmd}"; Parameters: "/C COPY /Y ""{#NGINX_DS_TMPL}"" ""{#NGINX_DS_CONF}"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
; Filename: "{#REPLACE}"; Parameters: "{{{{DOCSERVICE_PORT}} {code:GetDocServicePort} ""{#NGINX_SRV_DIR}\conf\includes\onlyoffice-http.conf"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"
; Filename: "{#REPLACE}"; Parameters: "{{{{EXAMPLE_PORT}} {code:GetExamplePort} ""{#NGINX_SRV_DIR}\conf\includes\onlyoffice-http.conf"""; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{app}\bin\documentserver-update-securelink.bat"; Parameters: "{param:SECURE_LINK_SECRET}"; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{cmd}"; Parameters: "/C icacls ""{#NGINX_SRV_DIR}"" /remove:g *S-1-5-32-545"; Flags: runhidden; StatusMsg: "{cm:CfgDs}"

Filename: "{#PSQL}"; Parameters: "-h {code:GetDbHost} -U {code:GetDbUser} -d {code:GetDbName} -w -q -f ""{app}\server\schema\postgresql\removetbl.sql"""; Flags: runhidden; Check: IsNotClusterMode; StatusMsg: "{cm:RemoveDb}"
Filename: "{#PSQL}"; Parameters: "-h {code:GetDbHost} -U {code:GetDbUser} -d {code:GetDbName} -w -q -f ""{app}\server\schema\postgresql\createdb.sql"""; Flags: runhidden; Check: CreateDbAuth; StatusMsg: "{cm:CreateDb}"

Filename: "{#NSSM}"; Parameters: "install {#CONVERTER_SRV} ""{#CONVERTER_SRV_DIR}\converter.exe"""; Flags: runhidden; StatusMsg: "{cm:InstallSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} DisplayName {#CONVERTER_SRV_DISPLAY}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} Description {#CONVERTER_SRV_DESCR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppDirectory {#CONVERTER_SRV_DIR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppRotateFiles 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppRotateOnline 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppRotateBytes {#LOG_ROTATE_BYTES}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppStdout {#CONVERTER_SRV_LOG_DIR}\out.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppStderr {#CONVERTER_SRV_LOG_DIR}\error.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} Start SERVICE_DELAYED_AUTO_START"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#CONVERTER_SRV}}"
Filename: "{#NSSM}"; Parameters: "start {#CONVERTER_SRV}"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#CONVERTER_SRV}}"

Filename: "{#NSSM}"; Parameters: "install {#DOCSERVICE_SRV} ""{#DOCSERVICE_SRV_DIR}\docservice.exe"""; Flags: runhidden; StatusMsg: "{cm:InstallSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} DisplayName {#DOCSERVICE_SRV_DISPLAY}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} Description {#DOCSERVICE_SRV_DESCR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppDirectory {#DOCSERVICE_SRV_DIR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppRotateFiles 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppRotateOnline 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppRotateBytes {#LOG_ROTATE_BYTES}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppStdout {#DOCSERVICE_SRV_LOG_DIR}\out.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppStderr {#DOCSERVICE_SRV_LOG_DIR}\error.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} Start SERVICE_DELAYED_AUTO_START"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#DOCSERVICE_SRV}}"
Filename: "{#NSSM}"; Parameters: "start {#DOCSERVICE_SRV}"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#DOCSERVICE_SRV}}"

Filename: "{#NSSM}"; Parameters: "install {#NGINX_SRV} ""{#NGINX_SRV_DIR}\nginx"""; Flags: runhidden; StatusMsg: "{cm:InstallSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} DisplayName {#NGINX_SRV_DISPLAY}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} Description {#NGINX_SRV_DESCR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppDirectory {#NGINX_SRV_DIR}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppEnvironmentExtra {#NGINX_SRV_ENV}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppRotateFiles 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppRotateOnline 1"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppRotateBytes {#LOG_ROTATE_BYTES}"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppStdout {#NGINX_SRV_LOG_DIR}\out.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppStderr {#NGINX_SRV_LOG_DIR}\error.log"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} Start SERVICE_DELAYED_AUTO_START"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#NGINX_SRV}}"
Filename: "{#NSSM}"; Parameters: "start {#NGINX_SRV}"; Flags: runhidden; StatusMsg: "{cm:StartSrv,{#NGINX_SRV}}"

Filename: "sc"; Parameters: "failure ""{#CONVERTER_SRV}"" actions= restart/60000/restart/60000/restart/60000 reset= 86400"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#CONVERTER_SRV}}"
Filename: "sc"; Parameters: "failure ""{#DOCSERVICE_SRV}"" actions= restart/60000/restart/60000/restart/60000 reset= 86400"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#DOCSERVICE_SRV}}"
Filename: "sc"; Parameters: "failure ""{#NGINX_SRV}"" actions= restart/60000/restart/60000/restart/60000 reset= 86400"; Flags: runhidden; StatusMsg: "{cm:CfgSrv,{#NGINX_SRV}}"

Filename: "schtasks"; Parameters: "/Create /F /RU ""{#LOCAL_SERVICE}"" /SC DAILY /TN ""{#LogRotateTaskName}"" /TR ""{app}\bin\documentserver-log-rotate.bat"""; Flags: runhidden; StatusMsg: "{cm:AddRotateTask}"

Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""{#NGINX_SRV_DESCR}"" program=""{#NGINX_SRV_DIR}\nginx.exe"" dir=in action=allow protocol=tcp localport={code:GetDefaultPorts}"; Flags: runhidden; StatusMsg: "{cm:FireWallExt}"

[UninstallRun]
Filename: "{app}\bin\documentserver-prepare4shutdown.bat"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#NGINX_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#NGINX_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#CONVERTER_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#CONVERTER_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#DOCSERVICE_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#DOCSERVICE_SRV} confirm"; Flags: runhidden

Filename: "schtasks"; Parameters: "/End /TN ""{#LogRotateTaskName}"""; Flags: runhidden
Filename: "schtasks"; Parameters: "/Delete /F /TN ""{#LogRotateTaskName}"""; Flags: runhidden

Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#NGINX_SRV_DESCR}"""; Flags: runhidden; StatusMsg: "{cm:FireWallExt}"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\sdkjs"
Type: filesandordirs; Name: "{app}\fonts"
Type: files; Name: "{app}\server\FileConverter\bin\font_selection.bin"
Type: files; Name: "{app}\server\FileConverter\bin\AllFonts.js"

[Code]
function UninstallPreviosVersion(): Boolean;
var
  UninstallerPath: String;
  UninstallRegKey: String;
  UninstallerParam: String;
  ResultCode: Integer;
  ConfirmUninstall: Integer;
begin
  Result := True;
  UninstallerParam := '/VERYSILENT';
  UninstallRegKey := '{reg:HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#sAppId}_is1,UninstallString}';

  UninstallerPath := RemoveQuotes(ExpandConstant(UninstallRegKey));
  if Length(UninstallerPath) > 0 then begin
    ConfirmUninstall := IDOK;

    if not WizardSilent() then begin
      UninstallerParam := '/SILENT';
      ConfirmUninstall := MsgBox(
                              ExpandConstant('{cm:PrevVer}'),
                              mbConfirmation,
                              MB_OKCANCEL);
    end;

    if ConfirmUninstall = IDOK then begin
      Exec(
        UninstallerPath,
        UninstallerParam,
        '', 
        SW_HIDE,
        ewWaitUntilTerminated,
        ResultCode);
      
      while FileExists( UninstallerPath ) do begin
        Sleep(500);
      end

    end else begin
      Result := False;
    end;
  end;
end;

function InitializeSetup(): Boolean;
begin
  if not UninstallPreviosVersion() then
  begin
    Abort();
  end;
 
  if WizardSilent() = false then
  begin
    Dependency_AddVC2013;
    Dependency_AddVC2015To2022;
  end;

  Result := true;
end;

var
  DbPage: TInputQueryWizardPage;
  RabbitMqPage: TInputQueryWizardPage;
  RedisPage: TInputQueryWizardPage;

function GetDbHost(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.sql.dbHost');
end;

function ReadValues(Param: String): String;
var
  TmpFileName, ExecStdout: AnsiString;
  ResultCode: integer;
  Params: String;
begin
  TmpFileName := ExpandConstant('{tmp}') + '\strings.txt';
  Params := '/C ""' +
  ExpandConstant('{#JSON}') +
  '" -I -q -f "' +
  ExpandConstant('{app}\config\local.json') +
  '" -e console.log(' + Param + ') > ' +
  '"' + TmpFileName + '""';
  Exec(
    'cmd.exe',
    Params,
    '',
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);
  if LoadStringFromFile(TmpFileName, ExecStdout) then
  begin
    Result := ExecStdout;
  end;
  DeleteFile(TmpFileName);
end;

function GetDbPort(Param: String): String;
begin
  Result := IntToStr(5432);
end;

function GetDbUser(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.sql.dbUser');
end;

function GetDbPwd(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.sql.dbPass');
end;

function GetDbName(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.sql.dbName');
end;

function ParseRabbitMqParams(Token: Integer; Delims: String; Url: String): String;
var
  TmpFileName, ExecStdout: AnsiString;
  ResultCode: integer;
  Params: String;
begin
  TmpFileName := ExpandConstant('{tmp}') + '\strings.txt';
  Params := '/C "for /f "tokens=' +
  IntToStr(Token) +
  ' delims=' +
  Delims +
  " %a in ("amqp://guest:guest@localhost") do echo %a > ' +
  '"' + TmpFileName + '""';
  Exec(
    'cmd.exe',
    Params,
    '',
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);
  if LoadStringFromFile(TmpFileName, ExecStdout) then
  begin
    Result := ExecStdout;
  end;
  DeleteFile(TmpFileName);
end;

function GetRabbitMqHost(Param: String): String;
begin
  Result := ParseRabbitMqParams(1,'://', ReadValues('this.rabbitmq.url')); 
end;

function GetRabbitMqUser(Param: String): String;
begin
  Result := ParseRabbitMqParams(2,'://', ReadValues('this.rabbitmq.url')); 
end;

function GetRabbitMqPwd(Param: String): String;
begin
  Result := ParseRabbitMqParams(3,'*@', ReadValues('this.rabbitmq.url')); 
end;

function GetRabbitMqProto(Param: String): String;
begin
  Result := ParseRabbitMqParams(4,'@', ReadValues('this.rabbitmq.url'));
end;

function GetRedisHost(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.redis.host');
end;

function GetDefaultPort(Param: String): String;
begin
  Result := ExpandConstant('{param:DS_PORT|{reg:HKLM\{#sAppRegPath},{#REG_DS_PORT}|80}}');
end;

function GetDefaultPorts(Param: String): String;
begin
  Result := GetDefaultPort('');
  if (Result = '80') then begin
    Result := Result + ',' + '443';
  end;
end;

function GetDocServicePort(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.server.port');
end;

function GetExamplePort(Param: String): String;
begin
  Result := ExpandConstant('{param:EXAMPLE_PORT|{reg:HKLM\{#sAppRegPath},{#REG_EXAMPLE_PORT}|3000}}');
end;

function GetLicensePath(Param: String): String;
  Result := ReadValues('this.license.license_file');
end;

function GetFontsPath(Param: String): String;
  Result := ReadValues('this.services.CoAuthoring.utils.utils_common_fontdir');
end;

function GetJwtEnabledBrowser(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.browser');
end;

function GetJwtEnabledRequestInbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.request.inbox');
end;

function GetJwtEnabledRequestOutbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.request.outbox');
end;

function GetJwtSecretInbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.browser');
end;

function GetJwtSecretOutbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.request.inbox');
end;

function GetJwtSecretSession(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.enable.request.outbox');
end;

function GetJwtHeaderInbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.inbox.header');
end;

function GetJwtHeaderOutbox(Param: String): String;
begin
  Result := ReadValues('this.services.CoAuthoring.token.outbox.header');
end;

function IsCommercial: Boolean;
begin
  Result := false;
  if ('{#sProductName}' = 'DocumentServer-EE') or ('{#sProductName}' = 'DocumentServer-IE') or ('{#sProductName}' = 'DocumentServer-DE') then begin
    Result := true;
  end;
end;

procedure InitializeWizard;
begin
  DbPage := CreateInputQueryPage(wpPreparing,
    'PostgreSQL Database', 'Configure PostgreSQL Connection...',
    'Please specify your PostgreSQL connection, then click Next.');
  DbPage.Add('Host:', False);
  DbPage.Add('User:', False);
  DbPage.Add('Password:', True);
  DbPage.Add('Database:', False);

  DbPage.Values[0] := ExpandConstant('{param:DB_HOST|{reg:HKLM\{#sAppRegPath},{#REG_DB_HOST}|localhost}}');
  DbPage.Values[1] := ExpandConstant('{param:DB_USER|{reg:HKLM\{#sAppRegPath},{#REG_DB_USER}|{#sDbDefValue}}}');
  DbPage.Values[2] := ExpandConstant('{param:DB_PWD|{reg:HKLM\{#sAppRegPath},{#REG_DB_PWD}|{#sDbDefValue}}}');
  DbPage.Values[3] := ExpandConstant('{param:DB_NAME|{reg:HKLM\{#sAppRegPath},{#REG_DB_NAME}|{#sDbDefValue}}}');

  RabbitMqPage := CreateInputQueryPage(DbPage.ID,
    'RabbitMQ Messaging Broker', 'Configure RabbitMQ Connection...',
    'Please specify your RabbitMQ connection, then click Next.');
  RabbitMqPage.Add('Host:', False);
  RabbitMqPage.Add('User:', False);
  RabbitMqPage.Add('Password:', True);
  RabbitMqPage.Add('Protocol:', False);
  
  RabbitMqPage.Values[0] := ExpandConstant('{param:RABBITMQ_HOST|{reg:HKLM\{#sAppRegPath},{#REG_RABBITMQ_HOST}|localhost}}');
  RabbitMqPage.Values[1] := ExpandConstant('{param:RABBITMQ_USER|{reg:HKLM\{#sAppRegPath},{#REG_RABBITMQ_USER}|guest}}');
  RabbitMqPage.Values[2] := ExpandConstant('{param:RABBITMQ_PWD|{reg:HKLM\{#sAppRegPath},{#REG_RABBITMQ_PWD}|guest}}');
  RabbitMqPage.Values[3] := ExpandConstant('{param:RABBITMQ_PROTO|{reg:HKLM\{#sAppRegPath},{#REG_RABBITMQ_PROTO}|amqp}}');
  
  if IsCommercial then begin
    RedisPage := CreateInputQueryPage(RabbitMqPage.ID,
      'Redis In-Memory Database', 'Configure Redis Connection...',
      'Please specify your Redis connection, then click Next.');
    RedisPage.Add('Host:', False);

    RedisPage.Values[0] := ExpandConstant('{param:REDIS_HOST|{reg:HKLM\{#sAppRegPath},{#REG_REDIS_HOST}|localhost}}');
  end;

end;

function CreateDbAuth(): Boolean;
begin
  Result := true;

  SaveStringToFile(
    ExpandConstant('{#POSTGRESQL_DATA_DIR}\pgpass.conf'),
    GetDbHost('')+ ':' + GetDbPort('')+ ':' + GetDbName('') + ':' + GetDbUser('') + ':' + GetDbPwd(''),
    False);
end;

function IsNotClusterMode(): Boolean;
var
  ClusterMode: Integer;
begin
  Result := true;
  ClusterMode := StrToInt(ExpandConstant('{param:CLUSTER_MODE|0}'));
  if ClusterMode > 0 then
  begin
    Result := false;
  end;
  CreateDbAuth();
end;

function IsStringEmpty(Param: String): Boolean;
begin
  Result := false;
  if Length(Param) <= 0 then
  begin
    Result := true;
  end;
end;

function CheckDbConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;

  SaveStringToFile(
    ExpandConstant('{userappdata}\postgresql\pgpass.conf'),
    GetDbHost('')+ ':' + GetDbPort('')+ ':' + GetDbName('') + ':' + GetDbUser('') + ':' + GetDbPwd(''),
    False);

  Exec(
    ExpandConstant('{#PSQL}'),
    '-h ' + GetDbHost('') + ' -U ' + GetDbUser('') + ' -d ' + GetDbName('') + ' -w -c ";"',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetDbHost('') + ' failed!' + #13#10 + 'PSQL return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

function CheckRabbitMqConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;
    Exec(
    ExpandConstant('{#RABBITMQCTL}'),
    '-q list_queues',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetRedisHost('') + ' failed!' + #13#10 + 'rabbitmqctl return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

function CheckRedisConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;
    Exec(
    ExpandConstant('{#REDISCLI}'),
    '-h ' + GetRedisHost('') + ' --version',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetRedisHost('') + ' failed!' + #13#10 + 'redis-cli return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

//function NextButtonClick(CurPageID: Integer): Boolean;
//begin
//  Result := true;
//  if WizardSilent() = false then
//  begin
//    case CurPageID of
////      DbPage.ID: Result := CheckDbConnection();
////      RabbitMqPage.ID: Result := CheckRabbitMqConnection();
////      RedisPage.ID: Result := CheckRedisConnection();
//      wpReady: Result := DownloadDependency();
//    end;
//  end;
//end;                                                     

