create table freeboard_comment(
idx number not null primary key,
freeboard_idx number not null,
username varchar2(20) not null,
email varchar2(50) not null,
content varchar2(600) not null,
write_date date default sysdate
); 