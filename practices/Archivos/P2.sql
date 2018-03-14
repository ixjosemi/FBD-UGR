SELECT NomPro, Status from proveedor where ciudad = 'Madrid';

SELECT codpro from ventas where codpie = 'P2';

SELECT DISTINCT codpro from ventas where codpie = 'P2';

SELECT * from ventas where cantidad between 200 and 500;

SELECT nomPie from pieza where nomPie like '%a%';

SELECT DISTINCT codpj from ventas where codpro = 'S3';

SELECT * from proveedor where status >= 2 AND ciudad = 'Paris';

SELECT * from ventas, proveedor where ventas.codpro = proveedor.codpro;

SELECT DISTINCT * from ventas, proyectos where ventas.codpj = proyectos.codpj;

SELECT DISTINCT pompj from ventas, proyectos where ventas.codpj = proyectos.codpj
    and codpro = 'S2';

SELECT DISTINCT nompie from pieza, ventas where pieza.codpie = ventas.codpie 
    and cantidad > 1000;

SELECT DISTINCT nompie,pieza.codpie from pieza, ventas where pieza.codpie = ventas.codpie 
    and cantidad > 1000;
    
  -- EJERCICIO 3.3
SELECT * from pieza where color in ('Gris', 'Rojo') and ciudad = 'Madrid';

-- EJERCICIO 3.4
SELECT * from ventas where cantidad between 200 and 300;

-- EJERCICIO 3.5
SELECT * from pieza where nomPie = 'Tornillo';

-- EJERCICIO 3.12
SELECT v.codpie, v.codpro, v.codpj, s.ciudad, p.ciudad, j.ciudad 
    from ventas v, pieza p, proveedor s, proyectos j where
    v.codpro = s.codpro and v.codpie = p.codpie and v.codpj = j.codpj and 
    s.ciudad = p.ciudad and p.ciudad = j.ciudad;

SELECT codpie, codpro, codpj, s.ciudad, p.ciudad, j.ciudad 
    from pieza p, proveedor s, proyectos j where
    s.ciudad = p.ciudad and p.ciudad = j.ciudad;


COMMIT;