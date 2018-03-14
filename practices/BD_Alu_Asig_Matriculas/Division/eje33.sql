--Alumnos becarios matriculados de todas las asignaturas de más de seis créditos (Dos alternativas de solución)

select ape1,ape2,nombre from alumnos al where beca='si' and not exists
      (select * from asigna  a where credt+credpr>6 and 
            not exists (select * from matricula m where al.dni=m.dni and a.asi#=m.codasi#));
            
select ape1,ape2,nombre from alumnos al where beca='si' and not exists
      (select a.asi# from asigna  a where credt+credpr>6 
         minus
       select m.codasi# from matricula m where al.dni=m.dni);

--Cálculo WinRDBI: Alumnos becarios matriculados de todas las asignaturas de más de seis créditos teóricos
query:= { A | alumnos(A) and A.beca='si' and not (exists As) (asigna(As) and As.credt>6 
and not (exists M)( matricula(M) and  M.codasi=As.asi and M.dni=A.dni ))};