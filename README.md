<div align="center">

# 🐉 Dragon Ball Flow for Claude Code

### El sistema de desarrollo con IA más eficiente para proyectos fullstack

**Bulma dirige. El Equipo Z ejecuta. Tú solo defines qué construir.**

[![Versión](https://img.shields.io/badge/versión-8.0-blue)](.)
[![Stack](https://img.shields.io/badge/stack-Next.js%20%7C%20TypeScript%20%7C%20Supabase-black)](.)
[![Actualizado](https://img.shields.io/badge/actualizado-semanalmente%20con%20IA-green)](.)
[![Licencia](https://img.shields.io/badge/licencia-MIT-orange)](.)

> ⚠️ **Este repositorio se actualiza automáticamente cada lunes** con las novedades que la IA determina que mejoran el flujo. No necesitas hacer nada para tener siempre la versión más reciente.

</div>

---

## ¿Qué es Dragon Ball Flow?

Dragon Ball Flow (también llamado Capsule Corp Flow internamente) es un **sistema de instrucciones y configuración para Claude Code** que convierte a Claude en un equipo completo de desarrollo fullstack. Tú describes lo que quieres construir y el sistema se encarga del resto: planifica, delega, ejecuta, revisa y despliega.

No es un framework de código. Es un **framework de trabajo** — una forma de orquestar Claude Code para que funcione como un equipo de 5 ingenieros especializados bajo la dirección de una arquitecta senior.

### ¿Para quién es esto?

- **Vibe coders** que saben qué quieren construir pero no cómo implementarlo
- **Developers** que quieren multiplicar su velocidad con IA de forma organizada
- **Founders** que necesitan MVPs rápidos y bien estructurados
- Cualquiera que quiera usar Claude Code más allá del "chat con código"

---

## El equipo Z Warriors

El flujo define 6 roles que Claude interpreta. Cada uno tiene herramientas específicas, nivel de esfuerzo ajustado y área de responsabilidad clara:

| Personaje | Rol | Especialidad | Debug |
|-----------|-----|-------------|-------|
| 🟡 **Bulma** (tú la diriges) | Arquitecta & Lead | Planifica, delega, toma decisiones técnicas | — |
| 🟠 **Goku** | Backend Engineer | API REST, auth, middleware, validación Zod | ✅ servidor |
| 🔵 **Vegeta** | Frontend Engineer | Componentes React, UI/UX, estilos Tailwind | ✅ visual |
| 🟢 **Piccolo** | Database Engineer | Tablas Supabase, migraciones, RLS, SQL | ✅ datos |
| 🟣 **Trunks** | DevOps & QA | Tests, CI/CD, docs, deploy en Vercel | — |
| ⚪ **Whis** | Auditor de código | Code review, seguridad, calidad — siempre en background | solo lectura |

---

## ¿Cómo funciona? (visión general)

```
TÚ escribes el PRD         →   Bulma lee y clasifica el proyecto (A/B/C)
TÚ apruebas la estructura  →   Bulma propone skills, rules y CLAUDE.md
TÚ apruebas el plan        →   Bulma divide en fases y asigna agentes
TÚ dices "empieza Fase 1"  →   El equipo Z ejecuta en paralelo
TÚ pruebas en el navegador →   Bulma registra la fase y limpia contexto
TÚ dices "Fase 2"          →   El equipo retoma desde donde lo dejó
```

### El ahorro real

El flujo usa `opusplan`: **Opus planifica, Sonnet ejecuta**. Esto reduce el coste de tokens entre un **60–68%** respecto a usar Opus en todo. Además, Whis corre en `background: true`, por lo que audita sin bloquear el flujo principal.

---

## Stack tecnológico por defecto

| Capa | Tecnología |
|------|-----------|
| Frontend | Next.js 15 (App Router) + TypeScript |
| Estilos | Tailwind CSS + Lucide React |
| Backend | Next.js API Routes + Zod |
| Base de datos | Supabase (PostgreSQL + RLS) |
| Auth | Supabase Auth |
| Deploy | Vercel (gratuito) |
| Modelos | Opus 4.7 (plan) + Sonnet 4.6 (ejecución) |

> El flujo también soporta **proyectos legacy** (Electron o HTML/JS/CSS puro sin dependencias externas).

---

## Instalación y uso

### 1. Copia la plantilla a tu proyecto

```bash
# Clona este repositorio o descárgalo como ZIP
git clone https://github.com/[usuario]/dragon-ball-flow-claude-code.git mi-proyecto

# Entra al proyecto
cd mi-proyecto

# Borra el historial de git (para empezar limpio)
rm -rf .git && git init
```

### 2. Instala la skill en Claude Code

Haz doble clic en el archivo `capsule-corp-flow.skill` para instalarlo en Claude Code.

O desde el terminal:
```bash
claude /plugin install capsule-corp-flow.skill
```

### 3. Escribe tu PRD

Edita `docs/PRD.md` con lo que quieres construir:
- ¿Qué es la app?
- ¿Para quién es?
- ¿Qué funcionalidades necesita?
- ¿Restricciones de diseño o tecnología?

No necesitas ser técnico. Sé claro sobre el RESULTADO que quieres.

### 4. Abre Claude Code y lanza el primer prompt

```
P1: Contexto inicial del proyecto
Lee docs/PRD.md y cualquier doc en docs/. 
Identifica el tipo de proyecto (A, B o C). 
Instala el plugin code-review. 
Preséntame un resumen del contexto detectado.
```

Claude (como Bulma) leerá tu PRD, clasificará el proyecto y responderá con un análisis. Luego sigues con P2 y P3.

---

## Los 3 prompts de arranque

El flujo tiene un protocolo de inicio de 3 pasos. Están escritos exactamente en `promptfirst.md`:

**P1 — Contexto:** Claude lee los docs, identifica el tipo de proyecto e instala herramientas necesarias.

**P2 — Estructura:** Claude propone la arquitectura de archivos (skills, rules, CLAUDE.md anidados). Tú apruebas o ajustas.

**P3 — Plan:** Claude presenta un plan de fases con los subagentes asignados a cada una. Tú apruebas antes de ejecutar.

---

## Tipos de proyecto

| Tipo | Descripción | Cuándo usarlo |
|------|-------------|---------------|
| **A** — Corporativo | Paleta de marca obligatoria, PWA, RLS por rol | Proyecto para cliente o empresa |
| **B** — Personal | Diseño libre, deploy Vercel/Netlify gratis | Side project, MVP, herramienta propia |
| **C** — Legacy | Electron o HTML/JS puro, sin internet | Herramienta local, sin dependencias externas |

---

## El ciclo de trabajo por fases

```
1. "Empieza la Fase 1: [nombre]"
   → Bulma planifica → delega a Goku/Vegeta/Piccolo/Trunks
   → Whis audita en background (confianza X/100)
   
2. Tú pruebas lo que se construyó

3. "Fase 1 terminada. Escribe resumen en docs/progreso-fase-1.md y guarda en memoria"
   → Bulma documenta + actualiza MEMORY.md
   
4. /dream  → consolida y limpia memoria
5. /clear  → borra contexto
6. "Retomo. Lee docs/progreso-fase-1.md. Empieza la Fase 2."
```

### ¿Por qué /clear entre fases?

Claude Code tiene un límite de contexto. Si no limpias entre fases, el rendimiento baja y los costes suben. Con el sistema de documentación del flujo (progreso-fase-N.md + MEMORY.md), Claude retoma exactamente donde lo dejó sin necesidad del historial completo.

---

## Funcionalidades avanzadas

### Checkpoints automáticos
Guarda el estado antes de cambios grandes. Puedes volver atrás al instante si algo sale mal.

### Worktree isolation
Cuando varios subagentes trabajan en paralelo (`isolation: worktree`), cada uno opera en su propia rama de git. Elimina conflictos de archivos.

### Whis en background
```
background: true
effort: high
```
Whis corre en paralelo sin bloquear a Goku o Vegeta. Produce un reporte de auditoría (confianza 0–100). Si detecta críticos, Bulma los resuelve antes del commit.

### Hooks condicionales
```json
"PostToolUse": [{
  "matcher": "Write(src/**)",
  "hooks": [{"type": "command", "command": "prettier --write"}]
}]
```
Prettier se ejecuta automáticamente al escribir en `src/**`. No actúa en `docs/`, `config/` ni `tests/`.

### Invocar subagentes directamente
```
@goku arregla el endpoint de autenticación
@vegeta el botón de submit no responde en móvil  
@piccolo la query de turnos tarda 3 segundos
@trunks escribe tests para el módulo de pagos
@whis audita antes del commit, céntrate en seguridad
```

### Ultraplan (nuevo en 2026)
Puedes usar `/plan` para crear un plan en la nube, revisarlo en el editor web de Anthropic y luego ejecutarlo remotamente o en local.

---

## Estructura de archivos

```
mi-proyecto/
├── CLAUDE.md                    ← Identidad de Bulma + reglas globales
├── REVIEW.md                    ← Reglas de code review para Whis
├── .claudeignore                ← Excluye node_modules, .next, etc.
├── promptfirst.md               ← Textos exactos de P1, P2, P3
├── instrucciones.md             ← Guía para el usuario
├── capsule-corp-flow.skill      ← Skill instalable con doble clic
│
├── .claude/
│   ├── settings.json            ← opusplan + hooks Prettier
│   ├── agents/
│   │   ├── goku.md              ← Backend (🟠 naranja)
│   │   ├── vegeta.md            ← Frontend (🔵 azul)
│   │   ├── piccolo.md           ← BD (🟢 verde)
│   │   ├── trunks.md            ← NEXO (🟣 morado)
│   │   └── whis.md              ← Auditor (⚪ blanco)
│   └── rules/
│       ├── tipos-proyecto.md    ← Reglas A/B/C (siempre cargada)
│       ├── supabase.md          ← paths: supabase/**
│       └── diseno-corporativo.md ← paths: src/components/**
│
└── docs/
    ├── PRD.md                   ← LO ESCRIBES TÚ antes del P1
    ├── flujo-proyecto-nuevo.md  ← Guía completa del flujo
    ├── agent-teams.md           ← Paralelismo con worktrees
    ├── checklist-despliegue.md  ← Verificación pre-deploy
    ├── convenciones-supabase.md ← Naming, RLS, migraciones
    └── skills-plugins-recomendados.md
```

---

## Reglas que nunca se rompen

1. **RLS en todas las tablas** — Sin excepciones, sin justificación
2. **Nunca hardcodear secrets** — Variables de entorno siempre
3. **Sin `any` en TypeScript** — Si lo usas, justifícalo en comentario
4. **Commits en español** — `feat: añadir auth con JWT`
5. **Zod en cliente Y servidor** — Doble validación siempre
6. **Code review antes de deploy** — Whis con confianza ≥ 80 o `/code-review`
7. **Sin `git --force`** — Nunca, bajo ninguna circunstancia
8. **Sin dependencias de pago** sin OK explícito de Adrian

---

## Actualizaciones automáticas

**Cada lunes a las 9:00 AM** una tarea programada busca automáticamente:
- Novedades en la documentación oficial de Claude Code
- Cambios en modelos disponibles
- Nuevas funcionalidades de hooks, agents, MCP o skills
- Mejoras en el Claude Agent SDK

Si encuentra algo relevante, actualiza automáticamente:
- `CLAUDE.md` con las mejoras aplicadas
- La skill `capsule-corp-flow.skill`
- Este repositorio de GitHub
- `docs/novedades-claudecode.md` con el changelog

**No necesitas hacer nada.** El flujo se mejora solo.

---

## FAQ

**¿Necesito saber programar?**
No. Solo necesitas saber describir lo que quieres. El flujo está diseñado para "vibe coders": personas que orquestan la IA sin escribir código directamente.

**¿Cuánto cuesta?**
El stack es 100% gratuito (Vercel free tier + Supabase free tier). El único coste es el de los tokens de Claude Code, que el sistema optimiza con `opusplan` (~68% de ahorro vs todo-Opus).

**¿Funciona para proyectos existentes?**
Sí. Copia los archivos `.claude/` a tu proyecto y ajusta el `CLAUDE.md` con el contexto de tu proyecto actual.

**¿Qué modelos usa?**
Por defecto: **Opus 4.7** para planificación (Bulma), **Sonnet 4.6** para ejecución (subagentes). Puedes ajustar con `/effort xhigh` para tareas críticas con Opus 4.7.

**¿Por qué los personajes de Dragon Ball?**
Porque los nombres son memorables y cada personaje tiene una personalidad que encaja perfectamente con su rol técnico. Whis (el Auditor) es imparcial y está por encima de todos. Goku (Backend) es potente pero impulsivo — necesita que Bulma le dirija. Vegeta (Frontend) es perfeccionista con el diseño.

---

## Contribuir

Las mejoras a este repo vienen principalmente de la tarea automatizada semanal. Si tienes sugerencias manuales:

1. Abre un Issue describiendo la mejora
2. O haz un PR con el cambio propuesto en `CLAUDE.md` o los archivos de agentes

---

## Licencia

MIT — Úsalo, modifícalo y compártelo libremente.

---

<div align="center">
  <sub>Creado por Adrian García · Mantenido automáticamente por IA · Actualizado cada lunes</sub>
</div>
