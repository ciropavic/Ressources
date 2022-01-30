INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thefamilie', 'test', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thefamilie', 'test', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thefamilie', 'test', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('thefamilie','test')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thefamilie',0,'recruit','Recluta',0,'{}','{}'),
	('thefamilie',1,'officer','Oficial',0,'{}','{}'),
	('thefamilie',2,'sergeant','Sergento',0,'{}','{}'),
	('thefamilie',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('thefamilie',4,'boss','Comandante',0,'{}','{}')
;
