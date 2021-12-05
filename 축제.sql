create table festival 
(name varchar2(1000) primary key,location varchar2(100),
startdate date, enddate date, content varchar2(2000),
homepage varchar2(100),phone varchar2(100), local varchar2(100),
latitude varchar2(100), hardness varchar2(100));
drop table festival;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) VALUES ('2021 ������Ȱ��ȭ����','�۵� �ػ����','��Ȱ��ȭTVǢǢ, ��Ÿ���� ǢǢ �� ���� �¶��� ����','054-289-7875','http://www.everydaylifeculture.net','��ȭü��������','36.0403049052','129.3766218071','2021-10-08','2021-10-10');
create table reply_festival (name varchar2(100));

select * from festival order by startdate desc;

insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) 
values ('�¹�괫����', '�¹�걹������ ����� �� �¹鹮ȭ���� �� �¹�� �Ͽ�', '���� ���л� ������ �濬��ȸ, ���� ��ݴ�ȸ, �԰Ÿ� ����, ���� ���α׷�, 
������ ���������� ü�� �� �������α׷�', '033-553-6900', 'http://tbcf.or.kr/', '�¹�ù�ȭ���', '37.16291444', '128.985252013', '2022-01-14', '2022-01-23') ;
	insert into festival (name,location,content,phone,homepage,local,latitude,hardness,startdate,enddate) values (#{name}, #{location}, #{content}, #{phone}, #{homepage}, #{local}, #{latitude}, #{hardness}, #{startdate}, #{enddate});
    
    
    commit;