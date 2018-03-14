--código y nombre de asignaturas en las que no hay ningún alumno matriculado

select asi#,nombreas from asigna where not exists (select * from matricula where asi#=codasi#);


select asi#,nombreas from asigna --asinaturas
  minus -- menos en las que hay matrículas
select asi#,nombreas from asigna join matricula on (codasi#=asi#);


select asi#,nombreas from asigna
  minus
select asi#,nombreas from asigna,matricula where asi#=codasi#;

-- Cálculo WinRDBI: 
query:= { A.asi,A.nombreas |  asigna(A) and not (exists M)(matricula(M) and M.codasi=A.asi)};

