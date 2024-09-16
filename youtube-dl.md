---
title: youtube-dl
heading:  使用 youtube-dl 快速下载 油管视频
date: 2024-09-16T16:50:27.816Z
tags: 
categories: ["code"]
Description:  
---

## 安装  youtube-dl
按照官网教程 [install youtube-dl with Homebrew](https://github.com/ytdl-org/youtube-dl?tab=readme-ov-file#installation) 安装完，发现版本是最低的。
```bash
brew install youtube-dl
youtube-dl --version
# 2021.12.17
```

重新安装最新版：
```bash
brew remove youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

运行时出现错误：
```bash
/usr/local/bin/youtube-dl: line 1: syntax error near unexpected token `newline'
/usr/local/bin/youtube-dl: line 1: `<h1>Access denied</h1>'
```

