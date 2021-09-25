create table webtoon_comment(
idx number not null primary key,
title varchar2(50) not null,
no number not null,
username varchar2(20) not null,
email varchar2(50) not null,
content varchar2(600) not null,
write_date date default sysdate,
heart number default 0,
hate number default 0
);
drop table webtoon_comment;
select * from webtoon_episode;

delete webtoon_comment where idx=1;
commit;
select * from webtoon_comment;

insert into webtoon_comment(idx,title,no,username,email,content) values(
(select nvl(max(idx)+1,1) from webtoon_comment),#{title},#{no},#{username},#{email},#{content}
)
commit;

		select *
		from (
		select A.*, rownum rn
		from (
		select c.*
		from webtoon_comment c
		where c.title='공복의저녁식사' and c.no='1'
		order by idx desc
		)A
		)
		where rn between 1 and 5
		