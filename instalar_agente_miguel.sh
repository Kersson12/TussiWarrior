#!/bin/bash

# 🤖 TussiWarrior Agent Installer (Para Miguel)
# Este script clona la configuración de sincronización de Diker en tu agente (Incluyendo GitHub, Apify y n8n).

echo "🚀 Configurando tu Agente Colaborativo..."

read -p "Introduce tu GitHub Personal Access Token (PAT): " MIGUEL_TOKEN
read -p "Introduce el API Token de Apify de la cuenta de TussiWarrior: " APIFY_TOKEN
read -p "Introduce tu API Key de n8n (AWS): " N8N_TOKEN

# Ruta estándar del archivo de configuración del agente (Claude Desktop / Antigravity)
MCP_PATH="$HOME/.gemini/antigravity/mcp_config.json"

if [ ! -f "$MCP_PATH" ]; then
    mkdir -p "$(dirname "$MCP_PATH")"
    echo "{}" > "$MCP_PATH"
fi

# Actualizamos el JSON con el servidor de GitHub, Apify (cargando los actores explícitamente) y n8n
python3 -c "
import json
with open('$MCP_PATH', 'r') as f:
    config = json.load(f)

if 'mcpServers' not in config:
    config['mcpServers'] = {}

config['mcpServers']['github'] = {
    'command': 'npx',
    'args': ['-y', '@modelcontextprotocol/server-github'],
    'env': {
        'GITHUB_PERSONAL_ACCESS_TOKEN': '$MIGUEL_TOKEN'
    }
}

config['mcpServers']['actors-mcp-server'] = {
    'command': 'npx',
    'args': [
        '-y', 
        '@apify/actors-mcp-server@latest', 
        '--actors', 
        'clockworks/tiktok-scraper,apify/instagram-scraper,apify/rag-web-browser'
    ],
    'env': {
        'APIFY_TOKEN': '$APIFY_TOKEN'
    }
}

config['mcpServers']['n8n-mcp'] = {
    'command': 'npx',
    'args': ['-y', 'n8n-mcp'],
    'env': {
        'MCP_MODE': 'stdio',
        'LOG_LEVEL': 'error',
        'DISABLE_CONSOLE_OUTPUT': 'true',
        'N8N_API_URL': 'https://n8n-n8n.bmk6bx.easypanel.host',
        'N8N_API_KEY': '$N8N_TOKEN'
    }
}

with open('$MCP_PATH', 'w') as f:
    json.dump(config, f, indent=2)
"

echo "✅ ¡Configuración completada! Tu agente ya tiene los 3 motores principales (GitHub, Apify con Actores precargados, y n8n)."
echo "🔄 Recuerda hacer './sync.sh' todas las mañanas."
