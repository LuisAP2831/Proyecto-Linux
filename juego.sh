#!/bin/bash
function juego(){
#variables para que funcione el juego
palabra_secreta="manzana"

letras_adivinadas=()

intentos_maximos=5

palabra_mostrada=$(echo "$palabra_secreta" | sed 's/./_/g')
intentos_restantes=$intentos_maximos

#_________________________________________________________________________________________________________________
#Interfaz del juego
interfaz() {
  echo "Palabra: $palabra_mostrada"
  echo "Letras adivinadas: ${letras_adivinadas[*]}"
  echo "Intentos restantes: $intentos_restantes/$intentos_maximos"
}

verificar_victoria() {
  if [[ "$palabra_mostrada" == "$palabra_secreta" ]]; then
    echo "$palabra_secreta"
    echo "¡FELICIDADES GANASTE!"
    juego_terminado=true
  fi
}

#_________________________________________________________________________________________________________________
#Loop y presentacion
echo "Bienvenido al juego del Ahorcado"
echo "Adivina la palabra secreta"

juego_terminado=false

while [ $juego_terminado = false ]; do
  clear
  interfaz

  echo -n "Ingresa una letra: "
  read letra

  if [[ ! "$letra" =~ ^[a-zA-Z]$ ]]; then
    echo "caracter no valido"
    continue
  fi

  if [[ "${letras_adivinadas[*]}" == *"$letra"* ]]; then
    echo "Letra repetida "
    continue
  fi

  if [[ "$palabra_secreta" == *"$letra"* ]]; then
    letras_adivinadas+=("$letra")
    palabra_mostrada=$(echo "$palabra_secreta" | sed "s/[^${letras_adivinadas[*]}]/_/g")
    verificar_victoria
  else
    intentos_restantes=$((intentos_restantes - 1))
  fi

  if [ "$intentos_restantes" -eq 0 ]; then
    echo "Perdiste :("
    echo "La palabra secreta era: $palabra_secreta"
    juego_terminado=true
  fi
done

}
