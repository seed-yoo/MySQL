 -- 계정생성 쿼리문
create user 'work'@'%' identified by 'work';


-- 권한설정 쿼리문
grant all privileges on work_db.* to 'work'@'%';


drop user if exists 'work_db';

create database work_db
	default character set utf8mb4
	collate utf8mb4_general_ci
	default encryption='n'
;


CREATE TABLE user (
	user_id				varchar(20)		primary key,
	department_id		int,
	pw					varchar(20)		NOT NULL,
	user_num			int				NOT NULL,
	user_name			varchar(20),
	user_address		varchar(20),
	user_hp				varchar(20),
	user_email			varchar(20),
	hire_date			datetime,
	position			varchar(20),
	resignation_date	datetime,
    constraint	user_fk foreign key (department_id)
    references department(department_id)
);

CREATE TABLE department (
	department_id		int			primary key,
	department_name		varchar(20)
);

CREATE TABLE work (
	user_id			varchar(20)			NOT NULL,
	state			varchar(20),
	work_date		datetime,
    constraint	work_fk foreign key (user_id)
    references user(user_id)
);

insert into department
value (10, '영업1팀');

insert into department
value (30, '영업2팀');

insert into department
value (40, '영업3팀');

insert into department
value (20, '마케팅');

select *
from department;






