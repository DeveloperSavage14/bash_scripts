#!bin/bash

read -p "Name of repo: " name
echo "# $name" >> README.md
git init
git add README.md
git commit -m "Setup"
git branch -M main
read -p "Url of git repositry: " repo
git remote add origin $repo
git push -u origin main
