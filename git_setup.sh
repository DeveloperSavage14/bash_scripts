#!bin/bash

read -p "Name of repo: " name
echo "# $name" >> README.md
git init
git add README.md
git commit -m "Setup"
git branch -M main
git remote add origin https://github.com/DeveloperSavage14/$name
git push -u origin main
