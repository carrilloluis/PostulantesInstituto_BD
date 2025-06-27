/*
@description Gestión de Postulantes a un Instituto
@author Luis Carrillo Gutiérrez
@date Enero, 2022
@version 0.0.2
*/

DROP TABLE IF EXISTS [Carrera Técnico Profesional];
CREATE TABLE IF NOT EXISTS [Carrera Técnico Profesional]
(
	[id] CHAR(36) NOT NULL,
	[denominación] VARCHAR(128) NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Período Académico];
CREATE TABLE IF NOT EXISTS [Período Académico]
(
	[id] CHAR(36) NOT NULL,
	[período] CHAR(4) NOT NULL, 
	[año] CHAR(4) NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Modalidad de Admisión];
CREATE TABLE IF NOT EXISTS [Modalidad de Admisión]
(
	[id] CHAR(36) NOT NULL,
	[denominación] VARCHAR(128) NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Datos de Contacto del Postulante];
CREATE TABLE IF NOT EXISTS [Datos de Contacto del Postulante]
(
	[id] CHAR(36) NOT NULL,
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos paternos] VARCHAR(64) NOT NULL,
	[apellidos maternos] VARCHAR(64) NULL,
	[género] CHAR(1) NOT NULL,
	[documento de identidad] CHAR(8) NOT NULL,
	[fecha de nacimiento] DATE NOT NULL,
	[creado en] DATETIME NOT NULL,
	[modificado por] CHAR(36) NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Postulante];
CREATE TABLE IF NOT EXISTS [Postulante]
(
	[id] CHAR(36) NOT NULL,
	[id de contacto] CHAR(36) NOT NULL REFERENCES [Datos de Contacto del Postulante](id),
	[id de carrera técnica] CHAR(36) NOT NULL REFERENCES [Carrera Técnico Profesional](id),
	[id de período académico] CHAR(36) NOT NULL REFERENCES [Período Académico](id),
	[id de modalidad de admisión] CHAR(36) NOT NULL REFERENCES [Modalidad de Admisión](id),
	[asistencia al examen de admisión] BOOLEAN NOT NULL,
	[puntaje] INTEGER UNSIGNED NOT NULL,
	[condición de ingreso] BOOLEAN NOT NULL,
	[estado] INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK([estado] >= 0 AND [estado] < 8),
	PRIMARY KEY(id)
) WITHOUT RowId;