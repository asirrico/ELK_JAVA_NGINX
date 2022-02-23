#!/bin/bash
(
echo "10" ; sleep 1
echo "# Verificando si JDK se encuentra instalado en el sistema" ; sleep 1
echo "20" ; sleep 1
echo "# Verificando si JDK se encuentra instalado en el sistema" ; sleep 1
echo "50" ; sleep 1
echo "# Verificando si JDK se encuentra instalado en el sistema" ; sleep 1
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

if dpkg -l | grep -i jdk; then
	clear
	echo "JDK ya instalado"
else
	clear
	echo "JDK no instalado"
	sudo apt update
	sudo apt install openjdk-8-jdk
fi
