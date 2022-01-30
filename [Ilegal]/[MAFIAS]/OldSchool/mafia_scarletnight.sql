INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_oldschool', 'Old School', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_oldschool', 'Old School', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_oldschool', 'Old School', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('oldschool','Old School')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('oldschool',0,'recruit','Recluta',0,'{}','{}'),
	('oldschool',1,'officer','Oficial',0,'{}','{}'),
	('oldschool',2,'sergeant','Sergento',0,'{}','{}'),
	('oldschool',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('oldschool',4,'boss','Comandante',0,'{}','{}')
;
