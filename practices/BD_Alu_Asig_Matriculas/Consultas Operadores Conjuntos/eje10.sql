-- Asignaturas de  más de 6 créditos y que han tenido alumnos en el curso 2014-2015

select asi# from asigna where credt+credpr >6
    intersect
select codasi# from matricula where curso_academico='2014-2015';

-- Cálculo WinRDBI: Asignaturas de más de 5 créditos teóricos que han tenido alumnos en el curso 2014-2015
query:= { A |  asigna(A) and  A.credt>5 and (exists M)(matricula(M) and M.curso_academico='2014-2015' and M.codasi=A.asi)};