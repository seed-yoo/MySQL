-- book 테이블, author 테이블 생성
create table author(
	author_id		int				auto_increment		primary key,
    author_name		varchar(100)	not null,
    author_desc		varchar(500)
);

create table book(
	book_id			int				auto_increment		primary key,
    title			varchar(100)	not null,
    pubs			varchar(100),
    pub_date		date,
    author_id		int,
constraint book_fk foreign key (author_id) references author(author_id)
);

-- author 테이블 데이터 추가
insert into author(author_name, author_desc) value ('이문열', '경북 영양');
insert into author(author_name, author_desc) value ('박경리', '경상남도 통영');
insert into author(author_name, author_desc) value ('유시민', '17대 국회의원');
insert into author(author_name, author_desc) value ('기안84', '기안동에서 산 84년생');
insert into author(author_name, author_desc) value ('강풀', '온라인 만화가 1세대');
insert into author(author_name, author_desc) value ('김영하', '알쓸신잡');

-- book 테이블 데이터 추가
insert into book(title, pubs, pub_date, author_id) value ('우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book(title, pubs, pub_date, author_id) value ('삼국지', '민음사', '2002-03-01', 1);
insert into book(title, pubs, pub_date, author_id) value ('토지', '마로니에북스', '2012-08-15', 2);
insert into book(title, pubs, pub_date, author_id) value ('유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book(title, pubs, pub_date, author_id) value ('패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book(title, pubs, pub_date, author_id) value ('순정만화', '재미주의', '2011-08-03', 5);
insert into book(title, pubs, pub_date, author_id) value ('오직두사람', '문학동네', '2017-05-04', 6);
insert into book(title, pubs, pub_date, author_id) value ('26년', '재미주의', '2012-02-04 ', 5);

select * from author;
select * from book;

-- 결과 출력
select b.book_id,
	   b.title,
       b.pubs,
       b.pub_date,
       a.author_id,
       a.author_name,
       a.author_desc
from author a, book b
where a.author_id = b.author_id
order by b.book_id asc;

-- 데이터 수정
update author
set author_desc = '서울특별시'
where author_id = 5;

-- 결과 출력
select b.book_id,
	   b.title,
       b.pubs,
       b.pub_date,
       a.author_id,
       a.author_name,
       a.author_desc
from author a, book b
where a.author_id = b.author_id
order by b.book_id asc;

-- 데이터 삭제 (순서대로 삭제해야 함.)
delete from book
where book_id = 5;

delete from author
where author_id = 4;

-- 결과 출력
select b.book_id,
	   b.title,
       b.pubs,
       b.pub_date,
       a.author_id,
       a.author_name,
       a.author_desc
from author a, book b
where a.author_id = b.author_id
order by b.book_id asc;








