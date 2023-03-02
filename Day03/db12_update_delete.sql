-- UPDATE & TRANSACTION
START TRANSACTION; -- 모든일이 완료 됐을때 처리되는것 제대로 수행 안되면 복구되어야함

UPDATE usertbl_bak -- 마지막에 WHERE절을 써서 조건을 꼭 달아줘야함
   SET mobile1 = '010'
     , mobile2 = '66667788'
     , addr = '부산'
WHERE name = '예서';
   
COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 절대! 네버! 완전!!! 안됨
DELETE FROM usertbl
WHERE userID = 'HGS';