# 🤖 Manual de Operaciones: Gestión de Workflows n8n (Agentes)

Este documento contiene las directrices de cómo el **Agente Diker** y el **Agente Miguel** interactuarán con la instancia de n8n alojada en AWS para diseñar, analizar, editar y desplegar automatizaciones.

---

## 🏗️ Nuestro Rol: Arquitectos n8n
Somos agentes potenciados por el **n8n-mcp server** y las **n8n-skills**. Nuestra misión es crear flujos de trabajo de producción perfectos, sin necesidad de que el equipo humano toque la interfaz visual a menos que sea estrictamente necesario.

El servidor n8n en AWS está conectado y nosotros (los agentes) tenemos acceso completo a:
- 📚 1,396 nodos de automatización.
- ⚙️ Lectura, edición y creación de *Workflows* en vivo.
- 🚦 Ejecución y monitoreo de tareas.

---

## 🛠️ Cómo Operamos (Directrices de Skills)

Basado en las **`n8n-skills`** que hemos interiorizado, este es nuestro modo de trabajo al recibir una orden del equipo:

### 1. Búsqueda y Validación Previa (Silenciosa)
Antes de construir nada, utilizaremos el MCP en segundo plano (en paralelo) para:
*   **Buscar Plantillas:** Consultaremos la base de datos de 2,700+ plantillas (`search_templates`) por si el flujo (ej: *"TikTok to Telegram"*) ya existe.
*   **Inspeccionar Nodos:** Extremos los esquemas exactos de los nodos necesarios (`search_nodes` + `get_node(mode='full')`).

### 2. Configuración sin "Valores por Defecto"
**Regla de Seguridad Extrema:** Nunca confiaremos en los valores por defecto. Si configuramos un nodo de Telegram o HTTP, estableceremos **todos** los parámetros explícitamente para evitar fallos en AWS de los que es difícil depurar el origen. 

### 3. El Patrón de Edición de Flujos (Incremental)
El agente gestiona el código de tus flujos. Cuando pidas un cambio, no reemplazaremos todo el workflow de golpe (es peligroso). 
*   Utilizaremos el comando `n8n_update_partial_workflow`.
*   Esto nos permite editar nodos individuales (`updateNode`), añadir conexiones (`addConnection`) y arreglar fallos aislados sin borrar el trabajo de los demás.

### 4. Flujo de Trabajo con el Equipo (Diker & Miguel)
1. **Petición del Usuario:** *"Crea un workflow de n8n que escuche Telegram."*
2. **Generación Local:** Generamos el modelo del Workflow (JSON base estructurado).
3. **Validación:** Usamos nuestras herramientas (`validate_node`, `validate_workflow`) para asegurar que no hay errores de sintaxis o expresiones `{{ $json.data }}` mal hechas.
4. **Despliegue a AWS:** Una vez validado por nosotros (o previa autorización tuya), usamos `n8n_create_workflow` para **inyectar** el workflow terminado directamente en tu instancia de AWS.

---

## ⚠️ Protocolo de Seguridad (Producción AWS)
Dado que la instancia está viva en la nube:
1.  **Workflows de Prueba Primero:** Todo nuevo workflow se inyectará **desactivado**.
2.  **Activación Manual:** Tú o Miguel entraréis a vuestro panel de EASypanel/n8n para revisarlo visualmente y activarlo (`Active: True`).
3.  **Logs de Ejecución:** Si un flujo falla en AWS, puedes pedirnos: *"Agente, revisa por qué el workflow ID 123 ha fallado"*, y leeremos los logs directamente.

---

## 🚀 Cómo pedirnos cosas
A partir de hoy, solo tienes que decir comandos como:
*   *"Agente, constrúyeme el nodo HTTP para conectar TikTok con mi flujo #24."*
*   *"Analiza el workflow ID 45 y dime por qué el nodo IF no pasa a 'true'."*
*   *"Crea un flujo desde cero que escanee la API de Telegram y mándalo a AWS."*
