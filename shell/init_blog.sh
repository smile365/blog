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
		echo "$SITE exists exit"
		return 1
	fi
	echo "mkdir $SITE"
	mkdir -p $SITE
	cd $SITE && hugo new site myblog
	cd $BLOG
	mkdir content/posts
	git init
	# 配置主题
	git submodule add git@gitee.com:smile365/wehuth.git themes/wehuth

	cp themes/wehuth/exampleSite/config.toml .

	git submodule add git@gitee.com:smile365/blog.git codeblog
	cd $BLOG/codeblog
	git remote set-url --add origin git@github.com:smile365/blog.git


	cd $BLOG
	git submodule add git@gitee.com:smile365/live4life.git lifeblog
	cd $BLOG/lifeblog
	git remote set-url --add origin git@github.com:smile365/live4life.git

}


Publish(){
	cd $BLOG/codeblog

	git pull && git push
	cp *.md ../content/posts/
	
	cd $BLOG/lifeblog
	git pull && git push
	cp *.md ../content/posts/

	cd .. && hugo
	echo $BLOG/public
	ls $BLOG/public
	cp -r public/* /usr/share/www/myblog/public/
}

initMyBlog
Publish




