drop schema catalog if exists;
create schema catalog;
create table catalog.student (id bigint(64) primary key auto_increment, Name varchar(32) not null, Grade varchar(32));

create table catalog.disciplines (id bigint(64) primary key auto_increment, Grade varchar(32) not null, Discipline varchar(32), Teacher varchar(32));

create table catalog.student_discipline(id bigint(64)primary key auto_increment , id_student INT(8), id_discipline INT(8), 
foreign key (id_student) references catalog.student (id) ON DELETE CASCADE ON UPDATE CASCADE, 
foreign key (id_discipline) references catalog.disciplines (id) ON DELETE CASCADE ON UPDATE CASCADE);

create table catalog.marks (id bigint(64) primary key auto_increment, id_student_discipline int(8) REFERENCES catalog.student_discipline (id), 
Mark int(4) not null, Date varchar(32) not null);

create table catalog.absences (id bigint(64) primary key auto_increment, id_student_discipline int(8) REFERENCES catalog.student_discipline (id), 
Date varchar(32) not null);

create table catalog.login (ID bigint(64) PRIMARY KEY auto_increment, USERNAME varchar(32), PASSWORD varchar(20));
alter table catalog.login add user_type varchar(20);

insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'English', 'Jane Austen');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Math', 'Archimede');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Spanish', 'Federico Garcia Lorca');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Japanese', 'Oichiro Oda');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Physics', 'Albert Einstein');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Chemistry', 'Marie Curie');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Biology', 'Rachel Carson');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Geography', 'Ptolemeu');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'History', 'Doris Goodwin');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'IT', 'Elon Musk');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Logic', 'Bertrand Russel');
insert into catalog.disciplines (grade, discipline, teacher) values ('9th Grade', 'Music', 'Wolfgang Amadeus Mozart');

insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'English', 'Jane Austen');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Math', 'Archimede');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Spanish', 'Federico Garcia Lorca');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Japanese', 'Oichiro Oda');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Physics', 'Albert Einstein');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Chemistry', 'Marie Curie');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Biology', 'Rachel Carson');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Geography', 'Ptolemeu');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'History', 'Doris Goodwin');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'IT', 'Elon Musk');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Psychology', 'Carl Gustav Jung');
insert into catalog.disciplines (grade, discipline, teacher) values ('10th Grade', 'Music', 'Johann Sebastian Bach');

insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'English', 'William Shakespeare');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Math', 'Pythagora');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Spanish', 'Federico Garcia Lorca');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Japanese', 'Oichiro Oda');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Physics', 'Nikola Tesla');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Chemistry', 'Linus Pauling');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Biology', 'Charles Darwin');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Geography', 'Richard Hartshone');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'History', 'Francis Fukuyama');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'IT', 'Elon Musk');
insert into catalog.disciplines (grade, discipline, teacher) values ('11th Grade', 'Economy', 'Carl Gustav Jung');

insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'English', 'William Shakespeare');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Math', 'Pythagora');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Spanish', 'Federico Garcia Lorca');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Japanese', 'Oichiro Oda');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Physics', 'Nikola Tesla');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Chemistry', 'Linus Pauling');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Biology', 'Charles Darwin');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Geography', 'Richard Hartshone');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'History', 'Francis Fukuyama');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'IT', 'Elon Musk');
insert into catalog.disciplines (grade, discipline, teacher) values ('12th Grade', 'Philosophy', 'Socrate');



insert into catalog.login (username, password, user_type) values ('Admin', '1234', 'Admin');
insert into catalog.login (username, password, user_type) values ('Pythagora', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('William Shakespeare', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Federico Garcia Lorca', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Oichiro Oda', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Nikola Tesla', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Linus Pauling', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Charles Darwin', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Richard Harshone', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Francis Fukuyama', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Elon Musk', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Socrate', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Jane Austen', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Carl Gustav Jung', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Johann Sebastian Bach', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Ptolemeu', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Marie Curie', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Rachel Carson', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Doris Goodwin', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Archimede', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Albert Einstein', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Bertrand Russel', '1234', 'Teacher');
insert into catalog.login (username, password, user_type) values ('Wolfgang Amadeus Mozart', '1234', 'Teacher');

