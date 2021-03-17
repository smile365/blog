---
title: 发送请求时不同数据发送方式的区别
heading: 
date: 2021-03-17T10:57:00.062Z
categories: ["code"]
tags: 
description: 发送请求时不同数据发送方式的区别,request-content-type 
---

不同类型的接收

Postman 发送不同数据的方式


header
body


@decorators/di 库

```
/**
 * Express req object
 */
export declare const Request: (name?: string) => ParameterDecorator;
/**
 * Express res object
 */
export declare const Response: (name?: string) => ParameterDecorator;
/**
 * Express next function
 */
export declare const Next: (name?: string) => ParameterDecorator;
/**
 * Express req.params object or single param, if param name was specified
 */
export declare const Params: (name?: string) => ParameterDecorator;
/**
 * Express req.query object or single query param, if query param name was specified
 */
export declare const Query: (name?: string) => ParameterDecorator;
/**
 * Express req.body object or single body param, if body param name was specified
 */
export declare const Body: (name?: string) => ParameterDecorator;
/**
 * Express req.headers object or single headers param, if headers param name was specified
 */
export declare const Headers: (name?: string) => ParameterDecorator;
/**
 * Express req.body object or single cookies param, if cookies param name was specified
 */
export declare const Cookies: (name?: string) => ParameterDecorator;

```

express 接收不同数据的方式



参考连接: 
- [](https://stackoverflow.com/questions/5710358/how-to-access-post-form-fields)