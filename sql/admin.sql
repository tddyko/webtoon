
commit;

create table admin(
    admin varchar2(10) primary key not null,
    passwd varchar2(100) not null
);
select * from admin;

insert into admin values('admin','1234');

select count(*) from admin where admin='admin' and passwd='1234'; 