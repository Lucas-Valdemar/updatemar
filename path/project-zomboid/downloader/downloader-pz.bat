@echo off
setlocal

:: URL do arquivo no Google Drive (com o ID do arquivo)
set "fileId=1yxFTv09-C2sGKsfLggHj3LXenGmGlMF0"
set "url=https://drive.google.com/uc?export=download&id=%fileId%"

:: Caminho de destino para os mods
set "destino=%USERPROFILE%\Zomboid\mods"

:: Baixar o arquivo usando PowerShell
echo Baixando o arquivo do Google Drive...

:: Usa o PowerShell para lidar com o processo de download e confirmação
powershell -command ^
    "$client = new-object System.Net.WebClient; ^ 
    $client.DownloadFile('https://drive.google.com/uc?export=download&id=%fileId%','mod.zip')"

:: Criar a pasta de destino, caso não exista
if not exist "%destino%" (
    mkdir "%destino%"
)

:: Extrair o arquivo
echo Extraindo os arquivos...
powershell -command "Expand-Archive mod.zip -DestinationPath %destino% -Force"

:: Limpar arquivos temporários
del mod.zip

echo Mod instalado com sucesso!
pause
