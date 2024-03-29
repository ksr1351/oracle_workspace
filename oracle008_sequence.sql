--oracle008_sequence.sql

/*-------------------------------------------------------------
 시퀀스(sequence)
   테이블 내의 유일한 숫자를 자동으로 생성하는 자동번호 발생이므로 시퀀스를
   기본 키로 사용하면 사용자의 부담을 줄일 수 있다.

     create sequence 시퀀스명
     start with  n - 시퀀스 시작번호
     increment by n  -시퀀스 증가치
     nocache  -cache는 메모리상의 시퀀스값을 관리하게 하는데 기본값이 20이다.
              -nocache은 메모리상의 시퀀스를 관리하지 않는다.
     nocycle  - cycle은 지정된 시퀀스값이 최대값까지 증가를 완료하면 start with
                옵션에 지정된 시작값에시 다시 시퀀스를 시작한다.
              - nocycle은  증가가 완료되면 에러를 유발한다.

    maxvalue n;- 시퀀스가 가질수 있는 최대값을 지정한다.
              maxvalue의 기본값은 ascending일때 1027승, descending 일때 -1이다.
-------------------------------------------------------------------------- */

DROP TABLE emp09;

CREATE TABLE emp09(
    num number,
    name varchar2(20)
);

SELECT * FROM user_tables;

SELECT * FROM emp09;

DROP SEQUENCE emp09_num_seq;

CREATE SEQUENCE emp09_num_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    

SELECT * FROM user_sequences;


-- nextval : 다음 시퀀스
SELECT emp09_num_seq.nextval FROM dual;


-- currval : 현재 시퀀스 - nextval을 수행한 다음 사용가능
SELECT emp09_num_seq.currval FROM dual;


INSERT INTO emp09(num, name)
VALUES(emp09_num_seq.nextval, '홍길동');


SELECT * FROM emp09;


INSERT INTO emp09(num, name)
VALUES(emp09_num_seq.nextval, '고수');


SELECT * FROM emp09;


INSERT INTO emp09(num, name)
VALUES(emp09_num_seq.nextval, '여진구');


SELECT * FROM emp09;


DELETE FROM emp09
WHERE num=3;


SELECT * FROM emp09;


INSERT INTO emp09(num, name)
VALUES(emp09_num_seq.nextval, '남문기');


SELECT * FROM emp09;

SELECT * FROM departments ORDER BY  department_id;

DESC departments;




----------------------------------------------------------------

SELECT * FROM departments WHERE upper(department_name) LIKE upper('%pay%') ORDER BY department_id;

TRUNCATE TABLE mem;

DROP TABLE mem;

--테이블 생성
CREATE TABLE mem(
    num number constraint mem_num_pk primary key,
    name varchar2(100),
    age number(3),
    loc varchar2(50)
);

DROP SEQUENCE mem_num_seq;

--시퀀스 생성
CREATE SEQUENCE mem_num_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- 삽입 
INSERT INTO mem(num, name, age, loc)
VALUES(mem_num_seq.nextval, '홍길동',30,'서울');


SELECT * FROM mem;


COMMIT;
select * from cafe_category;















