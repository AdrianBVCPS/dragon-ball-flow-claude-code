# Novedades Claude Code — Semana del 5 de mayo de 2026

## Resumen ejecutivo

Esta semana Claude Code lanzó dos versiones menores (2.1.126 y 2.1.128) con mejoras de calidad de vida: el nuevo comando `claude project purge` para limpiar estado de proyectos, una corrección crítica en worktrees que preserva commits no pusheados, y soporte para distribuir skills como archivos `.zip`. Cambios conservadores aplicados en la v8.2.

---

## Novedades aplicadas

### 1. `claude project purge` — limpieza de estado de proyectos
- **Fuente:** [Claude Code Changelog v2.1.126](https://code.claude.com/docs/en/changelog)
- **Qué es:** Nuevo comando que elimina todo el estado Claude de un proyecto: transcripts, tasks, historial de archivos y entrada de config. Soporta `--dry-run`, `--interactive` y `--all`.
- **Impacto en el flujo:** Útil para resetear el contexto de un proyecto sin borrar el código. Especialmente útil entre fases largas donde los transcripts acumulan ruido.
- **Acción aplicada:** Añadido a nueva sección "Utilidades de mantenimiento" en CLAUDE.md y SKILL.md.

### 2. `EnterWorktree` crea branch desde HEAD local
- **Fuente:** [Claude Code Changelog v2.1.128](https://code.claude.com/docs/en/changelog)
- **Qué es:** Corrección crítica: `EnterWorktree` (modo isolation de subagentes) ahora crea la nueva branch desde el HEAD local en lugar de `origin/<default-branch>`. Los commits no pusheados ya no se pierden al entrar en un worktree.
- **Impacto en el flujo:** Cuando @trunks o @goku usan isolation con `worktree`, el trabajo no confirmado del desarrollador ya no se descarta silenciosamente. Mayor seguridad en flujos de branches.
- **Acción aplicada:** Añadido en sección "Utilidades de mantenimiento" en CLAUDE.md y SKILL.md.

### 3. `--plugin-dir` acepta archivos `.zip`
- **Fuente:** [Claude Code Changelog v2.1.128](https://code.claude.com/docs/en/changelog)
- **Qué es:** El flag `--plugin-dir` ahora acepta directamente archivos `.zip` además de directorios. Simplifica la distribución de plugins/skills empaquetados.
- **Impacto en el flujo:** El archivo `capsule-corp-flow.skill` (que es un zip) puede ahora cargarse directamente con `--plugin-dir capsule-corp-flow.skill` sin descomprimir. Facilita la distribución.
- **Acción aplicada:** Documentado en CLAUDE.md y SKILL.md.

### 4. Fix: deferred tools disponibles en skills `context: fork`
- **Fuente:** [Claude Code Changelog v2.1.126](https://code.claude.com/docs/en/changelog)
- **Qué es:** Corrección de bug: las herramientas deferred (WebSearch, WebFetch, etc.) no estaban disponibles para skills con `context: fork` y subagentes en su primer turno.
- **Impacto en el flujo:** Whis y otros subagentes que usen skills forkeadas ahora tienen acceso completo a todas las herramientas desde el primer turno, sin fallos silenciosos.
- **Acción aplicada:** Solo documentado — no requiere cambios en CLAUDE.md.

---

## Modelos — sin cambios esta semana

Los modelos activos del flujo siguen siendo:
- **Planificación (Bulma):** Opus 4.7 vía `opusplan`
- **Ejecución (Z Warriors):** Sonnet 4.6 [1m]

Nota: Se detectó la existencia del modelo experimental **Mythos** (Anthropic) en fase de acceso limitado por capacidades de ciberseguridad avanzadas. No disponible públicamente. Sin impacto en el flujo actual.

---

*Generado automáticamente el 5 de mayo de 2026 · Dragon Ball Flow v8.2 · Sonnet 4.6 ejecuta, Opus 4.7 planifica*

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
