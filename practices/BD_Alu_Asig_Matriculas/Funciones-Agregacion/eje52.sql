--N�mero de instacias de matr�cula que tienen notas no nulas (es decir en las que se han presentado los alumnos)

Select count(notas) from matricula;


-- Otra forma de calcular

select count(*) from matricula where calificacion<>'np';
