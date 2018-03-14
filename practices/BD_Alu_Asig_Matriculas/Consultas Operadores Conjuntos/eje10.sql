-- Asignaturas de  m�s de 6 cr�ditos y que han tenido alumnos en el curso 2014-2015

select asi# from asigna where credt+credpr >6
    intersect
select codasi# from matricula where curso_academico='2014-2015';

-- C�lculo WinRDBI: Asignaturas de m�s de 5 cr�ditos te�ricos que han tenido alumnos en el curso 2014-2015
query:= { A |  asigna(A) and  A.credt>5 and (exists M)(matricula(M) and M.curso_academico='2014-2015' and M.codasi=A.asi)};