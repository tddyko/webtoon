
drop table main_ad_top5;
create table main_ad_top5(
    title varchar2(20),
    ad_start number
);
select * from main_ad_top5;

insert into main_ad_top5 values('��',160801);
insert into main_ad_top5 values('����',160801);
insert into main_ad_top5 values('������ ��',160801);
insert into main_ad_top5 values('����',160801);
insert into main_ad_top5 values('�ۼ�Ʈ',160801);

delete from main_ad_top5;