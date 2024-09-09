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

:: Move os arquivos da pasta de origem para a pasta de destino
move "%sourceDir%\*" "%destDir%"

:: Exibe uma mensagem de conclusão
echo Backup concluído. Os arquivos foram movidos para "%destDir%".

endlocal
pause
