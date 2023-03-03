USE tabledb;

CREATE TABLE TBL1 (
	ID INT NOT NULL PRIMARY KEY,
    bridge INT NULL,
    contests VARCHAR(5000)
    );
    
-- sqldb DB의 usertbl 데이터중
-- userID, name, birthYear, addr 만 가져와서
-- tabledb.usertbl에 부어 넣은 것
    INSERT INTO tabledb.usertbl
    SELECT userID, name, birthYear, addr
	  FROM sqldb.usertbl;
      
SELECT *
  FROM usertbl WHERE name ='김범수';