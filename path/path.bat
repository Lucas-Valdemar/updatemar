@echo off
REM Escolha entre os jogos disponíveis
echo.
echo Selecione o jogo que deseja atualizar:
echo 1. Project Zomboid
echo 2. Project Zomboid Dedicated Server

REM Leitura da escolha do usuário
set /p gameChoice="Digite o numero do jogo e aperte Enter: "

REM Processando a escolha do usuário
if "%gameChoice%"=="1" (
    echo Atualizando Project Zomboid...
    REM Instalador de mods Project Zomboid
    curl -s -O "https://lucas-valdemar.github.io/updatemar/path/project-zomboid/init-pz.bat"
    if exist init-pz.bat (
        call init-pz.bat
    ) else (
        echo Falha ao baixar init-pz.bat.
    )
) else if "%gameChoice%"=="2" (
    echo Atualizando Project Zomboid Dedicated Server...
    REM Instalador de mods Project Zomboid Dedicated Server
    curl -s -O "https://lucas-valdemar.github.io/updatemar/path/project-zomboid-dedicated-server/init-pzds.bat"
    if exist init-pzds.bat (
        call init-pzds.bat
    ) else (
        echo Falha ao baixar init-pzds.bat.
    )
) else (
    echo Escolha invalida. Por favor, execute o script novamente e escolha uma opcao valida.
    exit /b
)

REM Fim do script
echo Fim do script.
