/*
@description Gestión de Postulantes a un Instituto
@author Luis Carrillo Gutiérrez
@date Enero, 2022
@version 0.0.1b
*/

DROP TABLE IF EXISTS `Carrera Técnico Profesional`;
DELIMITER //
	CREATE TABLE IF NOT EXISTS `Carrera Técnico Profesional`
	(
		`id` BINARY(16) NOT NULL PRIMARY KEY, -- GUID/UUID
		`denominación` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
		`estado` INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK(`estado` >= 0 AND `estado` < 8)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 //
DELIMITER ;

DROP TABLE IF EXISTS `Período Académico`;
DELIMITER //
	CREATE TABLE IF NOT EXISTS `Período Académico`
	(
		`id` BINARY(16) NOT NULL PRIMARY KEY,
		`período` CHAR(4) CHARACTER SET 'ascii' NOT NULL,
		`año` CHAR(4) CHARACTER SET 'ascii' NOT NULL,
		`estado` INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK(`estado` >= 0 AND `estado` < 8)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 //
DELIMITER ;

DROP TABLE IF EXISTS `Modalidad de Admisión`;
DELIMITER //
	CREATE TABLE IF NOT EXISTS `Modalidad de Admisión`
	(
		`id` BINARY(16) NOT NULL PRIMARY KEY,
		`denominación` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
		`estado` INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK(`estado` >= 0 AND `estado` < 8)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 //
DELIMITER ;


DROP TABLE IF EXISTS `Datos de Contacto del Postulante`;
DELIMITER //
	CREATE TABLE IF NOT EXISTS `Datos de Contacto del Postulante`
	(
		`id` BINARY(16) NOT NULL PRIMARY KEY,
		`nombres` VARCHAR(64) CHARACTER SET 'utf8mb4' NOT NULL,
		`apellidos paternos` VARCHAR(64) CHARACTER SET 'utf8mb4' NOT NULL,
		`apellidos maternos` VARCHAR(64) CHARACTER SET 'utf8mb4' NULL,
		`género` CHAR(1) CHARACTER SET 'ascii' NOT NULL,
		`documento de identidad` CHAR(8) CHARACTER SET 'ascii' NOT NULL,
		`fecha de nacimiento` DATE NOT NULL,
		`creado en` DATETIME NOT NULL,
		-- `modificado por` BINARY(16) NOT NULL,
		`estado` INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK(`estado` >= 0 AND `estado` < 8)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 //
DELIMITER ;


DROP TABLE IF EXISTS `Postulante`;
DELIMITER //
	CREATE TABLE IF NOT EXISTS `Postulante`
	(
		`id` INTEGER UNSIGNED NOT NULL PRIMARY KEY,
		`id de contacto` BINARY(16) NOT NULL ,
		`id de carrera técnica` BINARY(16) NOT NULL ,
		`id de período académico` BINARY(16) NOT NULL ,
		`id de modalidad de admisión` BINARY(16) NOT NULL ,
		`asistencia al examen de admisión` BOOLEAN NOT NULL,
		`puntaje` INTEGER UNSIGNED NOT NULL,
		`condición de ingreso` BOOLEAN NOT NULL,
		`estado` INTEGER UNSIGNED NOT NULL DEFAULT 7 CHECK(`estado` >= 0 AND `estado` < 8)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 //
DELIMITER ;

/*
REFERENCES [Datos de Contacto del Postulante](id)
REFERENCES [Carrera Técnico Profesional](id)
REFERENCES [Período Académico](id)
REFERENCES [Modalidad de Admisión](id)
*/