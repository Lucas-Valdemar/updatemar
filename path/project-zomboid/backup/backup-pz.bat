@echo off
setlocal

:: Solicita ao usuário o nome da nova pasta para o backup
set /p backupName="Digite o nome da pasta para o backup: "

:: Define os diretórios de origem e destino
set sourceDir=C:\Users\%USERNAME%\Zomboid\mods
set destDir=C:\Users\%USERNAME%\Zomboid\updatemar backups\%backupName%

:: Cria o diretório de destino, se não existir
if not exist "%destDir%" (
    mkdir "%destDir%"
)

:: Move todos os arquivos e subpastas da pasta de origem para a pasta de destino
xcopy "%sourceDir%\*" "%destDir%" /E /I /H /R /Y

:: Remove a pasta de origem após mover todos os arquivos
rd /S /Q "%sourceDir%"

:: Exibe uma mensagem de conclusão
echo Backup concluído. Todos os arquivos e pastas foram movidos para "%destDir%".

endlocal
pause
