# Capsule Corp Flow — Skills y Plugins recomendados

**Documento para entregar a Claude Code para instalación global (~/.claude/)**
**Fecha: Abril 2026**

---

## Instrucciones de instalación

Abre Claude Code en cualquier proyecto y ejecuta estos comandos uno a uno.
Los plugins se instalan globalmente y estarán disponibles en TODOS tus proyectos.

---

## 1. ESSENTIALS — Instalar siempre

### Superpowers (obra/superpowers)
**Qué hace:** Framework completo de desarrollo: brainstorming → spec → plan → subagent execution → TDD → code review → merge. 40.9K stars, el más usado del ecosistema.
**Por qué lo necesitas:** Complementa el Capsule Corp Flow con TDD obligatorio (RED-GREEN-REFACTOR), code review por severidad antes de merge, y ejecución autónoma por subagentes con doble revisión.
**Relevancia:** testing, code review, calidad de código, documentación.

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### TypeScript LSP (oficial Anthropic)
**Qué hace:** Integración con Language Server Protocol para TypeScript. Claude ve errores de tipos, linting e información de hover en tiempo real.
**Por qué lo necesitas:** Detecta errores de TypeScript ANTES de que Claude los escriba, no después. Reduce ciclos de debugging. Nuestro stack es 100% TypeScript.
**Relevancia:** debugging, calidad de código.

```
/plugin install typescript-lsp@claude-plugins-official
```

### Code Review (oficial Anthropic)
**Qué hace:** Plugin oficial de Anthropic para revisión de código con severidades y sugerencias.
**Por qué lo necesitas:** Complementa a Whis con el plugin oficial. Lee CLAUDE.md y REVIEW.md para aplicar las convenciones del proyecto.
**Relevancia:** code review, calidad de código.

```
/plugin install code-review@claude-plugins-official
```

### Security Guidance (oficial Anthropic)
**Qué hace:** Auditoría de seguridad con checklist OWASP, detección de secrets, análisis de auth.
**Por qué lo necesitas:** Refuerza la capa de seguridad de Whis con patrones OWASP oficiales.
**Relevancia:** code review, seguridad.

```
/plugin install security-guidance@claude-plugins-official
```

---

## 2. RECOMENDADOS — Instalar según necesidad

### Context7 (upstash/context7)
**Qué hace:** Acceso a documentación actualizada de librerías en tiempo real. Busca APIs y ejemplos desde los repos fuente.
**Por qué lo necesitas:** Claude usa su conocimiento de entrenamiento que puede estar desactualizado. Context7 le da la documentación oficial actual de Next.js, Supabase, Tailwind, etc. Reduce alucinaciones.
**Relevancia:** debugging, calidad de código.

```
/plugin marketplace add upstash/context7-mcp
/plugin install context7@context7-mcp
```

### Frontend Design (oficial Anthropic)
**Qué hace:** Guía de diseño frontend con principios de UI/UX, accesibilidad y responsive.
**Por qué lo necesitas:** Refuerza a Vegeta con directrices de diseño profesionales.
**Relevancia:** calidad de código (frontend).

```
/plugin install frontend-design@claude-plugins-official
```

### Web Design Guidelines (vercel-labs)
**Qué hace:** Audita código de interfaz web contra 100+ reglas de diseño de Vercel Labs (22K stars).
**Por qué lo necesitas:** Quality gate visual para Vegeta. Verifica accesibilidad, rendimiento y UX antes de deploy.
**Relevancia:** code review (frontend), calidad.

```
/plugin marketplace add anthropics/web-design-guidelines-skill
/plugin install web-design-guidelines@web-design-guidelines-skill
```

### Commit Commands (oficial Anthropic)
**Qué hace:** Automatiza mensajes de commit con formato convencional.
**Por qué lo necesitas:** El Capsule Corp Flow requiere commits en español con formato `tipo: descripción`. Este plugin se puede configurar para respetar esa convención.
**Relevancia:** documentación, workflow.

```
/plugin install commit-commands@claude-plugins-official
```

### Local Review (local-review)
**Qué hace:** Code review paralelo con múltiples agentes sobre cambios locales no committeados. 5 agentes en paralelo, solo reporta issues con score ≥80.
**Por qué lo necesitas:** Más exhaustivo que un solo Whis — ejecuta 5 revisores en paralelo sobre tu diff.
**Relevancia:** code review.

```
/plugin marketplace add anthropics/local-review-plugin
/plugin install local-review@local-review-plugin
```

---

## 3. OPCIONALES — Para casos específicos

### Playwright MCP
**Qué hace:** Automatización de navegador, testing E2E, capturas de pantalla.
**Cuándo:** Si tu proyecto necesita testing visual o E2E.

```
/plugin install playwright@claude-plugins-official
```

### Feature Dev (oficial Anthropic)
**Qué hace:** Workflow estructurado para desarrollo de features: spec → plan → implement → test.
**Cuándo:** Si quieres un workflow más guiado que los 3 prompts del Capsule Corp Flow.

```
/plugin install feature-dev@claude-plugins-official
```

### Firecrawl
**Qué hace:** Scraping web limpio, convierte páginas en markdown estructurado para Claude.
**Cuándo:** Si tu proyecto necesita extraer datos de webs.

```
/plugin marketplace add mendableai/firecrawl-mcp-server
/plugin install firecrawl@firecrawl-mcp-server
```

---

## Script de instalación rápida

Copia y pega este bloque completo en Claude Code para instalar todos los essentials + recomendados de una vez:

```
Instala los siguientes plugins de forma global:

ESSENTIALS:
1. /plugin marketplace add obra/superpowers-marketplace → /plugin install superpowers@superpowers-marketplace
2. /plugin install typescript-lsp@claude-plugins-official
3. /plugin install code-review@claude-plugins-official
4. /plugin install security-guidance@claude-plugins-official

RECOMENDADOS:
5. /plugin marketplace add upstash/context7-mcp → /plugin install context7@context7-mcp
6. /plugin install frontend-design@claude-plugins-official
7. /plugin install commit-commands@claude-plugins-official

Instálalos uno por uno y confirma que cada uno se ha instalado correctamente.
```

---

## Advertencia sobre tokens

Cada plugin/skill añade tokens al contexto base. Según la documentación oficial de Anthropic, las skills usan progressive disclosure (~30-50 tokens por skill en metadata), pero los MCP servers pueden consumir 50K+ tokens.

**Regla de oro (self.md):** "don't install everything. each skill adds to your context window baseline. twenty skills fighting for attention is worse than three good ones."

**Nuestra recomendación:** Los 4 essentials + Context7 + Frontend Design. Son 6 plugins que cubren testing, code review, seguridad, tipos, documentación actualizada y diseño frontend. Si notas que el contexto se llena más rápido, desactiva los que menos uses con `/plugin disable nombre`.
