---
title: mysql中使用对称加密 
heading: 对称加密算法种类-mysql自带的对称加密如何使用。
date: 2020-07-06T02:35:03.792Z
categories: ["code"]
tags: 
description: 
---


mysql中对密码一般采取非对称加密，除了密码外业务上有时也需要对部分字段进行对称加密。

常见对称加密算法：
- AES
- DES
- RC4
- Rabbit
- TripleDes

常用的编码方式：
- N进制（N>=2 && N<= 36），只能表示数字类型。
- baseN（N=[16,32,64]），可表示任意类型。

mysql中可以用`conv`方法对数字进行转换,如：
```sql
select conv(101010,2,10);
select conv(13888888888,10,32);
```


mysql常用的对称加密方法：
- aes_encrypt
- des_encrypt

使用方法
```sql
select aes_encrypt("password","key");
select des_encrypt("password","key");
```

不出意外的话话出现一堆不认识的字符
```sql
mysql> select des_encrypt("password","key");
+-------------------------------+
| des_encrypt("password","key") |
+-------------------------------+
| ??bR?G
        8?????=?             |
+-------------------------------+
```

因为`des_encrypt`返回的是二进制序列（binary），需要将字节序列编码为字符串（即baseN）才可正常显示。常见的做法是base16或base64。
```sql
mysql> SELECT to_base64(aes_encrypt('password','key')); 
mysql> SELECT hex(aes_encrypt('password','key')); 
+------------------------------------+
| hex(aes_encrypt('password','key')) |
+------------------------------------+
| 9BDD7DE3EFED2089E18D6EB20B3C2DA0   |
+------------------------------------+
```

`hex`即base16，意思是使用16个可见字符来表示一个二进制数组。

上述加密结果的解密方法:
```sql
mysql> select aes_decrypt(unhex('9BDD7DE3EFED2089E18D6EB20B3C2DA0'),'key');
+--------------------------------------------------------------+
| aes_decrypt(unhex('9BDD7DE3EFED2089E18D6EB20B3C2DA0'),'key') |
+--------------------------------------------------------------+
| password                                                     |
+--------------------------------------------------------------+
```



参考文献：
- [mysql-aes-encryption-in-java](https://info.michael-simons.eu/2011/07/18/mysql-compatible-aes-encryption-decryption-in-java/)

