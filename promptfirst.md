# Capsule Corp Flow — Los 3 prompts de arranque

Copia y pega estos prompts uno a uno al abrir Claude Code en tu proyecto.

---

## Prompt 1 — Contexto

```
Lee todo el directorio /docs. Identifica:
- Qué tipo de proyecto es (A = corporativo, B = personal, C = legacy)
- Qué stack necesita
- Qué funcionalidades principales describe el PRD

Dime qué entendiste. No empieces a codificar.
```

> Revisa que haya entendido bien. Corrige si falta algo.

---

## Prompt 2 — Estructura

```
Basándote en lo que leíste, propón:
1. Skills específicas para este proyecto (si necesita alguna)
2. Rules adicionales con paths: para este proyecto
3. CLAUDE.md anidados para los módulos principales (src/app, src/components, src/lib, supabase)

Presenta la propuesta. No crees nada todavía.
```

> Revisa la propuesta. Di "Aprobado" cuando estés conforme.

---

## Prompt 3 — Plan y equipo

```
Ahora:
1. Crea todo lo aprobado (skills, rules, CLAUDE.md anidados)
2. Crea docs/decisions/ para registrar decisiones de arquitectura
3. Presenta un plan de implementación por fases con:
   - Fases ordenadas
   - Qué se construye en cada fase
   - Qué subagentes participan (@goku=Backend, @vegeta=Frontend, @piccolo=BD, @trunks=NEXO, @whis=Auditor)
   - Dependencias entre fases
   - Estimación de complejidad (simple / medio / complejo)

Usa los subagentes de .claude/agents/ para delegar trabajo especializado.
No empieces a codificar. Solo el plan.
```

> Revisa el plan. Di "Aprobado. Empieza la Fase 1" cuando estés conforme.

---

## Después: el ciclo de cada fase

Al terminar cada fase, di:

```
Fase [N] terminada. Escribe el resumen en docs/progreso-fase-N.md
y guarda en memoria lo que hicimos, decisiones y próximos pasos.
```

Después:
1. Si /dream está disponible, ejecuta `/dream` para consolidar memoria
2. Haz `/clear`
3. Para retomar:

```
Retomo. Lee docs/progreso-fase-[N].md y MEMORY.md.
Empieza la Fase [N+1].
```

---

## Invocar subagentes directamente

No necesitas pasar siempre por Bulma. Escribe `@nombre` para invocar directamente:

```
@goku arregla el endpoint de autenticación
@vegeta el dashboard no es responsive en móvil
@piccolo añade índice a la columna email de empleados
@trunks escribe tests para la lógica de turnos
@whis audita todo antes del commit
```

---

## Antes del deploy

```
@whis audita el código completo.
Corrige todo lo que sea CRÍTICO o ADVERTENCIA.
Después ejecuta /code-review y verifica el checklist de despliegue.
```

---

## Si algo se rompe

```
Eso no funciona. Arréglalo.
```

Bulma diagnosticará y delegará al subagente correcto.

---

## Tips de economía de tokens

- **No subas PDFs completos** si puedes pegar solo el párrafo relevante
- **Pide brevedad** cuando solo necesitas una respuesta corta
- **Si te levantas >5 min**, el cache de tokens expira — al volver, el coste sube
- **`/compact` con foco** cuando la conversación se alarga dentro de una fase
- **`/powerup`** para aprender features de Claude Code con demos interactivas
- **opusplan** ya configurado: Opus planifica (caro), Sonnet ejecuta (barato)
