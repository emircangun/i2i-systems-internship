
  CREATE TABLE "SEP_INTERNS"."USERS_TO_BE" 
   (	"REGISTER_CONFIRMATION_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(35 BYTE) NOT NULL ENABLE, 
	"SURNAME" VARCHAR2(35 BYTE) NOT NULL ENABLE, 
	"MAIL" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"MSISDN" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"GENERATED_CODE" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "USERS_TO_BE_PK" PRIMARY KEY ("MSISDN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

