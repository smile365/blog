---
title:  nodejs-json-to-excel
heading:
date: 2020-10-10T08:10:06.924Z
categories: ["code"]
tags: 
description: 
---

新建文件 json_2_xls.js 内容如下：
```javascript
const ExcelJS = require('exceljs');

const workbook = new ExcelJS.Workbook();
const worksheet = workbook.addWorksheet('Sheet 1')

worksheet.columns = [
  { header: '序号', key: 'num'},
  { header: '资源标题.', key: 'name'},
  { header: '资源分类', key: 'type'},
  { header: '资源URL地址', key: 'url'},
  { header: '二维码图片', key: 'id'}
];

const url = "https://sxy91.com/resource/detail?id=资源id&projectId=项目id";
// const rows = []; 
for (var i = 1; i < 10; i++) {
	//rows.push({"num":i,"name":"资源"+i,"type":"doc","url":url,"id":i})
	worksheet.addRow({"num":i,"name":"资源"+i,"type":"doc","url":url,"id":i});
}
// worksheet.addRows(rows); // 有 json 数组的话也可以一次性写入
workbook.xlsx.writeFile("TEST.xlsx");
```

运行
```bash
npm install exceljs
node json_2_xls.js
```
