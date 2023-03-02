-- 변수 사용
USE sqldb;

SET @myVar1 = 5; -- 값을 할당하는 것
SELECT @myVar1;
SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
FROM usertbl
WHERE height > 170;

SELECT name, height + @myVar1
FROM usertbl;

-- 형변환
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR)AS SIGNED INTEGER) FROM usertbl;

SELECT CAST(addr AS decimal) FROM usertbl; -- addr은 문자라서 decimal로 변환 불가능
SELECT CONVERT(addr, decimal) FROM usertbl;

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello', 'World'); -- 문자열 합치기

SELECT '200' + '300';  -- MySQL 이외에서는 '200300'
SELECT CONCAT(200, '300');

SELECT CONCAT('Hello' , 'World');

SELECT 2 = 1;

/*내장함수 리스트*/
-- 흐름함수
SELECT IF (100>200,'참','거짓');

SELECT IFNULL(NULL, '0') + 100; -- 숫자를 계산할때 NULL나오면 에러나는데 에러안나게 하기 위해서
-- DB는 중간에 NULL이 들어가 있으면 연산이 안됨

-- NULLIF는 많이 사용안됨
SELECT NULLIF(100,100);

-- 쿼리작성할 때 많이 사용
SELECT name
	 , birthYear
     , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN '조선권'
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열함수
  SELECT ASCII('A'), CHAR(65), ASCII('a');
  SELECT ASCII('한'), CHAR(236); -- 한글은 사용하면 안됨
  
-- CHAR_LENGTH(글자길이), LENGTH(byte)
  SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UTF-8
  SELECT CHAR_LENGTH('가나다'), LENGTH('가나다'); -- 한글은 한글자당 3bytes
  
  SELECT REPLACE('Hello World', 'Hello', 'Byebye'); -- 파이썬의 replace랑 똑같음
-- DB의 인덱스는 1부터 시작함(모든 DB)
  SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
  SELECT LEFT('ABCDEFTGIJKLMN', 3), RIGHT('ABCDEFTGIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');  

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
     , RTRIM('          Hello World!          ') AS 'rtrim'
     , TRIM('          Hello World!          ') AS 'trim'; -- 사용자들이 입력한 값의 공백을 빼기 위해사용
     
-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);


-- 수학함수
SELECT ABS(-10);

SELECT CEILING(4.7), FLOOR(4.9), ROUND(4.4); -- 올림, 내림, 반올림

SELECT MOD(157, 10);

-- RANDOM
SELECT RAND(), FLOOR(1 + (RAND() * (6))); -- 주사위 돌리기

-- 날짜 및 시간함수
SELECT NOW(); -- 현재 시간
SELECT YEAR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW()); -- 1(일) ~ 7(토)
SELECT LAST_DAY('2023-02-01'); -- 그 달의 마지막 날을 알려줌
SELECT ADDDATE('2023-03-02', INTERVAL -10 DAY);

-- 시스템 함수
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price *2;
SELECT ROW_COUNT();

SELECT VERSION();


  