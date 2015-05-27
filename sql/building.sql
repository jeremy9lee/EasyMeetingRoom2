CREATE TABLE BUILDING
(
   BUILDINGNO     VARCHAR2 (20),
   BUILDINGNAME   VARCHAR2 (50),
   BUILDINGLOCX   VARCHAR2(100),
   BUILDINGLOCY   VARCHAR2 (100),
   BUILDINGIMG    VARCHAR2 (100)
)
NOCACHE
LOGGING;



ALTER TABLE building
   MODIFY buildingno CONSTRAINT sys_c007001 NOT NULL;
   
ALTER TABLE final.building
   ADD CONSTRAINT sys_c007002 PRIMARY KEY (buildingno);
   
INSERT INTO BUILDING (BUILDINGNO,
                      BUILDINGNAME,
                      BUILDINGLOCX,
                      BUILDINGLOCY,
                      BUILDINGIMG)
     VALUES ('1',
             '삼성동 SDS ',
             '37.513147',
             '127.059762',
             'sds.jpg');

INSERT INTO BUILDING (BUILDINGNO,
                      BUILDINGNAME,
                      BUILDINGLOCX,
                      BUILDINGLOCY,
                      BUILDINGIMG)
     VALUES ('2',
             '삼성 SDS 제 2사옥',
             '37.501469 ',
             '127.039553',
             'sds.jpg');

INSERT INTO BUILDING (BUILDINGNO,
                      BUILDINGNAME,
                      BUILDINGLOCX,
                      BUILDINGLOCY,
                      BUILDINGIMG)
     VALUES ('3',
             '삼성 SDS 분당사옥',
             '37.379290',
             '127.106947',
             'bundang.png');

INSERT INTO BUILDING (BUILDINGNO,
                      BUILDINGNAME,
                      BUILDINGLOCX,
                      BUILDINGLOCY,
                      BUILDINGIMG)
     VALUES ('4',
             '잠실 WEST 캠퍼스',
             '37.516415 ',
             '127.100331',
             'jamsilwest.png');

INSERT INTO BUILDING (BUILDINGNO,
                      BUILDINGNAME,
                      BUILDINGLOCX,
                      BUILDINGLOCY,
                      BUILDINGIMG)
     VALUES ('5',
             '잠실 EAST 캠퍼스',
             '37.516636',
             '127.101168',
             'jamsileast.png');

COMMIT;
