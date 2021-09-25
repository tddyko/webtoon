create table webtoon_comment_like(
idx number not null primary key,
m_idx number not null,
c_idx number not null
);
select * from webtoon_comment_like;
select count(*) from webtoon_comment_like where c_idx=13;
commit;
delete webtoon_comment_like;

select * from member_t;

