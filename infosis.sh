#!/bin/bash

function infosis() {
  echo "Informacion de la computadora: "
  echo "Arquitectura del Sistema:"
  uname -m
  echo "Versión del Sistema Operativo:"
  uname -r
  echo "Memoria RAM:"
  free -h | grep -i mem | awk '{print $2}'
}
