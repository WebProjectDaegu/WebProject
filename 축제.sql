


drop sequence festivalseq;
create sequence festivalseq;

drop table festival;
create table festival 
(bno integer primary key, name varchar2(1000),location varchar2(100),
startdate date, enddate date, content varchar2(2000),
homepage varchar2(1000),phone varchar2(100), local varchar2(100),
latitude varchar2(100), hardness varchar2(100));

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

insert into memberinfo (membern,id,password,name,gender,nickname,birth,phone) values(memberseq.nextval, 'test','1234','노기성','남성','낙지','19970916','0000000000');
select * from memberinfo;


insert into festival (bno, name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES (festivalseq.nextval,'2021 전국생활문화축제','송도 해상공원','생활문화TV퐝퐝, 메타버스 퐝퐝 등 비대면 온라인 축제','054-289-7875','http://www.everydaylifeculture.net','문화체육관광부','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));
select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival order by startdate desc;

select * from festival order by startdate desc;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('태백산눈축제', '태백산국립공원 당골광장 및 태백문화광장 등 태백시 일원', '전국 대학생 눈조각 경연대회, 눈꽃 등반대회, 먹거리 장터, 별빛 프로그램, 
남녀노소 참여가능한 체험 및 공연프로그램', '033-553-6900', 'http://tbcf.or.kr/', '태백시문화재단', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival where name = '태백산눈축제';
    
    commit;