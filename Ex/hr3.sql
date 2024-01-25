-- ---------------------------------------------------
-- 수업 5일차
-- ---------------------------------------------------
-- SubQuary
-- ---------------------------------------------------
/*
[예제]
'Den' 보다 월급을 많은 사람의 이름과 월급은?

1. 'Den' 의 월급을 구한다.	11000
2. 직원테이블 에서 월급이 11000보다 많은 사람을 구한다
3. 질문을 1개로 합친다
*/
select first_name, salary
from employees
where first_name = 'Den';

-- 직원테이블 에서 월급이 11000보다 많은 사람을 구한다
select first_name, salary
from employees
where salary >= (11000);

-- 합치기
select *
from employees
where salary >= (
				select salary
				from employees
				where first_name = 'Den'
				);

/*
월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
1. 직원테이블에서 월급 2100원을 받는 사람을 구한다
2. 2100 <-- 직원테이블에서 최소월급
3. 질문을 1개로 합친다
*/
-- 구조
select *
from employees
where salary = 2100;

-- 최소월급
select min(salary)
from employees;

-- 합치기
select first_name,
	   salary,
       department_id
from employees
where salary = (
				select min(salary)
				from employees
                );

/*
평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
1. 직원테이블에서 평균월급 6461.831776원 미만을 받는 사람을 구한다
2. 6461.831776 <-- 직원테이블에서 평균월급
3. 질문을 1개로 합친다
*/
-- 구조
select *
from employees
where salary < '6461.831776';

-- 평균월급
select avg(salary)
from employees;

-- 합치기
select first_name,
	   salary
from employees
where salary < (
				select avg(salary)
				from employees
				);


/*
부서번호가 110인 직원의 급여와 같은 월급을 받는
모든 직원의 사번, 이름, 급여를 출력하세요
1. 전체: 직원테이블에서 월급이 12008, 8300인 직원구하기
2. 부서번호가 110인 직원의 월급 구하기 --> 12008, 8300
3. 합치기
*/
-- 직원테이블에서 월급이 12008, 8300인 직원구하기
select *
from employees
where salary in (12008, 8300);

-- 부서번호가 110인 직원의 월급 구하기 --> 12008, 8300
select salary
from employees
where department_id = 110;	-- 12008, 8300 결과의 row 1개 이상일때

-- 합치기
select employee_id,
	   first_name,
       salary
from employees
where salary in ( select salary
				from employees
				where department_id = 110 );

/*
각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
1. 각부서별 최고 월급을 구한다 --> 1이상 100 부서는 10000, 200번 부서는 20000
2. 직원 테이블에서 월급이 10000 또는 20000인 구한다
3. 합친다
 */
 -- 각 부서별 최고월급
select max(salary)
from employees
group by department_id;

-- 구조
select first_name,
	   salary,
       department_id
from employees
where (department_id, salary) in (('10', '4400'), (20, 13000));

-- 합치기
select first_name,
	   salary,
       department_id
from employees
where (department_id, salary) in ( select department_id, max(salary)
									from employees
									group by department_id );


/*
가장 적게 월급을 받는 직원의 이름, 월급은?
*/
select min(salary)
from employees
group by department_id;

select first_name,
	   salary
from employees
where (salary) = (select min(salary)
				  from employees );

/*
부서별 최고월급, 이름 --> in --> in 확장
*/

-- ---------------------------------------------------
-- SubQuary		ANY
-- ---------------------------------------------------
/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
*/
-- 월급이 15000보다 큰 직원의 이름, 급여를 출력하세요
select first_name,
	   salary
from employees
where salary > 15000;


-- 부서번호가 110인 직원의 월급
select salary
from employees
where department_id = 110;

select first_name,
	   salary,
       department_id
from employees
where salary > any (select salary
				 from employees
				 where department_id = 110);

-- ---------------------------------------------------
-- SubQuary		ALL
-- ---------------------------------------------------
/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
*/
select first_name,
	   salary
from employees
where salary > 15000;


-- 부서번호가 110인 직원의 월급
select salary
from employees
where department_id = 110;

select first_name,
	   salary,
       department_id
from employees
where salary > all (select salary
				 from employees
				 where department_id = 110);


select *
from employees
where salary > 15000;

select *
from employees e, departments d
where e.department_id = d.department_id;




-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
select max(salary),
	   department_id
from employees
group by department_id;

select department_id,
	   employee_id,
       first_name,
       salary
from employees
where (salary, department_id) in (select max(salary), department_id
									from employees
									group by department_id);
                            
                            
                            

select e.department_id,
	   e.employee_id,
       e.first_name,
       e.salary
from employees e, (select department_id, max(salary) 'max_salary'
					from employees
					group by department_id) s
where s.department_id = e.department_id
and s.max_salary = e.salary;


-- ---------------------------------------------------
-- limit
-- ---------------------------------------------------
-- 전체
select *
from employees
order by employee_id asc;

select *
from employees
order by employee_id asc
limit 0, 10;

select *
from employees
order by employee_id asc
limit 5 offset 0;


-- 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select first_name,
	   salary,
	   hire_date
from employees
where hire_date >= '2007/01/01' 
and hire_date < '2008/01/01'
order by salary desc
limit 2,5;















