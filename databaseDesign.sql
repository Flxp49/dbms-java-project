show databases;
create database fclub;
use fclub;
create table players (
	pid int primary key,
    name varchar(30) not null,
    dob date not null,
	pos varchar(30) not null,
    wage int not null,
    age int not null,
    cont_start date not null,
    cont_end date not null,
    CONSTRAINT input_pos CHECK (pos IN ('ATT', 'MID', 'DEF', 'GK'))
    );
insert into players values(1,"Hamza", "2000-12-01", "ATT", 45000, 20, "2000-12-01", "2000-12-01");
select * from players;
    