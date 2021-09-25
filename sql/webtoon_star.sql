create table webtoon_star(
    idx number not null primary key,
    title varchar2(100) not null,        -- ����
    no number not null,                  -- ���� ȭ
    m_idx number not null, -- �����Ѹ��
    star number not null               -- ����
    -- main varchar2(20) not null           -- ����ȭ���ΰ�
    
);
drop table webtoon_star;
desc webtoon_star;
select idx from member_t where idx=3;
select * from webtoon_star;

select avg(star) from webtoon_star where title='������' and no=1;

select * from webtoon_episode;
update webtoon_episode set star=0 where title='������' and no=1; 
commit;
-- ������Ʈ ����
update webtoon_episode set star=(select avg(star) from webtoon_star where title='������' and no=1) where title='������' and no=1;

-- ������Ʈ �������� ������ ��ճ�
update webtoon set heart=(select avg(star) from webtoon_star where title='������') where title='������';
select * from webtoon;

select * from member_t;
insert into member_t values(5,'test','test1@naver.com',12341234,sysdate,0,'010-2929-3939');

select count(*) from webtoon_star where 
		title='����������Ļ�' and no=1 and m_idx=9;
		
insert into webtoon_star values((select nvl(max(idx)+1,1) from webtoon_star),'����������Ļ�',1,3,8);
commit;


create table webtoon_episode(
    idx number not null primary key,    -- ������
    title varchar2(50) not null,        -- ��������
    no number not null,                 -- ��ȭ
    no_title varchar2(50) not null,     -- ȭ�� ������
    viewcount number default 0,         -- ��ȸ��
    star number default 0,              -- ����
    write_date date,                    -- ��ϳ�¥
    image varchar2(500) not null        -- ȭ�� ��ǥ�̹���   
);
alter table webtoon_episode add (cost varchar2(10) default '����' not null);
alter table webtoon_episode add (coin number default 0 not null);

