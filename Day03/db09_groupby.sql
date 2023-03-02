use sqldb;
-- 집계함수를 사용하기 위해서 / 그룹핑
-- 숫자가 아닌 것들은 합쳐기기 힘듬 반드시 SELECT에 * 이 아닌 컬럼명을 적어줘야함
SELECT userID
	 , SUM(price) AS 총가격 -- 집계함수
  FROM buytbl
 GROUP BY userID;
 
 SELECT userID
	 , AVG(amount) AS '평균 구매 갯수' -- 집계함수
  FROM buytbl
 GROUP BY userID;
 
-- HAVING은 집계함수 등의 결과값을 필터링 하기 위해서
 SELECT userID
	 , SUM(price*amount)
  FROM buytbl
 GROUP BY userID
HAVING SUM(price * amount) >= 1000;

-- Rollup 전체합계
 SELECT userID
	 , SUM(price*amount)
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP; 

-- ROLLUP 안쓸경우
SELECT SUM(o.합산)  
FROM(SELECT userID
     , SUM(price*amount) AS 합산
  FROM buytbl
 GROUP BY userID)
  AS o
 
 
 