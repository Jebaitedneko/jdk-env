IF NOT EXIST jdk8-32.zip (
    START /b /wait tools\curl\curl.exe https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u262-b10/openlogic-openjdk-8u262-b10-windows-x32.zip -o jdk8-32.zip
)
IF NOT EXIST proj (
    MD proj
)
IF NOT EXIST jdk8-32 (
    START /b /wait tools\7za\7za.exe x jdk8-32.zip
    REN openlogic-openjdk-8u262-b10-win-32 jdk8-32
)
CLS
START /b /wait jdk8-32\bin\javac.exe -d proj %1% 
START /b /wait jdk8-32\bin\java.exe -cp proj %2%
DEL /Q proj