-- �����Խ���

create table freeboard(

idx number not null primary key,        -- �ε���
title varchar2(20),                     -- ����
username varchar2(20),                  -- �����̸�
viewcount number default 0,             -- ��ȸ��
content long,                           -- ����
write_date date default sysdate,        -- �ۼ���¥
email varchar2(30)                      -- �̸���
);

drop table freeboard;
select * from freeboard;

delete from freeboard where idx=12;
select * from freeboard where idx=75;

insert into freeboard values((select nvl(max(idx)+1,1) from freeboard),'����sdfsf�ȳ�','���',1,'����',sysdate,'email');

commit;

update freeboard set content='' where idx=12;

