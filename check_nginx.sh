#!/bin/bash

# Diretório para os arquivos de log
LOG_DIR="/var/log/nginx_check" # Altere se necessário
mkdir -p "$LOG_DIR"

# Data e hora
DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")

# Nome do serviço
SERVICO="Nginx"

# Verifica o status do Nginx
if systemctl is-active --quiet nginx; then
  STATUS="ONLINE"
  MENSAGEM="Serviço Nginx está online."
  LOG_FILE="$LOG_DIR/nginx_online.log"
else
  STATUS="OFFLINE"
  MENSAGEM="Serviço Nginx está offline!"
  LOG_FILE="$LOG_DIR/nginx_offline.log"
fi

# Escreve no arquivo de log
echo "$DATA_HORA - $SERVICO - $STATUS - $MENSAGEM" >> "$LOG_FILE"

echo "$MENSAGEM" # Imprime a mensagem no console para feedback imediato (opcional)
