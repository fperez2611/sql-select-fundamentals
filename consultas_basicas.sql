-- ══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: Fabian Alejandro Perez
-- Fecha: 2026-07-20
-- ══════════════════════════════════════════

-- Consulta 1: Exploración general de la tabla sales
-- Uso de SELECT * para inspeccionar la estructura y datos de la tabla.
-- 
-- ¿Cuándo usarlo?: En fases tempranas de exploración, depuración o pruebas locales.
-- ¿Cuándo NO usarlo?: En entornos de producción, consultas recurrentes o sistemas de reporting,
-- ya que degrada el rendimiento, incrementa el consumo de ancho de banda y expone la consulta 
-- a fallos si cambia la estructura de la tabla.
SELECT * 
FROM sales;


-- Consulta 2: Selección de columnas específicas para finanzas
-- Extrae únicamente la información clave requerida por el área financiera.
SELECT 
    customer_id, 
    product_id, 
    total_amount
FROM sales;


-- Consulta 3: Selección con alias en español para stakeholders
-- Renombra las columnas técnicas con nombres amigables en español (utilizando snake_case).
SELECT 
    order_date AS fecha_pedido, 
    product_name AS nombre_producto, 
    quantity AS cantidad_unidades
FROM sales;
