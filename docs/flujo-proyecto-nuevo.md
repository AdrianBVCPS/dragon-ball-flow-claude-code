# Capsule Corp Flow — Guía paso a paso

## La idea

Tú eres el director. Claude Code es tu equipo. Tú dices QUÉ construir, ellos deciden CÓMO.

## El equipo Z Warriors

Bulma (Opus) planifica y delega. 5 subagentes (Sonnet) ejecutan:

| Agente | Rol | Color | Archivos exclusivos | Debugging |
|--------|-----|-------|---------------------|-----------|
| **@goku** | Backend | 🟠 | src/app/api/**, src/lib/**, middleware | ✅ servidor |
| **@vegeta** | Frontend | 🔵 | src/components/**, src/app/**/*.tsx | ✅ UI |
| **@piccolo** | BD | 🟢 | supabase/**, src/lib/supabase/** | ✅ datos |
| **@trunks** | NEXO | 🟣 | __tests__/**, docs/**, tools/**, config | ❌ |
| **@whis** | Auditor | ⚪ | cualquiera (solo lectura, background) | ❌ |

**¿Cómo ahorra?** opusplan: Opus piensa, Sonnet ejecuta (~68% ahorro). Cada subagente tiene su nivel de esfuerzo ajustado. Whis corre en background sin bloquear. Los hooks formatean automáticamente.

## Antes de empezar

1. **docs/PRD.md** — Qué quieres construir, funcionalidades, restricciones
2. **docs/diseno-ui-ux.md** (opcional) — Referencias visuales, bocetos

Copia la plantilla Capsule Corp Flow a la raíz de tu proyecto.

## Los 3 prompts de arranque

Ver `promptfirst.md` para los textos exactos:
1. **Contexto** → Claude lee docs, identifica tipo
2. **Estructura** → Claude propone skills/rules/CLAUDE.md anidados → apruebas
3. **Plan** → Claude presenta fases con subagentes asignados → apruebas

## Invocar subagentes

**Automático:** Bulma decide cuándo delegar según la tarea.
**Directo:** Escribe `@nombre` en el prompt:

```
@goku arregla el endpoint de login
@vegeta el botón no responde en móvil
@piccolo la query tarda 3 segundos
@trunks escribe tests para turnos
@whis audita antes del commit
```

### Reglas de delegación de Bulma

- **Tarea simple** (<3 archivos, <50 líneas): Bulma directa, NO delega
- **Un dominio** (>50 líneas): delega al subagente del dominio
- **Cross-domain** (>3 archivos): planifica → delega secuencialmente
- **Exploración**: usa Explore interno (gratis)
- **Pre-commit >100 líneas**: invoca a @whis (background)

### Whis — auditor en background

Whis corre en paralelo (`background: true`). Mientras Goku o Vegeta implementan, Whis puede estar revisando el código anterior. Produce un reporte con confianza X/100. Consulta REVIEW.md para las reglas.

### Memoria persistente por subagente

Cada subagente acumula aprendizajes en `.claude/agent-memory/`:
- **@piccolo** recuerda patrones de BD, queries optimizadas
- **@vegeta** recuerda decisiones de diseño, componentes reutilizables
- **@goku** recuerda patrones de API, auth flows
- **@trunks** recuerda configuraciones de proyecto, scripts útiles
- **@whis** recuerda issues recurrentes, falsos positivos

### Worktree isolation

Cuando se activan Agent Teams, cada subagente trabaja en su propio git worktree (`isolation: worktree`). Esto elimina conflictos de archivos cuando varios subagentes trabajan en paralelo.

## El ciclo de cada fase

```
1. "Empieza la Fase [N]: [nombre]"
   ↓
2. Bulma planifica → delega a subagentes → tú pruebas
   ↓
3. "Fase [N] terminada. Escribe resumen en docs/progreso-fase-N.md
    y guarda en memoria"
   ↓
4. /dream (si disponible) → consolida memoria
   ↓
5. /clear
   ↓
6. "Retomo. Lee docs/progreso-fase-[N].md y MEMORY.md.
    Empieza la Fase [N+1]"
```

### /dream — Consolida memoria entre fases

Limpia MEMORY.md: convierte fechas relativas a absolutas, elimina contradicciones, fusiona duplicados. Verifica con `/memory` si Auto-dream está disponible.

### /compact con foco al 50%

```
/compact focus on [la tarea actual]
```

La sección "Compact Instructions" del claude.md sobrevive siempre.

### Hooks automáticos

El settings.json incluye hooks condicionales:
- **PostToolUse Write(src/**)**: auto-formatea con Prettier al escribir en src/
- **PostToolUse Edit(src/**)**: auto-formatea con Prettier al editar en src/
- Solo actúa en src/**, no en docs/, config ni tests

### Si algo se rompe

```
Eso no funciona. Arréglalo.
```

Bulma derivará: error 500 → @goku · UI rota → @vegeta · datos incorrectos → @piccolo

## Ejemplo completo

```
── PROMPT 1-2-3: Setup y plan ─────────────────────
   → Aprobado → /clear

── FASE 1: Base de datos y auth ───────────────────
   Bulma → @piccolo: tablas, RLS
          → @goku: auth, middleware
          → @whis: auditoría (background)
   Commits... → Resumen + memoria → /dream → /clear

── FASE 2: Frontend ───────────────────────────────
   "Retomo. Lee progreso-fase-1.md"
   Bulma → @vegeta: componentes, páginas
          → @trunks: tests de componentes
          → @whis: auditoría (background)
   Commits... → Resumen + memoria → /dream → /clear

── FASE 3: Lógica + integración ───────────────────
   "Retomo. Lee progreso-fase-2.md"
   Bulma → @goku: endpoints + @vegeta: conexión API
          → @whis: auditoría completa
   → Resumen + memoria → /dream → /clear

── FASE FINAL ─────────────────────────────────────
   → @whis: auditoría final (confianza ≥ 80)
   → Corregir CRÍTICO y ADVERTENCIA
   → @trunks: checklist de deploy
   → /desplegar → producción
```

## Referencia rápida

| Feature | Impacto |
|---------|---------|
| opusplan | ~68% ahorro vs all-Opus |
| @mention de subagentes | Invocación directa sin pasar por Bulma |
| effort (low/medium/high) | Razonamiento ajustado por subagente |
| background (Whis) | Audita en paralelo sin bloquear |
| memory persistente | Cada subagente recuerda entre sesiones |
| isolation: worktree | Sin conflictos en Agent Teams |
| color por subagente | Identificación visual instantánea |
| hooks condicionales (if) | Prettier solo en src/** |
| REVIEW.md | Reglas de revisión separadas |
| .claudeignore | Excluye node_modules y pesados |
| Compact Instructions | Sobrevive siempre a /compact |
| /dream | Memoria limpia entre fases |
| /powerup | Lecciones interactivas de Claude Code |
