---
title: 使用 pyenv 安装和管理不同版本 python
heading:  
date: 2025-06-04T03:24:55.365Z
tags: 
categories: ["code"]
Description:  在 debian 12 安装 pyenv 可安装不同版本 python
---

## 前言

开发了一个 python 后端 api，其中用到了阿里云 python sdk 。
```python
send_sms_verify_code_request = dypnsapi_20170525_models.SendSmsVerifyCodeRequest(
            sign_name='云渚科技验证服务',
            template_code='100001',
            phone_number='12345678911',
            template_param='{"code":"##code##"}'
        )
```

本地运行完全没问题。但是部署到 debian 12 服务器就报错：
```bash
module 'alibabacloud_dypnsapi20170525.models' has no attribute 'SendSmsVerifyCodeRequest'
```

尝试了半天没解决，对比后发现 python 版本不一样，我本地是 3.10.12，线上的 python 是 3.11.2。怀疑是版本不同引发的问题。决定使用 pyenv 管理不同版本的 python。


## 安装 pyenv

[pyenv 官方](https://github.com/pyenv/pyenv/?tab=readme-ov-file#installation)推荐使用脚本安装

```bash
<pre>curl -fsSL https://pyenv.run | bash</pre>
```

国内访问 github 受限，经常安装失败，会报错：
```bash
Cloning into '/root/.pyenv'... fatal: unable to access 'https://github.com/pyenv/pyenv.git/': GnuTLS recv error (-110): The TLS connection was non-properly terminated.
```

可以通过镜像站安装，如 [gh-proxy.com](https://gh-proxy.com)
```bash
rm -rf /root/.pyenv
curl -fsSL  https://gh-proxy.com/github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```


## 设置 pyenv 环境变量

通过在 ~/.bash_profile 文件中添加以下代码自动加载 pyenv：
```bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - bash)"
```

通过在 ~/.bashrc 文件中添加以下代码自动加载 pyenv-virtualenv
```bash
eval "$(pyenv virtualenv-init -)"
```

 重启 shell 以使更改生效
```bash
exec $SHELL
# 测试运行
pyenv help
```

若出现 `arning: setlocale: LC_CTYPE: cannot change locale (UTF-8)` 警告，可安装系统语言环境
```bash
sudo apt update sudo 
apt install locales
```
然后在 `~/.bashrc` 添加:
```bash
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
```


##   通过 pyenv 安装 python 3.10.12
pyenv 安装 python 时会去官网下载安装文件 
```bash
pyenv install 3.10.12
```

国内大概率会报错
```bash
通过链接 https://www.python.org/ftp/python/3.10.12/Python-3.10.12.tar.xz 下载 tar.xz 文件超时
```

可以通过配置华为云的镜像下载
```bash
export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"
export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1  # 跳过校验（镜像可能无校验文件）
```
重新执行安装命令，即可安装成功：
```bash
pyenv install 3.10.12
```

检查是否安装成功
```bash
pyenv versions
python --version  # 应显示 3.10.12
```

**其他 pyenv 用法**


```bash
# 设置全局默认版本
pyenv global 3.10.12

# 为项目设置本地版本（进入项目目录后执行）：
pyenv local 3.10.12  # 生成 .python-version 文件

# 验证当前版本
python --version
```


**后记**

最后发现是 requirements.txt 是由 cursor 生成的，`alibabacloud_dypnsapi20170525` 被错误地写成了 `alibabacloud-dypnsapi20170525`，只需要把横线`-`改成下划线` _`就好了。
```python
alibabacloud_dypnsapi20170525==1.2.2
```