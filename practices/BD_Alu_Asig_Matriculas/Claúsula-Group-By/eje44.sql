-- Encontrar los nombres de las asignaturas que se han impartido en el curso 2014-2015 junto con el número de alumnos matriculados en ellas 


select nombreas,count(*) from asigna, matricula where asigna.asi#=matricula.codasi# and
curso_academico='2014-2015' group by nombreas;



-- Encontrar los nombres de las asignaturas que tienen mayor número de alumnos en el 2014-2015


select nombreas,count(*) from asigna,matricula 
where asigna.asi#=matricula.codasi# and
curso_academico='2014-2015' 
group by nombreas 
having count(*)>=all(select count(*) from matricula ma
where ma.curso_academico='2014-2015' group by ma.codasi#);



-- Otra forma


select nombreas,count(*) from asigna,matricula where asigna.asi#=matricula.codasi# and
curso_academico='2014-2015' 
group by nombreas 
having count(*)=(select max(count(*)) from matricula ma
where ma.curso_academico='2014-2015' group by ma.codasi#);