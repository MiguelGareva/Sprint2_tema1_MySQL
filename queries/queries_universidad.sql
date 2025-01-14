/*Queries universidad -1er bloque-*/
/*1*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre ASC;
/*2*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
/*3*/SELECT * FROM persona WHERE tipo = "alumno" AND fecha_nacimiento LIKE "%1999%";
/*4*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%k";
/*5*/SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
/*6*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
/*7*/SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = "26902806M";
/*8*/SELECT departamento.nombre, asignatura.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";
/*9*/SELECT DISTINCT apellido1, apellido2, nombre FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019 AND persona.tipo = "alumno";
/*2º bloque -LEFT JOIN/RIGHT JOIN-*/
/*1*/SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre AS nombre_profesor FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = "profesor" ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
/*2*/SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = "profesor" AND departamento.id IS NULL;
/*3*/SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
/*4*/SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = "profesor" AND asignatura.id_profesor IS NULL;
/*5*/SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL;
/*6*/SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id Is NULL;
/*3er bloque -CONSULTAS RESUMEN-*/
/*1*/