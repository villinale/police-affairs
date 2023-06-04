INSERT INTO user(u_no,u_role,u_name,u_psw,u_sex,u_phone) VALUES
(1,'管理员','admin','123456','男','12345678910'),
(2,'用户','admin','1111','男','2222'),
(3,'警员','1','1','男','1'),
(4,'警员','2','2','男','2'),
(5,'警员','3','3','男','3'),
(6,'警员','4','4','男','4');

INSERT INTO station(s_no,s_name,s_lon,s_lat,s_phone,s_province,s_city,s_area,s_address) VALUES
(1,'浦东分局','121.532328','31.191044','0210000','上海市','','浦东区','上海市浦东新区丁香路655号');

INSERT INTO officer(o_no,o_stat,u_no,s_no) VALUES
(1,'任务中',3,1),
(2,'任务中',4,1),
(3,'空闲',5,1),
(4,'空闲',6,1);

INSERT INTO cases(c_no,c_title,c_text,c_startdate,c_enddate,c_level,c_province,c_city,c_area, c_address,c_lon,c_lat,c_stat,c_isPublic,s_no,o_no,u_no) VALUES
(1,'案件1','案件1','2020-01-01 17:43:03','2020-01-05 17:43:03','轻微','上海市','','长宁区','上海市长宁区新泾镇淞虹路中新泾公园',121.365406,31.201426,'待分配',false,1,1,2);
