/* BookRentalShop 연습 */
SELECT *
  FROM rentaltbl;
  
  -- 서브쿼리를 쓰는 것과 조인을 쓰는 것 데이터가 많아 지면 나중에는 괸장히 속도가 차이남
  -- 정말 급하게 쿼리를 조정해야하거나 그것밖에 방법이 없을때 서브쿼리를 씀
  -- 왠만하면 조인을 사용함
  
-- 서브 쿼리 -- 한컬럼당 한번씩 실행되기 때문에 시간이 무지막지 하게 걸림
-- 성능이 떨어지는 영향이 있음(영향)
SELECT b.Author AS '저자' -- 1
-- , b.Division AS '장르' -- 2
     ,(SELECT Names FROM divtbl WHERE Division = b.Division) AS 장르  -- 진짜 안좋은 것 중에 하나ㅋ
     , b.Names AS '책제목' -- 3
     , b.ISBN -- 4
     , b.Price AS '금액' -- 5
  FROM bookstbl AS b
 ORDER BY b.Names ASC; -- b.Names, 책제목, 3 대신 쓸 수 있음
 
-- 조인 -- 한번 같은걸 비교하고 결과를 냄 그래서 속도가 아주아주아주아주 빠름
-- 서브쿼리 쓸 바에는 조인!
SELECT b.Author AS '저자'
-- , b.Division
     , d.Names AS '장르'
     , b.Names AS '책제목'
     , b.ISBN
     , b.Price AS '금액'
  FROM bookstbl AS b
  INNER JOIN divtbl AS d
	 ON b.Division = d.Division
  ORDER BY b.Names;
  
-- 서브쿼리 -- 장르로 그룹핑
SELECT (SELECT Names 
          FROM divtbl 
          WHERE Division = bb.Division) AS '장르'
     , bb.총합
 FROM(
	SELECT b.Division
		 , SUM(b.Price) AS '총합'
	  FROM bookstbl AS b
 	 GROUP BY b.Division
  )AS bb;
  
-- 내부조인 - 테이블 34개
SELECT m.Names AS '이름'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalDate AS '대여일자'
     , IFNULL(r.returnDate, '미반납') AS '반납일자'
-- , r.bookIdx
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
 INNER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 INNER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
 INNER JOIN divtbl AS d
    ON b.Division = d.Division;
    
    
-- 외부조인 - 테이블 34개
-- 키가 널이 되면 그것은 아우터 조인이다
SELECT m.Names AS '이름'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalIdx
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
-- , r.bookIdx
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
  LEFT OUTER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE r.rentalIdx IS NULL;
 
-- 책을 두권이상 출판한 저자
SELECT bb.Author
     , bb.Division
     , d.NAmes AS '장르'
     , bb.출판권수
     , bb.합계금액
  FROM(
	SELECT b.Author
		 , b.Division
		 , COUNT(b.Author) AS '출판권수'
		 , SUM(b.Price) AS '합계금액'
	  FROM bookstbl AS b
	  GROUP BY b.Author, b.Division
	  HAVING COUNT(b.Author) >= 2
	) AS bb
INNER JOIN divtbl AS d
   ON bb.Division = d.Division
ORDER BY bb.출판권수 DESC;