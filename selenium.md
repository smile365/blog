---
title:  Selenium与PhantomJS的使用
date: 2018-08-27T05:37:22.077Z
tags: 
 - selenium
 - PhantomJS
 - Pyppeteer
---

**Selenium**：网页自动化测试工具(通过各个浏览器的drive控制浏览器的行为)，给开发者提供控制浏览器的api，类似于sdk。  

**PhantomJS**：没有页面的浏览器

### 使用selenium控制chrome
#### 安装selenium
selenium支持JAVA、Python等常用语言开发。这里选择python版本安装
```shell
pip install selenium
```
#### 安装chorme-drive
[下载驱动安装](http://chromedriver.chromium.org/downloads)，并把Chrome浏览器和驱动配置在环境变量里：`sudo mv ~/Downloads/chromedriver /usr/bin/`

#### 测试
```python
from selenium import webdriver
browser = webdriver.Chrome()
browser.get('https://sxy91.com/')
```

### 使用selenium控制PhantomJS
[下载PhantomJS](http://phantomjs.org/download.html)，并把执行路径配置到环境变量里：`sudo mv ~/Downloads/phantomjs-2.1.1-macosx/bin/phantomjs /usr/bin/`

#### 测试
```python
from selenium import webdriver
driver = webdriver.PhantomJS()
driver.get('https://sxy91.com/')
print(driver.title)
```
提示：UserWarning: Selenium support for PhantomJS has been deprecated, please use headless versions of Chrome or Firefox instead。(后续不再支持PhantomJS，请使用 Chrome或Firefox替代)

### 服务器运行
centos安装chrome
```shell
curl https://intoli.com/install-google-chrome.sh | bash
```
验证是否安装成功
```shell
google-chrome --headless --disable-gpu --no-sandbox --dump-dom https://sxy91.com/
```
安装chromedriver
```
wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/local/bin/
```

测试
```python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


options = Options()
for x in "--headless --disable-gpu --no-sandbox".split():
    options.add_argument(x)
driver = webdriver.Chrome(chrome_options=options)
driver.get("https://sxy91.com/")
```


参考：

- [Selenium的用法](https://cuiqingcai.com/2599.html)
- [PhantomJS被Selenium标记为不赞成](https://www.cnblogs.com/zhuxiaoxi/p/8425686.html)
- [Centos-Headless-chrome](https://intoli.com/blog/installing-google-chrome-on-centos/)
- [selenium-doc](https://selenium-python.readthedocs.io/api.html)
- [Pyppeteer比selenium更高效的利器](https://mp.weixin.qq.com/s/PnKdH_wq2sWKr-Wq55fy-A)
