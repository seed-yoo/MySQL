show databases;
use hrdb;

select * from employees;

create user 'webdb'@'%' identified by '1234';

alter user 'webdb'@'%' identified by 'webdb';
flush privileges;

grant select, insert on web_db.* to 'webdb'@'%';		-- 조회 및 수정 권한 추가
grant all privileges on web_db.* to 'webdb'@'%';		-- 모든 권한 추가

drop user 'webdb'@'%';

create database web_db
	default character set utf8mb4		-- 이모티콘사용 케릭터셋
	collate utf8mb4_general_ci			-- 정렬규칙
	default encryption='n'				-- 암호화 no (기본값 생략가능)
;

show databases;

drop database web_db;


-- --------------------------------------------------------
# book_db 데이터베이스, book계정, book계정 권한 초기화 세팅 스트립트
# root로 접속해야함
-- --------------------------------------------------------
/*
[문제] 계정명 book, 비번 book, 모든곳에서 접속 가능한 계정을 만드세요
권한은 book_db 데이타베이스의 모든 테이블에 모든 권한을 갖도록 하세요
*/
-- 계정이 있다면 삭제
drop user if exists 'book'@'%';

create user 'book'@'%' identified by 'book';


grant all privileges on book_db.* to 'book'@'%';

-- 데이터 베이스가 있다면 삭제
drop user if exists 'book_db';

create database book_db
	default character set utf8mb4
	collate utf8mb4_general_ci
	default encryption='n'
;

flush privileges;














