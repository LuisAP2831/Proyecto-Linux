#!/bin/bash
source ./creditos.sh
source ./darHyF.sh
source ./infosis.sh
source ./juego.sh
source ./mp3.sh
source ./buscar.sh
source ./ayuda.sh
trap '' INT TSTP

clear
echo "Bienvenido a tu terminal"
read -p "Por favor ingresa tu usuario: " nombre
if id $nombre &> /dev/null; then
   read -s -p "Ingresa tu contrasena: " contrasena
   echo # Salto de línea para mayor legibilidad
   if su "$nombre" -c "echo 'Contrasena correcta'" &> /dev/null; then
      echo "Bienvenido, $nombre"
   else
      echo "La contrasena es incorrecta para el usuario $nombre"
   fi
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
     true
     ;;
     infosis)
     infosis
     true
     ;;
     ahorcado)
     juego
     true
     ;;
     mp3)
     mp3
     true
     ;;
     buscar)
     buscar
     true
     ;;
     ayuda)
     ayuda
     true
     ;;
     clear)
     clear
     true
     ;;
     salir)
     exit 0
     ;;

     *)
     echo Comando no valido
esac
done