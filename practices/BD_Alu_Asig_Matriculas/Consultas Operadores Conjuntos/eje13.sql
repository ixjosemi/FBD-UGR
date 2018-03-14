--Alumnos matriculados en asignaturas del último curso (Dos soluciones)

select distinct dni from matricula where 
codasi# in (select asi# from asigna where curso >=all (select asi.curso from asigna asi));


select distinct dni from asigna join matricula on (codasi#=asi#) where not exists (
   select * from asigna as2 where as2.curso>asigna.curso
);

-- Cálculo WinRDBI:
query:= { A |  alumnos(A) and  (exists As1,M )(asigna(As1) and matricula(M) and M.codasi=As1.asi and M.dni=A.dni 
and not (exists As2)(asigna(As2) and As2.curso>As1.curso))};