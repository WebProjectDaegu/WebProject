--��������
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

select * from festival where location = "���ϵ�";

--ȸ������
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

--�Խ��� ����
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


--�������� ����
drop SEQUENCE noticeseq;
create SEQUENCE noticeseq;

drop table noticeboard;
create table noticeboard(
nno integer primary key,
title varchar2(200),
writedate date DEFAULT sysdate,
content varchar2(2000)
);
insert into noticeboard (nno,title,content) values (noticeseq.nextval,'����'||noticeseq.nextval,'����'); 
insert into noticeboard (nno,title,content,writedate) values (#{},#{},#{}); 

select * from noticeboard;













insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'����','�ۼ���','����',112,'�����̸�','������','����',3);
select bbno,title,writer,visiter,replyer from board_table where type = '����';
select * from board_table;
select * from board_table where location = "�뱸 and type='����';
select * from board_table where location = #{location} and type='����';
delete from board_table where type = 'review';




update memberinfo set permission = 5 where id = 'admin';
select * from memberinfo;
















insert into memberinfo (membern,id,password,name,gender,nickname,birth,phone) values(memberseq.nextval, 'test','1234','��⼺','����','����','19970916','0000000000');
select * from memberinfo;


insert into festival (bno, name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES (festivalseq.nextval,'2021 ������Ȱ��ȭ����','�۵� �ػ����','��Ȱ��ȭTVǢǢ, ��Ÿ���� ǢǢ �� ���� �¶��� ����','054-289-7875','http://www.everydaylifeculture.net','��ȭü��������','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));
select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival order by startdate desc;


 insert into festival (bno,name,opar,fstvlCo,phone,homepage,auspcInstt,latitude,hardness,lnmadr,rdnmadr,location,startdate,enddate) 
select festivalseq.nextval, '�ε��ⱳ ��ο�', '���̽�', '���� ��� ���� ��ġ', '', '', '�ε��ⱳ', '', '','','���ϵ� 
���̽� ������ 335','���ϵ�' '2021-11-23', '2021-11-23' from dual WHERE NOT EXISTS (SELECT name FROM festival WHERE name = '�ε��ⱳ ��ο�' and startdate = '2021-11-23') ;


insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('�¹�괫����', '�¹�걹������ ����� �� �¹鹮ȭ���� �� �¹�� �Ͽ�', '���� ���л� ������ �濬��ȸ, ���� ��ݴ�ȸ, �԰Ÿ� ����, ���� ���α׷�, 
������ ���������� ü�� �� �������α׷�', '033-553-6900', 'http://tbcf.or.kr/', '�¹�ù�ȭ���', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival where name = '�¹�괫����';
    
insert into festival (bno,name,opar,fstvlCo,phone,homepage,auspcInstt,latitude,hardness,lnmadr,rdnmadr,location,startdate,enddate) 
select festivalseq.nextval, '�ε��ⱳ ��ο�', '���̽�', '���� ��� ���� ��ġ', '', '', '�ε��ⱳ', '', '','','���ϵ� 
���̽� ������ 335','���ϵ�' ,'2021-11-23', '2021-11-23' 
from dual 
WHERE NOT EXISTS 
(SELECT name 
FROM festival 
WHERE name = '�ε��ⱳ ��ο�' and startdate = '2021-11-23') ;
    
    insert into festival (bno,name,fstvlCo,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
			 select festivalseq.nextval, #{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate}
	from dual WHERE NOT EXISTS (SELECT name FROM festival WHERE name = #{name} and startdate = #{startdate});
	
    
    commit;