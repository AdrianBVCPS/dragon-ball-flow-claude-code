# Capsule Corp Flow — Instrucciones para el vibe coder

## Qué es esto

Un sistema de archivos que configura Claude Code con un equipo de 5 agentes IA especializados (con nombres de Dragon Ball) para construir aplicaciones web completas. Tú diseñas, ellos construyen.

## Tu equipo

| Agente | Personaje | Color | Qué hace |
|--------|-----------|-------|----------|
| **Bulma** | Líder (Opus) | — | Planifica, delega, orquesta. No programa. |
| **@goku** | Backend (Sonnet) | 🟠 | API, auth, lógica servidor, debugging servidor |
| **@vegeta** | Frontend (Sonnet) | 🔵 | Componentes, UI, estilos, debugging visual |
| **@piccolo** | BD (Sonnet) | 🟢 | Tablas, migraciones, RLS, debugging BD |
| **@trunks** | NEXO (Sonnet) | 🟣 | Tests, config, docs, deploy |
| **@whis** | Auditor (Sonnet) | ⚪ | Revisa calidad y seguridad (background) |

### Invocar subagentes directamente

Puedes escribir `@nombre` en el prompt para invocar un subagente sin pasar por Bulma:

```
@goku arregla el endpoint de login
@vegeta el botón de submit no responde en móvil
@piccolo la query de empleados tarda 3 segundos
@whis revisa todo antes de hacer commit
```

Claude Code autocompleta los nombres al escribir `@`.

## Qué preparas TÚ antes de abrir Claude Code

1. **PRD.md** — Describe qué quieres construir, para quién, qué funcionalidades
2. **diseno-ui-ux.md** (opcional) — Bocetos, referencias visuales, paleta de colores

## Qué copias del template

```
mi-nuevo-proyecto/
├── claude.md                            ← COPIA
├── REVIEW.md                           ← COPIA (reglas de code review)
├── .claudeignore                        ← COPIA
├── .claude/
│   ├── settings.json                    ← COPIA (con hooks de formateo)
│   ├── rules/
│   │   ├── tipos-proyecto.md            ← COPIA
│   │   ├── supabase.md                  ← COPIA
│   │   └── diseno-corporativo.md        ← COPIA (solo Tipo A)
│   └── agents/
│       ├── goku.md                      ← COPIA (Backend 🟠)
│       ├── vegeta.md                    ← COPIA (Frontend 🔵)
│       ├── piccolo.md                   ← COPIA (BD 🟢)
│       ├── trunks.md                    ← COPIA (NEXO 🟣)
│       └── whis.md                      ← COPIA (Auditor ⚪)
└── docs/
    ├── PRD.md                           ← TÚ
    ├── diseno-ui-ux.md                  ← TÚ (opcional)
    ├── convenciones-supabase.md         ← COPIA
    ├── checklist-despliegue.md          ← COPIA
    └── agent-teams.md                   ← COPIA
```

## Qué crea Claude Code por ti

- `.claude/skills/` — Skills específicas del proyecto
- `.claude/rules/` — Reglas adicionales con paths
- `.claude/agent-memory/` — Memoria persistente de cada subagente
- `src/app/CLAUDE.md`, `src/components/CLAUDE.md`, etc. — Instrucciones por módulo
- `docs/decisions/` — Registro de decisiones de arquitectura
- `MEMORY.md` — Memoria persistente entre sesiones

## Checklist antes de arrancar

```
□ PRD.md escrito y guardado en docs/
□ diseno-ui-ux.md escrito (solo si es Tipo A)
□ claude.md copiado a la raíz
□ REVIEW.md copiado a la raíz
□ .claudeignore copiado a la raíz
□ .claude/settings.json copiado (incluye hooks de formateo)
□ .claude/rules/ copiados
□ .claude/agents/ copiados (5 subagentes con colores)
□ Docs de referencia copiados
□ Abre Claude Code → 3 prompts de promptfirst.md
```

## Features que aprovechamos

| Feature | Para qué |
|---------|----------|
| **opusplan** | Opus piensa, Sonnet ejecuta (~68% ahorro) |
| **@mention** | Invocar subagentes directamente: `@goku`, `@whis` |
| **effort levels** | Cada subagente gasta lo justo (Whis=high, Trunks=low) |
| **background** | Whis audita en paralelo sin bloquear el desarrollo |
| **memory** | Cada subagente recuerda aprendizajes entre sesiones |
| **isolation: worktree** | Subagentes trabajan en worktrees git aislados |
| **hooks condicionales** | Prettier auto-formatea solo en src/** |
| **REVIEW.md** | Reglas de revisión separadas del CLAUDE.md general |
| **.claudeignore** | Excluye node_modules y archivos pesados |
| **/compact + Compact Instructions** | Lo esencial sobrevive a la compactación |
| **/dream** | Consolida memorias entre sesiones |
| **/powerup** | Lecciones interactivas para aprender Claude Code |
