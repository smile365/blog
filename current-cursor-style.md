---
title: 使用JavaScript获取当前鼠标的形状类型状态
heading: 
date: 2021-10-14T07:02:26.218Z
categories: ["other"]
tags: 
description: how to use javascript get current cursor style from browser
---

### 概述

web端目前大多数的测试都是功能测试、接口测试，自动化测试比较少，即使是自动化测试也需要开发者编写相关测试的代码，不同公司的产品不一样，甚至同一公司的产品每次发布页面都有调整，测试代码需要跟随线上版本同步改动，比较浪费人力。是否有一种可行的方案，用一种测试方式，即可应对几乎所有页面呢。


一种思路是扫描鼠标停留在页面上所有位置的形状，通过分析不同位置（区块）的鼠标形状，如 可点击、可输入、不可操作。

再结合点击区域的位置、区块的大小、元素类型、颜色、文字说明等属性，通过机器学习的方式，根据当前区域可操作的类型，机器不停尝试，即可构件一套测试流程。

开发人员只需要提供测试用例所需的数据(集)，即可完成自动化测试的编写。

甚至可精确到某个页面需要哪些数据。



关键词：机器学习、自动化测试

get current mouse cursor type
how to use javascript get current cursor style from browser


### 获取鼠标当前形状的代码如下：

```javascript
document.addEventListener('mouseover',function(e){
  const tgt = e.target;
  const inline = tgt.style.cursor || "Not defined"
  const computed = window.getComputedStyle(tgt)["cursor"]
  console.log("Inline: ",inline,"Computed: ",computed)
},false);

```