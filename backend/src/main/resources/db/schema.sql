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
    s_long DOUBLE PRECISION NOT NULL,
    s_lat DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(s_no)
);

CREATE TABLE officer(
    o_no INTEGER NOT NULL AUTO_INCREMENT,
    o_stat INTEGER NOT NULL,
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
    c_data DATE NOT NULL,
    c_level INTEGER NOT NULL,
    c_loc VARCHAR(128) NOT NULL,
    c_stat INTEGER NOT NULL,
    s_no INTEGER NOT NULL,
    o_no INTEGER NOT NULL,
    PRIMARY KEY(c_no),
    FOREIGN KEY (o_no) REFERENCES officer(o_no),
    FOREIGN KEY (s_no) REFERENCES station(s_no)
);

CREATE TABLE records(
    r_no INTEGER NOT NULL AUTO_INCREMENT,
    r_text VARCHAR(1024) DEFAULT NULL,
    r_data TIMESTAMP NOT NULL,
    r_stat INTEGER NOT NULL,
    c_no INTEGER NOT NULL,
    o_no INTEGER NOT NULL,
    u_no INTEGER NOT NULL,
    PRIMARY KEY (r_no),
    FOREIGN KEY (c_no) REFERENCES cases(c_no),
    FOREIGN KEY (o_no) REFERENCES officer(o_no),
    FOREIGN KEY (u_no) REFERENCES user(u_no)
);
