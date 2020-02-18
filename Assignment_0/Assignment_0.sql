SET FOREIGN_KEY_CHECKS=OFF;
DROP TABLE IF EXISTS beverage;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS sells;

SET FOREIGN_KEY_CHECKS=ON;

create table `beverage` (
	`code` int,
    `name` varchar(15),
    `size` varchar(10),
    primary key(`code`)
);

INSERT INTO beverage values(121, 'Latte', 'medium');
INSERT INTO beverage values(140, 'Latte', 'large');

INSERT INTO beverage values(122, 'Tea', 'large');
INSERT INTO beverage values(131, 'Tea', 'small');

INSERT INTO beverage values(123, 'Cola', 'medium');
INSERT INTO beverage values(133, 'Cola', 'large');

INSERT INTO beverage values(124, 'Mocha', 'medium');
INSERT INTO beverage values(134, 'Mocha', 'large');

INSERT INTO beverage values(125, 'Pepsi', 'large');
INSERT INTO beverage values(135, 'Pepsi', 'medium');

INSERT INTO beverage values(126, 'Schweppes', 'small');
INSERT INTO beverage values(136, 'Schweppes', 'medium');

INSERT INTO beverage values(127, 'Dr Pepper', 'medium');

INSERT INTO beverage values(128, 'Fanta', 'large');

INSERT INTO beverage values(129, 'Sprite', 'medium');

INSERT INTO beverage values(130, 'Cappy', 'small');

INSERT INTO beverage values(132, 'Mountain Dew', 'large');

INSERT INTO beverage values(137, 'Nestea', 'medium');

INSERT INTO beverage values(138, 'Lemonade', 'small');

INSERT INTO beverage values(139, 'Budweiser', 'medium');

/* ---------------------------------------------------- */

create table `store` (
	`name` varchar(15) not null,
    `location` varchar (20),
    `telephone` numeric,
    primary key (`name`)
);

INSERT INTO store values('REMA', 'Horsens', '45252163');
INSERT INTO store values('Fotex', 'Aarhus C', '45252153');
INSERT INTO store values('Bilka', 'Randers', '45784163');
INSERT INTO store values('Netto', 'Aarhus V', '45284263');
INSERT INTO store values('Fakta', 'Horsens', '45215163');

/* ---------------------------------------------------- */

create table sells (
	`store_name` varchar(15),
    `code` int,
    `price` numeric,
    primary key (`store_name`, `code`)
);

ALTER TABLE sells
	ADD FOREIGN KEY (`store_name`) REFERENCES store(`name`);

Alter table sells
	add foreign key (`code`) references beverage(`code`);

INSERT INTO sells values('REMA', 122, '10');
INSERT INTO sells values('Fotex', 121, '15');
INSERT INTO sells values('REMA', 132, '20');
INSERT INTO sells values('Fotex', 122, '25');
INSERT INTO sells values('REMA', 123, '30');
INSERT INTO sells values('Fotex', 123, '40');
INSERT INTO sells values('Bilka', 121, '38');
INSERT INTO sells values('Netto', 121, '20');
INSERT INTO sells values('REMA', 124, '100');
INSERT INTO sells values('Fotex', 124, '80');
INSERT INTO sells values('REMA', 125, '5');
INSERT INTO sells values('Netto', 122, '5'); -- cheapest drink
INSERT INTO sells values('Netto', 123, '60');
INSERT INTO sells values('Fotex', 125, '200');
INSERT INTO sells values('REMA', 126, '85');
INSERT INTO sells values('Netto', 124, '60');
INSERT INTO sells values('Netto', 125, '65');
INSERT INTO sells values('Fotex', 126, '87');
INSERT INTO sells values('REMA', 127, '15');
INSERT INTO sells values('Bilka', 122, '20');
INSERT INTO sells values('REMA', 128, '15');
INSERT INTO sells values('Fakta', 121, '20');
INSERT INTO sells values('Fakta', 122, '15');
INSERT INTO sells values('Fakta', 123, '4');
INSERT INTO sells values('Fakta', 124, '15');
INSERT INTO sells values('Fakta', 140, '49'); -- FAKTA latte large, 49 dkk, horsens
INSERT INTO sells values('Fotex', 127, '15');
INSERT INTO sells values('Fotex', 128, '20');
INSERT INTO sells values('Fotex', 129, '15');
INSERT INTO sells values('Fotex', 130, '20');
INSERT INTO sells values('REMA', 129, '15');
INSERT INTO sells values('Fotex', 131, '20');
INSERT INTO sells values('Bilka', 123, '15');
INSERT INTO sells values('Bilka', 124, '20');
INSERT INTO sells values('Bilka', 125, '15');
INSERT INTO sells values('Bilka', 126, '20');
INSERT INTO sells values('Bilka', 140, '35'); -- bilka, large latte, 35 dkk, randers
INSERT INTO sells values('Fotex', 132, '10');
INSERT INTO sells values('REMA', 130, '15');
INSERT INTO sells values('Fotex', 133, '20');
INSERT INTO sells values('Netto', 126, '15');
INSERT INTO sells values('Fotex', 134, '20');
INSERT INTO sells values('REMA', 131, '15');
INSERT INTO sells values('Netto', 127, '20');
INSERT INTO sells values('REMA', 140, '40'); -- rema large latte, 40 dkk, horsens
INSERT INTO sells values('Fotex', 135, '20');
INSERT INTO sells values('Netto', 128, '15');
INSERT INTO sells values('Netto', 129, '20');
INSERT INTO sells values('Netto', 130, '15');
INSERT INTO sells values('Fotex', 136, '20');
INSERT INTO sells values('Fotex', 137, '15');
