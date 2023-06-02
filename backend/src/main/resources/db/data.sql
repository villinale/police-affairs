INSERT INTO user(u_no,u_role,u_name,u_psw,u_sex,u_phone) VALUES
(1,'管理员','admin','123456','男','12345678910'),
(2,'警员','admin','1111','男','1111'),
(3,'用户','admin','1111','男','2222');

INSERT INTO station(s_no,s_name,s_long,s_lat) VALUES
(1,'浦东','12.3','10.2');

INSERT INTO officer(o_no,o_stat,u_no,s_no) VALUES
(1,0,2,1);

INSERT INTO cases(c_no,c_title,c_text,c_data,c_level,c_loc,c_stat,s_no,o_no) VALUES
(1,'案件1','案件1','2020-01-01',1,'浦东',0,1,1);

INSERT INTO records(r_no,r_text,r_data,r_stat,c_no,o_no,u_no) VALUES
(1,'记录1','2020-01-01 00:00:00',0,1,1,1);