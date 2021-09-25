commit;
-- Webtoon ���̺�(��ȭ���)

drop table webtoon;
create table webtoon(
    idx number not null primary key,    -- ������
    title varchar2(50) not null,        -- ����
    category varchar2(20) not null,     -- �帣
    finish varchar2(10) default 'N',    -- �ϰ�
    image varchar2(200) not null,       -- �����̹���
    week varchar2(10) not null,         -- ����������
    heart number default 0,              -- ���ƿ�
    summary varchar2(1000) not null,               -- ��༳��
    visibility varchar2(100) not null   -- ��������
);

update webtoon set title='����ž',idx=1 where idx=1;
select * from webtoon;
insert into webtoon values(1,'����ž','�׼�','N','main.jpg','Mon',0,'�ڽ��� ��� ���̾��� �ҳฦ �Ѿ� ž�� ���� �ҳ�<br/>�׸��� �׷� �ҳ��� �����ϴ� ž','N');
insert into webtoon values(2,'����','�θེ','N','main.jpg','Wed',0,'��2 ����, ��������� ���� �����ߴٴ� ���� ���� ���� ä ���� �׳డ 3�� ���� ��Ÿ����.','N');
insert into webtoon values(3,'�ܸ���������','�б�','N','main.jpg','Fri',0,'����� �׿��� �Ͼ �������� ��','N');
insert into webtoon values(4,'���۸�','����','N','main.jpg','Sun',0,'����ϴ� ����ģ���� ���� ù������ �°Ե� ����<br/> ���ڱ� ��ü�� ����鿡�� ��ġ�ǰ�<br/> �ڽ��� �������ڸ� ���� �ɷ��ڶ�� ��⸦ ��� �Ǵµ�...','N');
insert into webtoon values(5,'�������ΰŽ�','�θǽ�','N','main.jpg','Sun',0,'����� �����, �˷ϴ޷� �̻��� �׸����ӿ� ����! <br/> ������ ���� ã�� ������ ���� �̾߱�!','N');

insert into webtoon values((select nvl(max(idx)+1,1) from webtoon),'��','��','��','��','��',0,'��');





insert into webtoon values(6,'����������Ļ�','�ڹ�','N','main.jpg','Sat',0,'���󿡴� �� �̷��� ���ִ°� ������<br/>���ο��� ����Ļ縦 ���� ��Ž�ҳ� ������ ����쵹 �����','N');
insert into webtoon values(7,'�����','����','N','main.jpg','Tue',0,'820�Ⱓ�� �� �����, ���� ���ο� ���� ���� �ߴ�.<br/>�׸��� ���ο� ������ ���ο� ������� ������.','N');

insert into webtoon values(8,'�����ǼҸ�','������','N','main.jpg','Tue',0,'������� ������, �̳����� Ȳ������ �پ� �Ѵ´�!<br/>���� ��� �ְ��� ���� ��ȭ <������ �Ҹ�>! �������� ������ �Ҹ��� �ͱ�￩ ������!','N');
insert into webtoon values(9,'���п�','�б�','N','main.jpg','Wed',0,'�мǿ� ������ ���ƿԴ�!<br/>��ſ� ���� ��Ȱ?! ����?!','N');
insert into webtoon values(10,'������','�׼�','N','main.jpg','Thu',0,'�� �� �λ� ������ ����<br/>�϶��� �� �ֵ����� ó���� �λ� ��Ż��','N');
insert into webtoon values(11,'��������','�θǽ�','N','main.jpg','Thu',0,'�θǽ�, �׷� �� �츮���� ���� ���� ����!<br/>�Ű��� �θǽ�','N');
insert into webtoon values(12,'������ο�','�б�','N','main.jpg','Sat',0,'���¼��� �߽����� ��������<br/>�پ��� û����� ����ŸŬ�� �п� ��Ʈ�� ���','N');
insert into webtoon values(13,'�ѹ����ؿ�','����','N','main.jpg','Fri',0,'�ѹ� �� �ؿ�','N');
insert into webtoon values(14,'�����ϱ�','����','N','main.jpg','Mon',0,'�θ��� ���Ǵ� ķ�۽��� ����.<br/>�ػ�����ǿ� ����� �ʹ��� �������� �츮�� �����ϱ�','N');

-- test
insert into webtoon values(15,'�ٺ�','����','N','��.jpg','Mon',0,'�θ��� ���Ǵ� ķ�۽��� ����.<br/>�ػ�����ǿ� ����� �ʹ��� �������� �츮�� �����ϱ�');
--/test
delete webtoon where idx=15;
select * from webtoon where week='Mon';
commit;


-- Webtoon_episode(��ȭ�� �� ȭ)
drop table webtoon_episode;
create table webtoon_episode(
    idx number not null primary key,    -- ������
    title varchar2(50) not null,        -- ��������
    no number not null,                 -- ��ȭ
    no_title varchar2(50) not null,     -- ȭ�� ������
    viewcount number default 0,         -- ��ȸ��
    star number default 0,              -- ����
    write_date date,                    -- ��ϳ�¥
    image varchar2(500) not null,        -- ȭ�� ��ǥ�̹���  
    visibility varchar2(100) default 'Y'not null   -- ��������
);

select e.* from webtoon d join webtoon_episode e on d.title='�ܸ���������' and e.title='�ܸ���������';

select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
select a.ad_image from main_advertising a join main_ad_top5 t  on a.title=t.title and a.ad_start=t.ad_start;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;

insert into webtoon_episode values (1,'����������Ļ�',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (2,'����������Ļ�',2,'����',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (3,'�����',1,'���',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (4,'�����',2,'����',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (5,'�����ϱ�',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (6,'�����ϱ�',2,'�ϱ�',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (7,'�����ǼҸ�',1,'������',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (8,'�����ǼҸ�',2,'�Ҹ�',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (9,'���п�',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (10,'���п�',2,'��',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (11,'������',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (12,'������',2,'��',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (13,'���۸�',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (14,'���۸�',2,'��',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (15,'�������ΰŽ�',1,'������',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (16,'�������ΰŽ�',2,'�ΰŽ�',0,0,sysdate,'image2.jpg','Y');
insert into webtoon_episode values (17,'����ž',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (18,'����ž',2,'ž',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (19,'����',1,'��',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (20,'����',2,'��',0,0,sysdate,'image2.jpg','Y');
insert into webtoon_episode values (21,'��������',1,'����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (22,'��������',2,'����',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (23,'�ܸ���������',1,'�ܸ�����',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (24,'�ܸ���������',2,'����',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (25,'������ο�',1,'������',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (26,'������ο�',2,'�ο�',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (27,'�ѹ����ؿ�',1,'�ѹ���',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (28,'�ѹ����ؿ�',2,'�ؿ�',0,0,sysdate,'image2.jpg','Y');
commit;


delete webtoon_episode where idx=14;
select * from webtoon_episode where title='�ѹ����ؿ�' order by no desc;

select * from webtoon_episode;

-- Webtoon_image(��ȭ�� �̹�����)

create table webtoon_image(
    idx number not null primary key,    -- ������
    title varchar2(50) not null,        -- ��������
    no number not null,                 -- �� ȭ
    image number not null               -- �ش� �̹���
);

commit;
select * from webtoon_image where idx=1;


select image from webtoon_image where title='����������Ļ�' and no=1 order by image asc;
select * from test as of timestamp(systimestamp - interval '15' minute) where user_id='webtoon_image';
drop table webtoon_image;
select * from webtoon_image where title='����������Ļ�' and no=1 order by image asc;
delete webtoon_image where idx=1;
select * from  webtoon_image;
insert into webtoon_image values(1,'����������Ļ�',1,1);
insert into webtoon_image values(2,'����������Ļ�',1,2);
insert into webtoon_image values(3,'����������Ļ�',1,3);
insert into webtoon_image values(4,'����������Ļ�',1,4);
insert into webtoon_image values(5,'����������Ļ�',1,5);
insert into webtoon_image values(6,'����������Ļ�',1,6);
insert into webtoon_image values(7,'����������Ļ�',1,7);
insert into webtoon_image values(8,'����������Ļ�',1,8);
insert into webtoon_image values(9,'����������Ļ�',1,9);
insert into webtoon_image values(10,'����������Ļ�',1,10);
insert into webtoon_image values(11,'����������Ļ�',1,11);
insert into webtoon_image values(12,'����������Ļ�',1,12);
insert into webtoon_image values(13,'����������Ļ�',1,13);
insert into webtoon_image values(14,'����������Ļ�',1,14);
insert into webtoon_image values(15,'����������Ļ�',1,15);
insert into webtoon_image values(16,'����������Ļ�',1,16);
insert into webtoon_image values(17,'����������Ļ�',1,17);
insert into webtoon_image values(18,'����������Ļ�',1,18);
insert into webtoon_image values(19,'����������Ļ�',1,19);
insert into webtoon_image values(20,'����������Ļ�',1,20);
insert into webtoon_image values(21,'����������Ļ�',1,21);
insert into webtoon_image values(22,'����������Ļ�',1,22);
insert into webtoon_image values(23,'����������Ļ�',1,23);
insert into webtoon_image values(24,'����������Ļ�',1,24);
insert into webtoon_image values(25,'����������Ļ�',1,25);
insert into webtoon_image values(26,'����������Ļ�',1,26);
insert into webtoon_image values(27,'����������Ļ�',1,27);
insert into webtoon_image values(28,'����������Ļ�',1,28);


insert into webtoon_image values(29,'����������Ļ�',2,1);
insert into webtoon_image values(30,'����������Ļ�',2,2);
insert into webtoon_image values(31,'����������Ļ�',2,3);
insert into webtoon_image values(32,'����������Ļ�',2,4);
insert into webtoon_image values(33,'����������Ļ�',2,5);
insert into webtoon_image values(34,'����������Ļ�',2,6);
insert into webtoon_image values(35,'����������Ļ�',2,7);
insert into webtoon_image values(36,'����������Ļ�',2,8);
insert into webtoon_image values(37,'����������Ļ�',2,9);
insert into webtoon_image values(38,'����������Ļ�',2,10);
insert into webtoon_image values(39,'����������Ļ�',2,11);
insert into webtoon_image values(40,'����������Ļ�',2,12);
insert into webtoon_image values(41,'����������Ļ�',2,13);
insert into webtoon_image values(42,'����������Ļ�',2,14);
insert into webtoon_image values(43,'����������Ļ�',2,15);
insert into webtoon_image values(44,'����������Ļ�',2,16);
insert into webtoon_image values(45,'����������Ļ�',2,17);
insert into webtoon_image values(46,'����������Ļ�',2,18);
insert into webtoon_image values(47,'����������Ļ�',2,19);
insert into webtoon_image values(48,'����������Ļ�',2,20);
insert into webtoon_image values(49,'����������Ļ�',2,21);
insert into webtoon_image values(50,'����������Ļ�',2,22);
insert into webtoon_image values(51,'����������Ļ�',2,23);
insert into webtoon_image values(52,'����������Ļ�',2,24);
insert into webtoon_image values(53,'����������Ļ�',2,25);
insert into webtoon_image values(54,'����������Ļ�',2,26);
insert into webtoon_image values(55,'����������Ļ�',2,27);
insert into webtoon_image values(56,'����������Ļ�',2,28);
insert into webtoon_image values(57,'����������Ļ�',2,29);
insert into webtoon_image values(58,'����������Ļ�',2,30);
insert into webtoon_image values(59,'����������Ļ�',2,31);

commit;
delete webtoon_image where image=99;
select * from webtoon_image where title='�ѹ����ؿ�' and no=1;
select * from webtoon_image where title='�ѹ����ؿ�' and no=2;
-- �ѹ����ؿ� 
-- 1ȭ-52����
-- 2ȭ 37����
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�ѹ����ؿ�',1,(select nvl(max(image)+1,1) from webtoon_image where title='�ѹ����ؿ�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�ѹ����ؿ�',2,(select nvl(max(image)+1,1) from webtoon_image where title='�ѹ����ؿ�' and no=2));

select * from webtoon_image where title='������ο�' and no=1;
select * from webtoon_image where title='������ο�' and no=2;
-- ������ο�
-- 1ȭ 20,2ȭ 22
delete webtoon_image where title='������ο�';
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'������ο�',1,(select nvl(max(image)+1,1) from webtoon_image where title='������ο�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'������ο�',2,(select nvl(max(image)+1,1) from webtoon_image where title='������ο�' and no=2));

--�ܸ����� ����
-- 1ȭ 63 2ȭ 76
select * from webtoon_image where title='�ܸ���������' and no=1;
select * from webtoon_image where title='�ܸ���������' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�ܸ���������',1,
(select nvl(max(image)+1,1) from webtoon_image where title='�ܸ���������' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�ܸ���������',2,
(select nvl(max(image)+1,1) from webtoon_image where title='�ܸ���������' and no=2));

-- ��������
-- 1ȭ 23 2ȭ 23
select * from webtoon_image where title='��������' and no=1;
select * from webtoon_image where title='��������' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'��������',1,
(select nvl(max(image)+1,1) from webtoon_image where title='��������' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'��������',2,
(select nvl(max(image)+1,1) from webtoon_image where title='��������' and no=2));


-- ���� 
-- 1ȭ 38 2ȭ 43
select * from webtoon_image where title='����' and no=1;
select * from webtoon_image where title='����' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'����',1,
(select nvl(max(image)+1,1) from webtoon_image where title='����' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'����',2,
(select nvl(max(image)+1,1) from webtoon_image where title='����' and no=2));

-- ����ž 
-- 1ȭ 5 2ȭ 7
select * from webtoon_image where title='����ž' and no=1;
select * from webtoon_image where title='����ž' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'����ž',1,
(select nvl(max(image)+1,1) from webtoon_image where title='����ž' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'����ž',2,
(select nvl(max(image)+1,1) from webtoon_image where title='����ž' and no=2));

-- �������ΰŽ�
-- 1ȭ 23 2ȭ 33
select * from webtoon_image where title='�������ΰŽ�' and no=1;
select * from webtoon_image where title='�������ΰŽ�' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�������ΰŽ�',1,
(select nvl(max(image)+1,1) from webtoon_image where title='�������ΰŽ�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�������ΰŽ�',2,
(select nvl(max(image)+1,1) from webtoon_image where title='�������ΰŽ�' and no=2));

-- ���۸�
-- 1ȭ 28 2ȭ 32
select * from webtoon_image where title='���۸�' and no=1;
select * from webtoon_image where title='���۸�' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'���۸�',1,
(select nvl(max(image)+1,1) from webtoon_image where title='���۸�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'���۸�',2,
(select nvl(max(image)+1,1) from webtoon_image where title='���۸�' and no=2));

-- ������
-- 1ȭ 48 2ȭ 56
select * from webtoon_image where title='������' and no=1;
select * from webtoon_image where title='������' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'������',1,
(select nvl(max(image)+1,1) from webtoon_image where title='������' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'������',2,
(select nvl(max(image)+1,1) from webtoon_image where title='������' and no=2));

-- ���п�
-- 1ȭ 27 2ȭ 29
select * from webtoon_image where title='���п�' and no=1;
select * from webtoon_image where title='���п�' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'���п�',1,
(select nvl(max(image)+1,1) from webtoon_image where title='���п�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'���п�',2,
(select nvl(max(image)+1,1) from webtoon_image where title='���п�' and no=2));

-- �����ǼҸ�
-- 1ȭ 2 2ȭ 1
select * from webtoon_image where title='�����ǼҸ�' and no=1;
select * from webtoon_image where title='�����ǼҸ�' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����ǼҸ�',1,
(select nvl(max(image)+1,1) from webtoon_image where title='�����ǼҸ�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����ǼҸ�',2,
(select nvl(max(image)+1,1) from webtoon_image where title='�����ǼҸ�' and no=2));

-- �����ϱ�
-- 1ȭ 8 2ȭ 9
select * from webtoon_image where title='�����ϱ�' and no=1;
select * from webtoon_image where title='�����ϱ�' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����ϱ�',1,
(select nvl(max(image)+1,1) from webtoon_image where title='�����ϱ�' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����ϱ�',2,
(select nvl(max(image)+1,1) from webtoon_image where title='�����ϱ�' and no=2));

-- �����
-- 1ȭ 6 2ȭ 5
select * from webtoon_image where title='�����' and no=1;
select * from webtoon_image where title='�����' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����',1,
(select nvl(max(image)+1,1) from webtoon_image where title='�����' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'�����',2,
(select nvl(max(image)+1,1) from webtoon_image where title='�����' and no=2));