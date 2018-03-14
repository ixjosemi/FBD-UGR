--c�digo y nombre de asignaturas en las que no hay ning�n alumno matriculado

select asi#,nombreas from asigna where not exists (select * from matricula where asi#=codasi#);


select asi#,nombreas from asigna --asinaturas
  minus -- menos en las que hay matr�culas
select asi#,nombreas from asigna join matricula on (codasi#=asi#);


select asi#,nombreas from asigna
  minus
select asi#,nombreas from asigna,matricula where asi#=codasi#;

-- C�lculo WinRDBI: 
query:= { A.asi,A.nombreas |  asigna(A) and not (exists M)(matricula(M) and M.codasi=A.asi)};

