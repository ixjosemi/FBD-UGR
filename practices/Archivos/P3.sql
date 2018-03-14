SELECT * from ventas;

INSERT into ventas values('S4', 'P3', 'J4', 180, '24-APR-17');

-- Mostrar fechas en diferentes formatos
-- TO_CHAR 
-- EJEMPLO:
-- SELECT codPro, codPie, to_char(fecha, 'formato adecuado') from ventas;
-- d -> nos dice que dia de la semana es entre 1...7
-- dd -> nos dice que dia del mes es entre 1...28/29/30/31
-- DAY/day/Day -> Lunes, Martes, Miercoles...
-- ddd -> nos dice en que dia del año nos encontramos entre 1...365
-- mm -> nos dice que mes es entre 1...12
-- Month/MONTH/month -> nos dice que mes es entre Enero...Diciembre
-- MON -> nos dice las 3 primeras letras del mes
-- YYYY -> nos dice el año 2017
-- YEAR -> nos escribe el año
-- YY -> nos escribe los dos ultimos digitos del año

SELECT codPro, codPie, to_char(fecha, 'Day, dd "de" month "de" YYYY')  from ventas;

-- Pedidos del año 2015
SELECT * from ventas where to_char(FECHA, 'YYYY')= '2015';

-- Ordenar por año, luego por codigo de pieza y luego por cantidad(en forma descendiente)
SELECT codPie, to_char(FECHA, 'YYYY'), cantidad from ventas order by to_char(fecha, 'YYYY'), codPie, cantidad desc;

-- TO_DATE -> Convierte a fecha
INSERT into ventas values('S1', 'P1', 'J4', 40, to_date('17/07/1803', 'dd/mm/yyyy'));

--DELETE (borrado filas)
DELETE ventas where codpro='S4';

-- Rollback -> lo contrario al commit, vuelve atras
rollback;

-- Actualizamos datos
UPDATE ventas SET cantidad = cantidad+100 where to_char(fecha, 'yyyy') = 2015;

UPDATE ventas SET fecha = fecha+90 where to_char(fecha, 'yyyy') = 2017;
UPDATE ventas SET fecha = sysdate where to_char(fecha, 'yyyy') = 2017;

-- Clausula IN and NOT IN
SELECT * from proveedor where ciudad in('Paris', 'Madrid', 'Londres');

-- Proveedores que trabajan en una ciudad donde se fabriquen piezas
SELECT * from proveedor where ciudad in (select ciudad from pieza);

SELECT codpro, nomPro, status, p.ciudad from proveedor p, pieza j where p.ciudad = j.ciudad;

-- Proveedores que no han vendido nunca la P4
SELECT DISTINCT codpro from ventas where codpro not in(select codpro from ventas where codpie = 'P4');
 
-- Codigo de proyecto que usan piezas grises
SELECT DISTINCT codpj from ventas where codpie in(select ventas.codpie from ventas, pieza where pieza.color = 'Gris');

-- Datos de TODOS los proyectos que usan piezas grises
SELECT * from proyectos where codpj in (SELECT DISTINCT codpj from ventas where codpie in(select ventas.codpie from ventas, pieza where pieza.color = 'Gris'));

-- Operador exists
-- SELECT * from where exists(Select * ...);
SELECT * from proveedor p where exists(SELECT * from ventas v where v.codpro = p.codpro);

-- Piezas nunca vendidas
SELECT * from pieza pi where not exists (SELECT * from ventas v where v.codpie = pi.codpie);

-- EJERCICIOS 19, 20, 21

-- EJERCICIO 19


