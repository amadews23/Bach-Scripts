@echo off
REM Entrega voluntari 2, ASO.
REM Alumne: Bartolomé Vich Lozano
REM Email: web@tovilo.es
title Conversor Binari a Decimal
:inicio
cls
echo ****************************************************
echo *              Conversor binari i octal            *
echo *                     a decimal                    *
echo ****************************************************
echo "                                                  "
set /a indice=1
set /a potencia=1
set /a potencia0=1
set /a pos=1
set /a nbits =8
set /a resultado=0
echo Tria la base (2 o 8):
set /p base=">" 
if %base% EQU 2 (
echo Introdueix un numero amb base %base% de %nbits% bits:
	goto seguir
)
if %base% EQU 8 (
	echo Introdueix un numero amb base %base%:
	goto seguir
)
else (
	goto inicio
)
:seguir
set /p numero=">"

echo El numero a calcular es %numero:~0,8%
set /a numtemp=%numero:~-1,8%

REM posam un cero davant perque si posam una sola xifra calculi be 
set numero=0%numero%

REM comprobam la darrera xifra si es correcte
if %numtemp% GTR 7 (
	if %base% EQU 8 (
		goto inicio:
	)
)
if %numtemp% GTR 1 (
	if %base% EQU 2 (
		goto inicio:
	)
)
set /a numtemp0=numtemp*potencia0
:calcular
for /L %%a in (%indice%,1,%indice%) do (
REM	set /a exponente=%%a
	set /a potencia=potencia*base
	set /a pos+=1
)

CALL set numtemp=%%numero:~-%pos%,1%%

REM comprobam que desde la segona xifra fins es final es correcte
if %numtemp% GTR 7 (
	if %base% EQU 8 (
		goto inicio:
	)
)
if %numtemp% GTR 1 (
	if %base% EQU 2 (
		goto inicio:
	)
)
set /a valor=numtemp*potencia
set /a indice+=1
set /a resultado+=%valor%
if %indice% LSS %nbits% (
	goto calcular
)
set /a resultado+=%numtemp0%
echo El seu valor en decimal es: %resultado% 
