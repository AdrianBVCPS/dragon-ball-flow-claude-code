---
description: "Reglas según tipo de proyecto (A/B/C)"
---

## Tipo A — App corporativa

- Paleta corporativa obligatoria (ver @docs/sistema-diseno-bv.md si existe)
- PWA con manifest.json e iconos
- RLS por rol de empleado
- Fuentes: Source Sans 3 (UI), DM Mono (datos)
- Responsive obligatorio, mobile-first
- Favicon y splash screen corporativos

## Tipo B — App personal / side project

- Diseño libre, paleta a elección
- PWA opcional
- RLS según necesidad
- Deploy en Vercel/Netlify gratuito

## Tipo C — App legacy instrumental

- Electron o HTML/CSS/JS puro
- CERO conexiones a internet
- Sin frameworks, sin CDN, sin dependencias externas
- Empaquetado portable (.exe o carpeta autocontenida)
- UI simple, funcional, sin florituras
