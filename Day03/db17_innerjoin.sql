-- inner join
SELECT b.num
     , b.userID
     , b.prodNAme
     , u.name
     , u.addr
     , u.birthYear
  FROM buytbl AS b
INNER JOIN usertbl AS u
   ON b.userID = u.userID
ORDER BY b.num DESC;
-- WHERE u.userID = 'JYP';