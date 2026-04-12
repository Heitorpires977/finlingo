@echo off
echo === Deploy FinLingo para GitHub ===
echo.

echo 1. Adicionando arquivos alterados...
git add -A

echo.
echo 2. Criando commit...
git commit -m "Deploy: atualizacoes do app"

echo.
echo 3. Enviando para GitHub...
git push origin main

echo.
echo === Deploy concluido com sucesso! ===
echo.
echo O Vercel deve fazer o build automaticamente em alguns minutos.
pause