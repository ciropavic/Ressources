INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_yakuza', 'Yakuza', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_yakuza', 'Yakuza', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_yakuza', 'Yakuza', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('yakuza','Yakuza')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('yakuza',0,'recruit','Recluta',0,'{}','{}'),
	('yakuza',1,'officer','Oficial',0,'{}','{}'),
	('yakuza',2,'sergeant','Sergento',0,'{}','{}'),
	('yakuza',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('yakuza',4,'boss','Comandante',0,'{}','{}')
;
