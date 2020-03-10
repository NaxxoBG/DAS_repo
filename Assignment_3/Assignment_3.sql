SET FOREIGN_KEY_CHECKS=OFF;
DROP TABLE IF EXISTS r1; 
DROP TABLE IF EXISTS r2; 
DROP TABLE IF EXISTS r3;
DROP TABLE IF EXISTS r4; 
DROP TABLE IF EXISTS r5; 
SET FOREIGN_KEY_CHECKS=ON;

create table r1 (
instructor varchar(10) primary key, -- I
department varchar(15), -- D
unique (instructor, department)
);

create table r2 (
course_type varchar(10) primary key, -- T
credit_hours varchar(15), -- CH
course_level int -- CL
);

create table r3 (
department varchar(15), -- D
course_type varchar(10), -- T
instructor varchar(10), -- I
primary key (department, course_type),
foreign key (instructor, department) references r1(instructor, department),
foreign key (course_type) references r2(course_type)
);

create table r4 (
course_no int primary key, -- C
department varchar(15), -- D
course_type varchar(10), -- T
foreign key (department, course_type) references r3(department, course_type)
);

create table r5 (
course_no int, -- C
hold_no varchar(15), -- H
semester int, -- S
`year` year, -- Y
day_and_time datetime, -- DT
room_no int, -- R
num_enr_students int, -- NS
primary key (day_and_time, room_no, semester, `year`),
unique (course_no, hold_no, semester, `year`),
foreign key (course_no) references r4(course_no)
);

delimiter #
CREATE TRIGGER ensureFD_c 
BEFORE INSERT ON r5
FOR EACH ROW 
BEGIN
 IF (SELECT COUNT(*) FROM r4 WHERE Table2.C = NEW.C) = 0
 THEN 
  INSERT error_msg VALUES ("Foreign Key Constraint Violated! Enter in Table2 first!");
 END IF;
END#;
delimiter ;
drop trigger test.ensureFD_c;
-- CHSY and CDT enforcing FD meaning.. if user tries to add C into CHSY it should enforce adding it first to CDT

delimiter #
CREATE TRIGGER testref BEFORE INSERT ON r5
  FOR EACH ROW
  BEGIN
    INSERT INTO r4 (course_no, department, course_type)
    values(NEW.course_no,NEW.department,NEW.course_type);
END#
delimiter ;


-- Bad trigger
delimiter #
CREATE TRIGGER fdBefInsert
BEFORE INSERT ON r5
for each row
BEGIN 
  IF EXISTS (
    SELECT 1 FROM r4
    WHERE r5.course_no = r4.course_no
  )
    THEN signal sqlstate '45000' set message_text = 'Functional dependency on C violated';
END if;
end#;
delimiter ;
