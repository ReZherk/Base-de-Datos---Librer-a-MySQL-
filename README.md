# 📚 Base de Datos - Librería (MySQL)

Este proyecto contiene únicamente **scripts SQL** para crear y gestionar una base de datos de una librería.

## 📂 Contenido

- `schema.sql` → Creación de la BD y tablas con restricciones.
- `seed.sql` → Datos de ejemplo (autores, editoriales, libros, clientes y ventas).
- `queries.sql` → Consultas básicas y estructuradas.
- `updates_deletes.sql` → Ejemplos de actualización y eliminación de datos.
- `vista.sql` → Vista de resumen de ventas.
- `diagrams/erd.png` → Diagrama entidad-relación exportado desde phpMyAdmin.

## 🚀 Cómo usarlo

1. Crear la base de datos:

   ```bash
   mysql -u root -p < schema.sql
   ```

2. Poblar con datos de ejemplo:

   ```bash
   mysql -u root -p < seed.sql
   ```

3. Probar las consultas:

   ```bash
   mysql -u root -p < queries.sql
   ```

4. Ejecutar ejemplos de updates y deletes:

   ```bash
   mysql -u root -p < updates_deletes.sql
   ```

5. Crear y consultar la vista:

   ```bash
   mysql -u root -p < vista.sql
   ```
