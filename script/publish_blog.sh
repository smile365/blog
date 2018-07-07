#!/usr/bin/sh
#publish_blog.sh
# rm -rf /home/myblog/content/post/*
# cd /home/script/blog
# echo `pwd`
# echo `git pull`
# echo `./script/publish_blog.sh`
cp -rf *.md /home/myblog/content/post/
cd /home/myblog/themes/nuo
echo `git pull`
cp -f exampleSite/config.toml /home/myblog/
cd /home/myblog/
rm -rf public
echo `pwd`
echo `hugo -b "https://sxy91.com/"`