-- 피벗
-- 한 열에 포함된 여러 값 출력, 이를 여러열로 변환하여테이블 반환식 회전, 필요하면 집계까지 수행
CREATE TABLE pivotTest
(
	uName CHAR(3),
    season CHAR(2),
    amount INT
);

INSERT INTO sqldb.pivottest
(uName, season, amount)
VALUES
('김범수', '겨울', 10),('윤종신', '여름', 15), ('김범수', '가을', 25),
('김범수', '봄', 3),('김범수', '봄', 37),('윤종신', '겨울', 40),
('김범수', '여름', 14),('김범수', '겨울', 22),('윤종신', '여름', 64);

-- 피벗 기능
-- 세로의 데이터를 가로로 만들어줌(진짜 많이쓴다!!!!)
SELECT uNAme
  , SUM(IF(season='봄', amount, 0))AS '봄'
  , SUM(IF(season='여름', amount, 0))AS '여름'
  , SUM(IF(season='가을', amount, 0))AS '가을'
  , SUM(IF(season='겨울', amount, 0))AS '겨울'
  , SUM(amount) AS '합계'
FROM pivottest
GROUP BY uNAme;