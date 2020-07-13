---
title: mysql-load-data
heading: mysql从txt文件导入数据并跳过空行或者错误行
date: 2020-07-13T05:55:08.156Z
categories: ["code"]
tags: 
description: mysql load data skip errors
---

创建表
```sql
CREATE TABLE IF NOT EXISTS `uid_pcode`(
   `uid` bigint,
   `pcode` VARCHAR(32) NOT NULL,
   PRIMARY KEY ( `uid` ) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 
```

/mnt/data1/uid_phone.txt文件内容格式如下
```
1 13888888888
```

即：uid`\t`phone`\n`

需要对phone对称加密后存储到pcode里
```sql
mysql -uroot -p
mysql> LOAD DATA INFILE '/mnt/data1/uid_phone.txt' IGNORE INTO TABLE uid_pcode(@c1,@c2) set uid=@c1,pcode=HEX(aes_encrypt(lower(conv(@c2,10,32)),'yourkey'));
```

查看导入进度
```bash
# 查看mysql的pid
ps -ef | grep mysqld
# 本次是19411
# 查看打开的文件描述符编号
sudo ls -l /proc/19411/fd ｜grep uid_phone.txt
# 本次是34
sudo cat /proc/19411/fdinfo/34
# 打印已读取的字节数
# pos:	621936640
```

如果需要导出数据
```sql
SELECT uid,pcode INTO OUTFILE '/tmp/result.text'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM uid_pcode;
```

参考文献:
- [mysql-load-data](https://dev.mysql.com/doc/refman/8.0/en/load-data.html)
- [import text file to mysql](https://stackoverflow.com/questions/13579810/how-to-import-data-from-text-file-to-mysql-database)
- [查看导入进度](https://stackoverflow.com/questions/5748565/how-to-see-progress-of-csv-upload-in-mysql)
