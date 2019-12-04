---
title:  sublime text
date: 2019-07-03T01:36:38.994Z
tags: 
categories:
draft: true
description: 
---


创建一个别名
```bash
# alias 别名
vim ~/.bash_profile
# Mac OS命令行下使用SublimeText打开文本文件
alias st="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
# wq保存后回到命令行执行以下命令使其生效
source ~/.bash_profile
```

安装[Package-Control](https://packagecontrol.io/installation#st3) 

安装[SublimeTmpl](https://github.com/kairyou/SublimeTmpl)

1. `Ctrl+Shift+P`调出面板后输入`Install Package`选中。 
2. 输入`SublimeTmpl`，选中回车。


配置自定义模板:`Preferences / Packages Settings / SublimeTmpl`
`settings default`
```json
"attr": {
    "author": "songxueyan",
    "email": "sxy9103@gmail.com",
    "link": "https://sxy91.com"
}
```

`key bindings user`
```json
[
    {
        "keys": ["super+n"], "command": "sublime_tmpl",
        "args": {"type": "python"}, "context": [{"key": "sublime_tmpl.python"}]
    }
]
```


符号说明  
⌘：command   
⌃：control  
⌥：option  
⇧：shift   
↩：enter   
⌫：delete 

⌘ku 改为大写  
⌘kl 改为小写  
⌘⌃g 查找所有符合当前选择的内容进行多重编辑  


参考  

- [MAC版本的Sublime-Text快捷键](https://www.zhihu.com/question/39190896/answer/117536300)
- [Mac设置alias](https://blog.csdn.net/XIAO_XIAO_C/article/details/73162525)