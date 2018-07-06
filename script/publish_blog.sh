#!/usr/bin/sh
#publish_blog.sh
rm -rf /home/myblog/content/post*
cd /home/script/blog
echo `pwd`
echo `git pull`
cp -rf *.md /home/myblog/content/post
cd /home/myblog
echo `pwd`
echo `hugo -b https://sxy91.com/`
