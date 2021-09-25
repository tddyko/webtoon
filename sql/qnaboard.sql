create table qnaboard(
idx number not null primary key,
category varchar2(30) not null,
question varchar2(200) not null,
answer varchar2(600) not null
);

delete qnaboard where idx =1;
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'이용','웹툰 연재를 하고 싶습니다. 방법 좀 알려주세요','FakeToon@gamail.com으로 최소 2화 분량의 오나성 원고와 작가님 연락처를 남겨주시면 검토 후 연락을 드리겠습니다. ...');
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'이용','웹툰 연재를 하고 싶습니다. 방법 좀 알려주세요','FakeToon@gamail.com으로 최소 2화 분량의 오나성 원고와 작가님 연락처를 남겨주시면 검토 후 연락을 드리겠습니다. ...');
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'이용','웹툰 연재를 하고 싶습니다. 방법 좀 알려주세요','FakeToon@gamail.com으로 최소 2화 분량의 완성 원고와 작가님 연락처를 남겨주시면 검토 후 연락을 드리겠습니다. ...');

commit; 