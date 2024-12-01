create table patient_test (
patient_id number(1),
name varchar,
address varchar,
pharmacy_code number(2),
disease varchar

);
insert into patient_test values(8,'renu','Hyd',20,'cold');
insert into patient_test values(9,'anu','DL',30,'fever');
insert into patient_test values(3,'geetha','UP',30,'cancer');
insert into patient_test values(4,'seetha','HP',20,'pain');
insert into patient_test values(5,'vani','AP',20,'fever');
ALTER TABLE PATIENT_TEST SET DATA_RETENTION_TIME_IN_DAYS=90;
ALTER SCHEMA SWATHI_SCHEMA SET DATA_RETENTION_TIME_IN_DAYS = 30;
cOMMANDS
SELECT * FROM PATIENT_TEST AT (STATEMENT => '01b8b1ff-0001-3903-0000-0006c84a9959');

SELECT * FROM PATIENT_TEST AT (OFFSET => -600); -- Time offset in seconds

SELECT * FROM PATIENT_TEST AT (TIMESTAMP => '2024-11-29 12:40:00 -0800'::timestamp_tz);

DELETE FROM PATIENT_TEST WHERE NAME='swathi'

Create TABLE PATIENT_TEST1_CLONE CLONE PATIENT_TEST;
CREATE TABLE PATIENT_TEST2 CLONE PATIENT_TEST AT (TIMESTAMP => '2024-11-29 12:40:00 -0800'::timestamp_tz)
