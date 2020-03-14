SET FOREIGN_KEY_CHECKS=OFF;
DROP TABLE IF EXISTS object; 
DROP TABLE IF EXISTS property; 
DROP TABLE IF EXISTS relationship;
SET FOREIGN_KEY_CHECKS=ON;

create table object (
	object varchar(100) primary key,
    description varchar(100) not null
);

create table property (
	object varchar(100),
    property varchar(100) not null,
    `value` int,
    primary key(object, property),
    foreign key (object) references object(object)
);

create table relationship (
	object1 varchar(100),
    relationship varchar(100),
    object2 varchar(100),
    primary key(object1, relationship, object2),
    foreign key (object1) references object(object),
    foreign key (object2) references object(object)
);

insert into object values("Earth", "the 3rd planet from the Sun in the Solar System, which is part of the Milky Way galaxy");
insert into object values("Universe", "endless space of space");
insert into object values("car", "used for transportation");
insert into object values("driver", "using the car");
insert into object values("chef", "person preparing food");
insert into object values("stove", "cooking appliance");
insert into object values("Piers", "husband");
insert into object values("Cynthia", "wife");
insert into object values("Maggie", "friend");
insert into object values("Johnson", "doctor");
insert into object values("Ella", "child");
insert into object values("computer", "electronic device for computation");
insert into object values("mobile phone", "electronic device for communicating");
insert into object values("iphone", "electronic device for communicating");
insert into object values("huawei", "electronic device for communicating");
insert into object values("pixel", "electronic device for communicating");
insert into object values("samsung", "electronic device for communicating");
insert into object values("sony", "electronic device for communicating");
insert into object values("motorola", "electronic device for communicating");
insert into object values("htc", "electronic device for communicating");
insert into object values("nokia", "electronic device for communicating");
insert into object values("oneplus", "electronic device for communicating");
insert into object values("elephone", "electronic device for communicating");
insert into object values("xiaomi", "electronic device for doing calculations");
insert into object values("ipad", "electronic device for various purposes");
insert into object values("smartwatch", "smart wearable electronic device");
insert into object values("microwave", "electronic device for heating food");
insert into object values("kettle", "electronic device for boiling water");
insert into object values("TV", "electronic device for watching content");
insert into object values("router", "electronic device for setting up LANs");
insert into object values("projector", "electronic device for projecting video content");
insert into object values("mind", "some people have it");
insert into object values("body", "some people don't have it");

insert into relationship values ("driver", "driving", "car");
insert into relationship values ("chef", "cooking with", "stove");
insert into relationship values ("Piers", " is married to ", "Cynthia");
insert into relationship values ("Maggie", " is the best friend of ", "Cynthia");
insert into relationship values ("Johnson", " is the personal doctor of ", "Cynthia");
insert into relationship values ("Johnson", " is the personal doctor of ", "Ella");
insert into relationship values ("Ella", " is the daughter of ", "Cynthia");
insert into relationship values ("Cynthia", " is the mother of ", "Ella");

insert into relationship values ("Earth", " is the home of ", "car");
insert into relationship values ("Earth", " is the home of ", "driver");
insert into relationship values ("Earth", " is the home of ", "chef");
insert into relationship values ("Earth", " is the home of ", "stove");
insert into relationship values ("Earth", " is the home of ", "Piers");
insert into relationship values ("Earth", " is the home of ", "Cynthia");
insert into relationship values ("Earth", " is the home of ", "Maggie");
insert into relationship values ("Earth", " is the home of ", "Johnson");
insert into relationship values ("Earth", " is the home of ", "Ella");
insert into relationship values ("Earth", " is the home of ", "computer");
insert into relationship values ("Earth", " is the home of ", "mobile phone");
insert into relationship values ("Earth", " is the home of ", "iphone");
insert into relationship values ("Earth", " is the home of ", "huawei");
insert into relationship values ("Earth", " is the home of ", "pixel");
insert into relationship values ("Earth", " is the home of ", "samsung");
insert into relationship values ("Earth", " is the home of ", "sony");
insert into relationship values ("Earth", " is the home of ", "motorola");
insert into relationship values ("Earth", " is the home of ", "htc");
insert into relationship values ("Earth", " is the home of ", "nokia");
insert into relationship values ("Earth", " is the home of ", "oneplus");
insert into relationship values ("Earth", " is the home of ", "elephone");
insert into relationship values ("Earth", " is the home of ", "xiaomi");
insert into relationship values ("Earth", " is the home of ", "ipad");
insert into relationship values ("Earth", " is the home of ", "smartwatch");
insert into relationship values ("Earth", " is the home of ", "microwave");
insert into relationship values ("Earth", " is the home of ", "kettle");
insert into relationship values ("Earth", " is the home of ", "TV");
insert into relationship values ("Earth", " is the home of ", "router");
insert into relationship values ("Earth", " is the home of ", "projector");
insert into relationship values ("Earth", " is the home of ", "Earth");
insert into relationship values ("Universe", " is the home of ", "Earth");
insert into relationship values ("Earth", " is the home of ", "Universe");
insert into relationship values ("mind", " is the home of the ", "body");
insert into relationship values ("body", " is the home of the ", "mind");
insert into relationship values ("body", " is the home z ", "mind");
-- insert into relationship values ("mind", " is the home z ", "body");

-- Q1
select o.description
from object o, relationship r
where o.object = r.object1 and r.object2 = "Cynthia";

-- Q2
select o1.object, o2.object 
from object o1, object o2, relationship r where o1.object <= o2.object and o1.object = r.object1 and (r.object2 = "Cynthia")
group by o1.object, o2.object
having (o1.object <> o2.object) and o2.object in (
select o1.object
from object o1, object o2, relationship r where o1.object > o2.object and o1.object = r.object1 and (r.object2 = "Cynthia") and o2.object = r.object2
group by o2.object, o1.object);

-- Q3

select o.description, count(object) as cnt
from object o
where o.description like '%electronic%'
group by o.description
having (cnt > 10);

-- Q4

SELECT o.object
FROM object o
WHERE NOT EXISTS (
	SELECT o2.object
    FROM object o2
    WHERE NOT EXISTS (
	 SELECT * FROM relationship r WHERE r.object1 = o.object AND r.object2 = o2.object
    )
);    

-- Q5
-- This query is returning the set of all objects, with which no other object is in relationship (it is not a right hand side object of any relationship)
select o.object
from object o 
where o.object not in (select r.object2 from relationship r);

-- Q6
 
SELECT distinct r.object1, r.object2
FROM relationship r
WHERE EXISTS (
	select * from relationship r2 
		where r2.object1 = r.object2 and r2.relationship = r.relationship and r2.object2 = r.object1
        and not exists (
			select * from relationship r3 where r2.object1 > r3.object1 and r2.object2 <= r3.object2
        )
	)
	group by r.object1, r.relationship, r.object2
	having (r.object1 <> r.object2)
    
