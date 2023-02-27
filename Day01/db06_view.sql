-- 그냥 테이블 접근
select*
from memberTBL;

-- 뷰생성
create view uv_memberTBL
as
select membername, memberaddress
from membertbl;

-- 뷰로 조회
select *
from uv_memberTBL;