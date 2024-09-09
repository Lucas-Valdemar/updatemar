@echo off
REM Escolha entre instalar os mods ou fazer Backup
echo.
echo Selecione uma opcao:
echo 1. Instalar os mods
echo 2. Fazer Backup da pasta mods

REM Leitura da escolha do usuário
set /p gameChoice="Digite um numero e aperte Enter: "

REM Processando a escolha do usuário
if "%gameChoice%"=="1" (
    echo Instalando mods...
    REM Instalador de mods Project Zomboid
    curl -s -O "https://lucas-valdemar.github.io/updatemar/path/project-zomboid/downloader/downloader-pz.bat"
    if exist downloader-pz.bat (
        call downloader-pz.bat
    ) else (
        echo Falha ao baixar downloader-pz.bat.
    )
) else if "%gameChoice%"=="2" (
    echo Fazendo backup da pasta mods...
    REM Backup da pasta mods Proejct Zomboid
    curl -s -O "https://lucas-valdemar.github.io/updatemar/path/project-zomboid/backup/backup-pz.bat"
    if exist backup-pz.bat (
        call backup-pz.bat
    ) else (
        echo Falha ao baixar backup-pz.bat.
    )
) else (
    echo Escolha invalida. Por favor, execute o script novamente e escolha uma opcao valida.
    exit /b
)

REM Fim do script
echo Fim do script.