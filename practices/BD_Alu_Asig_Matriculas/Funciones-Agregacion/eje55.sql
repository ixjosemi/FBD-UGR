-- Alumnos de edad m�nima (compara con el ejercicio eje17)

select ape1,ape2,nombre,edad from alumnos where
 edad=(select min(edad) from alumnos);
 
-- C�lculo WIRDBI:
query:={ A | alumnos(A) and not (exists A1)(alumnos(A1) and A1.edad<A.edad)};


