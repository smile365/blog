#!/bin/bash
init_hugo_site(){
	# 1. 检查 80 端口占用的程序
	PROGRAM=$(sudo lsof -i :80 | awk 'NR>1 {print $1}')
	if [ -n "$PROGRAM" ]; then
	    echo "Port 80 is used by program: $PROGRAM."
	else
	    echo "Port 80 is not in use."
	fi

	# 2. 检查 /usr/share/www 路径是否存在
	WWW_PATH="/usr/share/www"
	if [ -d "$WWW_PATH" ]; then
	    echo "exists: $WWW_PATH "
	else
	    read -p "Path /usr/share/www does not exist. Please enter a static website path: " USER_PATH
	    WWW_PATH="$USER_PATH"
	fi

	# 3. 检查 www 下是否有 myblog 文件夹
	MYBLOG_PATH="$WWW_PATH/myblog"
	if [ -d "$MYBLOG_PATH" ]; then
	    echo "exists: $MYBLOG_PATH"
	    return 1
	else
	    # 使用 hugo 创建 myblog 站点
	    hugo new site "$MYBLOG_PATH"
	    echo "Created myblog site at $MYBLOG_PATH"
	fi

	# 4. 在 myblog 路径下创建 content/posts 路径
	POSTS_PATH="$MYBLOG_PATH/content/posts"
	mkdir -p "$POSTS_PATH"
	#echo "Created content/posts directory at $POSTS_PATH"

	cd $MYBLOG_PATH
	git init
	# 5. 配置主题
	git submodule add git@gitee.com:smile365/wehuth.git themes/wehuth
	cp themes/wehuth/exampleSite/config.toml .	
	echo "copy config config.toml into themes/wehuth"

}

init_hugo_site

clone_blog(){
	cd /root/projects
	git clone git@github.com:smile365/blog.git

	git clone git@github.com:smile365/live4life.git
}

clone_blog

update_cp_md(){
	# 1. 技术博客的 md 文件拷贝到 www
	cd /root/projects/blog 
	git config pull.rebase false
	git pull
	cp *.md /usr/share/www/myblog/content/posts/ 

	# 2. 生活类博客的 md 文件拷贝到 www
	cd /root/projects/live4life
	git config pull.rebase false
	git pull
	cp *.md /usr/share/www/myblog/content/posts/ 

	# 3. 生成 html
	cd /usr/share/www/myblog/ && hugo
}


update_cp_md

