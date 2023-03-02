INSERT INTO proctbl (TOTAL_NAME)
VALUES('BBK');

SELECT* FROM proctbl;

DELETE FROM proctbl WHERE ID = 3;

DELETE FROM proctbl;

-- 완전 초기화 / 진짜 다지워버림..
TRUNCATE proctbl;