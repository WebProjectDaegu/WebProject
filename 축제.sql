--축제정보
drop sequence festivalseq;
create sequence festivalseq;

drop table festival;
create table festival (
bno integer primary key,
name varchar2(1000),
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
startdate date,
enddate date
);

select * from festival where location = "경상북도";

--회원정보
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

--게시판 정보
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


--공지사항 정보
drop SEQUENCE noticeseq;
create SEQUENCE noticeseq;

drop table noticeboard;
create table noticeboard(
nno integer primary key,
title varchar2(200),
writedate date DEFAULT sysdate,
content varchar2(2000)
);
insert into noticeboard (nno,title,content) values (noticeseq.nextval,'제목'||noticeseq.nextval,'내용'); 
insert into noticeboard (nno,title,content,writedate) values (#{},#{},#{}); 

select * from noticeboard;













insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'제목','작성자','내용',112,'축제이름','강원도','자유',3);
select bbno,title,writer,visiter,replyer from board_table where type = '자유';
select * from board_table;
select * from board_table where location = "대구 and type='리뷰';
select * from board_table where location = #{location} and type='리뷰';
delete from board_table where type = 'review';




update memberinfo set permission = 5 where id = 'admin';
select * from memberinfo;
















insert into memberinfo (membern,id,password,name,gender,nickname,birth,phone) values(memberseq.nextval, 'test','1234','노기성','남성','낙지','19970916','0000000000');
select * from memberinfo;


insert into festival (bno, name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES (festivalseq.nextval,'2021 전국생활문화축제','송도 해상공원','생활문화TV퐝퐝, 메타버스 퐝퐝 등 비대면 온라인 축제','054-289-7875','http://www.everydaylifeculture.net','문화체육관광부','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));
select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival order by startdate desc;


 insert into festival (bno,name,opar,fstvlCo,phone,homepage,auspcInstt,latitude,hardness,lnmadr,rdnmadr,location,startdate,enddate) 
select festivalseq.nextval, '인동향교 기로연', '구미시', '마을 어르신 예우 잔치', '', '', '인동향교', '', '','','경상북도 
구미시 수출대로 335','경상북도' '2021-11-23', '2021-11-23' from dual WHERE NOT EXISTS (SELECT name FROM festival WHERE name = '인동향교 기로연' and startdate = '2021-11-23') ;


insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('태백산눈축제', '태백산국립공원 당골광장 및 태백문화광장 등 태백시 일원', '전국 대학생 눈조각 경연대회, 눈꽃 등반대회, 먹거리 장터, 별빛 프로그램, 
남녀노소 참여가능한 체험 및 공연프로그램', '033-553-6900', 'http://tbcf.or.kr/', '태백시문화재단', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival where name = '태백산눈축제';
    
insert into festival (bno,name,opar,fstvlCo,phone,homepage,auspcInstt,latitude,hardness,lnmadr,rdnmadr,location,startdate,enddate) 
select festivalseq.nextval, '인동향교 기로연', '구미시', '마을 어르신 예우 잔치', '', '', '인동향교', '', '','','경상북도 
구미시 수출대로 335','경상북도' ,'2021-11-23', '2021-11-23' 
from dual 
WHERE NOT EXISTS 
(SELECT name 
FROM festival 
WHERE name = '인동향교 기로연' and startdate = '2021-11-23') ;
    
    insert into festival (bno,name,fstvlCo,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
			 select festivalseq.nextval, #{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate}
	from dual WHERE NOT EXISTS (SELECT name FROM festival WHERE name = #{name} and startdate = #{startdate});
	
    
    commit;