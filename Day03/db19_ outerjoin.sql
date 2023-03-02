-- INNER JOIN
SELECT s.stdName, s.addr, c.clubName, t.roomNO
  FROM stdtbl AS s
  JOIN stdclubtbl AS c
    ON s.stdName = c.stdName
  JOIN clubtbl AS t
    ON c.clubName = t.clubName