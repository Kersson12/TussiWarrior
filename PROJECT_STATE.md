# 🧠 PROJECT STATE: TussiWarrior (Agnóstico & 100% Autónomo)

Este archivo es la "Fuente de la Verdad" para el **Bucle de Viralidad Autónomo**.

---

## 🛡️ Reglas de Oro de los Agentes (Mandato Oficial)
Cualquier agente (Diker-Bot o Miguel-Bot) **DEBE** seguir este protocolo:
1.  **PULL:** Sincronizar antes de cualquier acción.
2.  **READ:** Leer este estado antes de actuar.
3.  **EXECUTE:** Realizar la tarea autónoma.
4.  **UPDATE:** Documentar avance aquí.
5.  **AUTO-PUSH:** Subir cambios a GitHub **automáticamente** al finalizar la tarea.

---

## 🏗️ Arquitectura del Bucle Autónomo (The Loop) con n8n + Telegram

El proyecto adopta **n8n** como motor de orquestación y **Telegram** como interfaz de usuario/notificaciones.

### 🔄 Fase 1: Ingesta Automática (The Hunter via n8n)
- **Orquestador:** n8n.
- **Acción:** Workflow en n8n que hace scraping (ej. usando Apify API) de TikTok & Reels.
- **Notificación:** Envía un mensaje a un grupo privado de Telegram con los 5 mejores productos del día para que Diker/Miguel los aprueben con un botón.
- [ ] Crear flujo base en n8n.
- [ ] Configurar Bot de Telegram y conectarlo a n8n.

### 📝 Fase 2: Brainstorming de Contenido (The Creative Workflow)
- **Trigger:** Aprobación de producto mediante botón en Telegram.
- **Acción:** n8n llama a la API de IA (Claude/Gemini) para generar guiones virales.
- **Salida:** Envía los guiones de vuelta al grupo de Telegram.

### 🛒 Fase 3: E-commerce Bridge (The Store Workflow)
- **Acción:** n8n inyecta el producto aprobado directamente en Shopify/WooCommerce mediante su API.

### 💬 Fase 4: Social Closer (The Engagement Workflow)
- **Acción:** n8n monitorea comentarios en RRSS y gestiona DMs.

---

## 📅 Log de Automatización de Agentes
- [2026-03-29] **Sync Agent:** Configuración de GitHub + Apify MCP exitosa. 
- [2026-03-29] **Global Sync:** Se implementa la regla de **Auto-Push** obligatoria.
- [2026-03-29] **Pivot de Arquitectura:** Integración de **n8n + Telegram** como "Centro de Comando" de todas las automatizaciones.
- [2026-03-29] **Miguel-Bot:** Workflow de Creative Studio actualizado e inyectado con el contexto de Nicho Oro (Joyería). Fase 2 lista.
