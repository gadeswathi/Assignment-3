Create table Patient_RLS(
patient_id number(3),
name varchar,
address varchar,
region varchar,
disease varchar,
AdmissionDate date,
DischargeDate date
);

insert into Patient_RLS values(100,'swathi','Hyderabad','south','cold','2024-10-11','2024-10-15')
insert into Patient_RLS values(101,'swetha','DL','north','fever','2024-11-11','2024-11-15')
insert into Patient_RLS values(102,'veena','UP','east','cancer','2024-8-11','2024-10-15')
insert into Patient_RLS values(103,'vani','HP','west','pain','2024-9-11','2024-10-15')
insert into Patient_RLS values(104,'rani','AP','south','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(105,'renu','HP','east','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(106,'venu','UP','west','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(107,'vasu','MP','north','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(108,'seenu','AP','south','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(109,'seenu','AP','North','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(110,'seenu','AP','North','fever','2024-7-11','2024-7-15')
insert into Patient_RLS values(111,'seenu','AP','North','fever','2024-7-11','2024-7-15')

select * from Patient_RLS;

CREATE ROW ACCESS POLICY RegionPolicy2

AS (region STRING) RETURNS BOOLEAN ->

  CASE 

    WHEN CURRENT_ROLE() = 'ANALYST' THEN region = 'North'

    ELSE FALSE

  END; 
  
  GRANT ROLE analyst TO USER SWATHI;
grant usage on database swathi_db to analyst; 

grant usage on schema swathi_schema to analyst;

grant usage on warehouse compute_wh to analyst;
 
GRANT SELECT ON Patient_RLS TO ROLE analyst;

GRANT SELECT ON Patient_RLS TO ROLE public;

-- using the ANALYST role
 
USE ROLE analyst;


ALTER TABLE Patient_RLS ADD ROW ACCESS POLICY RegionPolicy2 ON (region);