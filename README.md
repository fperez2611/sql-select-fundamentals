# TechStore — Fundamentos de Consultas SQL (SELECT & Alias)

Este repositorio contiene las consultas SQL desarrolladas para responder a los requerimientos del equipo de finanzas de **TechStore**, permitiendo transformar datos brutos en reportes legibles y eficientes.

## 📁 Estructura del Repositorio

sql-select-fundamentals/
├── consultas_basicas.sql
└── README.md


---

## 🎯 Preguntas y Documentación Técnica

### 1. ¿Por qué es una mala práctica usar `SELECT *` en producción?

El uso de `SELECT *` en entornos de producción debe evitarse debido a varios factores críticos:

1. **Rendimiento e impacto en la red (Performance & I/O):**
   Al consultar todas las columnas de una tabla, el motor de base de datos se ve obligado a leer del disco e intercambiar por la red datos innecesarios (por ejemplo, textos largos, BLOBs o campos que la aplicación no va a usar). Esto incrementa el consumo de memoria y la latencia.

2. **Mantenibilidad y rotura de código (Fragilidad):**
   Si la estructura de la tabla cambia en el futuro (se añade, elimina o reordena una columna), las aplicaciones que dependen del orden o del número exacto de columnas devueltas por `SELECT *` fallarán automáticamente o procesarán datos erróneos.

3. **Uso ineficiente de índices:**
   Las bases de datos optimizan las consultas utilizando *Covering Indexes* (índices que contienen exactamente las columnas solicitadas). Al usar `SELECT *`, se fuerza al motor a consultar la tabla principal en disco, personalizando el costo de la consulta y anulando las optimizaciones del índice.

---

### 2. ¿Por qué son importantes los alias para un stakeholder no técnico?

Los alias (`AS`) actúan como un puente de comunicación entre la base de datos técnica y el lenguaje del negocio. Permiten renombrar campos para que las personas que toman decisiones interpreten la información directamente en sus reportes, paneles de BI o archivos de Excel, sin requerir conocimientos de programación.

#### Ejemplo concreto de transformación:

* **Sin alias (Nombre técnico original):**
  ```sql
  SELECT total_amount FROM sales;
Resultado del encabezado: total_amount

Inconveniente: Para un stakeholder no técnico o de habla hispana, términos en inglés o con sintaxis de código pueden generar confusión sobre si el monto incluye impuestos, si es bruto, neto, etc.

Con alias (Formato de negocio amigable):

```SQL
SELECT total_amount AS monto_total_facturado FROM sales;
```
Resultado del encabezado: monto_total_facturado

Beneficio: Transforma inmediatamente una columna en un indicador de negocio claro, profesional y contextualizado.
