--축제 DB
drop sequence boardseq;
create sequence boardseq;

drop table festival;
create table festival (
bno integer,
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
update board_table set visiter =visiter+1 where bbno = 91;
ALTER TABLE festival ADD CONSTRAINT PK_FESTIVAL PRIMARY KEY(bno);
ALTER TABLE festival ADD CONSTRAINT PK_ENDDATE not null(enddate);
--회원 DB
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
(memberseq.nextval,'admin','1234','홍길동','여성','어드민','20000101','01011111111',5);
insert into memberinfo 
(membern,id,password,name,gender,nickname,birth,phone,permission) values
(memberseq.nextval,'user','1234','이길동','남성','일반유저','22000101','01022222222',0);
--게시판 DB


drop table board_table;
create table board_table(
writedate date DEFAULT sysdate,
bbno integer,
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
ALTER TABLE board_table ADD CONSTRAINT PK_BOARD PRIMARY KEY(BBNO);

--댓글 테이블
drop SEQUENCE reply_sequence;
create SEQUENCE reply_sequence;

drop table reply_table;
create table reply_table(
rno INTEGER primary key,
brno INTEGER,
mrno INTEGER,
writer varchar(30),
content varchar(2000),
writeDate date default sysdate,
confirmDate date default sysdate
);



commit;