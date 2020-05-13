---
title:  
heading:
date: 2020-05-13T08:21:39.713Z
categories: ["code"]
tags: 
description: 
---




```json
POST _reindex?wait_for_completion=false
{
  "source": {
    "index": "wd-analytics"
  },
  "dest": {
    "index": "wd-analytics1"
  }
}
```