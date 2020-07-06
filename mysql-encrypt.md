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

如果只在mysql内加密与解密，那么到这里已经足够。若使用其他语言加解密可能得到的结果与mysql加解密的不一致。这是由于mysql处理IV，明文，填充和密文的方式不一致导致的。

AES分组：
- AES-128（mysql默认）
- AES-192
- AES-256

加密模式：
- ECB（mysql默认）
- CBC
- CFB
- CTR
- ...

更多参数可参考[AES-kwargs](https://pycryptodome.readthedocs.io/en/latest/src/cipher/aes.html#Crypto.Cipher.AES.new)

使用python实现mysql的aes加密解密如下：
```python
from Crypto.Util.Padding import pad, unpad
from Crypto.Cipher import AES
BLOCK_SIZE = 16 # Bytes

class MysqlAes(object):
	"""docstring for MysqlAes"""
	def __init__(self, key):
		super(MysqlAes, self).__init__()
		while len(key) % BLOCK_SIZE != 0:
			key += '\0'		
		self.cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)

	def encrypt(self,val):
		msg = self.cipher.encrypt(pad(val.encode("utf-8"), BLOCK_SIZE))
		return msg.hex().upper()

	def decrypt(self,val):
		msg_dec = self.cipher.decrypt(bytes.fromhex(val.lower()))
		return unpad(msg_dec, BLOCK_SIZE).decode('utf-8')


sqlAes = MysqlAes("key")
print(sqlAes.encrypt("password"))
print(sqlAes.decrypt("9BDD7DE3EFED2089E18D6EB20B3C2DA0"))

```


参考文献：
- [mysql-aes-encryption-in-java](https://info.michael-simons.eu/2011/07/18/mysql-compatible-aes-encryption-decryption-in-java/)
