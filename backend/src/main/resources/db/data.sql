INSERT INTO user(u_no,u_role,u_name,u_psw,u_sex,u_phone) VALUES
(1,'管理员','admin','123456','男','12345678910'),
(2,'用户','admin','1111','男','2222'),
(3,'警员','1','1','男','1'),
(4,'警员','2','2','男','2'),
(5,'警员','3','3','男','3'),
(6,'警员','4','4','男','4');

INSERT INTO station(s_no,s_name,s_long,s_lat) VALUES
(1,'浦东','12.3','10.2');

INSERT INTO officer(o_no,o_stat,u_no,s_no) VALUES
(1,0,3,1),
(2,0,4,1),
(3,0,5,1),
(4,0,6,1);

INSERT INTO cases(c_no,c_title,c_text,c_date,c_level,c_province,c_city,c_area, c_address,c_lon,c_lat,c_stat,s_no,o_no,u_no) VALUES
(1,'案件1','案件1','2020-01-01 17:43:03',0,'上海市','','浦东区','浦东',0.0,0.0,0,1,1,1);
