#!/bin/bash
function mp3(){
	# Colores de  terminal
	nazul="\e[1;33m"
	original="\e[0m"
	nblanco="\e[1;37m"
	
	bnegro="\e[1;40m"
	

	# Es verifica si está instalada dicha dependencia (mpg123) si no lo está, instala
	#
	paquete=$(man mpg123 | grep mpg123) #man=manual de usuario/man se envia a grep para buscar. busca info y almacena en paquete
	if [ -z "$paquete" ]
	then  
	    echo -e "${nazul} No se encuentra el paquete mpg123 que ejecuta el mp3;¿Desea instalarlo? s/n: ${nazul}"
	    read as
	    if [ "$as" = "s" ]
	    then
	        sudo apt install mpg123
	    else
	        echo -e "${nazul}El programa no tiene como ejecutarse :(${nazul}"
	        exit
	    fi
	fi
	

	#Codigo del reproductor
	printf "${nblanco}"
	echo -e "${bnegro}------------------------------------------------${bnegro}
	${bnegro}|                                              |${bnegro}
	${bnegro}|             Bienvenido al MP3                |${bnegro}
	${bnegro}|                                              |${bnegro}
	${bnegro}------------------------------------------------${bnegro}"
	printf "${original}" # restaurar el color del texto al original  de la terminal.
	

    #Avisa y cambia el directorio actual del usuario 
	#a la carpeta "Música" en su directorio de inicio.
	#variable donde estara el directorio con los archivos mpg
	echo -e "${nazul}Tus archivos mp3 deberan estar almacenados en 
	la carpeta Música del usuario${namarillo}"
	cd ~/Música #cambia de directorio "~" represnta directorio de inicio


	while [ "$ac" != "0" ]
	do
	    printf "${nazul}"
	

	    echo -e "${bnegro}-------------------------------------------${bnegro}
	${bnegro}|      ${nblanco}¿Que quieres hacer?${nazul}               |${bnegro}
	${bnegro}-------------------------------------------${bnegro}
	${bnegro}|      1) Reproducir todas las canciones  |${bnegro}
	${bnegro}|      2) Reproducir una cancion          |${bnegro}
	${bnegro}|      0) Salir                           |${bnegro}
	${bnegro}-------------------------------------------${bnegro}"
	    printf "${nblanco}"
	

	    read ac
	

	    case $ac in
	        0) 
	            echo ""
	            echo -e "Chafaaa, no quieres endulzar tu odio con buena musica"
	            printf "${original}"
	            clear
	            ;;
	        1)  
	            printf "${namarillo}"
	            echo -e "${bnegro}---------------------${bnegro}"
	            echo -e "${bnegro}|  ${nblanco}¿En que modo?${nazul}    |${bnegro}"
	            echo -e "${bnegro}---------------------${bnegro}"
	            echo -e "${bnegro}|  1) Lineal        |${bnegro}"
	            echo -e "${bnegro}|  2) shuffle       |${bnegro}"
	            echo -e "${bnegro}---------------------${bnegro}"
	            printf "${nblanco}"
	            read op2
	            case $op2 in
	

	                1)
	                    clear
	                    printf "${namarillo}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|         ${nblanco}ACCIONES${nazul}                    |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|       S) Pausar/Reanudar                        |${bnegro}"
	                    echo -e "${bnegro}|       F) Siguiente cancion                      |${bnegro}"
	                    echo -e "${bnegro}|       D) Cancion anterior                       |${bnegro}"
	                    echo -e "${bnegro}|       B) Reanudar cancion                       |${bnegro}"
	                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       U) Mute                                   |${bnegro}"
	                    echo -e "${bnegro}|       L) Canciones disponibles                  |${bnegro}" 
	                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    mpg123 -C --title -q *.mp3 &
						#-C: mp3 controlado por comandos en la línea de comandos/controlan la reproducción.
						#--title: muestra el título de la canción actual en reproducción.
						#-q: en el reproductor de audio no se muestran mensajes extras.
	                    clear
	                    ;;
	                2)
	                    clear
	                    printf "${namarillo}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|         ${nblanco}COMANDOS DISPONIBLES${nazul}                    |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|       S) Pausar/Reanudar                        |${bnegro}"
	                    echo -e "${bnegro}|       F) Siguiente                              |${bnegro}"
	                    echo -e "${bnegro}|       D) Regresar                               |${bnegro}"
	                    echo -e "${bnegro}|       B) Reanudar                               |${bnegro}"
	                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       U) Mute                                   |${bnegro}"
	                    echo -e "${bnegro}|       L) Canciones disponibles                  |${bnegro}" 
	                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    mpg123 -C --title -q -z *.mp3 
						#-z:habilita la reproducción en modo shuffle de los archivos MP3.
	                    clear
	                    ;;
	                *)
	                    clear
	                    echo -e "No existe el modo"
	                    ;;
	                esac
	            ;;
	        2)  
	            printf "${namarillo}"
	            echo -e "${bnegro}---------------------------------------------------${bnegro}"
	            echo -e "${bnegro}|         ${nblanco}CANCIONES DISPONIBLES${namarillo}                   |${bnegro}"
	            echo -e "${bnegro}---------------------------------------------------${bnegro}"
	            echo "$(ls -1)"
	            echo -e "${bnegro}---------------------------------------------------${bnegro}"
	            echo "Indica el nombre y formato del archivo de musica por ejemplo : Hotel.mp3:"
	            read cancion
	            (printf "${namarillo}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|         ${nazul}COMANDOS DISPONIBLES${nazul}                    |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    echo -e "${bnegro}|       S) Pausar                                 |${bnegro}"
	                    echo -e "${bnegro}|       B) Reiniciar                              |${bnegro}"
	                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
	                    echo -e "${bnegro}|       U) MUTE                                   |${bnegro}" 
	                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
	                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
	                    mpg123 -C --title -q $cancion && clear) || (clear && echo -e "Esa cancion no la topo :(")
						#$cancion: variable, &&: si el comando se ejectuta correctamente se realiza el clear
	            ;;
	        *)  
	            clear
	            echo -e "No es opcion valida"
	            ;;
	    esac
	done

}