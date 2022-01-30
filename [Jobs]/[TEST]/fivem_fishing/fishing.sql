CREATE TABLE `fivem_fishing` (
	`fish` varchar(30) NOT NULL,
	`data` longtext,
	PRIMARY KEY (`fish`)
);

INSERT INTO `fivem_fishing` (`fish`) VALUES
    ('salmon'),
    ('trout'),
    ('char'),
    ('pike'),
    ('goldfish'),
    ('whitefish'),
    ('roach'),
    ('mackerel'),
    ('lobster'), 
    ('crawfish')
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('fishingrod','Canne à pêche', 5),
	('bait', 'appât', 25),
    ('fishingpermit','Permis de pêche', 5),
    ('salmon', 'saumon', 20),
    ('trout', 'truite', 20),
    ('char', 'carboniser', 20),
    ('pike', 'brochet', 20),
    ('goldfish', 'Poisson d\'or', 20),
    ('whitefish', 'poisson blanc', 20),
    ('roach', 'Gardon', 20),
    ('mackerel', 'maquereau', 20),
    ('lobster', 'homard', 20), 
    ('crawfish','écrevisse', 20)
;