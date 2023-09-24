#!/bin/bash
# init_blog.sh
# /Users/songyangcong/project

SITE=/usr/share/www
if test -n $1
then
	SITE=$1
fi
echo $SITE
BLOG=$SITE/myblog
# 找一个文件夹
initMyBlog(){
	if test -e $SITE/myblog
	then
		return 1
	fi
	echo "mkdir $SITE"
	mkdir -p $SITE
	cd $SITE && hugo new site myblog
	cd myblog
	mkdir content/posts
	git init
	# 配置主题
	git submodule add git@gitee.com:smile365/wehuth.git themes/wehuth

	cp themes/wehuth/exampleSite/config.toml .

	git submodule add git@gitee.com:smile365/blog.git codeblog
	cd codeblog
	git remote set-url --add origin git@github.com:smile365/blog.git


	cd ..
	git submodule add git@gitee.com:smile365/live4life.git lifeblog
	cd lifeblog
	git remote set-url --add origin git@github.com:smile365/live4life.git

}


Publish(){
	cd $BLOG/codeblog

	git pull && git push
	cp *.md ../content/posts/
	
	cd ../lifeblog
	git pull && git push
	cp *.md ../content/posts/

	cd .. && hugo
	echo $BLOG

}

initMyBlog
Publish




