-- -------------------------------------------------------------
-- 수업 01일차
-- -------------------------------------------------------------
use hrdb;
-- select 문
#select 문

/*
select 문 (조회)
*/

# select ~ from절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;

-- select 절
select first_name, salary 
from employees;

# 모든 직원의 직원아이디(employee_id), 이름 (first_name), 성(last_name) 을 출력하세요
select employee_id, first_name, last_name 
from employees
;

# 모든 직원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name,
	   phone_number,
       hire_date,
       salary 
from employees
;

# 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select first_name,
	   last_name,
       salary,
       phone_number,
       email,
       hire_date
from employees
;

# 직원아이디, 이름, 월급을 출력하세요. 
# 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select employee_id empNO,
	   first_name as 'f-name',
       salary as '월 급'
from employees
;

# 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select first_name '이름',
	   phone_number '전화번호',
       hire_date '입사일',
       salary '월급'
from employees;

# 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select employee_id '사번',
	   first_name '이름',
       last_name '성',
       salary '월급',
 	   phone_number '전화번호',
       email '이메일',
       hire_date '입사일'
from employees;

-- 산술 연산자 사용하기
select first_name,
	   salary '월급',
       salary-100 '월급-식대',
       salary*12 '연봉',
       salary*12 + 5000 '보너스 포함',
       salary/30 '일급',
       employee_id%3 '워크샵 팀'
from employees;

-- 문자열은 0 으로 처리	--> 오류가 나지 않으므로 확인이 안될 수 있다
select job_id*12
from employees;

-- 컬럼 합치기
select first_name, last_name
from employees;

select concat(first_name, last_name) 'name'
from employees;

select concat(first_name, '-', last_name) 'name'
from employees;

select first_name,
	   last_name,
       concat(first_name, ' ', last_name) 'name'
from employees;

select first_name,
	   last_name,
	   concat(first_name, ' ', last_name) 'name',
       concat(first_name, ' ', last_name, ' hire date is ', hire_date) 'name2'
from employees;

select concat(first_name, '-',last_name) '성명',
	   salary '월급',
       salary*12 '연봉',
       salary*12 + 5000 '보너스',
       phone_number '전화번호'
from employees
;

-- 테이블의 컬럼명 테이블의 데이터, 문자열, 숫자는 그대로 출력
select first_name 이름,
	   salary*12 as '연봉',
       '(주)개발자' as 'company',
       3 '상태'
from employees;

-- 테이블 명 생략
select now();

select now() from dual;

select 123*5;

-- where 절
select first_name, department_id
from employees
where  department_id = 10;

#  월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where salary > 15000;
;

#  07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name,
	   hire_date
from employees
where hire_date >= '2007-01-01';

# 이름이 Lex인 직원의 이름과 월급을 출력하세요
# - 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
select first_name,
	   salary
from employees
where first_name like binary 'Lex';

select first_name,
	   salary
from employees
where binary first_name = 'Lex';

# 월급이 14000이상 17000이하인 사원의 이름과 월급을 구하시오
select first_name,
	   salary
from employees
where salary >= 14000
and salary <= 17000
;

# 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where salary <= 14000
or salary >= 17000
;

# 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name,
	   hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31'
;

# 월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오
select first_name,
	   salary
from employees
where salary >= 14000
and salary <= 17000
;

select first_name,
	   salary
from employees
where salary
between 14000 and 17000
;

# IN 연산자로 여러 조건을 검사하기
# Neena, Lex, John 의 이름, 성, 월급의 구하시오
select first_name,
	   last_name,
       salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John'
;

select first_name,
	   last_name,
       salary
from employees
where first_name in ('Neena', 'Lex', 'John', 'David')
;

# 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select first_name,
	   salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100
;

select first_name,
	   salary
from employees
where salary in(2100, 3100, 4100, 5100);


-- 이름이 L(대소문자 구분x)로 시작하는 직원의 이름, 성, 월급을 출력하세요
select first_name,
	   last_name,
       salary
from employees
where first_name like 'L%';

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where first_name like '_a%';

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name,
	   salary
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name,
	   salary
from employees
where first_name like '_a__';

-- null
select first_name,
	   salary,
       commission_pct,
       salary * commission_pct
from employees
where salary between 13000 and 15000;


select *
from employees
where commission_pct is null;

select *
from employees
where commission_pct is not null;


-- 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select first_name,
	   commission_pct*salary
from employees
where commission_pct is not null;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select first_name,
	   manager_id,
       commission_pct
from employees
where commission_pct is null
and manager_id is null;

-- 부서가 없는 직원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where department_id is null
;

-- ORDER BY
select first_name,
	   salary
from employees
where salary >=10000
order by salary desc;		-- asc, desc (오름차순, 내림차순)


select employee_id
from employees
order by employee_id asc;

select first_name, salary
from employees
order by first_name asc;

select first_name, hire_date
from employees
order by hire_date desc;

select first_name, hire_date, salary
from employees
order by hire_date desc;

-- 1.최근 입사한 순, 2.입사일이 같으면 월급이 많은 사람부터
select first_name, hire_date, salary
from employees
order by hire_date desc, salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select department_id,
	   salary,
	   first_name
from employees
order by department_id asc;

-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select first_name,
	   salary
from employees
where salary >= 10000
order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select department_id,
	   salary,
       first_name
from employees
order by department_id asc, salary desc;

-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select first_name, salary, hire_date
from employees
order by first_name asc;

-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select first_name,
	   salary,
       hire_date
from employees
order by hire_date desc;


select first_name,
       hire_date date,
       department_id
from employees
where hire_date >= '2007-01-01'
order by date desc;


-- null 값 치환(MySQL - ifnull 사용, ORACLE - NVL 사용)
select first_name,
	   ifnull(manager_id, 0)
from employees;



-- -------------------------------------------------------------
-- 수업 02일차
-- -------------------------------------------------------------
-- 단일행 함수
-- 단일행 함수 > 숫자함수

-- round() : 반올림
select round(123.123, 2),
	   round(123.126, 2),
       round(123.567, 0),
       round(234.567, 0),
       round(123.456, 0),
       round(123.456),
       round(123.126, -1),
       round(125.126, -1),
       round(123.126, -2)
from dual;

-- cell() : 올림
select ceil(123.456),
	   ceil(123.789),
	   ceil(123.7892313),
	   ceil(987.1234)
from dual
;

-- floor() : 내림
select floor(123.456),
	   floor(123.789),
	   floor(123.7892313),
	   floor(987.1234)
from dual
;

-- truncate() : 버림
select truncate(1234.34567, 2),
	   truncate(1234.34567, 3),
	   truncate(1234.34567, 0),
	   truncate(1235.34567, -2)
from dual;

select first_name, 
	   salary,
       ceil( salary/30 ) '일당'
from employees
order by salary desc;

-- power() : 숫자의 n승
select pow(12,2), power(12,2)
from dual;

-- sqrt() : 숫자의 제곱근
select sqrt(144)
from dual;

-- sign() : 숫자가 음수이면 -1, 0이면 0, 양수이면 1
select sign(123),
	   sign(0),
	   sign(-123)
from dual
;

-- abs() : 절대값
select abs(123),
abs(0),
abs(-123)
from dual
;


-- GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값
select greatest(2, 0, -2), 
	   greatest(4, 3.2, 5.25), 
	   greatest('B', 'A', 'C', 'c')
from dual
;

-- LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값
select least(2, 0, -2),
least(4, 3.2, 5.25), 
least('B', 'A', 'C', 'c')
from dual;


select max(salary)
from employees;

select min(salary)
from employees;

select employee_id,
	   manager_id,
       department_id,
	   greatest(employee_id, manager_id, department_id)
from employees;

-- 단일행 함수 > 문자함수
-- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결
select concat('안녕', '하세요')
from dual;

select concat('안녕', '-', '"하"세요')
from dual;

select concat('안녕', '-', "'하'세요")
from dual;

select concat(first_name, "-", last_name)
from employees;

-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 사이에 s 로 연결
select concat_ws('*******','abc','123','가나다');
select concat_ws('-', first_name, last_name, salary)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select first_name,
	   lcase(first_name),
	   lower(first_name),
	   lower('ABCabc!#$%'),
	   lower('가나다')
from employees;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select first_name,
	   ucase(first_name),
	   upper(first_name),
	   upper('ABCabc!#$%'),
	   upper('가나다')
from employees;

-- 문자개수
select first_name,
	   length(first_name),
       char_length(first_name),
       character_length(first_name)
from employees;

select first_name,
	   length('a'),
       char_length('a'),
       character_length('a')
from employees;

select first_name,
	   length('가'),
       char_length('가'),
       character_length('가')
from employees;

select length('a'), char_length('a'), character_length('a')
from dual;

select length('가'), char_length('가'), character_length('가')
from dual;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): 
select first_name,
	   substr(first_name,1,3),
       substr(first_name,2,2),
       substr(first_name,-3,2)
from employees
where department_id = 100;

select substr('930315-1234567', 8, 1),		-- 성별
	   substr('930315-1234567', -7, 1),		-- 성별 뒤에서 계산
       substr('930315-1234567', 1, 2),		-- 년도
       substr('930315-1234567', 3, 2),		-- 월
       substr('930315-1234567', 5, 2)		-- 일
from dual;

-- LPAD(str, len, padstr): str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
-- RPAD(str, len, padstr): str 문자열 오른쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
select first_name, 
	   lpad(first_name,10,'#*'), 
	   rpad(first_name,10,'*')
from employees;

-- TRIM(str): str의 양쪽에 있는 공백 문자를 제거
-- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
select concat('|', '             안녕하세요             ', '|' ),
	   concat('|', trim('             안녕하세요             '), '|' ),
	   concat('|', ltrim('                  안녕하세요               '), '|' ),
	   concat('|', rtrim('                  안녕하세요                 '), '|' )
from dual;
;


-- REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select first_name, 
	   replace(first_name, 'a', '*'),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;


-- 단일함수 > 날짜함수
select current_date(), curdate();

select current_time(), curtime();

select current_timestamp(), now(), sysdate();

-- ['2024-01-22 16:03:37']

select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 DAY), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND);

select subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 DAY), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND);
       
-- DATEDIFF(): 두 날짜간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차
select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
	   timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
from dual;
;

select first_name,
	   hire_date,
       round(datediff(now(), hire_date)/365, 1) workday
from employees
order by workday desc;

-- 변환함수
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select now(),
	   date_format(now(), '%y-%m-%d %H:%i:%s'),
       date_format(now(), '%y-%m-%d(%a) %H:%i:%s %p')
from dual;


-- STR_TO_DATE(str, format): str를 format형식으로 변환
select datediff('2021-Jun-04', '2021-06-01')
from dual; -- 계산안됨

select datediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
from dual;

select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d')
from dual;

select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
from dual;

select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'), 
	   str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
)
from dual;

select str_to_date('2021-06-01', '2021/06/01')
from dual;

-- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
SELECT format(1234567.89, 2),
	   format(1234567.89, 0),
	   format(1234567.89, -5)
from dual
;

select first_name, ifnull(commission_pct, '0')
from employees;























