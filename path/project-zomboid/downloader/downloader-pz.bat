@echo off
setlocal

:: URL do arquivo no Google Drive (com o ID do arquivo)
set "fileId=1yxFTv09-C2sGKsfLggHj3LXenGmGlMF0"
set "url=https://drive.google.com/uc?export=download&id=%fileId%"

:: Caminho de destino para os mods
set "destino=%USERPROFILE%\Zomboid\mods"

:: Baixar o arquivo usando PowerShell
echo Baixando o arquivo do Google Drive...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile 'mods.zip' -UseBasicP"

:: Verificar se o arquivo foi baixado com sucesso
if not exist "mods.zip" (
    echo Falha ao baixar o arquivo. Verifique a URL e tente novamente.
    exit /b 1
)

:: Criar a pasta de destino, caso não exista
if not exist "%destino%" (
    mkdir "%destino%"
)

:: Extrair o arquivo
echo Extraindo os arquivos...
powershell -Command "Expand-Archive -Path 'mods.zip' -DestinationPath '%destino%' -Force"

:: Verificar se a extração foi bem-sucedida
if not exist "%destino%" (
    echo Falha ao extrair o arquivo. Verifique o arquivo ZIP e tente novamente.
    exit /b 1
)


echo Mod instalado com sucesso!
pause
