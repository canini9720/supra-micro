
CREATE SEQUENCE LMN_EMP_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER
  NOKEEP
  GLOBAL;


CREATE TABLE "LMN"."LMN_EMPLOYEE"
  (
    "ID"   NUMBER NOT NULL ENABLE,
    "NAME" VARCHAR2(100 char),
    CONSTRAINT "LEMON_EMPLOYEE_PK" PRIMARY KEY ("ID") 
	USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
	STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 
	MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
	TABLESPACE "USERS" ENABLE
  )
  
CREATE TABLE LMN.LMN_NATIONALITY_MASTER
(
  ID          NUMBER                            NOT NULL,
  COUNTRY_EN  VARCHAR2(100 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX LMN.LMN_NATIONALITY_MASTER_PK ON LMN.LMN_NATIONALITY_MASTER
(ID)
LOGGING
NOPARALLEL;


ALTER TABLE LMN.LMN_NATIONALITY_MASTER ADD (  CONSTRAINT LMN_NATIONALITY_MASTER_PK  PRIMARY KEY
  (ID)
  USING INDEX LMN.LMN_NATIONALITY_MASTER_PK
  ENABLE VALIDATE);

Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (1, 'India');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (2, 'UAE');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (3, 'SaudiArabia');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (4, 'Qatar');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (5, 'Jordan');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (6, 'Syria');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (7, 'Pakistan');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (8, 'Bangladesh');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (9, 'SriLanka');
Insert into LMN.LMN_NATIONALITY_MASTER   (ID, COUNTRY_EN) Values   (10, 'Yeman');
COMMIT;

  
CREATE TABLE LMN.LMN_EMPLOYEE_DETAIL
(
  ID            NUMBER,
  USER_ID       NUMBER                          NOT NULL,
  FIRST_NAME    VARCHAR2(50 BYTE),
  LAST_NAME     VARCHAR2(50 BYTE),
  DOB           DATE,
  PASSPORT_NO   VARCHAR2(20 BYTE),
  EIDA          NUMBER,
  NATIONALITY   NUMBER,
  CREATED_DATE  DATE,
  UPDATED_DATE  DATE
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX LMN.LMN_EMPLOYEE_DETAIL_PK ON LMN.LMN_EMPLOYEE_DETAIL
(USER_ID)
LOGGING
NOPARALLEL;


ALTER TABLE LMN.LMN_EMPLOYEE_DETAIL ADD (
  CONSTRAINT LMN_EMPLOYEE_DETAIL_PK
  PRIMARY KEY
  (USER_ID)
  USING INDEX LMN.LMN_EMPLOYEE_DETAIL_PK
  ENABLE VALIDATE);

ALTER TABLE LMN.LMN_EMPLOYEE_DETAIL ADD (
  CONSTRAINT LMN_EMPLOYEE_DETAIL_NAT_FK 
  FOREIGN KEY (NATIONALITY) 
  REFERENCES LMN.LMN_NATIONALITY_MASTER (ID)
  ENABLE VALIDATE,
  CONSTRAINT LMN_EMP_DET_ID_FK 
  FOREIGN KEY (USER_ID) 
  REFERENCES LMN.OAUTH_USER (ID)
  ENABLE VALIDATE);

Insert into LMN.LMN_EMPLOYEE_DETAIL   (ID, USER_ID, FIRST_NAME, LAST_NAME, DOB, 
    PASSPORT_NO, EIDA, NATIONALITY, CREATED_DATE, UPDATED_DATE)
 Values   (1, 1, 'super', 'super', TO_DATE('04/15/1985 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 
    'Z789456', 784563251, 2, TO_DATE('04/15/2020 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL);

COMMIT;

--not used this seq
CREATE SEQUENCE LMN_EMP_DET_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER
  NOKEEP
  GLOBAL;
  