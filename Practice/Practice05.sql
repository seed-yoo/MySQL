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
select e.manager_id,
	   m.first_name,
	   round(avg(e.salary) , 0) as 'asalary' , 
	   max(e.salary),
       max(e.salary)
from employees m, employees e, (select avg(salary) as 'asalary', manager_id
								from employees
								group by manager_id) s
where e.hire_date >= '2005/01/01'
and s.asalary = asalary
and s.manager_id = e.manager_id
and m.employee_id = e.manager_id
group by e.manager_id
having avg(e.salary) >= 5000
order by asalary desc
;

/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명
(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
*/
select e.employee_id,
	   e.first_name,
       d.department_name,
       m.first_name
from employees e
join employees m on m.employee_id = e.manager_id
left outer join departments d on e.department_id = d.department_id
;

/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 월급, 입사일을 입사일 순서로 출력하세요
*/
select e.employee_id,
	   e.first_name,
       d.department_name,
       e.salary,
       hire_date
from employees e, departments d
where e.department_id = d.department_id
and hire_date > '2005/12/31'
limit 10 , 10;

/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 월급(salary)과 근무하는 부서 이름
(department_name)은?
*/
select concat(e.first_name, e.last_name) '이름',
	   e.salary '월급',
       d.department_name '부서이름',
       e.hire_date
from employees e, departments d
where e.department_id = d.department_id
and hire_date in (select max(hire_date)
				from employees);

/*
문제7.
평균월급(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성
(last_name)과 업무(job_title), 월급(salary)을 조회하시오.
*/
/*
select avg(salary)
from employees
group by department_id
;

select asalary
from employees e, (select avg(salary) as 'asalary', department_id
					from employees
					group by department_id) s
where e.department_id = s.department_id
;


select e.employee_id,
	   e.first_name,
       e.last_name,
       j.job_title,
       e.salary,
       s.asalary,
       e.department_id
from jobs j, employees e, (select avg(salary) as 'asalary',
								department_id
							from employees
							group by department_id) s
where s.department_id = e.department_id
and j.job_id = e.job_id
and (s.asalary) >= (select max(s.asalary)
					from employees e, (select avg(salary) as 'asalary', department_id
										from employees
										group by department_id) s
					where e.department_id = s.department_id);
*/
select e.employee_id,
	   e.first_name,
       e.last_name,
       j.job_title,
       e.salary,
       s.asalary,
       e.department_id
from jobs j, employees e, (select avg(salary) as 'asalary',
								department_id
							from employees
							group by department_id) s
where s.department_id = e.department_id
and j.job_id = e.job_id
and (s.asalary) >= all (select asalary
						from employees e, (select avg(salary) as 'asalary', department_id
											from employees
											group by department_id) s
						where e.department_id = s.department_id);

/*
문제8.
평균 월급(salary)이 가장 높은 부서명과 월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/
select d.department_name,
	   s.asalary
from employees e, departments d , (select e.department_id,
										   avg(salary) as 'asalary'
									from employees e, departments d
									where e.department_id = d.department_id
									group by department_id) s
where e.department_id = d.department_id
and s.department_id = e.department_id
and s.department_id = d.department_id
group by e.department_id
having s.asalary >= (select max(asalary)
						from employees e, (select avg(salary) as 'asalary', department_id
											from employees
											group by department_id) s
						where e.department_id = s.department_id)
;




/*
문제9.
평균 월급(salary)이 가장 높은 지역과 평균월급은?
*/
select r.region_name,
	   avg(salary) 'asalary'
from countries c, regions r, locations l, departments d, employees e
where c.region_id = r.region_id
and l.country_id = c.country_id
and d.location_id = l.location_id
and e.department_id = d.department_id
group by r.region_id
order by asalary desc
limit 0, 1
;


/*
문제10.
평균 월급(salary)이 가장 높은 업무와 평균월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/

select j.job_title,
	   s.asalary
from employees e, jobs j , (select e.job_id,
										   avg(salary) as 'asalary'
									from employees e, jobs j
									where e.job_id = j.job_id
									group by job_id) s
where e.job_id = j.job_id
and s.job_id = e.job_id
and s.job_id = j.job_id
group by e.job_id
having s.asalary >= (select max(asalary)
						from employees e, (select avg(salary) as 'asalary', job_id
											from employees
											group by job_id) s
						where e.job_id = s.job_id)
;











