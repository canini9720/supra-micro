CREATE TABLE  OAUTH_CLIENT_DETAILS (
  CLIENT_ID VARCHAR2(255) NOT NULL,
  CLIENT_SECRET VARCHAR2(255) NOT NULL,
  WEB_SERVER_REDIRECT_URI VARCHAR2(2048) DEFAULT NULL,
  SCOPE VARCHAR2(255) DEFAULT NULL,
  ACCESS_TOKEN_VALIDITY NUMBER(10) DEFAULT NULL,
  REFRESH_TOKEN_VALIDITY NUMBER(10) DEFAULT NULL,
  RESOURCE_IDS VARCHAR2(1024) DEFAULT NULL,
  AUTHORIZED_GRANT_TYPES VARCHAR2(1024) DEFAULT NULL,
  AUTHORITIES VARCHAR2(1024) DEFAULT NULL,
  ADDITIONAL_INFORMATION VARCHAR2(3000) DEFAULT NULL,
  AUTOAPPROVE VARCHAR2(255) DEFAULT NULL
)  ;


CREATE UNIQUE INDEX OAUTH_CLIENT_ID_PK ON OAUTH_CLIENT_DETAILS
(CLIENT_ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_CLIENT_DETAILS ADD (  CONSTRAINT OAUTH_CLIENT_ID_PK  PRIMARY KEY
  (CLIENT_ID)
  USING INDEX OAUTH_CLIENT_ID_PK
  ENABLE VALIDATE);
  
  
--===============
CREATE TABLE  OAUTH_PERMISSION (
  ID NUMBER(10) NOT NULL,
  NAME VARCHAR2(512) DEFAULT NULL
)  ;

CREATE UNIQUE INDEX OAUTH_PERMISSION_ID_PK ON OAUTH_PERMISSION
(ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_PERMISSION ADD (  CONSTRAINT OAUTH_PERMISSION_ID_PK  PRIMARY KEY
  (ID)
  USING INDEX OAUTH_PERMISSION_ID_PK
  ENABLE VALIDATE);
  
CREATE SEQUENCE LMN_OAUTH_PERMISSION_SEQ
MINVALUE 1
MAXVALUE 999999999999999999999999999 
INCREMENT BY 1
START WITH 1
CACHE 20 
NOORDER 
NOCYCLE ;
  
  
--===============  

CREATE TABLE OAUTH_ROLE (
  ID NUMBER(10) NOT NULL,
  NAME VARCHAR2(255) DEFAULT NULL
)  ;

CREATE UNIQUE INDEX OAUTH_ROLE_ID_PK ON OAUTH_ROLE
(ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_ROLE ADD (  CONSTRAINT OAUTH_ROLE_ID_PK  PRIMARY KEY
  (ID)
  USING INDEX OAUTH_ROLE_ID_PK
  ENABLE VALIDATE);
  
CREATE SEQUENCE LMN_OAUTH_ROLE_SEQ
MINVALUE 1
MAXVALUE 999999999999999999999999999 
INCREMENT BY 1
START WITH 1
CACHE 20 
NOORDER 
NOCYCLE ;  
 --===============  

CREATE TABLE  OAUTH_USER (
  ID NUMBER(10) NOT NULL,
  USERNAME VARCHAR2(100) NOT NULL,
  PASSWORD VARCHAR2(1024) NOT NULL,
  EMAIL VARCHAR2(1024) NOT NULL,
  ENABLED NUMBER(3) NOT NULL,
  ACCOUNTNONEXPIRED NUMBER(3) NOT NULL,
  CREDENTIALSNONEXPIRED NUMBER(3) NOT NULL,
  ACCOUNTNONLOCKED NUMBER(3) NOT NULL
)  ;
 CREATE UNIQUE INDEX OAUTH_USER_ID_PK ON OAUTH_USER
(ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_USER ADD (  CONSTRAINT OAUTH_USER_ID_PK  PRIMARY KEY
  (ID)
  USING INDEX OAUTH_USER_ID_PK
  ENABLE VALIDATE);
 --===============   
  


CREATE TABLE  OAUTH_PERMISSION_ROLE (
  PERMISSION_ID NUMBER(10) DEFAULT NULL,
  ROLE_ID NUMBER(10) DEFAULT NULL,
  CONSTRAINT OAUTH_PERMISSION_ROLE_IBFK_1 FOREIGN KEY (PERMISSION_ID) REFERENCES OAUTH_PERMISSION (ID),
  CONSTRAINT OAUTH_PERMISSION_ROLE_IBFK_2 FOREIGN KEY (ROLE_ID) REFERENCES OAUTH_ROLE (ID)
)  ;
 
 CREATE INDEX PERMISSION_ID ON OAUTH_PERMISSION_ROLE (PERMISSION_ID);
 CREATE INDEX ROLE_ID ON OAUTH_PERMISSION_ROLE (ROLE_ID);

--=============

CREATE TABLE OAUTH_ROLE_USER (
  ROLE_ID NUMBER(10) DEFAULT NULL,
  USER_ID NUMBER(10) DEFAULT NULL,
  CONSTRAINT OAUTH_ROLE_USER_IBFK_1 FOREIGN KEY (ROLE_ID) REFERENCES OAUTH_ROLE (ID),
  CONSTRAINT OAUTH_ROLE_USER_IBFK_2 FOREIGN KEY (USER_ID) REFERENCES OAUTH_USER (ID)
)  ;
 
 CREATE INDEX OAUTH_ROLE_USER_ROLE_ID_IDX ON OAUTH_ROLE_USER (ROLE_ID);
 --CREATE INDEX  USER_ID_IDX ON OAUTH_ROLE_USER (USER_ID);
 
 
-- Token store
CREATE TABLE OAUTH_CLIENT_TOKEN (
  TOKEN_ID VARCHAR2(256),
  TOKEN BLOB,
  AUTHENTICATION_ID VARCHAR2(256) ,
  USER_NAME VARCHAR2(256),
  CLIENT_ID VARCHAR2(256)
);
 CREATE UNIQUE INDEX OAUTH_AUTHENTICATION_ID_PK ON OAUTH_CLIENT_TOKEN
(AUTHENTICATION_ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_CLIENT_TOKEN ADD (  CONSTRAINT OAUTH_AUTHENTICATION_ID_PK  PRIMARY KEY
  (AUTHENTICATION_ID)
  USING INDEX OAUTH_AUTHENTICATION_ID_PK
  ENABLE VALIDATE);

--=========

CREATE TABLE OAUTH_ACCESS_TOKEN (
  TOKEN_ID VARCHAR2(256),
  TOKEN BLOB,
  AUTHENTICATION_ID VARCHAR2(256),
  USER_NAME VARCHAR2(256),
  CLIENT_ID VARCHAR2(256),
  AUTHENTICATION BLOB,
  REFRESH_TOKEN VARCHAR2(256)
);
CREATE UNIQUE INDEX OAUTH_ACCESS_AUTH_ID_PK ON OAUTH_ACCESS_TOKEN
(AUTHENTICATION_ID)
LOGGING
NOPARALLEL;


ALTER TABLE OAUTH_ACCESS_TOKEN ADD (  CONSTRAINT OAUTH_ACCESS_AUTH_ID_PK  PRIMARY KEY
  (AUTHENTICATION_ID)
  USING INDEX OAUTH_ACCESS_AUTH_ID_PK
  ENABLE VALIDATE);
--============
CREATE TABLE OAUTH_REFRESH_TOKEN (
  TOKEN_ID VARCHAR2(256),
  TOKEN BLOB,
  AUTHENTICATION BLOB
);

--=============

CREATE TABLE OAUTH_CODE (
  CODE VARCHAR2(256), AUTHENTICATION BLOB
);

CREATE TABLE OAUTH_APPROVALS (
	USERID VARCHAR2(256),
	CLIENTID VARCHAR2(256),
	SCOPE VARCHAR2(256),
	STATUS VARCHAR2(10),
	EXPIRESAT TIMESTAMP(0),
	LASTMODIFIEDAT TIMESTAMP(0)
);

COMMIT;

--===========================

INSERT INTO OAUTH_CLIENT_DETAILS 
(CLIENT_ID, CLIENT_SECRET, WEB_SERVER_REDIRECT_URI,
 SCOPE, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY,
 RESOURCE_IDS, AUTHORIZED_GRANT_TYPES, ADDITIONAL_INFORMATION) 
 VALUES 
 ('mobile', '{bcrypt}$2a$10$Y4onVRZYNSALy7sk8QlvleAig3arny/I2RuPvkFGhZzmR0Yj48eai', 'http://localhost:8080/code', 
 'READ,WRITE', '3600', '10000', 
 'inventory,payment', 'authorization_code,password,refresh_token,implicit', '{}');--mobile123

 INSERT INTO OAUTH_PERMISSION (ID,NAME) VALUES (1,'create_profile');
 INSERT INTO OAUTH_PERMISSION (ID,NAME) VALUES (2,'read_profile');
 INSERT INTO OAUTH_PERMISSION (ID,NAME) VALUES (3,'update_profile';
 INSERT INTO OAUTH_PERMISSION (ID,NAME) VALUES (4,'delete_profile');

 
 
 INSERT INTO OAUTH_ROLE (ID,NAME) VALUES(1,'ROLE_admin');
 INSERT INTO OAUTH_ROLE (ID,NAME) VALUES(2,'ROLE_operator');

INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (1,1);	-- create-> admin 
INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (2,1);	-- read admin 
INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (3,1);	-- update admin 
INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (4,1);	-- delete admin 
INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (2,2);	-- read operator 
INSERT INTO OAUTH_PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES  (3,2);	-- update operator 



INSERT INTO OAUTH_USER (ID, USERNAME,PASSWORD, EMAIL, 
ENABLED, ACCOUNTNONEXPIRED, CREDENTIALSNONEXPIRED, ACCOUNTNONLOCKED)
 VALUES 
 ('1', 'hasan','{bcrypt}$2a$10$ZHtHfHtU0cXsSBCpjqxbZu05tHCB7SY8OpBZB3hKmyfVFyzAa.Yhm', 'hasan234abu@gmail.com', 
 '1', '1', '1', '1');	--hasan123
 

INSERT INTO OAUTH_USER (ID, USERNAME,PASSWORD, EMAIL, 
ENABLED, ACCOUNTNONEXPIRED, CREDENTIALSNONEXPIRED, ACCOUNTNONLOCKED)
 VALUES 
('2', 'ashraf', '{bcrypt}$2a$10$cAVi6iBqQo0vm9GtDwQhx.WcxabKurPhaZWbw5jpPggRMNscZwfJO','hasan234abu@gmail.com',
 '1', '1', '1', '1');	--ashraf123

INSERT INTO OAUTH_ROLE_USER (ROLE_ID, USER_ID)VALUES(1, 1);	-- /* hasan-admin */
INSERT INTO OAUTH_ROLE_USER (ROLE_ID, USER_ID)VALUES(2, 2);	-- /* ashraf-operatorr /