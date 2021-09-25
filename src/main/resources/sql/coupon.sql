desc coupon;
create table coupon(
idx number not null primary key,
coupon varchar2(50) not null,
coin number not null,
write_date date default sysdate,
end_date date not null
)