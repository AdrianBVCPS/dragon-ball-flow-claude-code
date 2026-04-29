# REVIEW.md — Reglas de revisión de código (Capsule Corp Flow)

Este archivo es leído por Whis (subagente auditor) y por /code-review.
NO se carga en sesiones normales de desarrollo — solo durante revisiones.

## Reglas generales

- Preferir early returns sobre condicionales anidados
- Cada API route debe tener validación Zod de inputs
- Cada tabla nueva debe tener RLS activado con políticas específicas por rol
- Nunca secrets hardcodeados (buscar patrones: API_KEY, SECRET, PASSWORD, TOKEN en strings)
- Sin `any` en TypeScript salvo justificación explícita en comentario
- Sin console.log en código que va a producción (permitido en __tests__/)
- Imports ordenados: React primero, luego libs externas, luego internos, luego tipos

## Frontend (Vegeta)

- Componentes sin lógica de negocio — extraer a hooks custom
- Tailwind exclusivamente, sin CSS inline ni modules
- Todo componente interactivo debe manejar: loading, error, empty, success
- Responsive: verificar que funcione en viewport 375px (móvil) y 1440px (desktop)
- Accesibilidad: todos los inputs con label, imágenes con alt, botones con texto o aria-label

## Backend (Goku)

- Validación Zod en el handler, no en el middleware global
- Errores tipados con status codes correctos (400 para input inválido, 401 para auth, 403 para permisos, 404 para no encontrado, 500 solo para errores inesperados)
- Sin lógica de negocio en el handler — extraer a funciones en src/lib/
- Variables de entorno referenciadas deben estar en .env.example

## Base de datos (Piccolo)

- Migraciones idempotentes (IF NOT EXISTS, CREATE OR REPLACE)
- RLS: verificar que las políticas cubran SELECT, INSERT, UPDATE, DELETE por separado
- Índices en columnas usadas en WHERE y JOIN frecuentes
- Naming: tablas plural snake_case, columnas snake_case, funciones con prefijo de acción

## Tests (Trunks)

- Tests unitarios para toda función con lógica condicional
- Tests de integración para API routes con auth
- No mockear lo que se pueda testear con datos reales
- Nomenclatura: describe("Módulo") → it("debería hacer X cuando Y")

## Severidad

- **CRÍTICO**: seguridad (inyección, auth, secrets), datos sin RLS, crash en producción
- **ADVERTENCIA**: TypeScript `any`, console.log, imports no usados, código duplicado
- **INFO**: estilo, naming, oportunidades de refactor menor
