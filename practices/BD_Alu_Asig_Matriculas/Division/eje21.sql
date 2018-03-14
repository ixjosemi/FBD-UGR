-- Asignaturas que tienen o han tenido  matriculados a todos los alumnos de Almer�a (Dos alternativas de soluci�n)

Select asi#,nombreas from asigna a where 
   not exists(select dni from alumnos  where provincia='Almeria'
               minus
              select m.dni from matricula m where m.codasi#=a.asi#);


Select asi#,nombreas from asigna a where 
   not exists(select * from alumnos al where al.provincia='Almeria' and 
       not exists (select * from matricula m where m.codasi#=a.asi# and m.dni=al.dni));
	   
--C�lculo WinRDBI:
query:= { As | asigna(As) and not (exists A) (alumnos(A) and A.provincia='Almeria' and not  (exists M)( matricula(M) and  M.codasi=As.asi and M.dni=A.dni))};
