CREATE TABLE RESERVATION
(
   RESERVEDNO      VARCHAR2 (20),
   ENROLLEDDATE    DATE,
   ROOMNO          VARCHAR2 (20),
   EMPNO           VARCHAR2 (20),
   RESERVEDSTART   DATE,
   RESERVEDEND     DATE
)
NOCACHE
LOGGING;


ALTER TABLE final.reservation
   ADD CONSTRAINT "emp_no_fk" FOREIGN KEY (empno)
           REFERENCES final.employee (empno);

ALTER TABLE reservation
   MODIFY reservedno CONSTRAINT sys_c007007 NOT NULL;
   
ALTER TABLE final.reservation
   ADD CONSTRAINT sys_c007008 PRIMARY KEY (reservedno);