create table festival 
(name varchar2(1000) primary key,location varchar2(100),
startdate date, enddate date, content varchar2(2000),
homepage varchar2(100),phone varchar2(100), local varchar2(100),
latitude varchar2(100), hardness varchar2(100));
drop table festival;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES ('2021 전국생활문화축제','송도 해상공원','생활문화TV퐝퐝, 메타버스 퐝퐝 등 비대면 온라인 축제','054-289-7875','http://www.everydaylifeculture.net','문화체육관광부','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));

select * from festival order by startdate desc;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('태백산눈축제', '태백산국립공원 당골광장 및 태백문화광장 등 태백시 일원', '전국 대학생 눈조각 경연대회, 눈꽃 등반대회, 먹거리 장터, 별빛 프로그램, 
남녀노소 참여가능한 체험 및 공연프로그램', '033-553-6900', 'http://tbcf.or.kr/', '태백시문화재단', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    
    
    commit;