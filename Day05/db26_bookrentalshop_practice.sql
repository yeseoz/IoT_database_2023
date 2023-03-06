/* BookRentalShop 연습 */
SELECT *
  FROM rentaltbl;
  
-- 서브 쿼리
SELECT b.Author AS '저자' -- 1
     , b.Division AS '장르' -- 2
     , b.Names AS '책제목' -- 3
     , b.ISBN -- 4
     , b.Price AS '금액' -- 5
  FROM bookstbl AS b
 ORDER BY 3 DESC; -- b.Names, 책제목 대신 쓸 수 있음