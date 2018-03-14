--Alumnos matriculados de alguna asignatura optativa ordenados por apellidos y nombre (Dos soluciones)

select distinct alumnos.dni,ape1,ape2,nombre from matricula,alumnos
where alumnos.dni=matricula.dni 
      and codasi# in (select asi# from asigna where caracter='op') 
order by ape1,ape2,nombre;


select distinct dni,ape1,ape2,nombre from (matricula natural join alumnos) 
       join (select asi# from asigna where caracter='op') on codasi#=asi#
order by ape1,ape2,nombre;    	


-- Cálculo WinRDBI: Alumnos matriculados de alguna asignatura optativa
query:= { A.dni,A.ape1,A.ape2,A.nombre |  alumnos(A) and (exists As,M)(asigna(As) and matricula(M) and As.caracter='op' and  M.codasi=As.asi and M.dni=A.dni)};