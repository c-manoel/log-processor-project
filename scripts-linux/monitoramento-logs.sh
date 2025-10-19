#!/bin/bash

LOG_DIR="/home/carlosmanoel/Cml/alura/log-processor-project/myapp/logs"

echo "Verificando logs no diretorio $LOG_DIR"

find $LOG_DIR -name "*.log" -print0 | while IFS= read -r -d '' arquivo; do 
	grep "ERROR" $arquivo > "${arquivo}.filtrado"
       grep "SENSITIVE-DATA" $arquivo >> "${arquivo}.filtrado"

       sed -i 's/User password is .*/User password is REDACTED/g' "${arquivo}.filtrado"
       sed -i 's/User password reset request with token .*/User password reset request with token REDACTED/g' "${arquivo}.filtrado"
       sed -i 's/API key leaked: .*/API key leaked: REDACTED/g' "${arquivo}.filtrado"
       sed -i 's/User credit card last four digits: .*/User credit card last four digits: REDACTED/g' "${arquivo}.filtrado"
       sed -i 's/User session initiated with token: .*/User session initiated with token: REDACTED/g' "${arquivo}.filtrado"
done
