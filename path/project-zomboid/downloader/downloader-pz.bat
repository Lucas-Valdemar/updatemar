@echo off
setlocal

:: URL do arquivo no OneDrive (convertido para link de download direto)
set "url=https://api.onedrive.com/v1.0/shares/s!AnnI_h58OjVc1mgmOASroeVKSNfd/root/content"

:: Caminho de destino para os mods
set "destino=%USERPROFILE%\Zomboid\mods"

:: Baixar o arquivo usando PowerShell
echo Baixando o arquivo do OneDrive...
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

:: Limpar arquivos temporários
del mods.zip

echo Mod instalado com sucesso!
pause
