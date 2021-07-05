#! /bin/bash
echo -e  "\e[1;36m Actualizando Sistema: \e[0m"
apt update
apt-get update
apt-get upgrade
apt-get full-upgrade
echo
echo -e  "\e[1;36m Removiendo paquetes innecesarios: \e[0m"
apt autoremove
echo
echo -e  "\e[5;32m ***SISTEMA ACTUALIZADO*** \e[0m"
sleep 2

echo -e  "\e[1;36m Instalando servicios de recursos compartidos: \e[0m"

apt install samba
apt install nfs-common
apt install smbclient
apt install cifs-utils
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

read -p "Ingrese el nombre del grupo de trabajo: " grupo
cat ./arch1 > smb.conf
echo    workgroup = $grupo >> ./arch1
cat ./arch2 >> ./arch1

read -p "Ingrese la ip o el nombre del servidor: " servidor
read -p "Ingrese el nombre de la carpeta compartida, si no tiene pongale uno: " carpeta
mkdir /mnt/Servidor
mount //$servidor/$carpeta /mnt/Servidor
ln -s /mnt/Servidor ~/Desktop/Servidor

echo "Proceso concluido, ya puede acceder a su recurso compartido desde su escritorio."
