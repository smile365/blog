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

这几个缩写对应的[英文全称](https://redthunder.blog/2017/06/08/jwts-jwks-kids-x5ts-oh-my/)是：
- `JWT`: JSON Web Toke，令牌。
- `JWE`: JSON Web Encryption，加密。
- `JWA`: JSON Web Algorithm，算法。
- `JWS`: JSON Web Signature，签名。
- `JWK`: JSON Web Key，密钥。
- `JWKS`: JSON Web Key Set，多个密钥的集合。


JWT 由 JWK 经过一系列计算得来。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1625216099694.png)

[JWT](https://www.tomczhen.com/2017/05/25/5-easy-steps-to-understanding-json-web-tokens-jwt/)其实是由两个点“.”分隔成三段的一串字符串:
```
# 头部说明.数据体.签名
header.payload.signature
```
header、payload 其实都是 json 数据，header 描述了 signature 使用了哪种算法，方便验证的时候选择响应的算法。

比如下面是一个真实的 JWT：
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Zjg5MGI4NTVjMGI3MDc1IiwicGljdHVyZSI6Imh0dHBzOi8vc3h5OTEuY29tL2F2YXRhci5wbmciLCJ1c2VybmFtZSI6IiIsImlkIjoiNWY4OTBiODU1MDM4YzBiNzA3NSIsImVtYWlsIjoic3h5OTFAbWUuY29tIiwic2lkIjoiNmUzYzIzZmJmNWQ1MDEzMmZlNTUiLCJhdWQiOiI1ZTQzYWIxNDFlODZhZGFmY2IiLCJleHAiOjE2MjUyMTc5MjAsImlhdCI6MTYyNTIxNDMyMCwiaXNzIjoiaHR0cHM6Ly91c2VyLnN4eTkxLmNvbS9vYXV0aC9vaWRjIn0.yDuGkG4JYTaDH15EHX7fB03BXMaSKbv1UUZlrxBMHAs
```
用 [base64urlDecode](https://base64.guru/standards/base64url/decode) 把第一个点前面的字符串解码，就可以可以知道 header 的内容：

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1625217924505.png)

同理，把第二段解码后就得到数据
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1625218027543.png)


那么 ~~伪造~~ 生成这样格式的 token 也很简单：
```
data = base64urlEncode( header ) + "." + base64urlEncode( payload );
signature = Hash( data, secret );
token = data + "." + signature
```

或者直接在[jwt.io](https://jwt.io/)这个网站可以直接编辑或查看 JWT 格式的 token 。


所以 JWT 的作用是：
1. 更方便的传输和转换数据结构 JSON 格式经过 base64Url 编码。
2. 数据是没加密的，没有经过隐藏或者混淆数据。
3. 使用 JWT 是为了保证发送的数据是由可信的来源创建的。


既然谁都可以方便的造出一个格式相符的 token ，那么服务器怎么验证这个 token 确实是服务器发出去的呢？，答案就是 signature 。

用 token 中第二个“.”前面的数据和服务器签发时的密码做一次哈西运算，如果结果与第三段的 signature 就证明是自己签发的。
```
Hash(header+"."+payload,secret) =? signature
```

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

这样的算法有什么用呢？把之前的 token 简化一下。
```
signature = Hash(data, secret);
token = data+"."+signature
```

服务器把数据和一个别人不知道的东西（密钥）进行一次哈希运算，得到一个独一无二的指纹（signature）。然后服务器把数据+指纹（token）发给前端。之后服务器收到 token（数据+指纹），只需要取出数据，通过计算密钥+数据的指纹与收到的指纹进行对比，就知道是否是自己发出的token，如果是就是合法的。也就做到了验证和防篡改。





这样的哈希算法有很多，有可能不同的 signature 使用的算法不同。那么验证的时候怎么知道要用哪个算法呢？


这就需要用到 JWK，其实就是用来存储密钥和哈希算法所需的各种参数。


```json
{
    "kid":"YoxRVsbyYE5zKzxAaiayKY9rVLl13xNbHIM_cDI18S4"
    "kty":"RSA",
    "alg":"RS256",
    "use":"sig",
    "e":"AQAB",
    "n":"vL6fnf1S36B4xI3tIkD5_W3HoZJgEIzAYSsTLGIn",
}
```


密钥 ID (kid）: 
密钥类型 (kty）：算法系列，RSA\EC\oct\OKP
算法 (alg）：具体的算法，
使用使用 (use）：enc、sig

RSA 指数 (e）
RSA 模量 (n）



![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1625283745171.png)




JWK 可以表示密钥，即可以表示公钥或私钥，也可同时表示公钥和私钥。

提到公钥或私钥就不得不说非对称加密，这是一种特殊的算法。

fx(私钥,message)=n,
fy(公钥,n)=message



要理解 JWT 就避不开哈希算法和非对称加密。


参考： 
- [X.509 数字证书的基本原理及应用](https://zhuanlan.zhihu.com/p/36832100)
- [五个步骤轻松弄懂 JSON Web Token](https://www.tomczhen.com/2017/05/25/5-easy-steps-to-understanding-json-web-tokens-jwt/)
- [在线生成密钥](https://mkjwk.org/?spm=a2c4g.11186623.2.12.7b966a3ayACLcE)
- [X.509 数字证书的基本原理及应用](https://zhuanlan.zhihu.com/p/36832100)
- [P2P交易原理](https://www.liaoxuefeng.com/wiki/1207298049439968/1311929746325537)
- [npm-jose](https://www.npmjs.com/package/jose)
- [RSA算法原理（一）](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)
- [RSA算法原理（二）](http://www.ruanyifeng.com/blog/2013/07/rsa_algorithm_part_two.html)
- [Jwt+RSA非对称加密](https://www.huaweicloud.com/articles/e48fb83c6e0e13d1c0fec2f9341590e9.html)
- [HS256、RS256 及 ES256](https://www.cnblogs.com/kirito-c/p/12402066.html)
- [JWTs? JWKs? ‘kid’s? ‘x5t’s? Oh my!](https://redthunder.blog/2017/06/08/jwts-jwks-kids-x5ts-oh-my/)
- [JWTs: Which Signing Algorithm Should I Use?](https://www.scottbrady91.com/JOSE/JWTs-Which-Signing-Algorithm-Should-I-Use)
- [JSON Web Signatures, KIDs and Thumbprints: Sticking to Standards](https://developer.forgerock.com/docs/platform/how-tos/json-web-signatures-kids-and-thumbprints-sticking-standards)
- [RW 的 JWS 签名算法](https://bitbucket.org/openid/fapi/issues/101/jws-signature-algorithms-for-rw)
- [X.509证书有什么用？](https://www.ssl.com/zh-CN/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98/%E4%BB%80%E4%B9%88%E6%98%AFx-509%E8%AF%81%E4%B9%A6/)
