create table webtoon_star(
    idx number not null primary key,
    title varchar2(100) not null,        -- 제목
    no number not null,                  -- 웹툰 화
    m_idx number not null, -- 별점한멤버
    star number not null               -- 별점
    -- main varchar2(20) not null           -- 메인화면인가
    
);
drop table webtoon_star;
desc webtoon_star;
select idx from member_t where idx=3;
select * from webtoon_star;

select avg(star) from webtoon_star where title='상중하' and no=1;

select * from webtoon_episode;
update webtoon_episode set star=0 where title='상중하' and no=1; 
commit;
-- 업데이트 별점
update webtoon_episode set star=(select avg(star) from webtoon_star where title='상중하' and no=1) where title='상중하' and no=1;

-- 업데이트 별점들의 총점을 평균냄
update webtoon set heart=(select avg(star) from webtoon_star where title='상중하') where title='상중하';
select * from webtoon;

select * from member_t;
insert into member_t values(5,'test','test1@naver.com',12341234,sysdate,0,'010-2929-3939');

select count(*) from webtoon_star where 
		title='공복의저녁식사' and no=1 and m_idx=9;
		
insert into webtoon_star values((select nvl(max(idx)+1,1) from webtoon_star),'공복의저녁식사',1,3,8);
commit;


create table webtoon_episode(
    idx number not null primary key,    -- 고유값
    title varchar2(50) not null,        -- 웹툰제목
    no number not null,                 -- 몇화
    no_title varchar2(50) not null,     -- 화별 소제목
    viewcount number default 0,         -- 죄회수
    star number default 0,              -- 별점
    write_date date,                    -- 등록날짜
    image varchar2(500) not null        -- 화의 대표이미지   
);
alter table webtoon_episode add (cost varchar2(10) default '무료' not null);
alter table webtoon_episode add (coin number default 0 not null);

