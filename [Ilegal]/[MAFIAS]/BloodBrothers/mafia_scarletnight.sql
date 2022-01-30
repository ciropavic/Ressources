INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_bloodbrothers', 'test', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_bloodbrothers', 'test', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_bloodbrothers', 'test', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('bloodbrothers','test')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('bloodbrothers',0,'recruit','Recluta',0,'{}','{}'),
	('bloodbrothers',1,'officer','Oficial',0,'{}','{}'),
	('bloodbrothers',2,'sergeant','Sergento',0,'{}','{}'),
	('bloodbrothers',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('bloodbrothers',4,'boss','Comandante',0,'{}','{}')
;
