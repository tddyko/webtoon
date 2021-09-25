commit;
-- Webtoon 테이블(만화목록)

drop table webtoon;
create table webtoon(
    idx number not null primary key,    -- 고유값
    title varchar2(50) not null,        -- 제목
    category varchar2(20) not null,     -- 장르
    finish varchar2(10) default 'N',    -- 완결
    image varchar2(200) not null,       -- 메인이미지
    week varchar2(10) not null,         -- 쓰여지는주
    heart number default 0,              -- 좋아요
    summary varchar2(1000) not null,               -- 요약설명
    visibility varchar2(100) not null   -- 공개여부
);

update webtoon set title='신의탑',idx=1 where idx=1;
select * from webtoon;
insert into webtoon values(1,'신의탑','액션','N','main.jpg','Mon',0,'자신의 모든 것이었던 소녀를 쫓아 탑에 들어온 소년<br/>그리고 그런 소년을 시험하는 탑','N');
insert into webtoon values(2,'연놈','로멘스','N','main.jpg','Wed',0,'중2 여름, 가지말라는 말도 좋아했다는 말도 하지 못한 채 보낸 그녀가 3년 만에 나타났다.','N');
insert into webtoon values(3,'외모지상주의','학교','N','main.jpg','Fri',0,'어느날 그에게 일어난 기적같은 일','N');
insert into webtoon values(4,'스퍼맨','성인','N','main.jpg','Sun',0,'사랑하는 여자친구와 드디어 첫날밤을 맞게된 김기두<br/> 갑자기 정체모를 사람들에게 납치되고<br/> 자신이 슈퍼정자를 가진 능력자라는 얘기를 듣게 되는데...','N');
insert into webtoon values(5,'스프릿핑거스','로맨스','N','main.jpg','Sun',0,'평범한 여고생, 알록달록 이상한 그림모임에 들어가다! <br/> 나만의 색을 찾아 떠나는 모험 이야기!','N');

insert into webtoon values((select nvl(max(idx)+1,1) from webtoon),'ㅋ','ㅇ','ㅇ','ㅇ','ㅅ',0,'ㅋ');





insert into webtoon values(6,'공복의저녁식사','코믹','N','main.jpg','Sat',0,'세상에는 왜 이렇게 맛있는게 많을까<br/>만두와의 저녁식사를 통한 식탐소녀 복희의 좌충우돌 성장기','N');
insert into webtoon values(7,'노블레스','몰라','N','main.jpg','Tue',0,'820년간의 긴 수면기, 드디어 새로운 세상에 눈을 뜨다.<br/>그리고 새로운 세상의 새로운 사람들을 만나다.','N');

insert into webtoon values(8,'마음의소리','응몰라','N','main.jpg','Tue',0,'마사루의 센스를, 이나중의 황당함을 뛰어 넘는다!<br/>솔직 담백 최강의 개그 만화 <마음의 소리>! 여러분의 마음의 소리에 귀기울여 보세요!','N');
insert into webtoon values(9,'복학왕','학교','N','main.jpg','Wed',0,'패션왕 우기명이 돌아왔다!<br/>즐거운 대학 생활?! 과연?!','N');
insert into webtoon values(10,'상중하','액션','N','main.jpg','Thu',0,'한 방 인생 역전을 위한<br/>일란성 세 쌍둥이의 처절한 인생 쟁탈전','N');
insert into webtoon values(11,'연애혁명','로맨스','N','main.jpg','Thu',0,'로맨스, 그런 건 우리에게 있을 수가 없어!<br/>신개념 로맨스','N');
insert into webtoon values(12,'프리드로우','학교','N','main.jpg','Sat',0,'한태성을 중심으로 벌어지는<br/>다양한 청춘들의 스펙타클한 학원 시트콤 드라마','N');
insert into webtoon values(13,'한번더해요','성인','N','main.jpg','Fri',0,'한번 더 해요','N');
insert into webtoon values(14,'대학일기','몰라','N','main.jpg','Mon',0,'로망이 꽃피는 캠퍼스는 없다.<br/>극사실주의에 기반한 너무나 현실적인 우리의 대학일기','N');

-- test
insert into webtoon values(15,'바보','몰라','N','꽃.jpg','Mon',0,'로망이 꽃피는 캠퍼스는 없다.<br/>극사실주의에 기반한 너무나 현실적인 우리의 대학일기');
--/test
delete webtoon where idx=15;
select * from webtoon where week='Mon';
commit;


-- Webtoon_episode(만화의 각 화)
drop table webtoon_episode;
create table webtoon_episode(
    idx number not null primary key,    -- 고유값
    title varchar2(50) not null,        -- 웹툰제목
    no number not null,                 -- 몇화
    no_title varchar2(50) not null,     -- 화별 소제목
    viewcount number default 0,         -- 죄회수
    star number default 0,              -- 별점
    write_date date,                    -- 등록날짜
    image varchar2(500) not null,        -- 화의 대표이미지  
    visibility varchar2(100) default 'Y'not null   -- 공개여부
);

select e.* from webtoon d join webtoon_episode e on d.title='외모지상주의' and e.title='외모지상주의';

select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;
select a.ad_image from main_advertising a join main_ad_top5 t  on a.title=t.title and a.ad_start=t.ad_start;
select t.idx,t.title,t.ad_start,t.ad_image from main_ad_top5 t join main_advertising a on
		a.title=t.title and a.ad_start=t.ad_start;

insert into webtoon_episode values (1,'공복의저녁식사',1,'공복',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (2,'공복의저녁식사',2,'공복',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (3,'노블레스',1,'노블',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (4,'노블레스',2,'레스',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (5,'대학일기',1,'대학',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (6,'대학일기',2,'일기',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (7,'마음의소리',1,'마음의',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (8,'마음의소리',2,'소리',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (9,'복학왕',1,'복학',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (10,'복학왕',2,'왕',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (11,'상중하',1,'상중',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (12,'상중하',2,'하',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (13,'스퍼맨',1,'스퍼',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (14,'스퍼맨',2,'맨',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (15,'스프릿핑거스',1,'스프릿',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (16,'스프릿핑거스',2,'핑거스',0,0,sysdate,'image2.jpg','Y');
insert into webtoon_episode values (17,'신의탑',1,'신의',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (18,'신의탑',2,'탑',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (19,'연놈',1,'연',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (20,'연놈',2,'놈',0,0,sysdate,'image2.jpg','Y');
insert into webtoon_episode values (21,'연애혁명',1,'연애',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (22,'연애혁명',2,'혁명',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (23,'외모지상주의',1,'외모지상',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (24,'외모지상주의',2,'주의',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (25,'프리드로우',1,'프리드',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (26,'프리드로우',2,'로우',0,0,sysdate,'image2.jpg','Y');

insert into webtoon_episode values (27,'한번더해요',1,'한번더',0,0,sysdate,'image1.jpg','Y');
insert into webtoon_episode values (28,'한번더해요',2,'해요',0,0,sysdate,'image2.jpg','Y');
commit;


delete webtoon_episode where idx=14;
select * from webtoon_episode where title='한번더해요' order by no desc;

select * from webtoon_episode;

-- Webtoon_image(만화별 이미지들)

create table webtoon_image(
    idx number not null primary key,    -- 고유값
    title varchar2(50) not null,        -- 웹툰제목
    no number not null,                 -- 몇 화
    image number not null               -- 해당 이미지
);

commit;
select * from webtoon_image where idx=1;


select image from webtoon_image where title='공복의저녁식사' and no=1 order by image asc;
select * from test as of timestamp(systimestamp - interval '15' minute) where user_id='webtoon_image';
drop table webtoon_image;
select * from webtoon_image where title='공복의저녁식사' and no=1 order by image asc;
delete webtoon_image where idx=1;
select * from  webtoon_image;
insert into webtoon_image values(1,'공복의저녁식사',1,1);
insert into webtoon_image values(2,'공복의저녁식사',1,2);
insert into webtoon_image values(3,'공복의저녁식사',1,3);
insert into webtoon_image values(4,'공복의저녁식사',1,4);
insert into webtoon_image values(5,'공복의저녁식사',1,5);
insert into webtoon_image values(6,'공복의저녁식사',1,6);
insert into webtoon_image values(7,'공복의저녁식사',1,7);
insert into webtoon_image values(8,'공복의저녁식사',1,8);
insert into webtoon_image values(9,'공복의저녁식사',1,9);
insert into webtoon_image values(10,'공복의저녁식사',1,10);
insert into webtoon_image values(11,'공복의저녁식사',1,11);
insert into webtoon_image values(12,'공복의저녁식사',1,12);
insert into webtoon_image values(13,'공복의저녁식사',1,13);
insert into webtoon_image values(14,'공복의저녁식사',1,14);
insert into webtoon_image values(15,'공복의저녁식사',1,15);
insert into webtoon_image values(16,'공복의저녁식사',1,16);
insert into webtoon_image values(17,'공복의저녁식사',1,17);
insert into webtoon_image values(18,'공복의저녁식사',1,18);
insert into webtoon_image values(19,'공복의저녁식사',1,19);
insert into webtoon_image values(20,'공복의저녁식사',1,20);
insert into webtoon_image values(21,'공복의저녁식사',1,21);
insert into webtoon_image values(22,'공복의저녁식사',1,22);
insert into webtoon_image values(23,'공복의저녁식사',1,23);
insert into webtoon_image values(24,'공복의저녁식사',1,24);
insert into webtoon_image values(25,'공복의저녁식사',1,25);
insert into webtoon_image values(26,'공복의저녁식사',1,26);
insert into webtoon_image values(27,'공복의저녁식사',1,27);
insert into webtoon_image values(28,'공복의저녁식사',1,28);


insert into webtoon_image values(29,'공복의저녁식사',2,1);
insert into webtoon_image values(30,'공복의저녁식사',2,2);
insert into webtoon_image values(31,'공복의저녁식사',2,3);
insert into webtoon_image values(32,'공복의저녁식사',2,4);
insert into webtoon_image values(33,'공복의저녁식사',2,5);
insert into webtoon_image values(34,'공복의저녁식사',2,6);
insert into webtoon_image values(35,'공복의저녁식사',2,7);
insert into webtoon_image values(36,'공복의저녁식사',2,8);
insert into webtoon_image values(37,'공복의저녁식사',2,9);
insert into webtoon_image values(38,'공복의저녁식사',2,10);
insert into webtoon_image values(39,'공복의저녁식사',2,11);
insert into webtoon_image values(40,'공복의저녁식사',2,12);
insert into webtoon_image values(41,'공복의저녁식사',2,13);
insert into webtoon_image values(42,'공복의저녁식사',2,14);
insert into webtoon_image values(43,'공복의저녁식사',2,15);
insert into webtoon_image values(44,'공복의저녁식사',2,16);
insert into webtoon_image values(45,'공복의저녁식사',2,17);
insert into webtoon_image values(46,'공복의저녁식사',2,18);
insert into webtoon_image values(47,'공복의저녁식사',2,19);
insert into webtoon_image values(48,'공복의저녁식사',2,20);
insert into webtoon_image values(49,'공복의저녁식사',2,21);
insert into webtoon_image values(50,'공복의저녁식사',2,22);
insert into webtoon_image values(51,'공복의저녁식사',2,23);
insert into webtoon_image values(52,'공복의저녁식사',2,24);
insert into webtoon_image values(53,'공복의저녁식사',2,25);
insert into webtoon_image values(54,'공복의저녁식사',2,26);
insert into webtoon_image values(55,'공복의저녁식사',2,27);
insert into webtoon_image values(56,'공복의저녁식사',2,28);
insert into webtoon_image values(57,'공복의저녁식사',2,29);
insert into webtoon_image values(58,'공복의저녁식사',2,30);
insert into webtoon_image values(59,'공복의저녁식사',2,31);

commit;
delete webtoon_image where image=99;
select * from webtoon_image where title='한번더해요' and no=1;
select * from webtoon_image where title='한번더해요' and no=2;
-- 한번더해요 
-- 1화-52까지
-- 2화 37까지
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'한번더해요',1,(select nvl(max(image)+1,1) from webtoon_image where title='한번더해요' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'한번더해요',2,(select nvl(max(image)+1,1) from webtoon_image where title='한번더해요' and no=2));

select * from webtoon_image where title='프리드로우' and no=1;
select * from webtoon_image where title='프리드로우' and no=2;
-- 프리드로우
-- 1화 20,2화 22
delete webtoon_image where title='프리드로우';
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'프리드로우',1,(select nvl(max(image)+1,1) from webtoon_image where title='프리드로우' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'프리드로우',2,(select nvl(max(image)+1,1) from webtoon_image where title='프리드로우' and no=2));

--외모지상 주의
-- 1화 63 2화 76
select * from webtoon_image where title='외모지상주의' and no=1;
select * from webtoon_image where title='외모지상주의' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'외모지상주의',1,
(select nvl(max(image)+1,1) from webtoon_image where title='외모지상주의' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'외모지상주의',2,
(select nvl(max(image)+1,1) from webtoon_image where title='외모지상주의' and no=2));

-- 연애혁명
-- 1화 23 2화 23
select * from webtoon_image where title='연애혁명' and no=1;
select * from webtoon_image where title='연애혁명' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'연애혁명',1,
(select nvl(max(image)+1,1) from webtoon_image where title='연애혁명' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'연애혁명',2,
(select nvl(max(image)+1,1) from webtoon_image where title='연애혁명' and no=2));


-- 연놈 
-- 1화 38 2화 43
select * from webtoon_image where title='연놈' and no=1;
select * from webtoon_image where title='연놈' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'연놈',1,
(select nvl(max(image)+1,1) from webtoon_image where title='연놈' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'연놈',2,
(select nvl(max(image)+1,1) from webtoon_image where title='연놈' and no=2));

-- 신의탑 
-- 1화 5 2화 7
select * from webtoon_image where title='신의탑' and no=1;
select * from webtoon_image where title='신의탑' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'신의탑',1,
(select nvl(max(image)+1,1) from webtoon_image where title='신의탑' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'신의탑',2,
(select nvl(max(image)+1,1) from webtoon_image where title='신의탑' and no=2));

-- 스프릿핑거스
-- 1화 23 2화 33
select * from webtoon_image where title='스프릿핑거스' and no=1;
select * from webtoon_image where title='스프릿핑거스' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'스프릿핑거스',1,
(select nvl(max(image)+1,1) from webtoon_image where title='스프릿핑거스' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'스프릿핑거스',2,
(select nvl(max(image)+1,1) from webtoon_image where title='스프릿핑거스' and no=2));

-- 스퍼맨
-- 1화 28 2화 32
select * from webtoon_image where title='스퍼맨' and no=1;
select * from webtoon_image where title='스퍼맨' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'스퍼맨',1,
(select nvl(max(image)+1,1) from webtoon_image where title='스퍼맨' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'스퍼맨',2,
(select nvl(max(image)+1,1) from webtoon_image where title='스퍼맨' and no=2));

-- 상중하
-- 1화 48 2화 56
select * from webtoon_image where title='상중하' and no=1;
select * from webtoon_image where title='상중하' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'상중하',1,
(select nvl(max(image)+1,1) from webtoon_image where title='상중하' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'상중하',2,
(select nvl(max(image)+1,1) from webtoon_image where title='상중하' and no=2));

-- 복학왕
-- 1화 27 2화 29
select * from webtoon_image where title='복학왕' and no=1;
select * from webtoon_image where title='복학왕' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'복학왕',1,
(select nvl(max(image)+1,1) from webtoon_image where title='복학왕' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'복학왕',2,
(select nvl(max(image)+1,1) from webtoon_image where title='복학왕' and no=2));

-- 마음의소리
-- 1화 2 2화 1
select * from webtoon_image where title='마음의소리' and no=1;
select * from webtoon_image where title='마음의소리' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'마음의소리',1,
(select nvl(max(image)+1,1) from webtoon_image where title='마음의소리' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'마음의소리',2,
(select nvl(max(image)+1,1) from webtoon_image where title='마음의소리' and no=2));

-- 대학일기
-- 1화 8 2화 9
select * from webtoon_image where title='대학일기' and no=1;
select * from webtoon_image where title='대학일기' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'대학일기',1,
(select nvl(max(image)+1,1) from webtoon_image where title='대학일기' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'대학일기',2,
(select nvl(max(image)+1,1) from webtoon_image where title='대학일기' and no=2));

-- 노블레스
-- 1화 6 2화 5
select * from webtoon_image where title='노블레스' and no=1;
select * from webtoon_image where title='노블레스' and no=2;
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'노블레스',1,
(select nvl(max(image)+1,1) from webtoon_image where title='노블레스' and no=1));
insert into webtoon_image values((select nvl(max(idx)+1,1) from webtoon_image),'노블레스',2,
(select nvl(max(image)+1,1) from webtoon_image where title='노블레스' and no=2));