---
title: 使用 youtube-dl 快速下载 油管视频
heading:  
date: 2024-09-16T16:50:27.816Z
tags: 
draft: true
categories: ["code"]
Description:  
---

## 安装  youtube-dl
按照官网教程 [install youtube-dl with Homebrew](https://github.com/ytdl-org/youtube-dl?tab=readme-ov-file#installation) 安装完，发现版本是最低的。且官方 [ Issue #30839](https://github.com/ytdl-org/youtube-dl/issues/30839) 说 2021 这个版本本身已经无法运行，是个有问题的版本。
```bash
brew install youtube-dl
youtube-dl --version
# 2021.12.17
# 卸载
brew uninstall youtube-dl
pip uninstall youtube-dl
```


运行 2021 版本时会出现错误：
```bash
/usr/local/bin/youtube-dl: line 1: syntax error near unexpected token `newline'
/usr/local/bin/youtube-dl: line 1: `<h1>Access denied</h1>'
```

## 升级最新版
后来发现好像 youtube-dl 与一则[法院判决有关](https://openjur.de/u/2466945.html) 只能通过通过浏览器下载 [Releases ytdl-nightly](https://github.com/ytdl-org/ytdl-nightly/releases) youtube-dl
```bash
# 下载后移动到 bin 目录
sudo mv ~/Downloads/youtube-dl
# 执行权限
sudo chmod a+rx /usr/local/bin/youtube-dl
# youtube-dl --version
```

此时执行 youtube-dl 命令出现错误：
```
env: python: No such file or directory
```

可能是我通过 aliase 把 python 指向了 python3，因此 bin 路径下没有 python 可执行文件。可通过在 bin 路径下创建一个软链解决。

```bash
sudo ln -s /usr/local/bin/python3 /usr/local/bin/python
```

此时运行 `youtube-dl --version` 就正常了


## 下载视频 playlist
```bash
cd ~/Downloads
youtube-dl --proxy socks5://127.0.0.1:2080/ --yes-playlist --no-check-certificate PLkqMHcP63alkBgHdRFSw_qbQoB2lDARzn
```

> **注** 不使用`--no-check-certificate`参数，会出现错误：ERROR: Unable to download webpage: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1007)> (caused by URLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1007)'))) 





