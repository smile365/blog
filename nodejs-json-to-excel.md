---
title:  nodejs把json转化并生成excel文件
heading: exceljs 使用教程
date: 2020-10-10T08:10:06.924Z
categories: ["code"]
tags: 
description: 
---

做项目有个需求，需要把一个一批链接生成二维码图片，并在Excel文件记录。

新建文件 json_2_xls.js 内容如下：
```javascript
const ExcelJS = require('exceljs');
const qr = require('qr-image'); 
const util = require('util')

const workbook = new ExcelJS.Workbook();

const worksheet = workbook.addWorksheet('Sheet 1')


worksheet.columns = [
  { header: '序号', key: 'num'},
  { header: '资源标题.', key: 'name'},
  { header: '资源分类', key: 'type'},
  { header: '资源URL地址', key: 'url'},
  { header: '二维码图片', key: 'id'}
];

const qr_url = "https://sxy91.com/resource/detail?id=%s&projectId=%s";
const projectId = "111";
// const rows = []; 
// 模拟资源id
for (var i = 1; i < 10; i++) {
	//rows.push({"num":i,"name":"资源"+i,"type":"doc","url":url,"id":i})
	var url = util.format(qr_url,i,projectId);
	var qr_svg = qr.image(url, { type: 'png' });
	var filename = util.format("%s.png",i);
	//将二维码输出到文件流，并生成.png文件
	qr_svg.pipe(require('fs').createWriteStream('.png'));
	// 
	worksheet.addRow({"num":i,"name":"资源"+i,"type":"doc","url":url,"id":i});
}
// worksheet.addRows(rows); // 有 json 数组的话也可以一次性写入

workbook.xlsx.writeFile("test.xlsx");
```

运行
```bash
npm install exceljs
npm install qr-image
node json_2_xls.js
```


参考 
- [用nodejs和js分别生成二维码](https://www.dazhuanlan.com/2019/11/07/5dc3f6052d0b2/)
- 二维码生成：[qr-image](https://github.com/alexeyten/qr-image)
- Excel生成：[exceljs](https://github.com/exceljs/exceljs)