#!/bin/bash
(
echo "10" ; sleep 1
echo "# Verificando si ElasticSearch se encuentra instalado en el sistema" ; sleep 1
echo "20" ; sleep 1
echo "# Verificando si ElasticSearch se encuentra instalado en el sistema" ; sleep 1
echo "50" ; sleep 1
echo "# Verificando si ElasticSearch se encuentra instalado en el sistema" ; sleep 1
echo "75" ; sleep 1
echo "# Comprobación finalizada" ; sleep 1
echo "100" ; sleep 1
) |
zenity --progress \
  title="Verify" \
  text="Buscando instalaciones previas" \
  percentage=0

if [ "$?" = -1 ] ; then
zenity --error \
text="Búsqueda cancelada."
fi

if dpkg -l | grep -i elasticsearch; then
	clear
	echo "Elastic ya instalado"
else
	clear
	echo "Elastic no instalado"
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
	echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
	sudo apt update
	sudo apt install elasticsearch
	sudo echo '. . .
network.host: localhost
. . .
' >> /etc/elasticsearch/elasticsearch.yml

	sudo systemctl start elasticsearch
	sudo systemctl enable elasticsearch


fi
