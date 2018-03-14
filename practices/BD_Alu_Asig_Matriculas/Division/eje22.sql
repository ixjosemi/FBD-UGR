-- Alumnos que han aprobado todas las asignaturas del grado en Informática (Dos alternativas de solución)

 Select ape1,ape2,nombre from alumnos al where
      not exists (select a.asi# from asigna a where curriculum='Grado Informatica'  
                   minus
                  select m.codasi# from matricula m where al.dni=m.dni  
                                      and calificacion in ('ap','no','sb','mh'));
  
 Select ape1,ape2,nombre from alumnos al where
      not exists (select * from asigna a where curriculum='Grado Informatica'  and
         not exists (select * from matricula m where al.dni=m.dni and m.codasi#=a.asi# 
                     and calificacion in ('ap','no','sb','mh')));

--Cálculo WinRDBI:
query:= { A | alumnos(A) and not (exists As) (asigna(As) and As.curriculum='Grado Informatica' 
and not (exists M)( matricula(M) and  M.codasi=As.asi and M.dni=A.dni and 
(M.calificacion='ap' or M.calificacion='no' or M.calificacion='sb' or M.calificacion='mh')))};