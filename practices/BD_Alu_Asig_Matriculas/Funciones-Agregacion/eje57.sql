--Alumnos matriculados de m�s de 4 asignaturas en el curso acad�mico 2016-2017

select ape1,ape2,nombre,edad from alumnos where 4<any(select count(*) from matricula where alumnos.dni=matricula.dni
and curso_academico='2016-2017');


select ape1,ape2,nombre,edad from alumnos where (select count(*) from matricula where alumnos.dni=matricula.dni
and curso_academico='2016-2017') >4;

-- C�lculo WinRDBI: Alumnos matriculados de m�s de 1 asignatura en el curso acad�mico 2016-2017

query:= { A |  alumnos(A) and (exists M1,M2)(matricula(M1) and matricula(M2)  and M1.curso_academico='2016-2017' and M2.curso_academico='2016-2017' and M1.dni=A.dni and M2.dni=A.dni and M1.codasi<>M2.codasi)  };



