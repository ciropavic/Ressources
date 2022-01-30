USE `essentialmode`;

INSERT INTO `jobs` (`name`, `label`) VALUES
	('salvage', 'Sauvetage')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('salvage', 0, 'employee', 'Plongeur', 80, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('contrat', 'Sauvetage', 15, 0, 1)
;
