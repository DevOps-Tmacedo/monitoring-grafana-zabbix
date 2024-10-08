#!/bin/bash

# Verificar se o Docker e o Docker Compose estão instalados
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado. Por favor, instale o Docker primeiro."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não está instalado. Por favor, instale o Docker Compose primeiro."
    exit 1
fi

# Criar rede do Docker
echo "Criando rede do Docker..."
docker network create monitoring || { echo "Falha ao criar a rede"; exit 1; }

# Subir o Zabbix Server
echo "Subindo o Zabbix Server..."
docker-compose up -d || { echo "Falha ao iniciar o Zabbix"; exit 1; }

echo "Zabbix Server iniciado com sucesso!"

