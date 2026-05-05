# Novedades Claude Code — Semana del 5 de mayo de 2026

## Resumen ejecutivo

Claude Code incorporó `/ultrareview` (code review paralelo multi-agente en la nube), `/usage` para monitoreo de límites de contexto, y mejoras importantes en el sistema de hooks (duración de ejecución `duration_ms`, llamadas directas a herramientas MCP desde hooks, y opción `alwaysLoad` para MCP servers). Se actualiza el flujo de v8.1 a v8.2 y se regenera la skill.

## Novedades aplicadas

### 1. `/ultrareview` — Code review paralelo multi-agente en la nube
- **Fuente:** [Claude Code Changelog](https://code.claude.com/docs/en/changelog)
- **Qué es:** Ejecuta múltiples agentes revisores en paralelo sobre el código en la nube. Más rápido y exhaustivo que una sola pasada.
- **Impacto en el flujo:** Alternativa cloud a @whis para proyectos con cambios grandes. Complementa el flujo de revisión sin bloquear la sesión local.
- **Acción aplicada:** Regla 4 de Reglas universales actualizada en CLAUDE.md y SKILL.md. Añadido a sección Monitor.

### 2. `/usage` — Monitor de consumo de contexto
- **Fuente:** [Claude Code Changelog](https://code.claude.com/docs/en/changelog)
- **Qué es:** Muestra en tiempo real qué herramientas y contexto están consumiendo los límites del modelo.
- **Impacto en el flujo:** Útil para Adrian cuando la sesión crece mucho o detecta lentitud. Complementa `/monitor`.
- **Acción aplicada:** Añadido a sección "Monitor de background y uso" en CLAUDE.md y SKILL.md.

### 3. Hooks: `duration_ms` en PostToolUse
- **Fuente:** [Claude Code Changelog](https://code.claude.com/docs/en/changelog)
- **Qué es:** Los hooks PostToolUse ahora incluyen `duration_ms` (tiempo de ejecución de la herramienta, excluyendo prompts de permisos). Permite hooks de performance monitoring.
- **Impacto en el flujo:** Capacidad disponible para añadir métricas de rendimiento a hooks futuros. Sin cambio inmediato en settings.json.
- **Acción aplicada:** Documentado. No se modifica settings.json hasta que haya un caso de uso concreto.

### 4. Hooks: llamadas directas a herramientas MCP (`type: "mcp_tool"`)
- **Fuente:** [Claude Code Changelog](https://code.claude.com/docs/en/changelog)
- **Qué es:** Los hooks pueden invocar herramientas MCP directamente sin spawnar un proceso externo. Formato: `{ "type": "mcp_tool", ... }`.
- **Impacto en el flujo:** Cuando se integren MCPs (Slack, Supabase, etc.), los hooks podrán notificar o registrar eventos automáticamente.
- **Acción aplicada:** Documentado para uso futuro. Relevante cuando @trunks gestione deployments con MCPs.

### 5. `alwaysLoad` para MCP servers + auto-retry
- **Fuente:** [Claude Code Changelog](https://code.claude.com/docs/en/changelog)
- **Qué es:** Nueva opción `alwaysLoad: true` en la config de MCP servers para que sus herramientas siempre estén disponibles sin esperar tool-search. Además, MCP servers reintentan hasta 3 veces en errores de arranque transitorios.
- **Impacto en el flujo:** Para proyectos Tipo A con MCPs críticos (ej. Supabase MCP), activar `alwaysLoad` evita latencia en la primera llamada.
- **Acción aplicada:** Documentado. Aplicar en settings.json cuando se integren MCPs en proyectos concretos.

### 6. Claude Opus 4.7 GA (confirmado)
- **Fuente:** [Introducing Claude Opus 4.7](https://www.anthropic.com/news/claude-opus-4-7)
- **Qué es:** Opus 4.7 es GA desde el 16 de abril de 2026. Mejora significativa en agentic coding y visión de alta resolución. API string: `claude-opus-4-7`.
- **Impacto en el flujo:** El flujo ya usa Opus 4.7 como planificador (opusplan). Confirmado correcto.
- **Acción aplicada:** Sin cambios — ya estaba actualizado en v8.0.

---

*Generado el 2026-05-05 · Dragon Ball Flow v8.2 · Sonnet 4.6 ejecuta, Opus 4.7 planifica*

---

# Novedades Claude Code — Semana del 28 de abril de 2026

## Resumen ejecutivo

Claude Code incorporó en 2026 varias funcionalidades de alto impacto para el flujo: **Ultraplan** (planificación en la nube con editor web), **checkpoints** con rollback instantáneo, el nuevo nivel de esfuerzo `xhigh` en Opus 4.7, y `/monitor` para seguimiento en tiempo real de agentes en background. Todas aplicadas en la v8.0.

---

## Novedades aplicadas en esta actualización

### 1. Opus 4.7 + nivel de esfuerzo `xhigh`
- **Fuente:** [Releases Claude Code](https://github.com/anthropics/claude-code/releases)
- **Qué es:** Opus 4.7 introduce un nivel `xhigh` entre `high` y `max`. Permite razonamiento extendido para tareas críticas sin pagar el coste completo de `max`.
- **Impacto en el flujo:** Bulma puede usar `/effort xhigh` en auditorías de Whis, decisiones de arquitectura complejas y revisiones de seguridad. Actualizado en `CLAUDE.md`.
- **Acción aplicada:** Añadido al CLAUDE.md: `Usa /effort xhigh para tareas críticas con Opus 4.7`.

### 2. Ultraplan — planificac