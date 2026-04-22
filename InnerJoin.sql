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