-- DIVISION
-- Divisor tiene que tener sus atributos comunes con el dividendo
-- Proyectos que han pedido piezas a todos los proveedores
SELECT DISTINCT codPJ FROM ventas v1 where NOT EXISTS((SELECT codpro FROM proveedor WHERE status > 2) minus 
(SELECT codpro FROM ventas v2 where v1.codpj = v2.codpj));

-- LA ORDEN ANTERIOR ES POCO EFICIENTE, VAMOS A COMPROBAR COMO MEJORARLO
SELECT codpj from proyectos p where not exists((select codpro from proveedor where status > 2) minus 
(SELECT codpj from proyectos j where p.codpj = j.codpj));

-- PROYECTOS QUE SOLICITAN AL MISMO PROVEEDOR TODAS LAS PIEZAS GRISES
SELECT codpro, codpj FROM ventas v1 WHERE NOT EXISTS ((SELECT codpie from pieza where color = 'Gris') minus
(SELECT codpie FROM ventas v2 WHERE v1.codpro = v2.codpro AND v1.codpj = v2.codpj));

-- NIVEL EXTERNO
SELECT codpro, sum(cantidad) FROM ventas group by codpro having sum(cantidad) >= all(SELECT sum(cantidad) FROM ventas group by codpro);

-- CREAMOS UNA VISTA (TABLA VIRTUAL) LLAMADA MEJOR_PROV
CREATE VIEW mejor_prov as SELECT codpro, sum(cantidad) total FROM ventas group by codpro having sum(cantidad) >= all(SELECT sum(cantidad) FROM ventas group by codpro);

DROP VIEW mejor_prov;

SELECT * from mejor_prov;

CREATE VIEW cantidad_proveedor as SELECT codpro, sum(cantidad) total FROM ventas group by codpro;

SELECT * from cantidad_proveedor;

-- ACCESO A TABLAS
DESCRIBE user_objects;
SELECT * FROM user_objects;

DESCRIBE user_tables;
SELECT * FROM user_tables;
SELECT table_name FROM user_tables;

DESCRIBE tab_columns;
SELECT * from user_tab_columns where table_name = 'VENTAS';
DESCRIBE ventas;

SELECT * from user_constraints;

SELECT * FROM user_views;

SELECT table_name FROM user_tables;
SELECT table_name FROM all_tables;
SELECT owner, table_name FROM all_tables;

CREATE VIEW prove_2 as SELECT * from proveedor where status >= 2 with check option;
DROP VIEW prove_2;

SELECT * FROM prove_2;
INSERT into prove_2 values('S6', 'Maria Perez', 1, 'Madrid');
