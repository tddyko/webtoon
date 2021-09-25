create table ulboard(
idx number not null primary key,            -- 인덱스
title varchar2(100) not null,                -- 제목
username varchar2(20) not null,             -- 유저이름
viewcount number default 0,                 -- 조회수
content long not null,                      -- 내용
write_date date default sysdate,            -- 작성날짜
email varchar2(60) not null,                -- 이메일
img_url varchar2(100) not null,              -- 파일경로
heart number default 0
);
drop table ulboard;
commit;
create table ulboard_like(
idx number not null primary key,
u_idx number not null,
m_idx number not null
);

select * from ulboard_like;
select * from member_t;


select * from qnaboard;


select * from ulboard;
commit;


drop table ulboard;

select * from ulboard;

commit;