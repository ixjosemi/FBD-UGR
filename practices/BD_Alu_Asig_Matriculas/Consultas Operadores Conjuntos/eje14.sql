-- DNI nombre y apellidos de alumnos matriculados de la asignatura 'mabd1'

select dni,ape1,ape2,nombre from alumnos
   where exists (select * from matricula  where codasi#='mab1' and alumnos.dni=matricula.dni);
   
select distinct dni,ape1,ape2,nombre 
from alumnos natural join (select dni from matricula where codasi#='mab1');

-- Cálculo WinRDBI:
query:= { A.nombre,A.ape1,A.ape2 |  alumnos(A) and  (exists M )(matricula(M) and M.codasi='mab1' and M.dni=A.dni)};

-- DNI nombre y apellidos de alumnos no matriculados de la asignatura 'mabd1'

select dni,ape1,ape2,nombre from alumnos
   where not exists (select * from matricula  where codasi#='mab1' and alumnos.dni=matricula.dni);
   
   
select dni,ape1,ape2,nombre from alumnos --Todos
  minus -- menos los que estan matriculados en 'mab1'
select dni,ape1,ape2,nombre from alumnos natural join (select dni from matricula where codasi#='mab1');

-- Cálculo WinRDBI:
query:= { A.nombre,A.ape1,A.ape2 |  alumnos(A) and not (exists M )(matricula(M) and M.codasi='mab1' and M.dni=A.dni)};

