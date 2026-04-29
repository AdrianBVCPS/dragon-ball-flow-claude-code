---
description: "Convenciones de base de datos Supabase"
paths:
  - "supabase/**"
  - "src/lib/supabase/**"
---

- Tablas: snake_case, plural (empleados, fichajes)
- Columnas: snake_case (created_at, id_maquina)
- RLS obligatorio en CADA tabla
- Migraciones: timestamp, idempotentes, comentadas en español
- Cliente servidor: src/lib/supabase/server.ts
- Cliente navegador: src/lib/supabase/client.ts
- Nunca exponer service_role_key en cliente
- Tipos generados en src/types/
