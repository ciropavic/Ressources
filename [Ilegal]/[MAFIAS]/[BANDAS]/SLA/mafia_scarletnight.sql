INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_sla', 'SLA', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_sla', 'SLA', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_sla', 'SLA', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('sla','SLA')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('sla',0,'recruit','Recluta',0,'{}','{}'),
	('sla',1,'officer','Oficial',0,'{}','{}'),
	('sla',2,'sergeant','Sergento',0,'{}','{}'),
	('sla',3,'lieutenant','Sub-Jefe',0,'{}','{}'),
	('sla',4,'boss','Comandante',0,'{}','{}')
;
