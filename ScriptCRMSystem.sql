/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     8/11/2025 3:41:05                            */
/*==============================================================*/


alter table COMPANY_LOCATIONS
   drop constraint FK_COMPANY__PUEDE_TEN_COMPANY;

alter table CONTACT
   drop constraint FK_CONTACT_ESTA_ASOC_COMPANY;

drop table COMPANY cascade constraints;

drop index PUEDE_TENER_FK;

drop table COMPANY_LOCATIONS cascade constraints;

drop index ESTA_ASOCIADO_FK;

drop table CONTACT cascade constraints;

/*==============================================================*/
/* Table: COMPANY                                               */
/*==============================================================*/
create table COMPANY 
(
   IDCOMPANY            INTEGER              not null,
   EMPLOYER_IDENTIFICATION_NUMBER VARCHAR2(30),
   NAME                 VARCHAR2(30),
   STRUCTURE            VARCHAR2(10),
   EMAIL                VARCHAR2(50),
   PHONE_NUMBER         VARCHAR2(18),
   IS_ACTIVE            SMALLINT,
   constraint PK_COMPANY primary key (IDCOMPANY)
);

CREATE SEQUENCE SEQ_COMPANY START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_COMPANY_ID
BEFORE INSERT ON COMPANY
FOR EACH ROW
BEGIN
  IF :NEW.IDCOMPANY IS NULL THEN
     SELECT SEQ_COMPANY.NEXTVAL INTO :NEW.IDCOMPANY FROM DUAL;
  END IF;
END;
/


/*==============================================================*/
/* Table: COMPANY_LOCATIONS                                     */
/*==============================================================*/
create table COMPANY_LOCATIONS 
(
   ID                   INTEGER              not null,
   IDCOMPANY            INTEGER              not null,
   FIRST_ADDRESS        VARCHAR2(30),
   SECOND_ADDRESS       VARCHAR2(30),
   CITY                 VARCHAR2(50),
   PROVINCE             VARCHAR2(30),
   COUNTRY              VARCHAR2(30),
   constraint PK_COMPANY_LOCATIONS primary key (ID)
);

CREATE SEQUENCE SEQ_COMPANY_LOCATIONS START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_COMPANY_LOCATIONS_ID
BEFORE INSERT ON COMPANY_LOCATIONS
FOR EACH ROW
BEGIN
  IF :NEW.ID IS NULL THEN
     SELECT SEQ_COMPANY_LOCATIONS.NEXTVAL INTO :NEW.ID FROM DUAL;
  END IF;
END;
/

/*==============================================================*/
/* Index: PUEDE_TENER_FK                                        */
/*==============================================================*/
create index PUEDE_TENER_FK on COMPANY_LOCATIONS (
   IDCOMPANY ASC
);

/*==============================================================*/
/* Table: CONTACT                                               */
/*==============================================================*/
create table CONTACT 
(
   IDCONTACT            INTEGER              not null,
   IDCOMPANY            INTEGER              not null,
   FIRST_NAME           VARCHAR2(30),
   MIDDLE_NAME          VARCHAR2(30),
   LAST_NAME            VARCHAR2(30),
   MOTHERS_NAME         VARCHAR2(60),
   NICKNAME             VARCHAR2(30),
   BIRTHDAY             DATE,
   GENDER               VARCHAR2(10),
   IS_ACTIVE            SMALLINT,
   constraint PK_CONTACT primary key (IDCONTACT)
);

CREATE SEQUENCE SEQ_CONTACT START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_CONTACT_ID
BEFORE INSERT ON CONTACT
FOR EACH ROW
BEGIN
  IF :NEW.IDCONTACT IS NULL THEN
     SELECT SEQ_CONTACT.NEXTVAL INTO :NEW.IDCONTACT FROM DUAL;
  END IF;
END;
/

/*==============================================================*/
/* Index: ESTA_ASOCIADO_FK                                      */
/*==============================================================*/
create index ESTA_ASOCIADO_FK on CONTACT (
   IDCOMPANY ASC
);

alter table COMPANY_LOCATIONS
   add constraint FK_COMPANY__PUEDE_TEN_COMPANY foreign key (IDCOMPANY)
      references COMPANY (IDCOMPANY);

alter table CONTACT
   add constraint FK_CONTACT_ESTA_ASOC_COMPANY foreign key (IDCOMPANY)
      references COMPANY (IDCOMPANY);

