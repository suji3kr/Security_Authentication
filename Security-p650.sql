drop table authorities;

create table users(
    username VARCHAR2(50) not null primary key,
    password VARCHAR2(50)not null,
    enabled char(1) default '1'
);


create TABLE authorities(
    username VARCHAR2(50)not null,
    authority VARCHAR2(50)not null,
    CONSTRAINT fk_authorities_users foreign key(username) REFERENCES users(username));
    
 create UNIQUE index ix_auth_username on authorities (username, authority);


insert into users(username, password) values ('user00','pw00');
insert into users(username, password) values ('member00','pw00');
insert into users(username, password) values ('admin00','pw00');

insert into authorities (username, authority) values ('user00', 'ROLE_USER');
insert into authorities (username, authority) values ('member00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_ADMIN');

commit;


select*from authorities;



------------------------------------------------------------



drop table t_member;

create table tbl_member(
    userid VARCHAR2(50) not null primary KEY,
    userpw VARCHAR2(100) not null,
    username VARCHAR2(100) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1');
    
create table tbl_member_auth(
    userid VARCHAR2(50) not null,
    auth VARCHAR2(50) not null,
    constraint fk_member_auth foreign key(userid) REFERENCES tbl_member(userid)
    );
    
    
select* from tbl_member;

select* from tbl_member_auth;

select userid username, userpw password, enabled
from
    tbl_member
where userid ='admin90';


select userid username, auth authority
from
    tbl_member_auth
where userid ='admin90';

insert into tbl_member_auth(userid, auth) values('admin90', 'ROLE_MEMBER');
insert into tbl_member_auth(userid, auth) values('admin90', 'ROLE_USER');

commit;

select* from tbl_member_auth;

SELECT
  mem.userid, userpw, username, enabled, regdate, updatedate, auth 
FROM
  tbl_member mem LEFT OUTER JOIN tbl_member_auth auth on mem.userid = auth.userid
WHERE mem.userid = 'admin90';


-- 로그인 정보를 유지하는 테이블 

create table persistent_logins (
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null);

select* from persistent_logins;