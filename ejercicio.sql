-- selects 
select * from programs;
select * from subjects;
select * from students;
select * from inscripts;

-- programs 
create table programs (
     id serial primary key,
     name varchar(100),
     semestres_num int
 );
 
insert into programs (name,semestres_num) values
    ('Ing. informatica', 5),
    ('Medicina',6),
    ('Derecho',5);
 
 -- students
 create table students(
    id serial primary key,
    name varchar(100),
    program_id int references programs(id)
 );
 
 insert into students (name,program_id) values
 	('Leonardo',1),
	('Johan',3),
	('Alejandro',1),
	('Laura',2);
 
-- subjects
 create table subjects (
     id serial primary key,
     name varchar(100),
     program_id int references programs(id),
     credits int
 );
 
insert into subjects (name,program_id,credits) values
    ('calculo I',1,5),
    ('Intrduccion a la programación',1,3),
    ('Programacion orientada a objetos',1,2),
    ('Introduccion al derecho',3,4),
    ('Anatomía',2,3);


-- inscripts
create table inscripts (
     id serial primary key,
     student_id int references students(id),
     subject_id int references subjects(id)
 );
 
insert into inscripts (student_id,subject_id) values
	(1,3),
	(2,4),
	(1,1),
	(3,2);

-- filter

select * from subjects where program_id = 1;


-- inner join

-- subjects - inscripts - students
select * from subjects inner join inscripts 
	on subjects.id = inscripts.subject_id inner join students 
	on inscripts.student_id = students.id;

-- students - inscripts - subjects
select * from students inner join inscripts 
	on students.id = inscripts.student_id inner join subjects
	on inscripts.subject_id = subjects.id;

-- inscripts - students - subjects
select * from inscripts inner join students 
	on inscripts.student_id = students.id inner join subjects
	on inscripts.subject_id = subjects.id;

-- studenst - programs
select * from students inner join programs
	on students.program_id= programs.id;



	
	
	