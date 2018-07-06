#!/usr/bin/sh
#publish_blog.sh
rm -rf /home/myblog/content/post/*
cd /home/script/blog
echo `pwd`
echo `git pull`

cp -rf *.md /home/myblog/content/post/
#cp -rf nuo/* /home/myblog/themes/nuo/static/
cp -f script/nuo.toml /home/myblog/config.toml
cd /home/myblog
rm -rf public
echo `pwd`
echo `hugo -b https://sxy91.com/`