-- Asignaturas que tienen o han tenido matriculados m�s de 25 alumnos, con independencia del curso acad�mico

select asi#,nombreas from asigna where 25<any(select count(*) from matricula where asi#=codasi#);

select asi#,nombreas from asigna where (select count(*) from matricula where asi#=codasi#)>25;

