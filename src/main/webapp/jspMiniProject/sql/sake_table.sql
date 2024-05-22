DROP TABLE sake_Table;
purge recyclebin;
CREATE TABLE sake_Table (
    sake_no VARCHAR(15),
    sake_name VARCHAR(150),
    sake_name_kr VARCHAR(100),
    sake_co VARCHAR(70),
    sake_loc VARCHAR(30),
    sake_dosu VARCHAR(15),
    sake_price NUMERIC(15),
    sake_des VARCHAR(1000),
    sake_img varchar2(80)
);

