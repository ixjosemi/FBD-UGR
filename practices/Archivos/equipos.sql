    CREATE TABLE equipos(
    codE char(3) primary key,
    nombreE varchar2(30) not null,
    localidad varchar2(30) not null,
    entrenador varchar2(30) not null,
    fecha_crea date
);

CREATE TABLE jugadores(
  codJ char(3) primary key not null,
  codE char(3) constraint codE_clave_externa_equipos references equipos(codE),
  nombreJ char(30) not null
  );

CREATE TABLE encuentros(
   EQ1 char(3) not null,
   EQ2 char(3) not null,
   fecha date not null,
   RES1 number CHECK (RES1 > 0),
   RES2 number CHECK (RES2 > 0),
   constraint clave_primaria_encuentros primary key (EQ1, EQ2)
   );

CREATE TABLE faltas(
  codJ char(3),
  EQ1 char(3),
  EQ2 char(3),
  num number check (num >= 0 and num <= 5),
  FOREIGN KEY(codJ) REFERENCES jugadores(codJ),
  FOREIGN KEY(EQ1, EQ2) REFERENCES encuentros(EQ1, EQ2),
  PRIMARY KEY(codJ, EQ1, EQ2)
  );

DROP TABLE FALTAS;
DROP TABLE ENCUENTROS;

describe opc.equipos;
describe opc.jugadores;
describe encuentros;
describe opc.faltas;

INSERT INTO equipos (SELECT * from opc.equipos);
INSERT INTO jugadores (SELECT * from opc.jugadores);
INSERT INTO encuentros (SELECT * from opc.encuentros);
INSERT INTO faltas (SELECT * from opc.faltas);

select * from opc.faltas;
select * from faltas;
Select * from jugadores;


COMMIT;

-- 3.60
SELECT * from encuentros;
Select nombreE from equipos order by nombreE;
Select  nombreJ from jugadores order by nombreJ;

select * from faltas;
select codJ from faltas where num = 0;

-- 3.63
select codJ from jugadores where codE in(SELECT codE from jugadores where codJ in
    (select codJ from jugadores where codJ = 'B1'));

-- 3.64
select j.codJ, eq.localidad from jugadores j, equipos eq where j.codE = eq.codE;

-- 3.65
select eq.eq1 from encuentros eq where exists(select * from encuentros en where
  eq.eq1 = en.eq1 and en.res1 < en.res2);

-- 3.66
select DISTINCT eq1, eq2 from encuentros eq where eq1 = eq2 and eq.res1 < eq.res2 or eq.res1 > eq.res2;

--3.67
select DISTINCT eq.eq1 from encuentros eq where exists(select eq1 from encuentros where res1> res2
   minus (select eq1 from encuentros where res1 < res2));
