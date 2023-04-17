#!/bin/bash

function buscar() {
  if [ $# -ne 2 ]; then
    echo "Para hacer uso del comando buscar:"
    echo  "buscar <directorio> <archivo>"
    return
  fi
  find $1 -type f -name $2 2>/dev/null
}