create database fclub;
use fclub;

-- Players table 
create table players (
	pid int primary key,
    p_name varchar(30) not null,
    dob date not null,
	pos varchar(5) not null,
    wage int not null,
    cont_start date not null,
    cont_end date not null,
    tid int,
    CONSTRAINT input_pos CHECK (pos IN ('ATT', 'MID', 'DEF', 'GK'))
    );

-- Personal Trainers table
create table personal_trainers (
    ptid int primary key,
    email varchar(30),
    pt_name varchar(30),
    address varchar(30),
    contact_no varchar(15),
    pid int,
    foreign key(pid) references players(pid)
    );  

-- Coaches table
create table coaches (  
    cid int primary key,
    c_name varchar(30),
    contact_no varchar(15),
    address varchar(30),
    coaching_pos varchar(5),
    email varchar(30),
    pid int, 
    foreign key(pid) references players(pid)
    );

-- Training Sessions table
create table training_sessions(
    tid int primary key,
    cid int,
    start_time time,
    end_time time,
    info varchar(100),
    foreign key(cid) references coaches(cid)
    );

-- Nutritionist table
create table nutritionist(
    nid int primary key,
    n_name varchar(30),
    address varchar(20),
    email varchar(30),
    contact_no varchar(15),
    pid int,
    foreign key (pid) references players(pid)
    );

-- Doctors Training
create table doctors(
    did int primary key,
    d_name varchar(30),
    shift varchar(10),
    email varchar(30),
    pid int,
    contact_no varchar(15),
    address varchar(20),
    foreign key (pid) references players(pid),
    CONSTRAINT input_shift CHECK (shift IN ('Morning', 'Evening'))
    );

-- Adding foreign key 'TID' to players table
alter table players add foreign key(tid) references training_sessions(tid);