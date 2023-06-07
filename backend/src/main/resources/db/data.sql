INSERT INTO user(u_no,u_role,u_name,u_psw,u_sex,u_phone) VALUES
(1,'管理员','admin','123456','男','12345678910'),
(2,'用户','杭','1111','男','17175715879'),
(3,'用户','admin','1111','男','19929543540'),
(4,'警员','杭熠日','W1NDXBGZ', '男','17175715879'),
(5,'警员','龚易克','JGD#4g~I&', '女','19929543540'),
(6,'警员','皮宪微','YHQY^I5wf9', '女','13292694613'),
(7,'警员','花侃美','&fFsC&8+k', '男','19980442050'),
(8,'警员','伏畏炜','7+mR5KwF', '女','15621135515'),
(9,'警员','邢其曙','Rg_F&dUm', '男','13782708217'),
(10,'警员','蔡斌劫','@hwV#mvoI', '男','13315215593'),
(11,'警员','倪意会','rA+cEP9v', '女','18043158285'),
(12,'警员','徐钧庆','UiBFCcij', '女','18416954677'),
(13,'警员','何杉娆','f))ZJW%RK', '女','15270458812'),
(14,'警员','金朗年','p1qqLkQa', '男','18882496262'),
(15,'警员','鲍霓菱','VjMBoGMUn', '男','15221777686'),
(16,'警员','祖璐优','kMHlWDOIQs', '男','13254816940'),
(17,'警员','蒋凤跃','T(8do7ZAH', '男','17777933686'),
(18,'警员','奚炎锴','9DvzD3T@^', '女','13988067636'),
(19,'警员','蓬书霓','CR&$D&u1#', '女','13671685797'),
(20,'警员','邬默慈','M#D+H~Yl9A', '男','15061536045'),
(21,'警员','蔡菡义','OP$&EYGx', '男','17697534432'),
(22,'警员','韦佳嘉','VcWJ&*X$6', '男','19936853838'),
(23,'警员','杭凡倩','S7)pTr$O', '女','16554863429'),
(24,'警员','伏锴勇','0Fu(+%DHf', '女','18281379815'),
(25,'警员','丁娥朵','PibSFO6_F5', '女','13943555257'),
(26,'警员','叶瀚信','7d@Al!&9', '女','15860674931'),
(27,'警员','霍盼雨','v0VV&1zZm', '男','13811383629'),
(28,'警员','常尧才','iI9d&U$u+', '男','17738123147'),
(29,'警员','房珍铖','&re(hPJo$', '男','17395837515'),
(30,'警员','包珂忠','#YH~xchB8z', '男','18630705853'),
(31,'警员','褚存铮','K5GZ9XG(', '女','13830445785'),
(32,'警员','祁煦俭','hq2L@%%3%', '男','17522215345'),
(33,'警员','严冉沛','4x&5Z*l!yH', '男','13586795780');

INSERT INTO station(s_no,s_name,s_lon,s_lat,s_phone,s_province,s_city,s_area,s_address) VALUES
(1,'浦东分局',121.532328,31.191044,'021-50614567','上海市','','浦东新区','上海市浦东新区丁香路655号'),
(2,'黄浦分局',121.481781,31.19903,'021-63280123','上海市','','黄浦区','上海市黄浦区蒙自路与中山南一路辅路交叉口正东方向80米'),
(3,'徐汇分局',121.444901,31.181434,'021-64868911','上海市','','徐汇区','上海市徐汇区中山南二路1020号(上海体育场地铁站3号口步行390米)'),
(4,'长宁分局',121.383731,31.210344,'021-62906290','上海市','','长宁区','上海市长宁区威宁路201号'),
(5,'杨浦分局',121.546111,31.269083,'021-65431000','上海市','','杨浦区','上海市杨浦区杭州路903号'),
(6,'虹口分局',121.490501,31.247465,'021-63723030','上海市','','虹口区','上海市虹口区闵行路260号'),
(7,'普陀分局',121.399094,31.25458,'021-52809966','上海市','','普陀区','上海市普陀区大渡河路1895号(近芝川路,真如公园内)'),
(8,'静安分局',121.441895,31.230787,'021-62588800','上海市','','静安区','上海市静安区胶州路415-419(昌平路地铁站3号口步行380米)'),
(9,'闵行分局',121.387755,31.090366,'02134074800','上海市','','闵行区','上海市闵行区沪闵路4888号(银都路地铁站1号口步行450米)'),
(10,'宝山分局',121.468091,31.400809,'021-56608111','上海市','','宝山区','上海市宝山区友谊路999号'),
(11,'嘉定分局',121.255298,31.349315,'021-59995000','上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1300号'),
(12,'青浦分局',121.111684,31.154928,'021-59729780','上海市','','青浦区','上海市青浦区城中北路485号'),
(13,'松江分局',121.223843,31.021347,'021-57823618','上海市','','松江区','上海市松江区人民北路899号'),
(14,'金山分局',121.338039,30.741291,'021-37990110','上海市','','金山区','上海市金山区蒙源路110号'),
(15,'奉贤分局',121.463393,30.911147,'021-57426071','上海市','','奉贤区','上海市奉贤区南奉公路9555号'),
(16,'崇明分局',121.429628,31.621114,'021-59611039','上海市','','崇明区','上海市崇明区崇明大道7800号');

INSERT INTO officer(o_no,o_stat,u_no,s_no) VALUES
(1, '空闲',4,1),
(2, '任务中',5,2),
(3, '空闲',6,3),
(4, '空闲',7,4),
(5, '空闲',8,5),
(6, '空闲',9,6),
(7, '空闲',10,7),
(8, '任务中',11,8),
(9, '任务中',12,9),
(10, '任务中',13,10),
(11, '任务中',14,11),
(12, '任务中',15,12),
(13, '空闲',16,13),
(14, '空闲',17,14),
(15, '空闲',18,15),
(16, '任务中',19,16),
(17, '空闲',20,11),
(18, '任务中',21,11),
(19, '任务中',22,11),
(20, '任务中',23,11),
(21, '任务中',24,11),
(22, '空闲',25,11),
(23, '任务中',26,11),
(24, '空闲',27,11),
(25, '空闲',28,11),
(26, '任务中',29,11),
(27, '空闲',30,11),
(28, '空闲',31,11),
(29, '任务中',32,11),
(30, '空闲',33,11);

INSERT INTO cases(c_no,c_title,c_text,c_startdate,c_enddate,c_level,c_province,c_city,c_area, c_address,c_lon,c_lat,c_stat,c_isPublic,s_no,o_no,u_no) VALUES
(1,'泰坦队主席','不要把花生酱放在狗的鼻子上。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。关键哭泣婴儿慢人迷宫点力量颗粒闪光中途追逐者粉红樱桃冰球人鬼魂。蓬松的粉红色独角兽是男子气概男性中流行的身份象征。','2023-05-28 17:43:03','2023-05-29 17:43:03', '较大', '上海市','','浦东新区','上海市浦东新区丁香路655号',121.532328,31.191044, '已结束', false,1,1,2),
(2,'宇宙王子','他恨他爱她恨恨的东西。关键哭泣婴儿慢人迷宫点力量颗粒闪光中途追逐者粉红樱桃冰球人鬼魂。伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。','2023-05-29 17:43:03','2023-05-30 17:43:03', '较大', '上海市','','黄浦区','上海市黄浦区蒙自路与中山南一路辅路交叉口正东方向80米',121.481781,31.19903, '处理中',TRUE,2,2,3),
(3,'小的守护者','克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。我听说南希很漂亮。夕阳的美丽被工业起重机所掩盖。','2023-05-30 17:43:03','2023-05-31 17:43:03', '轻微', '上海市','','徐汇区','上海市徐汇区中山南二路1020号(上海体育场地铁站3号口步行390米)',121.444901,31.181434, '已结束',TRUE,3,3,3),
(4,'龙的守护者','她很反感他分不清柠檬水和酸橙水的区别。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。帕特里夏喜欢钉子用力压在黑板上的声音。不要把花生酱放在狗的鼻子上。','2023-05-31 17:43:03','2023-06-01 17:43:03', '严重', '上海市','','长宁区','上海市长宁区威宁路201号',121.383731,31.210344, '已结束', false,4,4,1),
(5,'国家牧首','帕特里夏喜欢钉子用力压在黑板上的声音。','2023-06-01 17:43:03','2023-06-02 17:43:03', '轻微', '上海市','','杨浦区','上海市杨浦区杭州路903号',121.546111,31.269083, '已结束', false,5,5,2),
(6,'值班主任','我想我会买红色的车，或者我会租蓝色的车。帕特里夏喜欢钉子用力压在黑板上的声音。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。飞鱼在空间站旁很少。阴影粉红色幽灵杀死屏幕黄色磁盘视频游戏迷宫控制台电源点中途岛。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。','2023-06-02 17:43:03','2023-06-03 17:43:03', '一般', '上海市','','虹口区','上海市虹口区闵行路260号',121.490501,31.247465, '已结束',TRUE,6,6,3),
(7,'愚人大师','他在房子后面房间的地板下面藏了一个藏匿处。','2023-06-03 17:43:03','2023-06-04 17:43:03', '较大', '上海市','','普陀区','上海市普陀区大渡河路1895号(近芝川路,真如公园内)',121.399094,31.25458, '已结束', false,7,7,3),
(8,'荒野典范','伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。他愿意找到兔子洞的深处，以便和她在一起。他在房子后面房间的地板下面藏了一个藏匿处。外部的伤疤只说明了故事的一部分。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。','2023-06-04 17:43:03','2023-06-05 17:43:03', '轻微', '上海市','','静安区','上海市静安区胶州路415-419(昌平路地铁站3号口步行380米)',121.441895,31.230787, '处理中',TRUE,8,8,1),
(9,'森林之母','吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。我想我会买红色的车，或者我会租蓝色的车。外部的伤疤只说明了故事的一部分。','2023-06-04 17:43:03','2023-06-05 17:43:04', '严重', '上海市','','闵行区','上海市闵行区沪闵路4888号(银都路地铁站1号口步行450米)',121.387755,31.090366, '处理中',TRUE,9,9,2),
(10,'湖中将军','不要把花生酱放在狗的鼻子上。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。','2023-06-04 17:43:03','2023-06-05 17:43:05', '一般', '上海市','','宝山区','上海市宝山区友谊路999号',121.468091,31.400809, '处理中',TRUE,10,10,3),
(11,'魔法头人','不要把花生酱放在狗的鼻子上。他在房子后面房间的地板下面藏了一个藏匿处。','2023-06-04 17:43:03','2023-06-05 17:43:06', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1300号',121.255298,31.349315, '处理中', false,11,11,3),
(12,'特工论坛报','苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。外部的伤疤只说明了故事的一部分。伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。','2023-06-04 17:43:03','2023-06-05 17:43:07', '较大', '上海市','','青浦区','上海市青浦区城中北路485号',121.111684,31.154928, '处理中',TRUE,12,12,1),
(13,'税务局局长','飞鱼在空间站旁很少。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。毒藤从他们说无法穿透的栅栏中生长出来。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。外部的伤疤只说明了故事的一部分。','2023-06-04 17:43:03','2023-06-05 17:43:08', '轻微', '上海市','','松江区','上海市松江区人民北路899号',121.223843,31.021347, '已结束',TRUE,13,13,2),
(14,'农业男爵','克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。外部的伤疤只说明了故事的一部分。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。','2023-06-04 17:43:03','2023-06-05 17:43:09', '轻微', '上海市','','金山区','上海市金山区蒙源路110号',121.338039,30.741291, '已结束', false,14,14,3),
(15,'铠甲女族长','她很反感他分不清柠檬水和酸橙水的区别。飞鱼在空间站旁很少。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。','2023-06-05 17:43:03','2023-06-06 17:43:03', '一般', '上海市','','奉贤区','上海市奉贤区南奉公路9555号',121.463393,30.911147, '已结束',TRUE,15,15,3),
(16,'能源代表','阴影点草莓吃豆人中途岛追逐者小指杀屏。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。他恨他爱她恨恨的东西。飞鱼在空间站旁很少。他愿意找到兔子洞的深处，以便和她在一起。','2023-06-05 17:43:03','2023-06-06 17:43:04', '轻微', '上海市','','崇明区','上海市崇明区崇明大道7800号',121.429628,31.621114, '处理中', false,16,16,1),
(17,'科学策展人','阴影点草莓吃豆人中途岛追逐者小指杀屏。夕阳的美丽被工业起重机所掩盖。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。他在房子后面房间的地板下面藏了一个藏匿处。克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。吃豆人南梦宫岩谷彻吃豆人发烧迷宫点。','2023-06-05 17:43:03','2023-06-06 17:43:05', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1300号',121.255298,31.349315, '已结束',TRUE,11,17,2),
(18,'工业部长','高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。我听说南希很漂亮。吃豆人铃铛鬼波基草莓闪蓝色敌人南梦宫日本追逐者点点帕库曼。她很反感他分不清柠檬水和酸橙水的区别。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。','2023-06-05 17:43:03','2023-06-06 17:43:06', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1301号',121.255298,31.349315, '处理中',TRUE,11,18,3),
(19,'税务官员','外部的伤疤只说明了故事的一部分。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。她有能够画歌的天赋。橙色善变的蓝色家伙迷宫追逐。','2023-06-05 17:43:03','2023-06-06 17:43:07', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1302号',121.255298,31.349315, '处理中', false,11,19,3),
(20,'通讯总督','当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。外部的伤疤只说明了故事的一部分。','2023-06-05 17:43:03','2023-06-06 17:43:08', '较大', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1303号',121.255298,31.349315, '处理中',TRUE,11,20,1),
(21,'光之红衣主教','蓬松的粉红色独角兽是男子气概男性中流行的身份象征。橙色善变的蓝色家伙迷宫追逐。不要把花生酱放在狗的鼻子上。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。鬼点樱桃眨眼吃豆人力量颗粒果实。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。','2023-06-05 17:43:03','2023-06-06 17:43:09', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1304号',121.255298,31.349315, '处理中',TRUE,11,21,2),
(22,'虔诚的大祭司','鬼点樱桃眨眼吃豆人力量颗粒果实。吃豆人铃铛鬼波基草莓闪蓝色敌人南梦宫日本追逐者点点帕库曼。毒藤从他们说无法穿透的栅栏中生长出来。关键哭泣婴儿慢人迷宫点力量颗粒闪光中途追逐者粉红樱桃冰球人鬼魂。','2023-06-06 17:43:03','2023-06-07 17:43:04', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1305号',121.255298,31.349315, '已结束',TRUE,11,22,3),
(23,'治愈的贤士','他恨他爱她恨恨的东西。鬼点樱桃眨眼吃豆人力量颗粒果实。她有能够画歌的天赋。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。外部的伤疤只说明了故事的一部分。','2023-06-06 17:43:04','2023-06-07 17:43:05', '轻微', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1306号',121.255298,31.349315, '处理中', false,11,23,3),
(24,'死亡长老','橙色善变的蓝色家伙迷宫追逐。她很反感他分不清柠檬水和酸橙水的区别。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。','2023-06-06 17:43:05','2023-06-07 17:43:06', '轻微', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1307号',121.255298,31.349315, '已结束', false,11,24,1),
(25,'自然伊玛目','高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。橙色善变的蓝色家伙迷宫追逐。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。鬼点樱桃眨眼吃豆人力量颗粒果实。老苹果陶醉于它的权威。','2023-06-06 17:43:06','2023-06-07 17:43:07', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1308号',121.255298,31.349315, '已结束',TRUE,11,25,2),
(26,'奉献女祭司','他愿意找到兔子洞的深处，以便和她在一起。阴影点草莓吃豆人中途岛追逐者小指杀屏。鬼点樱桃眨眼吃豆人力量颗粒果实。克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。','2023-06-06 17:43:07','2023-06-07 17:43:08', '较大', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1309号',121.255298,31.349315, '处理中',TRUE,11,26,3),
(27,'火焰圣徒','夕阳的美丽被工业起重机所掩盖。阴影粉红色幽灵杀死屏幕黄色磁盘视频游戏迷宫控制台电源点中途岛。他愿意找到兔子洞的深处，以便和她在一起。她有能够画歌的天赋。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。','2023-06-06 17:43:08','2023-06-07 17:43:09', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1310号',121.255298,31.349315, '已结束',TRUE,11,27,3),
(28,'虚空执事','她有能够画歌的天赋。我听说南希很漂亮。她很反感他分不清柠檬水和酸橙水的区别。阴影点草莓吃豆人中途岛追逐者小指杀屏。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。不要把花生酱放在狗的鼻子上。','2023-06-06 17:43:09','2023-06-07 17:43:10', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1311号',121.255298,31.349315, '已结束',TRUE,11,28,1),
(29,'黄金圣骑士','阴影点草莓吃豆人中途岛追逐者小指杀屏。飞鱼在空间站旁很少。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。','2023-06-06 17:43:10','2023-06-07 17:43:11', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1312号',121.255298,31.349315, '处理中',TRUE,11,29,1),
(30,'虔诚喇嘛','她很反感他分不清柠檬水和酸橙水的区别。飞鱼在空间站旁很少。外部的伤疤只说明了故事的一部分。阴影点草莓吃豆人中途岛追逐者小指杀屏。阴影粉红色幽灵杀死屏幕黄色磁盘视频游戏迷宫控制台电源点中途岛。','2023-06-06 17:43:11','2023-06-07 17:43:12', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1313号',121.255298,31.349315, '已结束', false,11,30,1),
(31,'森林之母','吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。我想我会买红色的车，或者我会租蓝色的车。外部的伤疤只说明了故事的一部分。','2023-06-04 17:43:03','2023-06-05 17:43:04', '严重', '上海市','','闵行区','上海市闵行区沪闵路4888号(银都路地铁站1号口步行450米)',121.387755,31.090366, '处理中',TRUE,9,9,2),
(32,'湖中将军','不要把花生酱放在狗的鼻子上。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。','2023-06-04 17:43:03','2023-06-05 17:43:05', '一般', '上海市','','宝山区','上海市宝山区友谊路999号',121.468091,31.400809, '处理中',TRUE,10,10,3),
(33,'魔法头人','不要把花生酱放在狗的鼻子上。他在房子后面房间的地板下面藏了一个藏匿处。','2023-06-04 17:43:03','2023-06-05 17:43:06', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1300号',121.255298,31.349315, '处理中', false,11,11,3),
(34,'特工论坛报','苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。外部的伤疤只说明了故事的一部分。伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。','2023-06-04 17:43:03','2023-06-05 17:43:07', '较大', '上海市','','青浦区','上海市青浦区城中北路485号',121.111684,31.154928, '处理中',TRUE,12,12,1),
(35,'税务局局长','飞鱼在空间站旁很少。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。毒藤从他们说无法穿透的栅栏中生长出来。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。外部的伤疤只说明了故事的一部分。','2023-06-04 17:43:03','2023-06-05 17:43:08', '轻微', '上海市','','松江区','上海市松江区人民北路899号',121.223843,31.021347, '已结束',TRUE,13,13,2),
(36,'农业男爵','克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。外部的伤疤只说明了故事的一部分。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。','2023-06-04 17:43:03','2023-06-05 17:43:09', '轻微', '上海市','','金山区','上海市金山区蒙源路110号',121.338039,30.741291, '已结束', false,14,14,3),
(37,'铠甲女族长','她很反感他分不清柠檬水和酸橙水的区别。飞鱼在空间站旁很少。他发现当他真正使用他的汗水和眼泪时，他的艺术从未进步。伏击者迷宫 沃卡沃卡水果 吃豆人狂热街机 银河老大 中场休息。','2023-06-05 17:43:03','2023-06-06 17:43:03', '一般', '上海市','','奉贤区','上海市奉贤区南奉公路9555号',121.463393,30.911147, '已结束',TRUE,15,15,3),
(38,'能源代表','阴影点草莓吃豆人中途岛追逐者小指杀屏。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。他恨他爱她恨恨的东西。飞鱼在空间站旁很少。他愿意找到兔子洞的深处，以便和她在一起。','2023-06-05 17:43:03','2023-06-06 17:43:04', '轻微', '上海市','','崇明区','上海市崇明区崇明大道7800号',121.429628,31.621114, '处理中', false,16,16,1),
(39,'科学策展人','阴影点草莓吃豆人中途岛追逐者小指杀屏。夕阳的美丽被工业起重机所掩盖。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。他在房子后面房间的地板下面藏了一个藏匿处。克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。吃豆人南梦宫岩谷彻吃豆人发烧迷宫点。','2023-06-05 17:43:03','2023-06-06 17:43:05', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1300号',121.255298,31.349315, '已结束',TRUE,11,17,2),
(40,'工业部长','高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。我听说南希很漂亮。吃豆人铃铛鬼波基草莓闪蓝色敌人南梦宫日本追逐者点点帕库曼。她很反感他分不清柠檬水和酸橙水的区别。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。','2023-06-05 17:43:03','2023-06-06 17:43:06', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1301号',121.255298,31.349315, '处理中',TRUE,11,18,3),
(41,'税务官员','外部的伤疤只说明了故事的一部分。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。她有能够画歌的天赋。橙色善变的蓝色家伙迷宫追逐。','2023-06-05 17:43:03','2023-06-06 17:43:07', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1302号',121.255298,31.349315, '处理中', false,11,19,3),
(42,'通讯总督','当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。外部的伤疤只说明了故事的一部分。','2023-06-05 17:43:03','2023-06-06 17:43:08', '较大', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1303号',121.255298,31.349315, '处理中',TRUE,11,20,1),
(43,'光之红衣主教','蓬松的粉红色独角兽是男子气概男性中流行的身份象征。橙色善变的蓝色家伙迷宫追逐。不要把花生酱放在狗的鼻子上。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。鬼点樱桃眨眼吃豆人力量颗粒果实。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。','2023-06-05 17:43:03','2023-06-06 17:43:09', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1304号',121.255298,31.349315, '处理中',TRUE,11,21,2),
(44,'虔诚的大祭司','鬼点樱桃眨眼吃豆人力量颗粒果实。吃豆人铃铛鬼波基草莓闪蓝色敌人南梦宫日本追逐者点点帕库曼。毒藤从他们说无法穿透的栅栏中生长出来。关键哭泣婴儿慢人迷宫点力量颗粒闪光中途追逐者粉红樱桃冰球人鬼魂。','2023-06-06 17:43:03','2023-06-07 17:43:04', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1305号',121.255298,31.349315, '已结束',TRUE,11,22,3),
(45,'治愈的贤士','他恨他爱她恨恨的东西。鬼点樱桃眨眼吃豆人力量颗粒果实。她有能够画歌的天赋。她了解到水瓶不再只是用来盛装液体，它们也是身份的象征。外部的伤疤只说明了故事的一部分。','2023-06-06 17:43:04','2023-06-07 17:43:05', '轻微', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1306号',121.255298,31.349315, '处理中', false,11,23,3),
(46,'死亡长老','橙色善变的蓝色家伙迷宫追逐。她很反感他分不清柠檬水和酸橙水的区别。高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。','2023-06-06 17:43:05','2023-06-07 17:43:06', '轻微', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1307号',121.255298,31.349315, '已结束', false,11,24,1),
(47,'自然伊玛目','高分假装无知迷宫生活视频游戏苹果慢人追逐者披萨缺少切片点蓝色。橙色善变的蓝色家伙迷宫追逐。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。鬼点樱桃眨眼吃豆人力量颗粒果实。老苹果陶醉于它的权威。','2023-06-06 17:43:06','2023-06-07 17:43:07', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1308号',121.255298,31.349315, '已结束',TRUE,11,25,2),
(48,'奉献女祭司','他愿意找到兔子洞的深处，以便和她在一起。阴影点草莓吃豆人中途岛追逐者小指杀屏。鬼点樱桃眨眼吃豆人力量颗粒果实。克莱德蓝色敌人闪光点沃卡迷宫怪物幽灵红色追逐者。当她走在街上，看着排水沟时，她意识到口罩已经成为新的烟头。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。','2023-06-06 17:43:07','2023-06-07 17:43:08', '较大', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1309号',121.255298,31.349315, '处理中',TRUE,11,26,3),
(49,'火焰圣徒','夕阳的美丽被工业起重机所掩盖。阴影粉红色幽灵杀死屏幕黄色磁盘视频游戏迷宫控制台电源点中途岛。他愿意找到兔子洞的深处，以便和她在一起。她有能够画歌的天赋。街机柜复古甜瓜点马扎吃豆人追红南梦宫水果沃卡帕库-帕库 1980 年。','2023-06-06 17:43:08','2023-06-07 17:43:09', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1310号',121.255298,31.349315, '已结束',TRUE,11,27,3),
(50,'虚空执事','她有能够画歌的天赋。我听说南希很漂亮。她很反感他分不清柠檬水和酸橙水的区别。阴影点草莓吃豆人中途岛追逐者小指杀屏。苹果快速迷宫沃卡沃卡闪电追逐帕库曼帕库-帕库点披萨缺失切片。不要把花生酱放在狗的鼻子上。','2023-06-06 17:43:09','2023-06-07 17:43:10', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1311号',121.255298,31.349315, '已结束',TRUE,11,28,1),
(51,'黄金圣骑士','阴影点草莓吃豆人中途岛追逐者小指杀屏。飞鱼在空间站旁很少。吃豆人 墨色害羞的橙色圆点 蓝色敌人 鬼魂 岩谷彻 冰球人 通电。','2023-06-06 17:43:10','2023-06-07 17:43:11', '严重', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1312号',121.255298,31.349315, '处理中',TRUE,11,29,1),
(52,'虔诚喇嘛','她很反感他分不清柠檬水和酸橙水的区别。飞鱼在空间站旁很少。外部的伤疤只说明了故事的一部分。阴影点草莓吃豆人中途岛追逐者小指杀屏。阴影粉红色幽灵杀死屏幕黄色磁盘视频游戏迷宫控制台电源点中途岛。','2023-06-06 17:43:11','2023-06-07 17:43:12', '一般', '上海市','','嘉定区','上海市嘉定区嘉定工业区永盛路1313号',121.255298,31.349315, '已结束', false,11,30,1);