-- this is a comment

drop table if exists mentors;
drop table if exists students;
drop table if exists classes;
drop table if exists class_attendance;


CREATE TABLE if not exists mentors (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(60) NOT NULL,
  years_glasgow smallint NOT NULL,
  address   VARCHAR(120),
  favourite_pl  VARCHAR(30)
  
);

insert into mentors (name, years_glasgow, address, favourite_PL)
values ('Nadee Gicale','5','Davao City','JS'),
('Bicho Meda','1','Davao City','SQL'),
('Alice Ada','3','Davao City','NODEJS'),
('Kris Debl','8','Davao City','JS'),
('Nadee Gicale','5','Davao City','JS');

CREATE TABLE if not exists students (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(60) NOT NULL,
  address   VARCHAR(120),
  Graduated BOOLEAN
);

insert into students (name, address, Graduated)
values ('Nadee Gicale','Glasgow','true'),
('Bicho Meda','Glasgow','true'),
('Ivan Teix','Glasgow','false'),
('Ernie Flores','Glasgow','true'),
('Many Jako','Glasgow','false'),
('Olivia White','Glasgow','false'),
('Joel Cruz','Glasgow','false'),
('Marivic Ola','Glasgow','false'),
('Ging Ceres','Glasgow','false'),
('Isidro Zapater','Glasgow','false');


CREATE TABLE if not exists classes (
  id        SERIAL PRIMARY KEY,
  mentor_id INT REFERENCES mentors(id),
  topic VARCHAR(60),
  taught_date  DATE not NULL,
  class_location  VARCHAR(60)
 
);

CREATE TABLE if not exists class_attendance (
	id SERIAL    PRIMARY KEY,
	student_id    INT REFERENCES students(id),
	classes_id    INT REFERENCES   classes(id)
);


insert into classes (mentor_id, taught_date) 
values ( 1, '2022-12-17');

insert into classes (mentor_id, taught_date) 
values ( 2, '2022-12-16');

insert into classes (mentor_id, taught_date, topic) 
values ( 3, '2022-12-17', 'JS');

insert into class_attendance (student_id, classes_id) values (5,3);
insert into class_attendance (student_id, classes_id) values (4,3);
insert into class_attendance (student_id, classes_id) values (3,3);
insert into class_attendance (student_id, classes_id) values (2,3);

select s.name from class_attendance as ca
join students as s
on ca.student_id =s.id 
where s.name like 'M' limit 5;

select ca.name from class_attendance as ca
join students as s
on ca.student_id =s.id  
join classes as c
on c.id= ca.classes_id
where c.taught_date = '2022-16-12'

--select students from dec 17
select s.name select * from students as s
join class_attendance as ca 
on s.id = ca.student_id
join classes as c 
on c.id =ca.classes_id
where c.taught_date= '2022-12-17'
;

--retrieve all mentors who lived more than 5 years in glassgow

select * from mentors as m 
where years_glasgow > 5;

select * from mentors as m 
where m.favourite_pl = 'JS';

select * from mentors limit 5;
select * from students limit 5;
select * from students where Graduated = true;
select * from students where name like 'M' limit 2;






