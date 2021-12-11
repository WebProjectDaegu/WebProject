DECLARE
NUM1 NUMBER :=1;

BEGIN
    WHILE(NUM1<100) --NUM이 10보다 작을때까지 LOOP실행
    LOOP
   insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','강원도','자유',3);
    NUM1 := NUM1+1; --NUM = NUM +1
    END LOOP;

END;

DECLARE
NUM1 NUMBER :=1;

BEGIN
    WHILE(NUM1<100) --NUM이 10보다 작을때까지 LOOP실행
    LOOP
   insert into board_table(writedate,bbno,title,writer,content,membern,name,location,type,replyer) values('19990505',boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','강원도','공지',3);
    NUM1 := NUM1+1; --NUM = NUM +1
    END LOOP;

END;

commit;