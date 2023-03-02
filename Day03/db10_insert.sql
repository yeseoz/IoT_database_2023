-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('KYS', '예서', 1997, '경남', '010', '12345678', 156, '2023-03-02' );

-- 컬럼을 다 적을 때 입력안할 커럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HGS', '홍길순', 2000, '한양', NULL, NULL, NULL, NULL );

-- NULL컬럼은 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM', '손흥민', 1991, '서울');

-- 컬럼 지정을 생략가능 단, 입력할 값의 순서가 컬럼순서와 일치해야함
INSERT INTO usertbl VALUES
('SJW', '손정웅', 1969, '서울','010', '55664433', '176', '2023-03-02' );

-- AUTO_INCREMENT 의 경우 필드 값을 입력하지 않아도 됨
-- 실행할때마다 입력됨
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('KYS', '노트북', '전자', 500000, 1)


