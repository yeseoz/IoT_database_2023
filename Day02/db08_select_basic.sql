-- 사용 데이터베이스 변경
USE homeplus;

-- 한문장 끝은 세미콜론으로 마침
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl; /* 동일한 의미*/

SELECT * FROM employees.titles; -- 다른 DB의 테이블에서 데이터를 가져오려면

-- 필요한 컬럼만 가져오고 싶을때
 SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
use sqldb;

-- 조건절 검색
SELECT userID
	 , name
	 , birthYear
	 , height
  FROM usertbl
 WHERE name = '김경호';
 
 -- 관계 연산자
 SELECT *
   FROM usertbl
  WHERE birthYear >= 1970
	AND height >= 182;
    
-- 사이의 값을 조회
SELECT *
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;
   
SELECT *
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;

-- IN 연산자
SELECT *
  FROM usertbl
 WHERE addr IN('경남','경북','전남'); 

-- 문자열 검색 - 뉴스 본문안에서 일정 단어를 검색
SELECT *
  FROM usertbl
 WHERE name LIKE '__김';
 
 -- 서브 쿼리 SubQuery 위치
 -- 1. 컬럼위치
 -- 2. 테이블위치
 -- 3. 조건절 위치
 -- WHERE 절에 서브쿼리가 컬럼이 한개이상이거나 결과가 한개 이상이면 
 -- 조건연산자로 조회할 수 없음
 SELECT name
	  , height
   FROM usertbl
  WHERE height > (SELECT height FROM usertbl WHERE name = '김경호'); -- 김경호 보다 키가 큰사람을 조회
  
-- 가상테이블
SELECT u.userID
	 , u.name
     , (2023 - u.birthYear) AS '나이'
 FROM (
	   SELECT userID, name, birthYear, addr
	     FROM usertbl
         ) AS u
WHERE u.birthYear > 1969;
  
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID AS '아이디'
     , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
     , b.prodName
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;
  
-- 중복제거 / 중복제거할 컬럼만
SELECT DISTINCT addr
  FROM usertbl;
  
-- LIMIT 갯수 제한
USE homeplus;

SELECT * FROM indexTbl
LIMIT 5;


USE sqlDB;
-- 조회하면서 새로운 테이블 생성하는 쿼리 
-- 임시 테이블 만들때 많이 사용
-- PK나 FK 같은 제약 조건은 복사되지 않음
CREATE TABLE elec_buytbl_new
SELECT num
	 , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';
  
