create table Certification(
uuid varchar2(20) not null primary key,
email varchar2(50) not null
);

commit;
select * from certification;

select count(*) from certification where uuid='e010bce2' and email='awjdalsa@gmail.com';

insert into certification values ('','');