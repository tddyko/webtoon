-- 자유게시판

create table freeboard(

idx number not null primary key,        -- 인덱스
title varchar2(20),                     -- 제목
username varchar2(20),                  -- 유저이름
viewcount number default 0,             -- 조회수
content long,                           -- 내용
write_date date default sysdate,        -- 작성날짜
email varchar2(30)                      -- 이메일
);

drop table freeboard;
select * from freeboard;

delete from freeboard where idx=12;
select * from freeboard where idx=75;

insert into freeboard values((select nvl(max(idx)+1,1) from freeboard),'제목sdfsf안녕','기용',1,'내용',sysdate,'email');

commit;

update freeboard set content='' where idx=12;

