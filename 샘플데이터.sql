        DECLARE
        NUM1 NUMBER :=1;
        
        BEGIN
            WHILE(NUM1<100) --NUM�� 10���� ���������� LOOP����
            LOOP
           insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','','����');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','','����');
            
                  insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','��⵵','����');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','������','����');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','��û�ϵ�','����');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','��û����','����');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','����ϵ�','����');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','���ϵ�','����');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','��󳲵�','����');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'����'||boardseq.nextval,'�ۼ���'||boardseq.nextval,'����',112,'�����̸�','���󳲵�','����');
            NUM1 := NUM1+1; --NUM = NUM +1
            END LOOP;
        commit;
        END;
        
        