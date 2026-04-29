@echo off
REM ─────────────────────────────────────────────────────────────────
REM  Dragon Ball Flow — Conectar carpeta local con GitHub
REM  Ejecuta este archivo UNA SOLA VEZ desde la carpeta del flujo
REM  Prerequisito: git instalado (https://git-scm.com/download/win)
REM ─────────────────────────────────────────────────────────────────

echo.
echo  Dragon Ball Flow — Conectando con GitHub...
echo.

cd /d "%~dp0"

git init
git config user.email "adriangarciamendez87@gmail.com"
git config user.name "AdrianBVCPS"
git branch -M main
git remote add origin https://github.com/AdrianBVCPS/dragon-ball-flow-claude-code.git
git add -A
git commit -m "sync: sincronizacion inicial desde Windows"
git push -u origin main --force

echo.
echo  LISTO. La carpeta esta conectada con GitHub.
echo  Las actualizaciones semanales automaticas ya pueden hacer push.
echo.
pause
