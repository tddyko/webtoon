create table mylist(
idx number not null primary key,
m_idx number not null,
title varchar2(50) not null,
no number not null,
coin number not null,
buy_date date default sysdate
);

commit;

select * from mylist;

select * from webtoon_episode;