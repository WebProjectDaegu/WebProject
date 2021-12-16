        DECLARE
        NUM1 NUMBER :=1;
        
        BEGIN
            WHILE(NUM1<100) --NUM이 10보다 작을때까지 LOOP실행
            LOOP
           insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','','자유');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','','공지');
            
                  insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','경기도','리뷰');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','강원도','리뷰');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','충청북도','리뷰');
            insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','충청남도','리뷰');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','전라북도','리뷰');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','경상북도','리뷰');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','경상남도','리뷰');
        insert into board_table(bbno,title,writer,content,membern,name,location,type) values(boardseq.nextval,'제목'||boardseq.nextval,'작성자'||boardseq.nextval,'내용',112,'축제이름','전라남도','리뷰');
            NUM1 := NUM1+1; --NUM = NUM +1
            END LOOP;
        commit;
        END;
        
        