-- �����Խ���
drop table freeboard;
create table freeboard(

idx number not null primary key,  -- �ε���
title varchar2(100) not null,                     -- ����
username varchar2(20) not null,                  -- �����̸�
viewcount number default 0,             -- ��ȸ��
content long not null,                  -- ����
write_date date default sysdate,        -- �ۼ���¥
email varchar2(50)  not null                    -- �̸���
);
