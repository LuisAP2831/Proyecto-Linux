#!/bin/bash
source ./creditos.sh
source ./darHyF.sh
source ./infosis.sh
source ./juego.sh
source ./mp3.sh
source ./buscar.sh

echo "Bienvenido a tu terminal"
read -p "Por favor ingresa tu usuario: " nombre
if id $nombre &> /dev/null; then
   echo ingresa contraseña
   su -c "whoami"
   echo "Bienvenido: $nombre"
else
   echo "El usuario $nombre no existe"
   read -p "¿Deseas crearlo?[S/N]" respuesta

    if [ "$respuesta" == "S" -o "$respuesta" = "S" ];then
     sudo adduser $nombre
    fi
fi


while true; do
printf "[%s@%s] " "$(whoami)" "$(basename "$(pwd)")"
read -a tarea
case $tarea in
     creditos)
      creditos
      true
     ;;
     fecha)
     darHyF
     ;;
     infosis)
     infosis
     ;;
     ahorcado)
     juego
     ;;
     mp3)
     mp3
     ;;
     buscar)
     buscar
     ;;

     *)
     echo Comando no valido
esac
done