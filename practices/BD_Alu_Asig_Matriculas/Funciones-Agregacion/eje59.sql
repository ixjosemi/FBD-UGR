--Asignaturas con mayor n�mero de cr�ditos

select asi#,nombreas,credt+credpr creditos from asigna where
 (credt+credpr)=(select max(credt+credpr) from asigna);
 


