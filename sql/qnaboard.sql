create table qnaboard(
idx number not null primary key,
category varchar2(30) not null,
question varchar2(200) not null,
answer varchar2(600) not null
);

delete qnaboard where idx =1;
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'�̿�','���� ���縦 �ϰ� �ͽ��ϴ�. ��� �� �˷��ּ���','FakeToon@gamail.com���� �ּ� 2ȭ �з��� ������ ����� �۰��� ����ó�� �����ֽø� ���� �� ������ �帮�ڽ��ϴ�. ...');
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'�̿�','���� ���縦 �ϰ� �ͽ��ϴ�. ��� �� �˷��ּ���','FakeToon@gamail.com���� �ּ� 2ȭ �з��� ������ ����� �۰��� ����ó�� �����ֽø� ���� �� ������ �帮�ڽ��ϴ�. ...');
insert into qnaboard values ((select nvl (max(idx)+1,1) from qnaboard),'�̿�','���� ���縦 �ϰ� �ͽ��ϴ�. ��� �� �˷��ּ���','FakeToon@gamail.com���� �ּ� 2ȭ �з��� �ϼ� ����� �۰��� ����ó�� �����ֽø� ���� �� ������ �帮�ڽ��ϴ�. ...');

commit; 