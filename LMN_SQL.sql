
CREATE SEQUENCE LMN_EMP_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER
  NOKEEP
  GLOBAL;


CREATE TABLE "TEST"."LMN_EMLOYEE"
  (
    "ID"   NUMBER NOT NULL ENABLE,
    "NAME" VARCHAR2(100 BYTE),
    CONSTRAINT "LEMON_EMPLOYEE_PK" PRIMARY KEY ("ID") 
	USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
	STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 
	MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
	TABLESPACE "USERS" ENABLE
  )