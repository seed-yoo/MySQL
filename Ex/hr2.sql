-- ---------------------------------------------------
-- 수업 4일차
-- left outer join
-- ---------------------------------------------------
select e.first_name,
       d.department_id,
       d.department_name
from employees e
left outer join departments d 
	on d.department_id = e.department_id;

-- ---------------------------------------------------
-- right outer join
-- ---------------------------------------------------
select e.first_name,
       d.department_id,
       d.department_name,
       e.employee_id
from employees e
right outer join departments d 
	on d.department_id = e.department_id;

-- ---------------------------------------------------
-- union join
-- ---------------------------------------------------
(
select e.first_name,
       d.department_id,
       d.department_name,
       e.employee_id
from employees e
left outer join departments d 
	on d.department_id = e.department_id
)
union
(
select e.first_name,
       d.department_id,
       d.department_name,
       e.employee_id
from employees e
right outer join departments d 
	on d.department_id = e.department_id
);

(
select e.first_name,
       d.department_id,
       d.department_name
from employees e
left outer join departments d 
	on d.department_id = e.department_id
)
union
(
select e.first_name,
       d.department_id,
       d.department_name
from employees e
right outer join departments d 
	on d.department_id = e.department_id
);

-- ---------------------------------------------------
-- self join
-- ---------------------------------------------------
select e.employee_id, 
	   e.first_name, 
	   e.manager_id, 
       m.first_name as manager 
from employees e, employees m
where e.manager_id = m.employee_id;

-- ---------------------------------------------------
-- 잘못된 예
-- ---------------------------------------------------
select *
from employees e, locations l
where e.salary = l.location_id;


-- ---------------------------------------------------
-- SubQuery
-- ---------------------------------------------------
-- [예제]
-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?
select first_name, salary
from employees
where first_name = 'Den';

select first_name, salary
from employees
where salary >= (select salary
				 from employees
				 where first_name = 'Den'
);


























