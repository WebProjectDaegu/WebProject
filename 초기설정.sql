--���� DB
drop sequence festivalseq;
create sequence festivalseq;

drop table festival;
create table festival (
bno integer primary key,
name varchar2(1000) not null,
opar varchar2(1000),
fstvlCo varchar2(1000),
phone varchar2(100),
homepage varchar2(1000),
auspcInstt varchar2(2000),
latitude varchar2(100),
hardness varchar2(100),
lnmadr varchar2(1000),
rdnmadr varchar2(1000),
location varchar2(100),
visiter integer default 0,
startdate date,
enddate date);

--ȸ�� DB
drop sequence memberseq;
create sequence memberseq;

drop table memberinfo; 
create table memberinfo (
membern integer primary key,
id varchar2(20) not null,
password varchar2(20) not null ,
name varchar2(10) not null,
gender varchar2(10),
nickname varchar2(30) not null,
birth date,
phone varchar(100), 
permission integer default 0);

insert into memberinfo 
(membern,id,password,name,gender,nickname,birth,phone,permission) values
(memberseq.nextval,'admin','1234','ȫ�浿','����','����','20000101','01011111111',5);
insert into memberinfo 
(membern,id,password,name,gender,nickname,birth,phone,permission) values
(memberseq.nextval,'user','1234','�̱浿','����','�Ϲ�����','22000101','01022222222',0);
--�Խ��� DB
drop sequence boardseq;
create sequence boardseq;

drop table board_table;
create table board_table(
writedate date DEFAULT sysdate,
bbno integer primary key,
title varchar2(100),
writer varchar2(100),
content varchar2(2000),
membern integer,
name varchar2(1000),
location varchar(100),
type varchar2(200),
visiter integer default 0,
replyer integer default 0
);

commit;