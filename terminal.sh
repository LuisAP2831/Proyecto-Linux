#!/bin/bash
echo "Bienvenido a tu terminal"
read -p "Por favor ingresa tu usuario: " nombre
if id $nombre &> /dev/null; then
   echo "Bienvenido: $nombre"
else
   echo "El usuario $nombre no existe"
   read -p "¿Deseas crearlo?[S/N]" respuesta

    if [ "$respuesta" == "S" -o "$respuesta" = "S" ];then
     sudo adduser $nombre
    fi
fi


while true; do
printf "[%s@%s] " "$(whoami)" "$(basename" $(pwd)")"
read -a tarea
case $tarea in
     1)
     echo uno
     ;;
     2)
     echo dos
     ;;
     3)
     echo tres
     ;;
     *)
     echo Comando no valido
esac
done