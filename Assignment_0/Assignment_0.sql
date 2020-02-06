DROP TABLE IF EXISTS Beverage;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Sells;

create table `Beverage` (
	`code` int,
    `name` varchar(15),
    `size` varchar(10)
);

INSERT INTO Beverage values(121, 'Latte', 'medium');
INSERT INTO Beverage values(122, 'Tea', 'large');
INSERT INTO Beverage values(123, 'Cola', 'small');
INSERT INTO Beverage values(124, 'Mocha', 'medium');
INSERT INTO Beverage values(125, 'Pepsi', 'large');
INSERT INTO Beverage values(126, 'Schweppes', 'small');
INSERT INTO Beverage values(127, 'Dr Pepper', 'medium');
INSERT INTO Beverage values(128, 'Fanta', 'large');
INSERT INTO Beverage values(129, 'Sprite', 'medium');
INSERT INTO Beverage values(130, 'Cappy', 'small');

INSERT INTO Beverage values(131, 'Rauch', 'small');
INSERT INTO Beverage values(132, 'Mountain Dew', 'large');
INSERT INTO Beverage values(133, 'Cola', 'medium');
INSERT INTO Beverage values(134, 'Mocha', 'large');
INSERT INTO Beverage values(135, 'Pepsi', 'large');
INSERT INTO Beverage values(136, 'Schweppes', 'medium');
INSERT INTO Beverage values(137, 'Nestea', 'medium');
INSERT INTO Beverage values(138, 'Lemonade', 'easy');
INSERT INTO Beverage values(139, 'Budweiser', 'medium');
INSERT INTO Beverage values(140, 'Latte', 'easy');

/* ---------------------------------------------------- */

create table `Store` (
	`name` varchar(15),
    `location` varchar (20),
    `telephone` numeric
);

INSERT INTO Store values('REMA', 'Aarhus N', '45252163');
INSERT INTO Store values('Fotex', 'Aarhus C', '45252153');
INSERT INTO Store values('Bilka', 'Aarhus O', '45784163');
INSERT INTO Store values('Netto', 'Aarhus V', '45284263');
INSERT INTO Store values('Fakta', 'Aarhus V', '45215163');

/* ---------------------------------------------------- */

create table `Sells` (
	`store_name` varchar(15),
    `code` varchar (20),
    `price` numeric
);

INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Fotex', 128, '20');
INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Fotex', 129, '20');
INSERT INTO Sells values('REMA', 130, '15');
INSERT INTO Sells values('Fotex', 131, '20');
INSERT INTO Sells values('Bilka', 140, '15');
INSERT INTO Sells values('Netto', 139, '20');
INSERT INTO Sells values('REMA', 125, '15');
INSERT INTO Sells values('Fotex', 127, '20');
INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Netto', 128, '20');
INSERT INTO Sells values('Netto', 127, '15');
INSERT INTO Sells values('Fotex', 131, '20');
INSERT INTO Sells values('REMA', 132, '15');
INSERT INTO Sells values('Netto', 133, '20');
INSERT INTO Sells values('Netto', 124, '15');
INSERT INTO Sells values('Fotex', 128, '20');
INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Bilka', 128, '20');
INSERT INTO Sells values('REMA', 135, '15');
INSERT INTO Sells values('Fakta', 137, '20');
INSERT INTO Sells values('Fakta', 138, '15');
INSERT INTO Sells values('Fakta', 138, '20');
INSERT INTO Sells values('Fakta', 127, '15');
INSERT INTO Sells values('Fakta', 130, '20');
INSERT INTO Sells values('Fotex', 130, '15');
INSERT INTO Sells values('Fotex', 136, '20');
INSERT INTO Sells values('Fotex', 127, '15');
INSERT INTO Sells values('Fotex', 128, '20');
INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Fotex', 139, '20');
INSERT INTO Sells values('Bilka', 139, '15');
INSERT INTO Sells values('Bilka', 138, '20');
INSERT INTO Sells values('Bilka', 137, '15');
INSERT INTO Sells values('Bilka', 136, '20');
INSERT INTO Sells values('Bilka', 127, '15');
INSERT INTO Sells values('Fotex', 136, '20');
INSERT INTO Sells values('REMA', 129, '15');
INSERT INTO Sells values('Fotex', 128, '20');
INSERT INTO Sells values('Netto', 129, '15');
INSERT INTO Sells values('Fotex', 129, '20');
INSERT INTO Sells values('REMA', 127, '15');
INSERT INTO Sells values('Netto', 128, '20');
INSERT INTO Sells values('REMA', 125, '15');
INSERT INTO Sells values('Fotex', 124, '20');
INSERT INTO Sells values('Netto', 126, '15');
INSERT INTO Sells values('Netto', 126, '20');
INSERT INTO Sells values('Netto', 126, '15');
INSERT INTO Sells values('Fotex', 135, '20');
INSERT INTO Sells values('Fotex', 135, '15');
