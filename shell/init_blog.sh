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



}

init_hugo_site

check_ssh_connection() {
    # 定义要检测的主机
    hosts=(
        "github.com"
        "gitee.com"
    )

    # 遍历每个主机进行检测
    for host in "${hosts[@]}"; do
        {
            # 使用 ssh 命令测试连接，设置 10 秒超时
            if ssh -T -o BatchMode=yes -o ConnectTimeout=10 git@"${host}" 2>&1 | grep -q "successfully"; then
                echo "✅ ${host}"
            else
                echo "❌ 无法通过 SSH 连接到 ${host}"
            fi
        } &
    done
    wait  # 等待所有后台任务完成
}

# 调用检测函数
check_ssh_connection
# 调用检测函数
check_ssh_connection


clone_blog(){
	cd $MYBLOG_PATH
	git init
	# 5. 配置主题
	git submodule add git@gitee.com:smile365/wehuth.git themes/wehuth
	cp themes/wehuth/exampleSite/config.toml .	
	echo "copy config config.toml into themes/wehuth"	

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
	cp *.md $WWW_PATH/content/posts/ 

	# 2. 生活类博客的 md 文件拷贝到 www
	cd /root/projects/live4life
	git config pull.rebase false
	git pull
	cp *.md $WWW_PATH/myblog/content/posts/ 

	# 3. 生成 html
	cd $WWW_PATH/myblog/ && hugo

	ls $WWW_PATH/myblog/public/
}


update_cp_md

