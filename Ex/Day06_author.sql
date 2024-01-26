-- 작가 테이블 만들기
-- auto_increment		 테이블에 적용
create table author(
	author_id		int				auto_increment		primary key,
    author_name		varchar(100)	not null,
    author_desc		varchar(500)
);

-- auto_increment		 생성된 테이블에 적용
alter table author modify author_id int auto_increment primary key;

-- 책 테이블 만들기
create table book (
	book_id		int					auto_increment		primary key,
    title		varchar(100)		not null,
    pubs		varchar(100),
    pub_date	datetime,
    author_id	int,
    constraint	book_fk foreign key (author_id)
    references author(author_id)
);

-- 작가 등록
-- 묵시적 방법
insert into author value ('박경리', '토지작가');

-- 명시적 방법
insert into author(author_name) value ('이문열');

insert into author(author_name) value ('가나다');

insert into author(author_name) value ('정우성');

insert into author value (5, '김종국', null);

insert into author value (6, '유재석', null);

-- 작가 수정
-- ※ WHERE 절이 생략되면 모든 레코드에 적용(주의) 
update author
set author_name = '기안84',
	author_desc = '웹툰작가'
where author_id = 3;

update author
set author_desc = '영화배우'
where author_id = 4;

update author
set author_name = '정우성'
where author_id = 4;

-- 작가 삭제
-- ※ WHERE 절이 생략되면 모든 데이터 삭제(주의)
delete from author
where author_id = 5;	

select * from author;

insert into book value ('우리들의 일그러진 영웅', '다림', '1998/02/22', 1);
insert into book value ('삼국지', '민음사', '2002/03/01', 1);
insert into book value ('토지', '마로니에북스', '2012/08/15', 2);
insert into book value ('유시민의 글쓰기 특강', '생각의길', '2015/04/01', 3);
insert into book value ('패션왕', '중앙북스(books) ', '2012/02/22', 4);
insert into book value ('순정만화', '재미주의', '2011/08/03', 5);
insert into book value ('오직두사람', '문학동네', '2017/05/04', 6);
insert into book value ('26년', '재미주의', '2012/02/04', 5);

--  번호를 변경할때
alter table author auto_increment = 5;

-- 현재값을 조회할때
SELECT LAST_INSERT_ID();








