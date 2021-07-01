---
title: 傻傻分不清楚JWT\JWE\JWS\JWK\JWKS分别是什么
heading: 
date: 2021-06-30T10:28:12.372Z
categories: ["code"]
grammar_mathjax: true
tags: 
description: JSON Web Toke,json-jwt
---

这五个缩写对应的英文全称是：
- `JWT`: JSON Web Toke，令牌。
- `JWE`: JSON Web Encryption，加密。
- `JWS`: JSON Web Signature，签名。
- `JWK`: JSON Web Key，密钥。
- `JWKS`: JSON Web Key Set，密钥对。


要理解 JWT 就避不开哈希算法和非对称加密。

哈希算法，又称散列算法，它是一个单向函数，可以把任意长度的输入数据转化为固定长度的输出：
`h=H(x)`


这个算法有如下几个特点：
1. 无论输入多长，输出总是一定的。
2. 输出无规律，输入改变一点点就会导致输出完全不同。
3. 通过输入可以很容易地计算输出，但是，反过来，通过输出无法反推输入。


例如，对`洋葱`和`哈希算法`这两个词进行某种哈希运算，得到的结果长度是一样的：
```
H("洋葱")    = 74c9227d95c45856683c457bbcd04d90
H("哈希算法") = 16600f689cdf9ad8305749bd64d3ca32
H("哈希算术") = ef1f60e4a59184a4f5bb9977a2245218
H("哈希算力") = a47bc40c3586cc0fbf275d2f83c17708
H("哈希算了") = d67394d8dcda13ca451ae72e90ed2de2
```

这样的散列算法有很多比如：MD5\SHAxxx\HmacSHA\HmacMd5 等。

这样的算法有什么用呢？


 

