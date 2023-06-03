drop database if exists police;
create database police;
use police;

CREATE TABLE user(
    u_no INTEGER NOT NULL AUTO_INCREMENT,
    u_role VARCHAR(10) check(u_role='警员' or u_role='管理员' or u_role='用户') ,
    u_name VARCHAR(128) NOT NULL,
    u_psw VARCHAR(32) NOT NULL,
    u_sex VARCHAR(4) check(u_sex='男' or u_sex='女') ,
    u_phone VARCHAR(20),
    PRIMARY KEY(u_no)
);

CREATE TABLE station(
    s_no INTEGER NOT NULL AUTO_INCREMENT,
    s_name VARCHAR(128) NOT NULL,
    s_lon DOUBLE PRECISION NOT NULL,
    s_lat DOUBLE PRECISION NOT NULL,
    s_phone VARCHAR(20) NOT NULL,
    s_province VARCHAR(50) DEFAULT NULL,
    s_city VARCHAR(50) DEFAULT NULL,
    s_area VARCHAR(50) DEFAULT NULL,
    s_address VARCHAR(256) DEFAULT NULL,
    PRIMARY KEY(s_no)
);

CREATE TABLE officer(
    o_no INTEGER NOT NULL AUTO_INCREMENT,
    o_stat VARCHAR(10) NOT NULL check(o_stat='任务中' or o_stat='空闲') ,
    u_no INTEGER NOT NULL,
    s_no INTEGER NOT NULL,
    PRIMARY KEY(o_no),
    FOREIGN KEY (u_no) REFERENCES user(u_no),
    FOREIGN KEY (s_no) REFERENCES station(s_no)
);

CREATE TABLE cases(
    c_no INTEGER NOT NULL AUTO_INCREMENT,
    c_title VARCHAR(128) NOT NULL,
    c_text VARCHAR(1024) DEFAULT NULL,
    c_date DATETIME NOT NULL,
    c_level INTEGER NOT NULL,
    c_province VARCHAR(50) DEFAULT NULL,
    c_city VARCHAR(50) DEFAULT NULL,
    c_area VARCHAR(50) DEFAULT NULL,
    c_address VARCHAR(256) DEFAULT NULL,
    c_lon DOUBLE PRECISION NOT NULL,
    c_lat DOUBLE PRECISION NOT NULL,
    c_stat VARCHAR(10) NOT NULL check(c_stat='待分配' or c_stat='处理中' or c_stat='已结束') ,
    s_no INTEGER NOT NULL,
    o_no INTEGER NOT NULL,
    u_no INTEGER NOT NULL,
    PRIMARY KEY(c_no),
    FOREIGN KEY (o_no) REFERENCES officer(o_no),
    FOREIGN KEY (s_no) REFERENCES station(s_no),
    FOREIGN KEY (u_no) REFERENCES user(u_no)
);