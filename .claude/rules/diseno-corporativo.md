---
description: "Reglas de diseño para proyectos corporativos (Tipo A)"
paths:
  - "src/components/**"
  - "src/app/**/*.tsx"
---

- Consultar @docs/sistema-diseno-bv.md si existe para paleta y fuentes
- Fuentes: Source Sans 3 (UI general), DM Mono (datos numéricos/tablas)
- Iconos: Lucide React, stroke-width 1.5
- Layout: sidebar colapsable + header + main content
- Mobile-first: breakpoints sm(640) md(768) lg(1024) xl(1280)
- Skeletons/spinners obligatorios en carga de datos
- Animaciones sutiles, nunca distractoras
- Accesibilidad: labels, contraste, focus visible
