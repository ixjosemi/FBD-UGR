-- 3.1
SELECT ciudad from proyectos;

-- 3.2
select DISTINCT codpie from ventas;

-- 3.3
select codpie from pieza where (ciudad = 'Madrid') and (color = 'Gris') or (color = 'Rojo');

-- 3.4
select codpie from ventas where cantidad between 200 and 300;

-- 3.5
select codpie from pieza where nompie like 'Tornillo';

-- 3.12
(SELECT codpro, codpie, codpj from proveedor, proyectos, pieza where
    proyectos.ciudad = pieza.ciudad and proyectos.ciudad = proveedor.ciudad) intersect
    (SELECT codpro, codpie, codpj from ventas);
    
-- 3.13
SELECT pieza.codpie from ventas, pieza, proveedor where(ventas.codpro = proveedor.codpro and
ventas.codpie = pieza.codpie and proveedor.ciudad = 'Madrid');

-- 3.14
SELECT pieza.ciudad, pieza.codpie from ventas, pieza, proveedor, proyectos where
    (ventas.codpro = proveedor.codpro and ventas.codpie = pieza.codpie and
    ventas.codpj = proyectos.codpj and proveedor.ciudad = proyectos.ciudad);
    
-- 3.8
SELECT proyectos.codpj from ventas, proyectos where(ventas.codpj = proyectos.codpj
and proyectos.codpj = 'S1') minus (select codpj from ventas where codpj != 'S1');

-- 3.19
SELECT DISTINCT codpie from ventas where codpro in(select codpro from proveedor where
ciudad = 'Madrid');

-- 3.20
SELECT * from proyectos where ciudad in(select ciudad from pieza);

-- 3.21 
SELECT codpj from ventas where codpie not in(select pieza.codpie from pieza, ventas, proveedor
where (ventas.codpie = pieza.codpie and ventas.codpro = proveedor.codpro and pieza.color = 'Rojo' and proveedor.ciudad = 'Londres'));

-- 3.22 
select codpie from pieza where peso > all (select peso from pieza where nompie = 'tornillo');

-- 3.23
select * from pieza where peso <= all (select peso from pieza);

-- 3.26
select count(*) from ventas where cantidad > 1000;

-- 3.27
select codpie, max(peso) from pieza group by codpie;

-- 3.28
select codpie from pieza where peso >= all(select peso from pieza);

-- VENTAS TOTALES POR AÑO
select to_char(fecha, 'YYYY'), sum(cantidad) from ventas group by to_char(fecha, 'YYYY') order by to_char(fecha, 'YYYY');

-- 3.35
SELECT proveedor.nompro, sum(cantidad) from proveedor, ventas where proveedor.codpro = ventas.codpro group by nompro
having sum(cantidad) > 1000;

-- 3.36
Select codpie, max(cantidad) from ventas group by codpie;

-- 3.38
select avg(cantidad), to_char(fecha, 'mm') from ventas group by to_char(fecha, 'mm');

-- 3.42
select codpro, sum(cantidad) from ventas group by codpro having
sum(cantidad) > (select sum(cantidad) from ventas where codpro = 'S1');

-- 3.43
select codpro, sum(cantidad) from ventas group by codpro
having sum(cantidad) >= all(select sum(cantidad) from ventas group by codpro);


-- 3.45
select codpro from ventas group by codpro having count(*) >= 5;

-- 3.49
select codpro, avg(cantidad) from ventas where codpie = 'P3' group by codpro;

-- 3.52
select codpro, avg(cantidad), to_char(fecha, 'yyyy') from ventas
group by (codpro, to_char(fecha, 'yyyy'));

-- 3.53
Select ventas.codpro from ventas, pieza where pieza.color = 'Rojo' and ventas.codpie = pieza.codpie
group by ventas.codpro having count(*) = 1;

-- 3.56
select ventas.codpro from ventas, pieza where pieza.color = 'Rojo' and
ventas.codpie = pieza.codpie group by ventas. codpro having count(*) > 1;

-- 3.58
select distinct codpro from ventas where codpie = 'P1' minus
select distinct codpro from ventas where codpie != 'P1';

-- DIVISION
-- piezas vendidas por los mismos proveedores a todos los proyectos
select codpro, codpie from ventas v1 where not exists((select codpj from proyectos)
minus (select codpj from ventas v2 where v1.codpro = v2.codpro and v1.codpie = v2.codpie));