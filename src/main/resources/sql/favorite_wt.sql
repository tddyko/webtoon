create table favorite_wt(
    idx number not null primary key,
    w_title varchar2(50) not null,
    m_idx number not null,
    plus_date date default sysdate  
    
);

insert into favorite_wt values((select nvl(max(idx)+1,1) from favorite_wt ),'�ܸ�',3,sysdate);
select * from favorite_wt;
select count(*) from favorite_wt where w_title='������' and m_idx=3;
drop table favorite_wt;
commit;