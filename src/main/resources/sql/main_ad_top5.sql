
drop table main_ad_top5;
create table main_ad_top5(
    title varchar2(20),
    ad_start number
);
select * from main_ad_top5;

insert into main_ad_top5 values('손',160801);
insert into main_ad_top5 values('일진',160801);
insert into main_ad_top5 values('돗가비 시',160801);
insert into main_ad_top5 values('레릭',160801);
insert into main_ad_top5 values('퍼센트',160801);

delete from main_ad_top5;