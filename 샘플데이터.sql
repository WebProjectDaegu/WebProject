DECLARE
NUM1 NUMBER :=1;

BEGIN
    WHILE(NUM1<100) --NUM�� 10���� ���������� LOOP����
    LOOP
   insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','������','����',3);
    NUM1 := NUM1+1; --NUM = NUM +1
    END LOOP;

END;

DECLARE
NUM1 NUMBER :=1;

BEGIN
    WHILE(NUM1<100) --NUM�� 10���� ���������� LOOP����
    LOOP
   insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','������','����',3);
    NUM1 := NUM1+1; --NUM = NUM +1
    END LOOP;

END;

commit;