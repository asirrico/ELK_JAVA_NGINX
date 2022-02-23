#!/bin/bash
(
echo "10" ; sleep 1
echo "# Verificando si Kibana se encuentra instalado en el sistema" ; sleep 1
echo "20" ; sleep 1
echo "# Verificando si Kibana se encuentra instalado en el sistema" ; sleep 1
echo "50" ; sleep 1
echo "# Verificando si Kibana se encuentra instalado en el sistema" ; sleep 1
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

if dpkg -l | grep -i kibana; then
	clear
	echo "Kibana ya instalado"
else
	clear
	echo "Kibana no instalado"
	sudo apt update
	sudo apt install kibana
	sudo systemctl enable kibana
	sudo systemctl start kibana
	echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users
	sudo echo 'server {
    listen 80;

    server_name example.com;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}' > /etc/nginx/sites-available/example.com

	sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com
	sudo nginx -t
	sudo systemctl restart nginx
	sudo systemctl start elasticsearch
	sudo systemctl enable elasticsearch


fi
