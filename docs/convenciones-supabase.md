# Convenciones Supabase

## Naming
- Tablas: `snake_case`, plural → `empleados`, `fichajes`, `pausas`
- Columnas: `snake_case` → `created_at`, `id_maquina`, `nombre_completo`
- Funciones SQL: `snake_case` con prefijo → `get_empleados_activos()`
- Enums: `snake_case` → `tipo_turno`, `estado_fichaje`

## RLS (Row Level Security)
- Obligatorio en CADA tabla, sin excepciones
- Políticas específicas por rol, nunca genéricas tipo `true`
- Nombrar descriptivamente: `empleados_select_own`, `admin_all_access`
- Testear con diferentes roles antes de dar por buenas

## Migraciones
- Directorio: `supabase/migrations/`
- Formato: timestamp automático de Supabase CLI
- Idempotentes: usar `IF NOT EXISTS`, `CREATE OR REPLACE`
- Comentadas en español: explicar el porqué, no el qué
- Una migración por cambio lógico

## Clientes
- Servidor: `src/lib/supabase/server.ts`
- Navegador: `src/lib/supabase/client.ts`
- **Nunca** exponer `service_role_key` en cliente

## Tipos
- Generar: `supabase gen types typescript`
- Guardar en `src/types/database.types.ts`
- Regenerar después de cada migración
