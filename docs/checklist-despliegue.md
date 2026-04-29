# Checklist de despliegue

## Antes de desplegar

### Código
- [ ] TypeScript compila sin errores (`npx tsc --noEmit`)
- [ ] Sin `console.log` en producción
- [ ] Sin `any` no justificado
- [ ] Sin secrets hardcodeados
- [ ] Sin imports no utilizados
- [ ] Código comentado en español

### Base de datos
- [ ] Todas las tablas tienen RLS
- [ ] Migraciones aplicadas y probadas
- [ ] Seeds funcionando (si aplica)
- [ ] Índices en columnas con queries frecuentes

### Seguridad
- [ ] Auth verificada en todas las rutas protegidas
- [ ] Validación Zod en cliente Y servidor
- [ ] Variables de entorno configuradas en el hosting
- [ ] CORS configurado correctamente

### UI/UX
- [ ] Responsive: probado en móvil, tablet y desktop
- [ ] Skeletons/spinners en todas las cargas
- [ ] Estados vacíos manejados
- [ ] Errores mostrados al usuario de forma amigable

### Testing
- [ ] Tests unitarios pasan
- [ ] Tests de integración pasan (si hay)
- [ ] Build de producción sin errores (`npm run build`)

### Auditoría
- [ ] @whis ejecutado: confianza ≥ 80
- [ ] Issues CRÍTICOS corregidos
- [ ] Issues ADVERTENCIA revisados

### Deploy
- [ ] Variables de entorno en hosting (Vercel/Netlify)
- [ ] Dominio configurado (si aplica)
- [ ] Build exitoso en hosting
- [ ] Prueba manual post-deploy
