-- WHERE atributo (>=, >, <, <=, <>, =) | {ANY; ALL} (SELECT...)

-- pedido con el menor num de ventas
SELECT * from ventas where cantidad <= all (select cantidad from ventas);

-- FUNCIONES DE AGREGACION

-- MIN(ATRIBUTO) --> Cantidad minima
-- MAX("") --> Cantidad maxima
-- SUM("") --> Hace una suma de todo
-- AVG("") --> Media
-- STDDEV("") --> Desviacion tipica
-- COUNT("") --> Hay 3 versiones:
  -- COUNT(cantidad) --> Cuenta los valores no nulos hay
  -- COUNT(DISTINCT codPie) --> Cuenta cuantas piezas DISTINTAS hay, sin repeticiones
  -- COUNT(*) --> Cuenta TODOS los valores, nulos, no nulos, repetidos, no repetidos...
  
-- Devolver primera fecha en la que se hizo un pedido
SELECT min(fecha), max(fecha) from ventas;

-- Fecha del primer pedido que hizo S2
SELECT min(fecha) from ventas where codPro = 'S2';

-- Media de las cantidades vendidas durante 2015
SELECT AVG(cantidad) from ventas where to_char(FECHA, 'YYYY')= '2015';

-- Proveedor que hizo el primer pedido para la empresa
SELECT codPro from ventas where fecha = (select min(fecha) from ventas);
SELECT codPro from ventas where fecha <= all (select fecha from ventas);

-- Todos los datos del proveedor que hizo el primer pedido para la empresa
SELECT * from ventas where codPro in (select codpro from ventas where fecha = (select min(fecha) from ventas));

-- Ejemplo de count
SELECT count(codPie) from ventas; -- 23
SELECT count(DISTINCT codPie) from ventas; -- 5
SELECT count(*) from ventas; -- 23

-- Cantidades totales vendidas por S1
SELECT sum(cantidad) from ventas where CODPRO = 'S1';

-- Tabla para TODOS los proveedores y las cantidades que ha vendido cada uno
SELECT codpro, sum(cantidad) from ventas group by codpro order by codpro;
SELECT codpro, sum(cantidad) from ventas group by to_char(fecha, 'yyyy'), codpro;

-- Resumen mes y proveedor de las ventas de 2015
SELECT to_char(fecha, 'MON'),codpro, sum(cantidad) from ventas where to_char(fecha, 'yyyy') = 2015 group by to_char(fecha, 'MON'), codpro;

-- Num piezas compradas diferentes por proyecto
SELECT codpj, count(DISTINCT codPie) from ventas group by codpj;

-- Media unidades vendidas por proveedor de Londres
SELECT AVG(cantidad), codpro from ventas where codpro in (select codpro from proveedor where ciudad = 'Londres') group by codpro;

SELECT codpro, AVG(cantidad) from ventas group by codpro;

-- USO DEL HAVING (WHERE) PARA TABLAS GROUP BY
-- Media mayor que 700 unidades
SELECT codpro, AVG(cantidad) from ventas group by codpro having AVG(cantidad) >= 700;

-- Encontrar codpro que ha vendido mas unidades
SELECT codpro, SUM(cantidad) from ventas group by codpro having sum(cantidad) >= all(SELECT sum(cantidad) from ventas group by codPro);

-- 3.7, 3.8, 3.9, 3.10
