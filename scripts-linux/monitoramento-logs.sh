#!/bin/bash

LOG_DIR="/home/carlosmanoel/Cml/alura/log-processor-project/myapp/logs"

echo "Verificando logs no diretorio $LOG_DIR"

find $LOG_DIR -name "*.log" -print0 | while IFS= read -r -d '' arquivo; do 
	echo "ARQUIVO ENCONTRADO $arquivo" 
done
