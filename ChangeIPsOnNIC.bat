@echo off

REM Autor: Lucas Rocini
REM Script: Modificar configuracao de IP dos notebooks
REM Versao: LAR 2.0
REM Email: LucasRocin@hotmail.com


echo ****************************************************************************
echo 				Setar IP
echo ****************************************************************************
echo .	Script para Setar Configuracao de IP
echo .	Versao: LAR 2.0
echo ****************************************************************************
echo .
echo .
echo ****************************************************************************
echo .
echo . 	ATENCAO - ESTE SCRIPT DEVE SER EXECUTADO COMO ADMINISTRADOR!
echo .
echo ****************************************************************************
echo .
echo .

echo . OPCOES PARA CONFIGURAR O IP DO COMPUTADOR:
echo .
echo .	[1] - VLAN 200 - Rede XXX
echo .
echo .	[2] - VLAN 600 - Rede XXX
echo .
echo .	[3] - Rede 58  - Rede XXX
echo .
echo .	[4] - Rede 60  - Rede XXX
echo .
echo .
::Prompt ao usuário para prosseguir
set /p resp=Digite o numero da opcao desejada: 
if /i "%resp%" EQU "1" goto VLAN200
if /i "%resp%" EQU "2" goto VLAN600
if /i "%resp%" EQU "3" goto Rede58
if /i "%resp%" EQU "4" goto Rede60
if /i "%resp%" NEQ "1" goto encerra



:encerra
echo .
echo  Nenhuma opcao escolhida
echo  O script sera encerrado.
echo  A configuracao IP nao sera modificada.
echo .
pause
exit /b



:VLAN200

echo ****** Iniciando Script... ******

echo .
echo .
:: Ativar DHCP no Endereco IP
echo Setando IP...
netsh interface ip set address name="Ethernet" static 1.1.1.1
netsh interface ip set address "Ethernet" dhcp
IF %ERRORLEVEL% EQU 0 (echo IP setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Ativar DHCP no Endereco DNS
echo Setando DNS...
netsh interface ip set dns "Ethernet" dhcp
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

timeout 1 > NUL
echo .
timeout 1 > NUL
echo .
echo . Seguem configuracoes setadas:
echo Obs.: Caso esteja no WIFI e no cabo, pode aparecer mais de um IP!
echo Obs.: Caso nao esteja conectado, a configuracao pode nao aparecer!
echo .
ipconfig -all | find "IPv4"
ipconfig -all | find "Sub-rede"
ipconfig -all | find "Gateway"

echo .
echo ****************************************************
echo ***                                              ***
echo ***       Script Finalizado com SUCESSO.         ***
echo ***                                              ***
echo ***                HORA: %time:~0,5%                   ***
echo ***                                              ***
echo ****************************************************
echo .

pause
exit /b


:VLAN600
echo .
echo ****** Iniciando Script... ******

echo .
echo .
::Prompt do IP
set /p final_IP=Digite o final do IP: 10.141.88.

set "IP=10.141.88.%final_IP%"

echo .
echo .
:: Endereco IP
echo Setando IP...
netsh interface ip set address name="Ethernet" static %IP% 255.255.255.128 10.141.88.1
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Endereco DNS Local 1
echo Setando DNS Local 1...
netsh interface ip set dns "Ethernet" static 10.141.65.152
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Endereco DNS Local 2
echo Setando DNS Local 2...
netsh interface ip add dns name="Ethernet" addr=10.141.64.119 index=2
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)


echo .
echo .
:: Endereco DNS Mercado 1
echo Setando DNS Mercado 1...
netsh interface ip add dns name="Ethernet" addr=165.131.177.16 index=3
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Endereco DNS Mercado 2
echo Setando DNS Mercado 2...
netsh interface ip add dns name="Ethernet" addr=165.131.177.33 index=4
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Endereco DNS Regional 1
echo Setando DNS Regional 1...
netsh interface ip add dns name="Ethernet" addr=165.131.136.115 index=5
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Endereco DNS Regional 2
echo Setando DNS Regional 2...
netsh interface ip add dns name="Ethernet" addr=165.131.136.111 index=6
IF %ERRORLEVEL% EQU 0 (echo DNS setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

timeout 1 > NUL
echo .
timeout 1 > NUL
echo .
echo . Seguem configuracoes setadas:
echo Obs.: Caso esteja no WIFI e no cabo, pode aparecer mais de um IP!
echo Obs.: Caso nao esteja conectado, a configuracao pode nao aparecer!
echo .
ipconfig -all | find "IPv4"
ipconfig -all | find "Sub-rede"
ipconfig -all | find "Gateway"

echo .
echo ****************************************************
echo ***                                              ***
echo ***       Script Finalizado com SUCESSO.         ***
echo ***                                              ***
echo ***                HORA: %time:~0,5%                   ***
echo ***                                              ***
echo ****************************************************
echo .

pause
exit /b


:Rede58

echo .
echo ****** Iniciando Script... ******
echo .
echo .

::Prompt do IP
set /p final_IP=Digite o final do IP: 192.168.58.

set "IP=192.168.58.%final_IP%"

echo .
echo .
:: Endereco IP
echo Setando IP...
netsh interface ip set address name="Ethernet" static %IP% 255.255.255.0 
IF %ERRORLEVEL% EQU 0 (echo IP setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Ativar DHCP no Endereco DNS
echo Setando DNS...
netsh interface ip set dns "Ethernet" dhcp
IF %ERRORLEVEL% EQU 0 (echo IP setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

timeout 1 > NUL
echo .
timeout 1 > NUL
echo .
echo . Seguem configuracoes setadas:
echo Obs.: Caso esteja no WIFI e no cabo, pode aparecer mais de um IP!
echo Obs.: Caso nao esteja conectado, a configuracao pode nao aparecer!
echo .
ipconfig -all | find "IPv4"
ipconfig -all | find "Sub-rede"
ipconfig -all | find "Gateway"

echo .
echo ****************************************************
echo ***                                              ***
echo ***       Script Finalizado com SUCESSO.         ***
echo ***                                              ***
echo ***                HORA: %time:~0,5%                   ***
echo ***                                              ***
echo ****************************************************
echo .

pause
exit /b


:Rede60

echo .
echo ****** Iniciando Script... ******
echo .
echo .

::Prompt do IP
set /p final_IP=Digite o final do IP: 192.168.60.

set "IP=192.168.60.%final_IP%"

echo .
echo .
:: Endereco IP
echo Setando IP...
netsh interface ip set address name="Ethernet" static %IP% 255.255.255.0 
IF %ERRORLEVEL% EQU 0 (echo IP setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

echo .
echo .
:: Ativar DHCP no Endereco DNS
echo Setando DNS...
netsh interface ip set dns "Ethernet" dhcp
IF %ERRORLEVEL% EQU 0 (echo IP setado com SUCESSO!) ELSE (echo ATENCAO Ocorreu algum erro !!!)

timeout 1 > NUL
echo .
timeout 1 > NUL
echo .
echo . Seguem configuracoes setadas:
echo Obs.: Caso esteja no WIFI e no cabo, pode aparecer mais de um IP!
echo Obs.: Caso nao esteja conectado, a configuracao pode nao aparecer!
echo .
ipconfig -all | find "IPv4"
ipconfig -all | find "Sub-rede"
ipconfig -all | find "Gateway"

echo .
echo ****************************************************
echo ***                                              ***
echo ***       Script Finalizado com SUCESSO.         ***
echo ***                                              ***
echo ***                HORA: %time:~0,5%                   ***
echo ***                                              ***
echo ****************************************************
echo .

pause
exit /b







