/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/
select first_name,
	   manager_id,
       commission_pct,
       salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

/*
문제2. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 월급
(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하
세요
-조건절비교 방법으로 작성하세요 
-월급의 내림차순으로 정렬하세요 
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select employee_id,
	   first_name,
       salary,
	   case when DAYOFWEEK(hire_date) = 1 then date_format(hire_date, '%Y-%m-%d 일요일')
			when DAYOFWEEK(hire_date) = 2 then date_format(hire_date, '%Y-%m-%d 월요일')
            when DAYOFWEEK(hire_date) = 3 then date_format(hire_date, '%Y-%m-%d 화요일')
            when DAYOFWEEK(hire_date) = 4 then date_format(hire_date, '%Y-%m-%d 수요일')
            when DAYOFWEEK(hire_date) = 5 then date_format(hire_date, '%Y-%m-%d 목요일')
            when DAYOFWEEK(hire_date) = 6 then date_format(hire_date, '%Y-%m-%d 금요일')
            when DAYOFWEEK(hire_date) = 7 then date_format(hire_date, '%Y-%m-%d 토요일')
			else ''
       END '날짜',
       replace(phone_number, '.', '-'),
       department_id
from employees
where (salary, department_id) in (select max(salary), department_id
									from employees
									group by department_id)
order by salary desc;


/*
문제3
매니저별 담당직원들의 평균월급 최소월급 최대월급을 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균월급이 5000이상만 출력합니다.
-매니저별 평균월급의 내림차순으로 출력합니다.
-매니저별 평균월급은 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균월급, 매니저별최소월급, 매
니저별최대월급 입니다.
(9건)
*/
select avg(salary), manager_id
from employees e, employees p
group by manager_id;


select avg(salary) '매니저별평균월급', manager_id
from employees
where hire_date >= '2005/01/01'
group by manager_id;



select m.manager_id,
	   m.first_name
       

from employees e, employees m 
where e.manager_id = m.employee_id
and e.hire_date >= '2005/01/01'
;















