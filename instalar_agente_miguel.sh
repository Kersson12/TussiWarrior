#!/bin/bash

# 🤖 TussiWarrior Agent Installer (Para Miguel)
# Este script clona la configuración de sincronización de Diker en tu agente.

echo "🚀 Configurando tu Agente Colaborativo..."

read -p "Introduce tu GitHub Personal Access Token (PAT): " MIGUEL_TOKEN

# Ruta estándar del archivo de configuración del agente (Claude Desktop / Antigravity)
# Nota: Esta ruta puede variar según el OS, pero es la estándar de nuestro entorno.
MCP_PATH="$HOME/.gemini/antigravity/mcp_config.json"

if [ ! -f "$MCP_PATH" ]; then
    mkdir -p "$(dirname "$MCP_PATH")"
    echo "{}" > "$MCP_PATH"
fi

# Actualizamos el JSON con el servidor de GitHub
# Usamos un script temporal de Python para asegurar un JSON válido
python3 -c "
import json, os
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

with open('$MCP_PATH', 'w') as f:
    json.dump(config, f, indent=2)
"

echo "✅ ¡Configuración completada! Tu agente ya tiene los mismos 'brazos' que el de Diker para gestionar el repositorio."
echo "🔄 Ahora puedes usar './sync.sh' para manteneros sincronizados."
