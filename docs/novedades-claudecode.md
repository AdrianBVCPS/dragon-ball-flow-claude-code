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

### 2. Ultraplan — planificación en la nube
- **Fuente:** [Enabling Claude Code to work more autonomously](https://www.anthropic.com/news/enabling-claude-code-to-work-more-autonomously)
- **Qué es:** `/plan` crea un plan en la nube que puedes revisar y comentar en el editor web de Anthropic, luego ejecutar remoto o local.
- **Impacto en el flujo:** El P3 ahora puede usar Ultraplan para proyectos complejos de más de 4 fases. El plan se puede revisar antes de ejecutar desde cualquier dispositivo.
- **Acción aplicada:** Mencionado en CLAUDE.md sección P3 y en README.

### 3. Checkpoints con rollback instantáneo
- **Fuente:** [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- **Qué es:** Claude Code guarda checkpoints automáticamente (o manualmente) y permite volver al estado anterior con un comando.
- **Impacto en el flujo:** Antes de cada cambio mayor entre subagentes, Bulma crea un checkpoint. Si Goku rompe algo, se puede revertir sin perder el trabajo de Vegeta.
- **Acción aplicada:** Añadida regla 6 en CLAUDE.md: "Usar checkpoints antes de cambios grandes".

### 4. `/monitor` — streaming de eventos en tiempo real
- **Fuente:** Release notes abril 2026
- **Qué es:** Streams los eventos de agentes en background directamente en la conversación.
- **Impacto en el flujo:** Puedes ver en tiempo real qué está haciendo Whis o Trunks sin interrumpirlos. Útil para debugging de builds largos.
- **Acción aplicada:** Añadida sección "Monitor de background" en CLAUDE.md.

### 5. `/autofix-pr` para @trunks
- **Fuente:** Release notes abril 2026
- **Qué es:** Activa la corrección automática de PRs con tests fallidos desde el terminal.
- **Impacto en el flujo:** @trunks puede activarlo en el ciclo de deploy para que los fallos de tests se corrijan automáticamente antes de hacer merge.
- **Acción aplicada:** Añadido a reglas universales en CLAUDE.md: "@trunks activa /autofix-pr en PRs con tests fallidos".

### 6. Claude Sonnet 4.6 como modelo por defecto actualizado
- **Fuente:** [Introducing Claude Sonnet 4.6](https://www.anthropic.com/news/claude-sonnet-4-5)
- **Qué es:** Sonnet 4.6 es ahora el modelo de ejecución en Claude Code por defecto.
- **Impacto en el flujo:** Los 5 subagentes (Goku, Vegeta, Piccolo, Trunks, Whis) se actualizan de Sonnet 4.6 a Sonnet 4.6.
- **Acción aplicada:** Actualizado en CLAUDE.md y en la skill.

### 7. Plugins instalables con `/plugin`
- **Fuente:** [Claude Code Plugins](https://www.anthropic.com/news/claude-code-plugins)
- **Qué es:** Los plugins se instalan con `/plugin install nombre.skill` directamente desde el terminal.
- **Impacto en el flujo:** El P1 ahora puede instalar code-review y otros plugins con un solo comando.
- **Acción aplicada:** Mencionado en README sección de instalación.

### 8. `duration_ms` en hooks PostToolUse
- **Fuente:** [Claude Code Changelog](https://docs.anthropic.com/en/release-notes/claude-code)
- **Qué es:** Los inputs de hooks `PostToolUse` y `PostToolUseFailure` ahora incluyen `duration_ms` (tiempo de ejecución de la herramienta).
- **Impacto en el flujo:** Los hooks de Prettier pueden registrar cuánto tardaron y alertar si una operación es anormalmente lenta (posible señal de problemas).
- **Acción aplicada:** Pendiente de implementar en settings.json en próxima versión.

---

## Sin impacto en el flujo esta semana

- **/buddy** (lanzado 1 abril) — Criatura virtual que te observa mientras codeas. Entretenido pero no mejora el flujo.
- **Sandbox runtime (beta)** — Relevante para equipos con políticas de seguridad estrictas. No aplica al stack actual.
- **VS Code native extension** — Útil si Adrian usa VS Code en lugar de Claude Code CLI.

---

*Generado automáticamente el 29 de abril de 2026 · Dragon Ball Flow v8.0*
