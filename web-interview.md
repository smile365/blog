---
title:  web-interview
heading: 前端面试题2021年最新整理
date: 2021-01-07T02:51:15.616Z
categories: ["code"]
tags: 
draft: true
description: 前端面试题2021年最新整理
---

### HTML5
#### 一、HTML5 的新特
[HTML5 的新特性](https://www.runoob.com/html/html5-intro.html)主要有新增标签（图形的绘制，多媒体内容，[语义](https://www.runoob.com/html/html5-semantic-elements.html)和结构元素）。api（拖放元素，定位）。存储（[本地](https://www.runoob.com/html/html5-webstorage.html)、[Web SQL](https://www.runoob.com/html/html5-web-sql.html)），WebSocket等。

- [新元素](https://www.runoob.com/html/html5-new-element.html)
- 新属性
- 完全支持 CSS3
- Video 和 Audio
- 2D/3D 制图：canvas、svg
- 本地存储：localStorage、sessionStorage
- 本地 SQL 数据
- Web 应用

#### 二、HTML5 新元素有哪些
图形的绘制：canvas、svg
媒体元素：video、audio、source、track、
表单元素：datalist、keygen、output
语义和结构元素：header、footer、nav、progress、section、time
移出的元素有哪些：frame、frameset、acronym、applet、basefont、big、center、dir、font、noframes、strike、tt


#### 三、媒体元素

HTML5 如何嵌入视频/音频、支持什么格式、如何嵌入字幕、多个 source 和 track 如何处理？
```html
<video width=”450″ height=”340″ controls>
     <source src=”jamshed.mp4″ type=”video/mp4″>
     <source src=”jamshed.ogg” type=”video/ogg”>
     <track kind=”subtitles” label=”English” src=”jamshed_en.vtt” srclang=”en” default></track>
     <track kind=”subtitles” label=”Arabic” src=”jamshed_ar.vtt” srclang=”ar”></track>
</video>
```
video 元素支持三种视频格式： MP4, WebM, 和 Ogg
audio 元素支持三种音频格式文件: MP3, Wav, 和 Ogg


#### 四、SVG 与 Canvas两者间的区别
[SVG](https://www.runoob.com/html/html5-svg.html) 是一种使用 XML 描述 2D 图形的语言。Canvas 通过 JavaScript 来绘制 2D 图形。SVG 基于 XML，这意味着 SVG DOM 中的每个元素都是可用的。您可以为某个元素附加 JavaScript 事件处理器。在 SVG 中，每个被绘制的图形均被视为对象。如果 SVG 对象的属性发生变化，那么浏览器能够自动重现图形。Canvas 是逐像素进行渲染的。在 canvas 中，一旦图形被绘制完成，它就不会继续得到浏览器的关注。如果其位置发生变化，那么整个场景也需要重新绘制，包括任何或许已被图形覆盖的对象。

#### 五、HTML5 新的 Input 类型有哪些
color、date、datetime、datetime-local、email、month、number、range、search、tel、time、url、week
```html
<input type="color" name="favcolor">
```




CSS3
选择器
盒模型
背景和边框
文字特效
2D/3D转换
动画
多列布局
用户界面

圆形图片
border-radius
CSS3 渐变类型有几种
伪元素 伪类
Overflow属性 内容溢出 文字 。。。

less\scss





JavaScript

面向对象


参考文献   
- [HTML5 教程](https://www.runoob.com/html/html5-intro.html)
- [canvas.getContext](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLCanvasElement/getContext)