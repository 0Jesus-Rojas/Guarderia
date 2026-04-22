/* ==== Mostrar la asistencia de los niños ====*/

select id_asistencia as Asistencia, nombre_nino as Nombre_Niño, fecha_asistencia as Fecha_Asistencia, FK_id_estado_asistencia as Estado 
From ninos
left join asistencia on id_ninos = FK_id_ninos;

/* ==== Mostrar asistencia de los docentes ====*/

select id_asistencia as Asistencia, nombre_docente as Nombre, apellidos_docente as Apellido,
fecha_asistencia as Fecha_Asistencia, FK_id_estado_asistencia as Estado
from docentes
left join asistencia on id_docentes = FK_id_docente;

/* ==== 1. mostrar nombres de los niños y el nombre del grupo ==== */

select nombre_nino as Nombre_Niño, apellido_nino as Apellidos_Niños, nombre_grupo as Grupo
from ninos
inner join grupos on id_grupo = FK_id_grupo;

/* ==== 2. mostrar los niños y el nombre del acudiente ====*/

select nombre_nino as Nombre_Niño, nombre_acudiente as Acudiente
from ninos
inner join acudiente on id_acudiente = id_ninos;

/* ==== 3. mostrar docentes y el tipo de documento ====*/

select nombre_docente as Nombre_Docente, tipo_documento as Documento
from docentes
inner join tipodocumento on id_tipo_documento = FK_tipo_documento;

/* ==== 4. mostrar los grupos y la actividad que realizan ====*/

select nombre_grupo as Grupo, descripcion as Actividad
from grupos 
inner join actividades on id_actividades = id_grupo;

/* ==== 5. mostrar la asistencia con estado ====*/

select fecha_asistencia, estado
from asistencia
inner join estadoasistencia on id_estado_asistencia = FK_id_estado_asistencia;

/* ==== 6. Mostrar niño y docente que le da clase ====*/

select nombre_nino as Niño, nombre_docente as Docente
from Ninos
inner join Grupos on FK_id_grupo = id_grupo
inner join docentes on FK_id_docente = id_docentes;

/* ==== 7. Mostrar niño, grupo y actividad ====*/

select nombre_nino as Niño, nombre_grupo as Grupo, descripcion_actividad as Actividad
from ninos
inner join Grupos on id_ninos = id_grupo 
inner join actividades on id_grupo = id_actividades;

/* ==== 8. Mostrar niño acudiente y parentesco ====*/

select nombre_nino as Niño, nombre_acudiente as Acudiente, parentesco
from ninos
inner join acudiente on id_acudiente = id_ninos;

/*==== 9. Mostrar niño la fecha de la asistencia y el estado ====*/

select id_asistencia as Asistencia, nombre_nino as Nombre_Niño, fecha_asistencia as Fecha_Asistencia, estado as Estado 
From ninos
left join asistencia on id_ninos = FK_id_ninos
join estadoasistencia on id_estado_asistencia = FK_id_estado_asistencia;

/* ==== 10. Mostrar niño y registro medico ====*/

select nombre_nino as Niño, observaciones as Registro_medicos, Alergias
from ninos
inner join registromedico on id_ninos = FK_id_ninos;

/* ==== 11.Mostrar niño, docente, acudiente y grupo ====*/

select nombre_nino as Niño, nombre_acudiente as Acudiente, nombre_grupo as Grupo, nombre_docente as Docente
from ninos
join grupos on FK_id_grupo = id_grupo
join docentes on id_docentes = FK_id_docente 
inner join acudiente on id_acudiente = id_ninos;

/* ==== 12. Mostrar asistencia completa niño, acudiente, docente, estado, fecha y grupo==== */

select nombre_nino as Niño, nombre_grupo as Grupo, nombre_acudiente as Acudiente, nombre_docente as Docente, fecha_asistencia as Fecha, estado
from ninos
inner join grupos on FK_id_grupo = id_grupo
join acudiente on id_ninos = id_acudiente
join docentes on id_docentes = FK_id_docente
join asistencia on id_ninos = FK_id_ninos
join estadoasistencia on id_estado_asistencia = FK_id_estado_asistencia;

/* ==== 13. Docente, grupo y actividad ====*/
select nombre_docente as Docente, nombre_grupo as Grupo, descripcion_actividad as Actividad
from docentes
inner join grupos on FK_id_docente = id_docentes
join grupoyactividad GA on GA.FK_id_grupo = id_grupo
join actividades on id_actividades = FK_id_actividades;

/* ==== 14. Niño, tipo de documento, documento y acudiente ====*/

select nombre_nino AS nombre, apellido_nino AS apellido, documento_nino, tipo_documento AS tipodocumento, nombre_acudiente as Acudiente
from ninos N
inner join tipodocumento on N.FK_id_tipo_documento = id_tipo_documento
inner join acudiente on id_acudiente = id_ninos;