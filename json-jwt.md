---
title: 傻傻分不清楚JWT\JWE\JWS\JWK\JWKS分别是什么
heading: 
date: 2021-06-30T10:28:12.372Z
categories: ["code"]
grammar_mathjax: true
tags: 
description: JSON Web Toke,json-jwt
---

## 前言

之前开发互联网应用的时候一直使用 token 作为鉴权的手段，之前使用的时候仅仅当做类似 session 的存在，完全没有发挥 jwt-token 的价值。当遇到签发、授权、鉴权等流程不在同一主体时，就遇到了很多问题。查问题的时候又遇到一大堆名词，比如：JWT、JWE、JWA、JWS、JWK、JWKS，听起来就头皮发麻。为了完全理解它们，做一个整理。

这几个缩写对应的[英文全称](https://redthunder.blog/2017/06/08/jwts-jwks-kids-x5ts-oh-my/)是：
- `JWT`: JSON Web Toke，令牌。
- `JWE`: JSON Web Encryption，加密。
- `JWA`: JSON Web Algorithm，算法。
- `JWS`: JSON Web Signature，签名。
- `JWK`: JSON Web Key，密钥。
- `JWKS`: JSON Web Key Set，多个密钥的集合。


## JWT 是什么
先来看下 JWT，它其实是由两个点“.”分隔成三段的一串字符串:
```
# 头部说明.数据体.签名
header.payload.signature
```

这个字符串其实就是把数据用 base64 编码了一下，没有经过加密，任何人通过解码就能看到原始数据。


比如下面是一个真实的 JWT：
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Zjg5MGI4NTVjMGI3MDc1IiwicGljdHVyZSI6Imh0dHBzOi8vc3h5OTEuY29tL2F2YXRhci5wbmciLCJ1c2VybmFtZSI6IiIsImlkIjoiNWY4OTBiODU1MDM4YzBiNzA3NSIsImVtYWlsIjoic3h5OTFAbWUuY29tIiwic2lkIjoiNmUzYzIzZmJmNWQ1MDEzMmZlNTUiLCJhdWQiOiI1ZTQzYWIxNDFlODZhZGFmY2IiLCJleHAiOjE2MjUyMTc5MjAsImlhdCI6MTYyNTIxNDMyMCwiaXNzIjoiaHR0cHM6Ly91c2VyLnN4eTkxLmNvbS9vYXV0aC9vaWRjIn0.yDuGkG4JYTaDH15EHX7fB03BXMaSKbv1UUZlrxBMHAs
```
用 [base64urlDecode](https://base64.guru/standards/base64url/decode) 把第一个点前面的字符串解码，就可以可以知道 header 的内容：
```
header = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';
print(base64urlDecode(header)) 
// 输出
{"alg":"HS256","typ":"JWT"}
```


同理，把第二段[解码](https://base64.guru/standards/base64url/decode)后就得到数据
```
payload = 'eyJzdWIiOiI1Zjg5MGI4NTVjMGI3MDc1IiwicGljdHVyZSI6Imh0dHBzOi8vc3h5OTEuY29tL2F2YXRhci5wbmciLCJ1c2VybmFtZSI6IiIsImlkIjoiNWY4OTBiODU1MDM4YzBiNzA3NSIsImVtYWlsIjoic3h5OTFAbWUuY29tIiwic2lkIjoiNmUzYzIzZmJmNWQ1MDEzMmZlNTUiLCJhdWQiOiI1ZTQzYWIxNDFlODZhZGFmY2IiLCJleHAiOjE2MjUyMTc5MjAsImlhdCI6MTYyNTIxNDMyMCwiaXNzIjoiaHR0cHM6Ly91c2VyLnN4eTkxLmNvbS9vYXV0aC9vaWRjIn0';
print(base64urlDecode(payload)) 
// 输出
{"sub":"5f890b855c0b7075","picture":"https://sxy91.com/avatar.png","username":"","id":"5f890b855038c0b7075","email":"sxy91@me.com","sid":"6e3c23fbf5d50132fe55","aud":"5e43ab141e86adafcb","exp":1625217920,"iat":1625214320,"iss":"https://user.sxy91.com/oauth/oidc"}
```

第三段可以理解成随机字符串，客户端拿到也没什么用。


因此想要伪造这样格式的 JWT 也很简单：
```
data = base64urlEncode( header ) + "." + base64urlEncode( payload );
signature = "xxxx"; // 任意字符串
token = data + "." + signature
```

上面的过程仅仅为了说明 JWT 的生成过程和解析过程，更简单的方式是到[jwt.io](https://jwt.io/)这个网站，它提供在线编辑或查看 JWT 格式的 token 。

所以 JWT 的作用是：
1. 更方便的传输和转换数据结构 JSON 格式经过 base64Url 编码。
2. 数据是没加密的，没有经过隐藏或者混淆数据。
3. 使用 JWT 是为了保证发送的数据是由可信的来源创建的。


那么服务器如何判断这个 JWT 是自己合法发出的呢，关键点就在 signature ，只要保证别人无法知道 signature 怎么生成的就可以了。

最笨的办法是生成一个随机的字符串作为 signature 存在服务器端，然后发给客户端，以后收到 JWT 时取出 signature 与自己存储的做比对，一样就证明是正确的、合法的。

这样的问题是每个用户都需要存储一份数据，非常浪费资源。有没有一种方式不需要保存 signature 就能验证 JWT 是正确的呢？

简单的思路就是根据 header 和 payload 生成一个 signature，生成的规则只有服务器知道，这样就不用存储 signature，每次服务端收到客户端的 JWT 只需要重新生成一次 signature 与收到进行对比就知道是否合法。

比如可以设定这样的规则
```
data = base64urlEncode( header ) + "." + base64urlEncode( payload );

规则一：signature = data 的后32个字符。
规则二：signature = data 的第1，3，5，7...位字符串。
规则三：signature = data 的第1，3，5，7...位字符串。
规则四：signature = data 的第1，3，4，7，11，18...位字符串。
```

因为别人不知道我服务器用的是哪种规则，所以也就无法伪造了。

上面的规则看似别人不知道，其实想“猜”出来很简单，稍微聪明一点的人使用统计学和密码学相关知识，估计一周不到就能比较出来。

那有没有一种规则实现简单且理论上无法“猜”出来呢，这就需要用到哈希算法和非对称加密算法。

## 哈希算法


哈希算法，又称散列算法，它是一个单向函数，可以把任意长度的输入数据转化为固定长度的输出，此输出一般又称为摘要或者散列值，相当于人的指纹信息：
`摘要=Hash(x)`

这个算法有如下几个特点：
1. 无论输入多长，输出总是一定的。
2. 输出无规律，输入改变一丁点就会导致输出完全不同，因此无法统计和猜测。
3. 通过输入可以很容易地计算输出，但是，反过来，通过输出无法反推输入。相当于警察抓到一个人就很容易得到他的指纹，但仅仅采集到一个指纹信息，却很难知道这个指纹是谁的，长相如何等。


例如，对`洋葱`和`哈希算法`这两个词进行某种哈希运算，得到的结果长度是一样的：
```
Hash("洋葱")    = 74c9227d95c45856683c457bbcd04d90
Hash("哈希算法") = 16600f689cdf9ad8305749bd64d3ca32
Hash("哈希算术") = ef1f60e4a59184a4f5bb9977a2245218
Hash("哈希算力") = a47bc40c3586cc0fbf275d2f83c17708
Hash("哈希算了") = d67394d8dcda13ca451ae72e90ed2de2
```

能实现这种特性的算法有很多，常见的有：MD5、SHA、Hmac等。

哈希算法的这种特性就可以用来验证某个文件是否被篡改。早期很多提供软件的公司，除了提供软件的下载地址，同时也会提供文件的摘要。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1626175452029.png)

比如你网速比较慢，不想去官网下载 MySQL，然后找同事通过 U 盘拷贝了一个 MySQL 的软件安装包，你想看一下这个软件是否安全，可以直接在[终端](https://support.apple.com/zh-cn/guide/terminal/apd5265185d-f365-44cb-8b09-71a064a42125/mac)执行命令`md5 文件名`获取这个安装包的 md5 值，然后和官网进行比对，如果一样就证明没修改过，不一眼就证明肯定不是官方发布的安装包。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1626175996119.png)


回到 JWT ，使用哈希算法就可以保证数据的一致性，只要 header 和 payload 没有被改变，那么其生成的摘要也不会变。
```
token = header.payload.signature
摘要 = Hash(header+"."+payload); 
```

到这里，如果用摘要作为 signature 那么似乎也没什么用，因为谁都能使用哈希算法轻易的生成这个摘要，伪造JWT比之前定义的规则还简单。

那能否加点干扰数据呢，比如: 
```
token = header.payload.signature
摘要 = Hash(header+"."+payload); 
signature = Hash(摘要+"这是我的密码，只有我知道")
```

这样也能保证别人无法伪造 signature ，这么做就需要密码设置的足够复杂，然而大多数人不会设置复杂的密码，即使看起来复杂的密码，对机器来说其实很简单，另外即使特别复杂也完全可以使用一个一个尝试的方式来破解。

那能不能由机器生成一个足够安全的密码，然后加密后作为 signature 呢？



## 非对称加密与对称加密






JWT 由 JWK 经过一系列计算得来。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1625216099694.png)

[JWT](https://www.tomczhen.com/2017/05/25/5-easy-steps-to-understanding-json-web-tokens-jwt/)其
header、payload 其实都是 json 数据，header 描述了 signature 使用了哪种算法，方便验证的时候选择响应的算法。






既然谁都可以方便的造出一个格式相符的 token ，那么服务器怎么验证这个 token 确实是服务器发出去的呢？，答案就是 signature 。

用 token 中第二个“.”前面的数据和服务器签发时的密码做一次哈西运算，如果结果与第三段的 signature 就证明是自己签发的。
```
Hash(header+"."+payload,secret) =? signature
```




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
