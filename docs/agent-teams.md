# Agent Teams — Paralelismo con subagentes

## Qué son

Agent Teams permiten que varios subagentes trabajen **en paralelo** en sesiones separadas con git worktrees aislados. A diferencia de los subagentes normales (secuenciales), los Agent Teams se coordinan entre sí.

## Cuándo usar

Solo cuando hay **paralelismo genuino**: tareas independientes que no dependen una de otra.

Ejemplo: @piccolo crea las tablas MIENTRAS @vegeta construye los componentes de UI.

## Cuándo NO usar

- Cuando una tarea depende del resultado de otra
- Para tareas simples que Bulma puede hacer directamente
- Si no estás seguro, usa subagentes normales (secuenciales)

## Coste

Agent Teams consumen **7x más tokens** que sesiones single-agent. Usar solo cuando el ahorro de tiempo justifica el coste.

## Aislamiento (worktree)

Cada subagente tiene `isolation: worktree` en su frontmatter. Cuando se activan Agent Teams, cada uno trabaja en su propio worktree git, eliminando conflictos de archivos.

## Cómo funciona

Bulma (lead) propondrá Agent Teams si detecta paralelismo. **Siempre espera tu aprobación** antes de lanzarlos.

La propuesta incluirá:
- Nº de teammates (recomendado: 2-3, máximo 4)
- File ownership de cada teammate (archivos exclusivos, sin solapamiento)
- Modelo: Sonnet 4.6 [1m] para todos

## Regla de oro

Cada teammate debe tener archivos exclusivos. Dos teammates editando el mismo archivo = sobrescrituras y conflictos.
