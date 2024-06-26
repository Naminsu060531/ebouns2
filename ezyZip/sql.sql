drop table TBL_BONUS_202406;

select * from TBL_BONUS_202406;

create table TBL_BONUS_202406 (
	deptcode char(10) not null primary key,
	bper number
);


insert into TBL_BONUS_202406 values ('D001', 15);
insert into TBL_BONUS_202406 values ('D002', 25);

MERGE INTO TBL_BONUS_202406
USING DUAL
	ON (trim(deptcode) = 'D002') 
	when matched then
		update set
			BPER = '35'
	when not matched then
		insert values ('D002', '35')
;






drop table TBL_DEPART_202406;

create table TBL_DEPART_202406 (
	deptcode char(10) not null primary key,
	deptname varchar2(20)
);


insert into TBL_DEPART_202406 values ('D001', '영업부');
insert into TBL_DEPART_202406 values ('D002', '개발부');

select * from TBL_DEPART_202406;



select * from TBL_EMPLOYEE_202406;

drop table TBL_EMPLOYEE_202406;

create table TBL_EMPLOYEE_202406 (
	eid char(8) not null primary key,
	ename varchar2(20),
	deptcode char(10),
	grade varchar2(10),
	salary number
);

SELECT eid, ename, deptcode, grade, salary FROM TBL_EMPLOYEE_202406;

insert into TBL_EMPLOYEE_202406 values (
'20240001', '김부장', 'D001', '부장', 75600000);
insert into TBL_EMPLOYEE_202406 values (
'20240002', '박대리', 'D002', '대리', 42300000);
insert into TBL_EMPLOYEE_202406 values (
'20240003', '최사원', 'D001', '사원', 31200000);
insert into TBL_EMPLOYEE_202406 values (
'20240004', '주과장', 'D002', '과장', 53400000);
insert into TBL_EMPLOYEE_202406 values (
'20240005', '차차장', 'D001', '차장', 64500000);