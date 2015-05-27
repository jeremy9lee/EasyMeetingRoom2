CREATE TABLE EMPLOYEE
(
   EMPNO          VARCHAR2 (20),
   EMPNAME        VARCHAR2 (20),
   DEPTID         VARCHAR2 (20),
   DEPTNAME       VARCHAR2 (20),
   POSITIONID     VARCHAR2 (20),
   POSITIONNAME   VARCHAR2 (20)
)
NOCACHE
LOGGING;

ALTER TABLE employee
   MODIFY empno CONSTRAINT sys_c007003 NOT NULL;
   
ALTER TABLE final.employee
   ADD CONSTRAINT sys_c007004 PRIMARY KEY (empno);
   
   
INSERT INTO EMPLOYEE (EMPNO,
                      EMPNAME,
                      DEPTID,
                      DEPTNAME,
                      POSITIONID,
                      POSITIONNAME)
     VALUES ('37643',
             '이준행',
             '1',
             'ICTO 개발팀',
             '1',
             '사원');

INSERT INTO EMPLOYEE (EMPNO,
                      EMPNAME,
                      DEPTID,
                      DEPTNAME,
                      POSITIONID,
                      POSITIONNAME)
     VALUES ('39000',
             '박병광',
             '2',
             '화재 CI팀',
             '1',
             '사원');

COMMIT;