---
title: 傻傻分不清楚JWT\JWE\JWS\JWK\JWKS分别是什么
heading: 
date: 2021-06-30T10:28:12.372Z
categories: ["code"]
grammar_mathjax: true
tags: 
description: JSON Web Toke,json-jwt
---

之前开发互联网应用的时候一直使用 token 作为鉴权的手段，之前使用的时候仅仅当做类似 session 的存在，完全没有发挥 jwt-token 的价值。当遇到签发、授权、鉴权等流程不在同一主体时，就遇到了很多问题。查问题的时候又遇到一大堆名词，比如：JWT、JWE、JWA、JWS、JWK、JWKS，听起来就头皮发麻。为了完全理解它们，做一个整理。

这几个缩写对应的英文全称是：
- `JWT`: JSON Web Toke，令牌。
- `JWE`: JSON Web Encryption，加密。
- `JWA`: JSON Web Algorithm，算法。
- `JWS`: JSON Web Signature，签名。
- `JWK`: JSON Web Key，密钥。
- `JWKS`: JSON Web Key Set，多个密钥的集合。


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

```json
{
    "kid":"YoxRVsbyYE5zKzxAaiayKY9rVLl13xNbHIM_cDI18S4"
    "alg":"RS256",
    "kty":"RSA",
    "e":"AQAB",
    "n":"vL6fnf1S36B4xI3tIkD5_W3HoZJgEIzAYSsTLGIn",
    "use":"sig",
}
```

密钥 ID (kid）
这些区域有：kid是一个提示，指示哪些密钥用于保护令牌的 JSON Web Signature (JWS)。

算法 (alg）
这些区域有：alg标头参数表示用于保护 ID 令牌的加密算法。用户池使用 RS256 加密算法，这是一种采用 SHA-256 的 RSA 签名。有关 RSA 的更多信息，请参阅RSA 加密。

密钥类型 (kty）
这些区域有：kty参数标识与密钥结合使用的加密算法系列，例如本示例中的 “RSA”。

RSA 指数 (e）
这些区域有：e参数包含 RSA 公有密钥的指数值。它表示为采用 Base64urlUInt 编码的值。

RSA 模量 (n）
这些区域有：n参数包含 RSA 公有密钥的模数值。它表示为采用 Base64urlUInt 编码的值。

使用使用 (use）
这些区域有：use参数描述了公有密钥的预期用途。对于这个示例，use值sig表示签名。

