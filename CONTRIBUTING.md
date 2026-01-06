# CONTRIBUTING

## Directrices generales

- Sigue estrictamente las reglas definidas en `.editorconfig` del repositorio.
- Mantén la indentación de 4 espacios y límite de línea 120.
- Preserva los bloques de comentario existentes al refactorizar.

## Estilo de código

- Nombres PascalCase para clases y métodos; camelCase para parámetros y variables privadas.
- Incluye `using` explícitos cuando sea necesario; evita `global using`.

## Flujo de trabajo

- Crea una rama por característica: `feature/descripcion`.
- Ejecuta las pruebas con __Test Explorer__ antes de enviar PR.
- Asegúrate de que la solución compila en __Build > Build Solution__.

## Commits y PRs

- Mensajes de commit cortos y claros: `feat: Añadir servicio de autenticación`.
- Incluye descripción en PR y referencia issues si aplica.

## Archivos obligatorios

- Mantén `.editorconfig` y `CONTRIBUTING.md` actualizados.
