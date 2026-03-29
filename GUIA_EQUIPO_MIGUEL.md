# 🚀 Guía de Sincronización para Miguel (TussiWarrior)

¡Hola Miguel! Este proyecto de Dropshipping Orgánico se va a gestionar mediante **Agentes de IA** para que nuestro equipo sea 10 veces más rápido que cualquier otro.

Aquí tienes los pasos para que tú y Diker estéis sincronizados al segundo:

---

### 1. ⚙️ Instalación de Git y GitHub
Lo primero es que tengas acceso al repositorio privado que ha creado Diker.
*   Pídele a Diker que te añada como **Colaborador** (Diker debe ir al Repo -> Settings -> Collaborators).
*   Haz el clon del proyecto en tu máquina local:
    ```bash
    git clone https://github.com/[Usuario_Diker]/TussiWarrior.git
    ```

### 2. 🤖 El "Agente Sincronizador"
Hemos configurado un servidor **MCP (GitHub)** para que nuestro agente (IA) se encargue de coordinar nuestras tareas.
*   **No te preocupes por los conflictos de código:** Si tú y Diker trabajáis en lo mismo, el agente nos avisará y nos propondrá cómo mezclar las ideas.
*   **Usa Ramas:** Trabaja siempre en una rama con tu nombre:
    ```bash
    git checkout -b miguel-dev
    ```

### 3. 📂 Estructura del Proyecto Sincronizado
Todo lo que hagamos (agentes de TikTok, guiones virales, listas de productos) lo subiremos a la carpeta principal. 
- Puedes leer el plan de ataque aquí: `dropshipping_organico_agentes.md`

---

### 🗝️ Configuración de tu Agente (Para Miguel)
Para que el agente también trabaje por ti, deberías añadir esto a tu configuración local de MCP en tu sistema:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "TÚ_PROPIO_TOKEN_AQUÍ"
      }
    }
  }
}
```

---

### 📩 Resumen de hoy
- Diker ya ha configurado los cimientos del proyecto.
- Tenemos un plan para automatizar la búsqueda de productos ganadores.
- **Tu misión:** Revisar el plan en `dropshipping_organico_agentes.md` y decirnos qué piensas.

¡Vamos a por ello! 🚀
