CREATE TABLE MEETINGROOM
(
   ROOMNO       VARCHAR2 (20),
   BUILDINGNO   VARCHAR2 (20),
   CAPACITY     VARCHAR2 (20),
   FLOOR        VARCHAR2 (20)
)
NOCACHE
LOGGING;

ALTER TABLE final.meetingroom
   ADD CONSTRAINT "building_no_fk" FOREIGN KEY (buildingno)
           REFERENCES final.building (buildingno);
		   

ALTER TABLE meetingroom
   MODIFY roomno CONSTRAINT sys_c007005 NOT NULL;
   
   
ALTER TABLE final.meetingroom
   ADD CONSTRAINT sys_c007006 PRIMARY KEY (roomno);
   
   
INSERT INTO MEETINGROOM (ROOMNO,
                         BUILDINGNO,
                         CAPACITY,
                         FLOOR)
     VALUES ('502',
             '1',
             '25',
             '5');

INSERT INTO MEETINGROOM (ROOMNO,
                         BUILDINGNO,
                         CAPACITY,
                         FLOOR)
     VALUES ('307',
             '2',
             '20',
             '3');

INSERT INTO MEETINGROOM (ROOMNO,
                         BUILDINGNO,
                         CAPACITY,
                         FLOOR)
     VALUES ('205',
             '3',
             '44',
             '2');

INSERT INTO MEETINGROOM (ROOMNO,
                         BUILDINGNO,
                         CAPACITY,
                         FLOOR)
     VALUES ('402',
             '1',
             '15',
             '4');

COMMIT;

