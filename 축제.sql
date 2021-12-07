


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

insert into memberinfo (membern,id,password,name,gender,nickname,birth,phone) values(memberseq.nextval, 'test','1234','��⼺','����','����','19970916','0000000000');
select * from memberinfo;


insert into festival (bno, name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES (festivalseq.nextval,'2021 ������Ȱ��ȭ����','�۵� �ػ����','��Ȱ��ȭTVǢǢ, ��Ÿ���� ǢǢ �� ���� �¶��� ����','054-289-7875','http://www.everydaylifeculture.net','��ȭü��������','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));
select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival order by startdate desc;

select * from festival order by startdate desc;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('�¹�괫����', '�¹�걹������ ����� �� �¹鹮ȭ���� �� �¹�� �Ͽ�', '���� ���л� ������ �濬��ȸ, ���� ��ݴ�ȸ, �԰Ÿ� ����, ���� ���α׷�, 
������ ���������� ü�� �� �������α׷�', '033-553-6900', 'http://tbcf.or.kr/', '�¹�ù�ȭ���', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    select name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate from festival where name = '�¹�괫����';
    
    commit;