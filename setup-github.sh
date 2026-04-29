#!/bin/bash
# Dragon Ball Flow — Conectar carpeta local con GitHub (Mac/Linux)
cd "$(dirname "$0")"
git init
git config user.email "adriangarciamendez87@gmail.com"
git config user.name "AdrianBVCPS"
git branch -M main
git remote add origin https://github.com/AdrianBVCPS/dragon-ball-flow-claude-code.git
git add -A
git commit -m "sync: sincronizacion inicial"
git push -u origin main --force
echo "✅ Carpeta conectada con GitHub."
