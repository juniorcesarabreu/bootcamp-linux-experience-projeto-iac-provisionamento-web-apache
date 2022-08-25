#!/bin/bash

echo "Atualizando o sistema..."
apt update -y
apt upgrade -y
echo "Sistema atualizado!"

echo "Instalando o Apache..."
apt install apache2 -y
systemctl start apache2
echo "Apache instalado!"

echo "Instalando o UnZip..."
apt install unzip -y
echo "UnZip instalado!"

echo "Baixando a aplicação..."
wget -P /tmp/ https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo "Descompactando..."
unzip /tmp/main.zip -d /tmp/
rm -r -f /tmp/main.zip
echo "Movendo para o diretório do servidor web..."
cp -r -f /tmp/linux-site-dio-main/* /var/www/html/
rm -r -f /tmp/linux-site-dio-main/
echo "Aplicação instalada!"

