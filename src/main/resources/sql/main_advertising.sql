-- ����� ���� ���� ��ϵ�

drop table main_advertising;

create table main_advertising(
    idx number primary key not null,
    title varchar2(20) not null,
    type varchar2(20) not null,
    fee number not null,
    ad_start date not null,
    ad_end date not null,
    ad_image varchar2(2000) not null,
    summary varchar2(1000) not null
       
);
update main_advertising set title='',type='',fee=2,ad_start=sysdate,ad_end=sysdate,ad_image='',summary='' where idx=2;

commit;
select * from main_advertising where idx=3;

select * from main_advertising;
insert into main_advertising values(1,'��','�׼�',1500000,'2016-08-01','2016-08-19','��.jpg','�׵��� ã�ƿ´�');
insert into main_advertising values(2,'����','�б�',1500000,'2016-08-01','2016-08-19','����.jpg','�������� ����');
insert into main_advertising values(3,'������ ��','Ʈ��',1500000,'2016-08-01','2016-08-19','������ ��.jpg','������ �� ��');
insert into main_advertising values(4,'����','����',1500000,'2016-08-01','2016-08-19','����.jpg','�ϼ� ���� ���� ����~');
insert into main_advertising values(5,'�ۼ�Ʈ','���',1500000,'2016-08-01','2016-08-19','�ۼ�Ʈ.jpg','����� ���ѹα� ���ۼ�Ʈ?');

insert into main_advertising values(1,'��','�׼�',1500000,160801,160819,'��.jpg','�׵��� ã�ƿ´�');
insert into main_advertising values(2,'����','�б�',1500000,160801,160819,'����.jpg','�������� ����');
insert into main_advertising values(3,'������ ��','Ʈ��',1500000,160801,160819,'������ ��.jpg','������ �� ��');
insert into main_advertising values(4,'����','����',1500000,160801,160819,'����.jpg','�ϼ� ���� ���� ����~');
insert into main_advertising values(5,'�ۼ�Ʈ','���',1500000,160801,160819,'�ۼ�Ʈ.jpg','����� ���ѹα� ���ۼ�Ʈ?');
insert into main_advertising values(6,'�ۼ�Ʈ','���',1500000,160801,160808,'�ۼ�Ʈ.jpg','����� ���ѹα� ���ۼ�Ʈ?');


insert into main_advertising values((select nvl(max(idx)+1,1) from main_advertising),'�ۼ�Ʈ','���',1500000,160801,160808,'�ۼ�Ʈ.jpg','����� ���ѹα� ���ۼ�Ʈ?');
delete from main_advertising where idx=5;
desc main_advertising;

select * from main_advertising where ad_start<=sysdate and ad_end >sysdate;

-- �̰� �׳� ������ ��
-- �������� �͵� �� ȭ�鿡 ��� �͵�
drop table main_ad_top5;
create table main_ad_top5(
    idx number primary key not null,
    title varchar2(20),
    ad_start number not null,
    ad_image varchar2(50) not null
    
);
commit;
select * from main_ad_top5;
select * from main_ad_top5 where idx=3;
insert into main_ad_top5 values(1,'��',160801,'��.jpg');
insert into main_ad_top5 values(2,'����',160801,'����.jpg');
insert into main_ad_top5 values(3,'������ ��',160801,'������ ��.jpg');
insert into main_ad_top5 values(4,'����',160801,'����.jpg');
insert into main_ad_top5 values(5,'�ۼ�Ʈ',160801,'�ۼ�Ʈ.jpg');
insert into main_ad_top5 values(6,'�ۼ�Ʈ',160801,'�ۼ�Ʈ.jpg');

delete from main_ad_top5;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
select a.ad_image from main_advertising a join main_ad_top5 t  on a.title=t.title and a.ad_start=t.ad_start;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
commit;

select * from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
