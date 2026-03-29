#!/bin/bash

# 🚀 TussiWarrior Sync Script
# Este script mantiene a Diker y Miguel sincronizados automáticamente.

echo "🔄 Iniciando sincronización total..."

# 1. Traer cambios de los demás
git pull origin main --rebase

# 2. Añadir todos vuestros nuevos archivos y cambios
git add .

# 3. Crear un punto de guardado automático con la fecha
git commit -m "Sincronización automática de equipo: $(date +'%Y-%m-%d %H:%M:%S')"

# 4. Subir a la nube
git push origin main

echo "✅ ¡Todo sincronizado! Miguel ya puede ver tus cambios y tú los de él."
