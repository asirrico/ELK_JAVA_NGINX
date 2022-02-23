#!/bin/bash
(
echo "10" ; sleep 1
echo "# Verificando si Nginx se encuentra instalado en el sistema" ; sleep 1
echo "20" ; sleep 1
echo "# Verificando si Nginx se encuentra instalado en el sistema" ; sleep 1
echo "50" ; sleep 1
echo "# Verificando si Nginx se encuentra instalado en el sistema" ; sleep 1
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

if dpkg -l | grep -i nginx; then
	clear
	echo "Nginx ya instalado"
else
	clear
	echo "Nginx no instalado"
	sudo apt update
	sudo apt install nginx

fi
