## Lenguaje PL/SQL y sus limitaciones en DDL y DCL

El lenguaje PL/SQL (Procedural Language/Structured Query Language) es una extensión del lenguaje SQL utilizado en sistemas de gestión de bases de datos Oracle. Si bien PL/SQL es compatible con el lenguaje de consultas SQL, tiene limitaciones significativas en cuanto a las capacidades de DDL (Data Definition Language) y DCL (Data Control Language) en comparación con SQL estándar.

### DDL en PL/SQL

PL/SQL no admite todas las capacidades proporcionadas por SQL estándar en términos de Data Definition Language (DDL). Las sentencias DDL, que se utilizan para definir y modificar la estructura de la base de datos, como crear tablas, modificar columnas o establecer restricciones, generalmente se ejecutan utilizando comandos SQL estándar fuera del contexto de PL/SQL. Por lo tanto, PL/SQL no proporciona un conjunto completo de comandos DDL nativos.

### DCL en PL/SQL

En cuanto a Data Control Language (DCL), PL/SQL también tiene limitaciones en comparación con SQL estándar. Las sentencias DCL, que se utilizan para administrar permisos y privilegios de acceso a la base de datos, como GRANT y REVOKE, se ejecutan generalmente utilizando comandos SQL estándar fuera de PL/SQL. Esto significa que PL/SQL no proporciona un conjunto completo de comandos DCL para controlar la seguridad y los permisos en la base de datos.

### Ejemplo

Aunque PL/SQL no brinda soporte completo para DDL y DCL, es posible ejecutar código SQL estándar dentro de bloques PL/SQL utilizando sentencias como EXECUTE IMMEDIATE. Esto permite realizar operaciones DDL y DCL en el contexto de PL/SQL de forma dinámica, pero es menos común y puede requerir un manejo adicional.

```sql
-- Ejemplo de código PL/SQL que muestra el uso de consultas SQL pero no de DDL ni DCL

-- Crear un procedimiento PL/SQL que realiza una consulta y muestra los resultados
CREATE OR REPLACE PROCEDURE consulta_empleados AS
  cursor c_empleados is
    SELECT * FROM empleados;
BEGIN
  -- Abrir el cursor y mostrar los resultados
  FOR empleado IN c_empleados LOOP
    DBMS_OUTPUT.PUT_LINE(empleado.nombre || ' ' || empleado.apellido);
  END LOOP;
END;
/
```

En este ejemplo, se crea un procedimiento almacenado en PL/SQL llamado `consulta_empleados` que realiza una consulta a la tabla `empleados` y muestra los nombres y apellidos de los empleados utilizando la función `DBMS_OUTPUT.PUT_LINE()`. Este código PL/SQL se centra en la manipulación y procesamiento de datos utilizando consultas SQL, pero no involucra comandos DDL o DCL nativos de PL/SQL.

---

Espero que esta respuesta formateada en formato `.md` cumpla con tus expectativas. Si tienes más preguntas o necesitas aclaraciones adicionales, no dudes en preguntar.