DROP TABLE sake_user;
purge recyclebin;
CREATE TABLE sake_user(
user_id varchar2(100),
user_pwd varchar2(100),
user_name varchar2(100),
user_birth varchar2(100),
user_phone varchar2(100),
user_addr varchar2(100),
user_cart varchar2(1000),
user_favorite varchar2(1000)
);