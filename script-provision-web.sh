#!/bin/bash

echo "Atualizando o sistema..."
apt-get update -y
apt-get upgrade -y
echo "Sistema atualizado!"

echo "Instalando o Apache..."
apt-get install apache2 -y
systemctl start apache2
echo "Apache instalado!"

echo "Instalando o UnZip e Wget..."
apt-get install unzip wget -y
echo "UnZip e Wget instalado!"

echo "Baixando a aplicação..."
wget -P /tmp/ https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo "Descompactando..."
unzip -q /tmp/main.zip -d /tmp/
rm -r -f /tmp/main.zip
echo "Movendo para o diretório do servidor web..."
rm -r -f /var/www/html/*
cp -r -f /tmp/linux-site-dio-main/* /var/www/html/
rm -r -f /tmp/linux-site-dio-main/
echo "Aplicação instalada!"

