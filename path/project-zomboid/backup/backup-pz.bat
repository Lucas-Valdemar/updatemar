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
for /d %%D in ("%sourceDir%\*") do move "%%D" "%destDir%\"
for %%F in ("%sourceDir%\*") do move "%%F" "%destDir%"

:: Exclui os arquivos e pastas vazias que podem permanecer na pasta de origem
for /f "delims=" %%D in ('dir /ad /b "%sourceDir%"') do rd "%sourceDir%\%%D"

:: Exibe uma mensagem de conclusão
echo Backup concluído. Todos os arquivos e pastas foram movidos para "%destDir%". A pasta de origem foi deixada vazia.

endlocal
pause
exit /b
