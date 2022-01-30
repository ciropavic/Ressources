INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thesystem', 'The Systems', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thesystem', 'The Systems', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thesystem', 'The Systems', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('thesystem','The Systems')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thesystem',0,'recruit','Recluta',0,'{}','{}'),
	('thesystem',1,'officer','Oficial',0,'{}','{}'),
	('thesystem',2,'sergeant','Sergento',0,'{}','{}'),
	('thesystem',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('thesystem',4,'boss','Comandante',0,'{}','{}')
;
