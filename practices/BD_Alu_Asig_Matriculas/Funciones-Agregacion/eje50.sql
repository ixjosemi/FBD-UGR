-- Nota media y desviaci�n t�pica de acceso de los alumnos varones

select round(avg(nota),2), round(stddev(nota),2) from alumnos where sexo='v';

