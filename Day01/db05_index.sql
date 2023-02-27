-- employees DB의 employees 테이블에서 데이터 10만개 가져오기
CREATE TABLE indexTBL(
	first_name VARCHAR(14),
    last_name VARCHAR(16),
    hire_data DATE
);

-- employees.employees 테이블에서 데이터 10만건 가져오기
insert into indextbl
	select first_name, last_name, hire_date
		from employees.employees
        limit 300000;
        
-- 조회
select * FROM indexTBL
where first_name = 'Mary';

-- indexTBL에 first_name에 인덱스 생성
create index idx_indexTbl_firstname on indexTBL(first_name);