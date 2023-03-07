USE bookrentalshop;

-- 1번 문제
SELECT CONCAT(SUBSTR(m.Names,1,1),',',SUBSTR(m.Names,2,3)) AS'회원명'
     , SUBSTRING(m.Addr ,5)AS '주소'
     , m.Mobile AS '폰번호'
     , UPPER(m.Email)AS '이메일'
  FROM membertbl AS m
 ORDER BY m.Email DESC;

-- 2번 문제
SELECT d.Names
     , b.Author
     , b.Names
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
	ON b.Division = d.Division
 ORDER BY d.Division DESC, b.Author ASC ;
     

-- 3번 문제
INSERT INTO divtbl VALUES
('I002', '네트워크');


-- 4번 문제
 START TRANSACTION;

UPDATE membertbl
   SET Levels = 'D'
     , Mobile = '010-9839-9999'
 WHERE Names = '성명건';

COMMIT;
ROLLBACK;

-- 5번 문제
SELECT (CASE WHEN GROUPING(d.Names) = 1
		THEN '--합계--'
        ELSE d.Names END) AS '장르'
     , CONCAT(FORMAT(SUM(b.price),N'#,0'),'원') AS '장르별 총합계'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
	ON b.Division = d.Division
 GROUP BY d.Names
  WITH ROLLUP ;
 
 
 
 
 
