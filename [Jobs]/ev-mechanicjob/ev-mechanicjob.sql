
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mechanic', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mécano')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'recrue','Recrue',12,'{}','{}'),
	('mechanic',1,'novice','Novice',24,'{}','{}'),
	('mechanic',2,'experimente','Experimente',36,'{}','{}'),
	('mechanic',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('mechanic',4,'boss','Patron',0,'{}','{}')
;