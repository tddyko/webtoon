-- 광고비 받은 웹툰 목록들

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
insert into main_advertising values(1,'손','액션',1500000,'2016-08-01','2016-08-19','손.jpg','그들이 찾아온다');
insert into main_advertising values(2,'일진','학교',1500000,'2016-08-01','2016-08-19','일진.jpg','일진들의 전쟁');
insert into main_advertising values(3,'돗가비 시','트롤',1500000,'2016-08-01','2016-08-19','돗가비 시.jpg','돗가비가 쓴 시');
insert into main_advertising values(4,'레릭','벌레',1500000,'2016-08-01','2016-08-19','레릭.jpg','암소 레릭 레릭 레릭~');
insert into main_advertising values(5,'퍼센트','노답',1500000,'2016-08-01','2016-08-19','퍼센트.jpg','당신은 대한민국 몇퍼센트?');

insert into main_advertising values(1,'손','액션',1500000,160801,160819,'손.jpg','그들이 찾아온다');
insert into main_advertising values(2,'일진','학교',1500000,160801,160819,'일진.jpg','일진들의 전쟁');
insert into main_advertising values(3,'돗가비 시','트롤',1500000,160801,160819,'돗가비 시.jpg','돗가비가 쓴 시');
insert into main_advertising values(4,'레릭','벌레',1500000,160801,160819,'레릭.jpg','암소 레릭 레릭 레릭~');
insert into main_advertising values(5,'퍼센트','노답',1500000,160801,160819,'퍼센트.jpg','당신은 대한민국 몇퍼센트?');
insert into main_advertising values(6,'퍼센트','노답',1500000,160801,160808,'퍼센트.jpg','당신은 대한민국 몇퍼센트?');


insert into main_advertising values((select nvl(max(idx)+1,1) from main_advertising),'퍼센트','노답',1500000,160801,160808,'퍼센트.jpg','당신은 대한민국 몇퍼센트?');
delete from main_advertising where idx=5;
desc main_advertising;

select * from main_advertising where ad_start<=sysdate and ad_end >sysdate;

-- 이거 그냥 쓰지마 씨
-- 광고비받은 것들 중 화면에 띄울 것들
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
insert into main_ad_top5 values(1,'손',160801,'손.jpg');
insert into main_ad_top5 values(2,'일진',160801,'일진.jpg');
insert into main_ad_top5 values(3,'돗가비 시',160801,'돗가비 시.jpg');
insert into main_ad_top5 values(4,'레릭',160801,'레릭.jpg');
insert into main_ad_top5 values(5,'퍼센트',160801,'퍼센트.jpg');
insert into main_ad_top5 values(6,'퍼센트',160801,'퍼센트.jpg');

delete from main_ad_top5;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
select a.ad_image from main_advertising a join main_ad_top5 t  on a.title=t.title and a.ad_start=t.ad_start;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
commit;

select * from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
