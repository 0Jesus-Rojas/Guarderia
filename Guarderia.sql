create database Guarderia;
use Guarderia;

create table TipoDocumento(
	id_tipo_documento int primary key null AUTO_INCREMENT,
    tipo_documento varchar(55)
);

create TABLE EstadoAsistencia(
	id_estado_asistencia INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	estado VARCHAR(45) NOT NULL
);

create TABLE Ambiente(
	id_ambiente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	numero_ambiente VARCHAR(45) NOT NULL
);

create TABLE Actividades(
	id_actividades INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descripcion_actividad VARCHAR(45) NOT NULL,
	fecha_actividad DATE NOT NULL
);

create TABLE Acudiente(
	id_acudiente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre_acudiente VARCHAR(45) NULL,
	apellidos_acudiente VARCHAR(45) NULL,
    parentesco VARCHAR(45) NULL,
	documento_acudiente VARCHAR(45) NULL,
	telefono_acudiente VARCHAR(45) NULL, 
    FK_tipo_documento INT NULL,
    CONSTRAINT FK_documento_acudiente
		FOREIGN KEY (FK_tipo_documento) REFERENCES TipoDocumento(id_tipo_documento)
);

create TABLE docentes(
	id_docentes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre_docente VARCHAR(45) NOT NULL,
	apellidos_docente VARCHAR(45) NOT NULL, 
    FK_tipo_documento int null,
    CONSTRAINT FK_documento_docente
		FOREIGN KEY (FK_tipo_documento) REFERENCES TipoDocumento (id_tipo_documento)
);

create TABLE Grupos(
	id_grupo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	cupos INT NOT NULL,
	nombre_grupo VARCHAR(45) NOT NULL,
	FK_id_docente INT,
	FK_id_ambiente INT,
	CONSTRAINT FK_docente_grupo
		FOREIGN KEY (FK_id_docente) REFERENCES docentes(id_docentes),
	CONSTRAINT FK_ambiente_grupo
		FOREIGN KEY (FK_id_ambiente) REFERENCES Ambiente(id_ambiente)
);

create TABLE Ninos(
	id_ninos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre_nino VARCHAR(100) NOT NULL,
	apellido_nino VARCHAR(100) NOT NULL,
	codigo_unico VARCHAR(45) NOT NULL,
	documento_nino VARCHAR(45),
	FK_id_grupo INT,
    FK_id_tipo_documento INT null,
	CONSTRAINT FK_grupo_Ninos
		FOREIGN KEY(FK_id_grupo) REFERENCES Grupos(id_grupo),
	CONSTRAINT FK_documento_Ninos
		FOREIGN KEY(FK_id_tipo_documento) REFERENCES TipoDocumento (id_tipo_documento)	
);

create TABLE RegistroMedico(
	id_registro_medico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	observaciones VARCHAR(45) NOT NULL,
	Alergias VARCHAR(45) NOT NULL,
	contacto_emergencia VARCHAR(45) NOT NULL,
	FK_id_ninos INT,
	CONSTRAINT FK_ninos_Registro
		FOREIGN KEY(FK_id_ninos) REFERENCES Ninos(id_ninos)
);

create TABLE Asistencia(
	id_asistencia INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	fecha_asistencia DATE NOT NULL,
	excusa VARCHAR(45) NULL,
	FK_id_ninos INT NULL,
	FK_id_estado_asistencia INT,
    FK_id_docente INT,
	CONSTRAINT FK_ninos_Asistencia
		FOREIGN KEY(FK_id_ninos) REFERENCES Ninos(id_ninos),
	CONSTRAINT FK_estado_asistencia
		FOREIGN KEY(FK_id_estado_asistencia) REFERENCES EstadoAsistencia(id_estado_asistencia),
	CONSTRAINT FK_docente_asistencia
		FOREIGN KEY(FK_id_docente) REFERENCES docentes(id_docentes)
);

create TABLE GrupoYActividad(
	FK_id_grupo INT NULL,
	FK_id_actividades INT NULL,
	CONSTRAINT FK_grupo_actividad
		FOREIGN KEY(FK_id_grupo) REFERENCES Grupos(id_grupo),
	CONSTRAINT FK_actividades_grupo
		FOREIGN KEY(FK_id_actividades) REFERENCES Actividades(id_actividades)
);

create TABLE NinosYAcudientes(
	FK_id_ninos INT NULL,
	FK_id_acudientes INT NULL,
	CONSTRAINT FK_ninos_acudiente
		FOREIGN KEY(FK_id_ninos) REFERENCES Ninos(id_ninos),
	CONSTRAINT FK_acudientes_ninos
		FOREIGN KEY(FK_id_acudientes) REFERENCES Acudiente(id_acudiente)
);

insert into TipoDocumento(id_tipo_documento, tipo_documento)
values (1, 'Cedula de ciudadania'), (2, 'Cedula de extranjeria'), (3, 'PPT'), (4, 'Tarjeta de identidad');

insert into EstadoAsistencia (id_estado_asistencia, estado)
values (1, 'Asistio'), (2, 'No Asistio'), (3, 'Excusa');

insert into Ambiente (id_ambiente, numero_ambiente)
value (1, 'A_1'), 
(2, 'A_2'),
(3, 'B_3'),
(4, 'B_4'),
(5, 'C_5'),
(6, 'C_6'),
(7, 'D_7'),
(8, 'D_8'),
(9, 'E_9'),
(10, 'E_10');

insert into Actividades (id_actividades, descripcion_actividad, fecha_actividad)
value (1, 'Actividad_recreativa', '2026-05-25'), 
(2, 'Lectura', '2026-05-28'), 
(3, 'Jean_day', '2026-06-05'),
(4, 'juegos sensoriales', '2026-06-06'),
(5, 'motricidad fina y gruesa', '2026-06-06'),
(6, 'juegos cognitivos', '2026-06-06'),
(7, 'Dibujo', '2026-06-06'),
(8, 'Escritura', '2026-06-06'),
(9, 'Karaoke', '2026-06-06'),
(10, 'Juegos de mesa', '2026-06-06');

insert into Acudiente (id_acudiente, nombre_acudiente, apellidos_acudiente, parentesco, documento_acudiente, telefono_acudiente, FK_tipo_documento)
values (1, 'Pepe', 'Ramirez', 'Padre', 1002558749, 3004567891, 1),
(2, 'Maria', 'Figueroa', 'Madre', 1007894561, 3009876541, 1),
(3, 'Pablo', 'Rodriguez', 'Padre', 1002482629, 3004563214, 1),
(4, 'Chucho', 'Ramirez', 'Padre', 1007845963, 3009876542, 2),
(5, 'Yolanda', 'Guerrero', 'Madre', 100123421, 3001237894, 1),
(6, 'Cristian', 'Valero', 'Padre', 10012351249, 3005647813, 2),
(7, 'Mencho', 'Vivont', 'Padre', 1000981234, 3004569872, 1),
(8, 'John', 'Rambo', 'Padre', 10012334645, 3004456813, 1),
(9, 'Ximena', 'Valero', 'Madre', 100419915, 3001837594, 3),
(10, 'Fernanda', 'Rojas', 'Madre', 100789546, 3001837295, 1);

insert into docentes (id_docentes, nombre_docente, apellidos_docente, FK_tipo_documento)
value (1, 'Juan', 'Ramirez', 1), 
(2, 'Marina', 'Jalizco', 1),
(3, 'Pepe', 'Pico', 1),
(4, 'Pipe', 'Malo', 2),
(5, 'Marco', 'Solis', 1),
(6, 'Jose', 'Jose', 2),
(7, 'Luis', 'Posada', 1),
(8, 'Arthur', 'Morgan', 2),
(9, 'John', 'Marston', 1),
(10, 'Leon', 'Kennedy', 3);

insert into Grupos (cupos, nombre_grupo, FK_id_docente, FK_id_ambiente)
value(5, 'Grupo Jirafa', 1, 1), 
(5, 'Grupo Dinamita', 2, 2),
(5, 'Grupo FARC', 3, 3),
(5, 'Grupo ELN', 4, 4),
(5, 'Grupo M-19', 5, 5),
(5, 'Grupo Paras', 6, 6),
(5, 'Grupo Uribe', 7, 7),
(5, 'Grupo Petro', 8, 8),
(5, 'Grupo Stalin', 9, 9),
(5, 'Grupo Homero', 10, 10);

insert into Ninos (id_ninos, nombre_nino, apellido_nino, codigo_unico, documento_nino, FK_id_grupo, FK_id_tipo_documento)
value (1, 'Juancho', 'Ramirez', 'A1', 1002356, 1, 4),
(2, 'Pepe', 'Pitufo', 'A2', 1002356, 1, 4),
(3, 'Moncho', 'Wey', 'A3', 1002356, 1, 4),
(4, 'Arley', 'Montañez', 'A4', 1002356, 1, 4),
(5, 'Cristian', 'Tovar', 'A5', 1002356, 1, 4),
(6, 'Dylan', 'Trujillo', 'B1', 1002356, 2, 4),
(7, 'Nelson', 'Ocampo', 'B2', 1002356, 2, 4),
(8, 'Andriy', 'Guzman', 'B3', 1002356, 2, 4),
(9, 'Jeffry', 'Ramirez', 'B4', 1002356, 2, 4),
(10, 'Pelu', 'Vocero', 'B5', 1002356, 2, 4);

insert into RegistroMedico (id_registro_medico, observaciones, Alergias, contacto_emergencia, FK_id_ninos)
value (1, 'Sin Observaciones', 'Polen', 15978944, 1),
(2, 'Asma', 'Polen',  15978944, 2),
(3, 'Sin Observaciones', 'Latex', 15978944,  3),
(4, 'Sin Observaciones', 'Sin alergias', 15978944,  4),
(5, 'Sin Observaciones', 'Sin alergias', 15978944,  5),
(6, 'Baja presion', 'Mariscos', 15978944,  6),
(7, 'TDAH', 'Sin alergias', 15978944,  7),
(8, 'Sin Observaciones', 'Sin alergias', 15978944,  8),
(9, 'Sin Observaciones', 'Sin alergias', 15978944,  9),
(10, 'Sin Observaciones', 'Sin alergias', 15978944,  10);

insert into Asistencia(id_asistencia, fecha_asistencia, FK_id_ninos, FK_id_estado_asistencia, excusa, FK_id_docente)
value (1, '2026-04-20', 1, 1, 'N/A', 1),
(2, '2026-04-20', 2, 1, 'N/A', 2),
(3, '2026-04-20', 3, 1, 'N/A', 3),
(4, '2026-04-20', 4, 2, 'N/A', 4),
(5, '2026-04-20', 5, 3, 'Cita medica', 5),
(6, '2026-04-20', 6, 2, 'N/A', 6),
(7, '2026-04-20', 7, 2, 'N/A', 7),
(8, '2026-04-20', 8, 1, 'N/A', 8),
(9, '2026-04-20', 9, 3, 'Asuntos Familiares', 9),
(10, '2026-04-20', 10, 1, 'N/A', 10);

insert into GrupoYActividad (FK_id_grupo, FK_id_actividades)
values (1,1) , (1,3) , (1,5) , (1,7), (1,9), (2,2), (2,4), (2,6), (2,8), (2,10);

insert into NinosYAcudientes (FK_id_ninos, FK_id_acudientes)
values(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);