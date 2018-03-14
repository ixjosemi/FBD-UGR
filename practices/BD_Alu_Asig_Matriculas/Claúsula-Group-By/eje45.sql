--Muestra número de alumnos por asignatura y curso académico ordenados por asignatura y número de alumnos



Select curso_academico,codasi#,count(*) from matricula group by codasi#,curso_academico order by codasi#, count(*) desc;




-- Mostrar para cada asignatura el número máximo de alumnos que ha tenido y el curso en que ha ocurrido


Select codasi#,curso_academico,count(*) from matricula group by codasi#,curso_academico 
having 
count(*)= (select max(count(*)) from  matricula ma where matricula.CODASI# = ma.CODASI#  group by ma.codasi#,ma.curso_academico) 
order by matricula.CODASI#;