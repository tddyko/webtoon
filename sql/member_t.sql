create table member_t(
idx number not null primary key,
username varchar2(20) not null,
email varchar2(50) not null,
passwd varchar2(50) not null,
reg_date date default sysdate,
coin number default 0,
phone varchar(20) not null
);

insert into member_t values ((select nvl(max(idx)+1,1) from member_t),'±â¿ë','email@naver.com','pwd',sysdate,0,'010-2979-9353' );

select * from member_t;


