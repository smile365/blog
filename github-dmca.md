---
title:  记一次github仓库被DMCA take down的经历
heading: 
date: 2019-11-28T06:29:12.130Z
categories: ["code"]
draft: true
tags: 
description: 
---

打开仓库发现如下提示： 

```html
Repository unavailable due to DMCA takedown.
This repository is currently disabled due to a DMCA takedown notice. We have disabled public access to the repository. The notice has been publicly posted.

If you are the repository owner, and you believe that your repository was disabled as a result of mistake or misidentification, you have the right to file a counter notice and have the repository reinstated. Our help articles provide more details on our DMCA takedown policy and how to file a counter notice. If you have any questions about the process or the risks in filing a counter notice, we suggest that you consult with a lawyer.
```

由于github收到DMCA的移除通知，所以把你的仓库给封了。

此时无法对仓库做任何git相关的操作。

给github发送邮件，说明你可以删除侵权内容，可否临时恢复仓库的使用。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1574926087695.png)

收到回复邮件：
要么它可以帮你删除整个库，或者给你24小时删除侵权内容。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1574926127420.png)

翻译：一旦您完成了所要求的修改，请回复此邮件让我们知晓，以便我们可以让投诉人知道已经按要求进行了更改。如果我们没有收到你的来信，我们将在明天以后重新禁用此库。

```bash
# clone
git clone  git://github.com/smile365/blog.git
# 永久删除文件和历史提交信息
git filter-branch --tree-filter 'rm -rf IntelliJ-IDEA.md' HEAD
# 确认是否删除
git log --stat -S "IntelliJ"
#向仓库强制推送所有的变化
git push origin master --force
```

然后提交到仓库就行。

记得回复邮件，否则还是会被禁！



参考资料  

- [记一次github仓库被DMCA take down的经历](https://berryjam.github.io/2019/06/%E8%AE%B0github%E4%BB%93%E5%BA%93%E8%A2%ABDMCA-take-down%E7%BB%8F%E5%8E%86/)
- [美国人怎么拔网线----DMCA入门](http://www.ruanyifeng.com/blog/2010/03/dmca.html)
- [Github仓库被DMCA Takedown后怎么办](https://linux.cn/article-9374-1.html)
- [从 Git 仓库中永久删除文件或目录](https://www.jianshu.com/p/d333ab0e6818)
- [使用git的“核弹级选项”：filter-branch](https://blog.lilydjwg.me/2011/4/22/tried-the-nuclear-option-filter-branch-of-git-the-first-time.26331.html)