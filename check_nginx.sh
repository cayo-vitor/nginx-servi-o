#!/bin/bash

# Caminhos dos arquivos de log
LOG_ONLINE="./log_online.txt"
LOG_OFFLINE="./log_offline.txt"

# verificar se os arquivos de log existem, se não cria -os
touch "$LOG_ONLINE" "$LOG_OFFLINE"

# Verifica o status do serviço Nginx
if systemctl is-active --quiet nginx; then
    # Serviço está ativo
    echo "$(date): Nginx está ONLINE." >> "$LOG_ONLINE"
    echo "Nginx está funcionando normalmente."
else
    # Serviço está inativo
    echo "$(date): Nginx está OFFLINE." >> "$LOG_OFFLINE"
    echo "Nginx não está funcionando."
fi
