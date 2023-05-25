---
title: nano
heading: 
date: 2023-05-25
categories: ["code"]
tags: 
description: nano 编辑器
---

## 快捷键

- ^，它可以用 Ctrl 键或按 Esc 键两次的方式进行输入。
- Meta 键序列使用“M-”符号标记，它可以用 Alt、Cmd 或 Esc 键输入，具体取决于您的键盘设置。 
- 按 Esc 两次之后再键入从 000 到 255 之间的三位数字，则会输入该 ASCII 码对应的字符。

| 快捷键  | 描述                     |
|-------|------------------------|
| Esc+N | 显示行号             |
| Ctrl+W | 查找文本                 |
| - |       -      |
| Ctrl+X | 退出编辑器               |
| Ctrl+O | 保存文件                 |
| Ctrl+G | 显示帮助窗口              |
| Alt+W  | 查找下一个实例            |
| Ctrl+K | 剪切文本                 |
| Ctrl+U | 复制文本                 |
| Ctrl+J | 粘贴文本                 |
| Ctrl+Y | 重复上一个操作            |
| Ctrl+T | 将当前行与下一行交换        |
| Ctrl+\_| 标记起始位置/取消标记    |
| Alt+A  | 将标记扩展到当前光标位置   |
| Alt+6  | 复制所选文本              |
| Alt+7  | 剪切所选文本              |
| Alt+8  | 粘贴所选文本              |
| Ctrl+D | 删除光标后的字符           |
| Ctrl+H | 或 Del 删除光标前的字符   |
| Ctrl+L | 刷新屏幕                 |
| Alt+R  | 搜索并替换               |
| Alt+G  | 转到指定行                |
| Ctrl+] | 缩进所选文本              |
| Ctrl+\[ | 反缩进所选文本            |
| Alt+A  | 在当前光标位置添加或删除行注释 |
| Alt+I  | 切换自动缩进              |
| Alt+X  | 切换拆分当前位置上下文      |
| Ctrl+\_ | 切换撤销/重做模式          |




Last login: Thu May 25 18:46:23 on ttys000
sxy@sxydeMacBook-Air ~ % ssh bkm
Linux debian 5.10.0-21-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Wed May 17 10:25:08 2023 from 192.168.0.161
root@debian:~# dockecr ps
-bash: dockecr：未找到命令
root@debian:~# docker ps
CONTAINER ID   IMAGE                              COMMAND                   CREATED       STATUS                 PORTS                                         NAMES
ec920faae78d   postgres:9.6.24                    "docker-entrypoint.s…"   2 weeks ago   Up 2 weeks             0.0.0.0:30302->5432/tcp, :::30302->5432/tcp   authing-server-db-1
1dbfb30eca1c   redis:6.2.6                        "docker-entrypoint.s…"   2 weeks ago   Up 2 weeks             0.0.0.0:30301->6379/tcp, :::30301->6379/tcp   authing-server-redis-1
24e7214b510f   lscr.io/linuxserver/transmission   "/init"                   5 weeks ago   Up 3 weeks                                                           transmission
a54f686a92df   lscr.io/linuxserver/qbittorrent    "/init"                   5 weeks ago   Up 3 weeks                                                           qbittorrent
26387a4e17ba   crazymax/samba                     "/entrypoint.sh smbd…"   5 weeks ago   Up 3 weeks (healthy)                                                 samba
root@debian:~# ip addr|grep "inet "
    inet 127.0.0.1/8 scope host lo
    inet 192.168.0.143/24 brd 192.168.0.255 scope global dynamic ens18
    inet 172.21.0.1/16 brd 172.21.255.255 scope global br-89931493cad2
    inet 172.22.0.1/16 brd 172.22.255.255 scope global br-0670679b64b5
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-18b012eab92d
    inet 172.23.0.1/16 brd 172.23.255.255 scope global br-249bd9217d90
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
    inet 172.19.0.1/16 brd 172.19.255.255 scope global br-e24beaa07ff8
root@debian:~# pwd
/root
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# cd projects/
root@debian:~/projects# ls
authing-api-explorer  authing-conductor  authing-fe-console  authing-php-sdk  authing-server  authing-server-orbiter  authing-user-portal  composer-setup.php  db-movies  hbg  idea  nas
root@debian:~/projects# cd authing-conductor/
root@debian:~/projects/authing-conductor# ls
annotations	       cassandra-persistence  common		   docker	      gradle	   grpc-server	 licenseheader.txt     redis-concurrency-limit	SECURITY.md			 ui
annotations-processor  CHANGELOG.md	      CONTRIBUTING.md	   docs		      gradlew	   http-task	 OSSMETADATA	       redis-lock		server				 WHOSUSING.md
awss3-storage	       client		      core		   es6-persistence    gradlew.bat  java-sdk	 polyglot-clients      redis-persistence	settings.gradle
awssqs-event-queue     client-spring	      dependencies.gradle  es7-persistence    grpc	   json-jq-task  postgres-persistence  RELATED.md		springboot-bom-overrides.gradle
build.gradle	       CODE_OF_CONDUCT.md     dependencies.lock    family.properties  grpc-client  LICENSE	 README.md	       rest			test-harness
root@debian:~/projects/authing-conductor# cd ..
root@debian:~/projects# ls
authing-api-explorer  authing-conductor  authing-fe-console  authing-php-sdk  authing-server  authing-server-orbiter  authing-user-portal  composer-setup.php  db-movies  hbg  idea  nas
root@debian:~/projects# cd ..
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# docker ps
CONTAINER ID   IMAGE                              COMMAND                   CREATED       STATUS                 PORTS                                         NAMES
ec920faae78d   postgres:9.6.24                    "docker-entrypoint.s…"   2 weeks ago   Up 2 weeks             0.0.0.0:30302->5432/tcp, :::30302->5432/tcp   authing-server-db-1
1dbfb30eca1c   redis:6.2.6                        "docker-entrypoint.s…"   2 weeks ago   Up 2 weeks             0.0.0.0:30301->6379/tcp, :::30301->6379/tcp   authing-server-redis-1
24e7214b510f   lscr.io/linuxserver/transmission   "/init"                   5 weeks ago   Up 3 weeks                                                           transmission
a54f686a92df   lscr.io/linuxserver/qbittorrent    "/init"                   5 weeks ago   Up 3 weeks                                                           qbittorrent
26387a4e17ba   crazymax/samba                     "/entrypoint.sh smbd…"   5 weeks ago   Up 3 weeks (healthy)                                                 samba
root@debian:~# cd authing-server
-bash: cd: authing-server: 没有那个文件或目录
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# cd projects/
root@debian:~/projects# ls
authing-api-explorer  authing-conductor  authing-fe-console  authing-php-sdk  authing-server  authing-server-orbiter  authing-user-portal  composer-setup.php  db-movies  hbg  idea  nas
root@debian:~/projects# cd ..
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# cd kfk/
root@debian:~/kfk# ls
data  docker-compose.yml  kafka-logs
root@debian:~/kfk# cat docker-compose.yml 
version: "3"
services:
  zookeeper:
    image: 'bitnami/zookeeper'
    ports:
      - '2181:2181'
    environment:
      # 匿名登录--必须开启
      - ALLOW_ANONYMOUS_LOGIN=yes

  # 该镜像具体配置参考 https://github.com/bitnami/bitnami-docker-kafka/blob/master/README.md
  kafka:
    image: 'bitnami/kafka'
    ports:
      - '30302:9092'
    environment:
      - KAFKA_BROKER_ID=1
      - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092
      # 客户端访问地址，更换成自己的
      - KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://sxy21.cn:30302
      - KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181
      # 允许使用PLAINTEXT协议(镜像中默认为关闭,需要手动开启)
      - ALLOW_PLAINTEXT_LISTENER=yes
      # 全局消息过期时间 6 小时(测试时可以设置短一点)
      - KAFKA_CFG_LOG_RETENTION_HOURS=2
    depends_on:
      - zookeeper





root@debian:~/kfk# ls
data  docker-compose.yml  kafka-logs
root@debian:~/kfk# cd ..
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# cd nas/
root@debian:~/nas# ls
docker-compose.yml  docker-compose.yml.bak
root@debian:~/nas# cat docker-compose.yml
---
version: "3"
services:
  samba:
    image: crazymax/samba
    container_name: samba
    network_mode: host
    volumes:
      - "/etc/docker/samba:/data"
      - "/share:/share"
    environment:
      - "TZ=Asia/Shanghais"
      - "SAMBA_LOG_LEVEL=0"
    restart: always

  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent
    container_name: qbittorrent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/qbittorrent:/config
      - /share/downloads:/downloads
    # ports:
    #   - 8080:8080
    #   - 6881:6881
    #   - 6881:6881/udp

  transmission:
    image: lscr.io/linuxserver/transmission
    container_name: transmission
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/transmission:/config
      - /share/downloads:/downloads
    # ports:
    #   - 9091:9091
    #   - 51413:51413
    #   - 51413:51413/udp
root@debian:~/nas# cd ..
root@debian:~# ls
airflow  docs-v3  kfk  nas  node_modules  package-lock.json  projects  sdkman.sh  table  wssdemo
root@debian:~# cd projects/
root@debian:~/projects# ls
authing-api-explorer  authing-conductor  authing-fe-console  authing-php-sdk  authing-server  authing-server-orbiter  authing-user-portal  composer-setup.php  db-movies  hbg  idea  nas
root@debian:~/projects# cd authing-server
root@debian:~/projects/authing-server# ls
alinode.Dockerfile  Dockerfile-arm64-temp  jest.config.multitenant.js	  migrations-build	 node_modules  README.md		 test				 tsconfig.tools.json
config.yaml	    docs		   jest.env-setup.js		  migrations-example	 ormconfig.js  scripts			 tsconfig.build.json		 tsconfig.typeorm.json
dist		    GeoLite2-City.mmdb	   jest.env-setup.multitenant.js  muilt-arch.Dockerfile  package.json  secrets			 tsconfig.json			 version.txt
docker-compose.yml  increment_version.sh   merge-coverage.ts		  multi.Dockerfile	 patches       sonar-project.properties  tsconfig.strictNullChecks.json  webpack.config.js
Dockerfile	    jest.config.js	   migrations			  nest-cli.json		 public        src			 tsconfig.test.json		 yarn.lock
root@debian:~/projects/authing-server# cat docker-compose.yml 
version: '3.7'
services:
  redis:
    image: redis:6.2.6
    ports:
      - 30301:6379
    networks:
      - authing
    restart: always

  db:
    image: postgres:9.6.24
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    networks:
      - authing
    restart: always
    ports:
      - 30302:5432

networks:
  authing:
volumes:
  db-data:
root@debian:~/projects/authing-server# docker exec -it ^C
root@debian:~/projects/authing-server# docker pull dpage/pgadmin4
Using default tag: latest
latest: Pulling from dpage/pgadmin4
59bf1c3509f3: Pull complete 
f2d8dd431001: Pull complete 
1f0a23820872: Pull complete 
80f3c815fedd: Pull complete 
6a2d369d0b49: Pull complete 
72e35256d757: Pull complete 
385de77bf4d9: Pull complete 
6bb95c7964fd: Pull complete 
c7bfcb129eea: Pull complete 
9055580785ee: Pull complete 
297ed8c164c6: Pull complete 
6fcd594095da: Pull complete 
01b1cbeb4a76: Pull complete 
c3800dcdc1fb: Pull complete 
Digest: sha256:9e0204e13c0864488f5cf9f075f741098a4c59923afa9ae5e7e2904c23eabcf0
Status: Downloaded newer image for dpage/pgadmin4:latest
docker.io/dpage/pgadmin4:latest
root@debian:~/projects/authing-server# ls
alinode.Dockerfile  Dockerfile-arm64-temp  jest.config.multitenant.js	  migrations-build	 node_modules  README.md		 test				 tsconfig.tools.json
config.yaml	    docs		   jest.env-setup.js		  migrations-example	 ormconfig.js  scripts			 tsconfig.build.json		 tsconfig.typeorm.json
dist		    GeoLite2-City.mmdb	   jest.env-setup.multitenant.js  muilt-arch.Dockerfile  package.json  secrets			 tsconfig.json			 version.txt
docker-compose.yml  increment_version.sh   merge-coverage.ts		  multi.Dockerfile	 patches       sonar-project.properties  tsconfig.strictNullChecks.json  webpack.config.js
Dockerfile	    jest.config.js	   migrations			  nest-cli.json		 public        src			 tsconfig.test.json		 yarn.lock
root@debian:~/projects/authing-server# vi docker-compose.yml 
root@debian:~/projects/authing-server# vi doc
root@debian:~/projects/authing-server# vi docker-compose.yml 
root@debian:~/projects/authing-server# nano doc
root@debian:~/projects/authing-server# nano docker-compose.yml
root@debian:~/projects/authing-server# docker compose up -d
yaml: line 26: mapping values are not allowed in this context
root@debian:~/projects/authing-server# docker compose up ^C
root@debian:~/projects/authing-server# cat docker-compose.yml 
version: '3.7'
services:
  redis:
    image: redis:6.2.6
    ports:
      - 30301:6379
    networks:
      - authing
    restart: always

  db:
    image: postgres:9.6.24
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    networks:
      - authing
    restart: always
    ports:
      - 30302:5432

  pgadmin4:
    image:dpage/pgadmin4
    networks:
      - authing
    restart: always
    ports:
      - 30303:80

networks:
  authing:
volumes:
  db-data:
root@debian:~/projects/authing-server# docker compose up pgadmin4
yaml: line 26: mapping values are not allowed in this context
root@debian:~/projects/authing-server# docker compose up -d pgadmin4
yaml: line 26: mapping values are not allowed in this context
root@debian:~/projects/authing-server# docker compose down
yaml: line 26: mapping values are not allowed in this context
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# docker compose up -d pgadmin4
[+] Running 1/1
 ⠿ Container authing-server-pgadmin4-1  Started                                                                                                                                                          1.3s
root@debian:~/projects/authing-server# docker compose log

Usage:  docker compose [OPTIONS] COMMAND

Docker Compose

Options:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --env-file string            Specify an alternate environment file.
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name

Commands:
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information

Run 'docker compose COMMAND --help' for more information on a command.
unknown docker command: "compose log"
root@debian:~/projects/authing-server# docker compose logs
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-db-1        | 
authing-server-db-1        | PostgreSQL Database directory appears to contain a database; Skipping initialization
authing-server-db-1        | 
authing-server-db-1        | LOG:  database system was shut down at 2023-05-05 11:09:16 UTC
authing-server-db-1        | LOG:  MultiXact member wraparound protections are now enabled
authing-server-db-1        | LOG:  autovacuum launcher started
authing-server-db-1        | LOG:  database system is ready to accept connections
authing-server-db-1        | LOG:  incomplete startup packet
authing-server-db-1        | FATAL:  password authentication failed for user "postgres"
authing-server-db-1        | DETAIL:  Password does not match for user "postgres".
authing-server-db-1        | 	Connection matched pg_hba.conf line 95: "host all all all md5"
authing-server-db-1        | FATAL:  database "flow-engine" does not exist
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.990 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.991 # Redis version=6.2.6, bits=64, commit=00000000, modified=0, pid=1, just started
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.991 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.991 * monotonic clock: POSIX clock_gettime
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 * Running mode=standalone, port=6379.
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 # Server initialized
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 * Ready to accept connections
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.055 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.055 * Background saving started by pid 19
authing-server-redis-1     | 19:C 05 May 2023 12:21:04.086 * DB saved on disk
authing-server-redis-1     | 19:C 05 May 2023 12:21:04.086 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.156 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.347 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.348 * Background saving started by pid 20
authing-server-redis-1     | 20:C 05 May 2023 13:17:17.368 * DB saved on disk
authing-server-redis-1     | 20:C 05 May 2023 13:17:17.368 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.448 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.743 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.744 * Background saving started by pid 21
authing-server-redis-1     | 21:C 05 May 2023 13:23:35.779 * DB saved on disk
authing-server-redis-1     | 21:C 05 May 2023 13:23:35.779 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.844 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.684 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.684 * Background saving started by pid 22
authing-server-redis-1     | 22:C 05 May 2023 13:32:10.716 * DB saved on disk
authing-server-redis-1     | 22:C 05 May 2023 13:32:10.716 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.786 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.726 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.726 * Background saving started by pid 23
authing-server-redis-1     | 23:C 05 May 2023 13:57:16.749 * DB saved on disk
authing-server-redis-1     | 23:C 05 May 2023 13:57:16.749 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.827 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.700 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.700 * Background saving started by pid 49
authing-server-redis-1     | 49:C 05 May 2023 14:08:31.743 * DB saved on disk
authing-server-redis-1     | 49:C 05 May 2023 14:08:31.744 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.801 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.067 * Background saving started by pid 50
authing-server-redis-1     | 50:C 05 May 2023 14:13:32.100 * DB saved on disk
authing-server-redis-1     | 50:C 05 May 2023 14:13:32.100 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.073 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.073 * Background saving started by pid 51
authing-server-redis-1     | 51:C 05 May 2023 14:18:33.106 * DB saved on disk
authing-server-redis-1     | 51:C 05 May 2023 14:18:33.107 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.174 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.188 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.189 * Background saving started by pid 52
authing-server-redis-1     | 52:C 05 May 2023 14:26:00.227 * DB saved on disk
authing-server-redis-1     | 52:C 05 May 2023 14:26:00.228 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.290 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.089 * Background saving started by pid 53
authing-server-redis-1     | 53:C 05 May 2023 14:31:01.160 * DB saved on disk
authing-server-redis-1     | 53:C 05 May 2023 14:31:01.160 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.092 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.093 * Background saving started by pid 54
authing-server-redis-1     | 54:C 05 May 2023 14:36:02.134 * DB saved on disk
authing-server-redis-1     | 54:C 05 May 2023 14:36:02.135 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.193 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.098 * Background saving started by pid 55
authing-server-redis-1     | 55:C 05 May 2023 14:41:03.144 * DB saved on disk
authing-server-redis-1     | 55:C 05 May 2023 14:41:03.145 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.198 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.598 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.599 * Background saving started by pid 56
authing-server-redis-1     | 56:C 05 May 2023 14:48:00.629 * DB saved on disk
authing-server-redis-1     | 56:C 05 May 2023 14:48:00.629 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.699 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.032 * Background saving started by pid 57
authing-server-redis-1     | 57:C 05 May 2023 14:53:01.063 * DB saved on disk
authing-server-redis-1     | 57:C 05 May 2023 14:53:01.063 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.395 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.396 * Background saving started by pid 58
authing-server-redis-1     | 58:C 05 May 2023 15:09:24.423 * DB saved on disk
authing-server-redis-1     | 58:C 05 May 2023 15:09:24.424 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.497 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.084 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.085 * Background saving started by pid 59
authing-server-redis-1     | 59:C 05 May 2023 15:14:25.120 * DB saved on disk
authing-server-redis-1     | 59:C 05 May 2023 15:14:25.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.185 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.029 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.029 * Background saving started by pid 60
authing-server-redis-1     | 60:C 05 May 2023 16:14:26.055 * DB saved on disk
authing-server-redis-1     | 60:C 05 May 2023 16:14:26.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.130 * Background saving terminated with success
authing-server-redis-1     | 1:M 06 May 2023 05:49:25.947 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 06 May 2023 05:49:25.948 * Background saving started by pid 61
authing-server-redis-1     | 61:C 06 May 2023 05:49:25.986 * DB saved on disk
authing-server-redis-1     | 61:C 06 May 2023 05:49:25.987 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 06 May 2023 05:49:26.049 * Background saving terminated with success
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.018 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.019 * Background saving started by pid 62
authing-server-redis-1     | 62:C 06 May 2023 05:54:27.052 * DB saved on disk
authing-server-redis-1     | 62:C 06 May 2023 05:54:27.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.119 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.182 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.183 * Background saving started by pid 63
authing-server-redis-1     | 63:C 08 May 2023 15:12:49.211 * DB saved on disk
authing-server-redis-1     | 63:C 08 May 2023 15:12:49.211 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.284 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:20:25.982 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:20:25.983 * Background saving started by pid 64
authing-server-redis-1     | 64:C 08 May 2023 15:20:26.016 * DB saved on disk
authing-server-redis-1     | 64:C 08 May 2023 15:20:26.017 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:20:26.084 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.029 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.030 * Background saving started by pid 65
authing-server-redis-1     | 65:C 08 May 2023 15:25:27.068 * DB saved on disk
authing-server-redis-1     | 65:C 08 May 2023 15:25:27.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.130 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.046 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.046 * Background saving started by pid 66
authing-server-redis-1     | 66:C 08 May 2023 15:30:28.079 * DB saved on disk
authing-server-redis-1     | 66:C 08 May 2023 15:30:28.080 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.147 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.432 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.432 * Background saving started by pid 67
authing-server-redis-1     | 67:C 09 May 2023 14:46:15.448 * DB saved on disk
authing-server-redis-1     | 67:C 09 May 2023 14:46:15.449 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.534 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.065 * Background saving started by pid 68
authing-server-redis-1     | 68:C 09 May 2023 14:51:16.098 * DB saved on disk
authing-server-redis-1     | 68:C 09 May 2023 14:51:16.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.089 * Background saving started by pid 69
authing-server-redis-1     | 69:C 09 May 2023 14:56:17.144 * DB saved on disk
authing-server-redis-1     | 69:C 09 May 2023 14:56:17.144 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.016 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.016 * Background saving started by pid 70
authing-server-redis-1     | 70:C 09 May 2023 15:01:18.046 * DB saved on disk
authing-server-redis-1     | 70:C 09 May 2023 15:01:18.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.117 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.047 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.048 * Background saving started by pid 71
authing-server-redis-1     | 71:C 09 May 2023 15:06:19.078 * DB saved on disk
authing-server-redis-1     | 71:C 09 May 2023 15:06:19.078 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.149 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.013 * Background saving started by pid 72
authing-server-redis-1     | 72:C 09 May 2023 15:11:20.040 * DB saved on disk
authing-server-redis-1     | 72:C 09 May 2023 15:11:20.041 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.002 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.003 * Background saving started by pid 73
authing-server-redis-1     | 73:C 09 May 2023 16:11:21.027 * DB saved on disk
authing-server-redis-1     | 73:C 09 May 2023 16:11:21.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.104 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.695 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.696 * Background saving started by pid 74
authing-server-redis-1     | 74:C 10 May 2023 08:48:15.735 * DB saved on disk
authing-server-redis-1     | 74:C 10 May 2023 08:48:15.735 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.797 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.741 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.742 * Background saving started by pid 75
authing-server-redis-1     | 75:C 10 May 2023 08:56:55.781 * DB saved on disk
authing-server-redis-1     | 75:C 10 May 2023 08:56:55.782 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.843 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.008 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.009 * Background saving started by pid 76
authing-server-redis-1     | 76:C 10 May 2023 09:01:56.047 * DB saved on disk
authing-server-redis-1     | 76:C 10 May 2023 09:01:56.047 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.109 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.005 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.006 * Background saving started by pid 77
authing-server-redis-1     | 77:C 10 May 2023 09:06:57.031 * DB saved on disk
authing-server-redis-1     | 77:C 10 May 2023 09:06:57.032 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.106 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.056 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.056 * Background saving started by pid 78
authing-server-redis-1     | 78:C 10 May 2023 09:11:58.101 * DB saved on disk
authing-server-redis-1     | 78:C 10 May 2023 09:11:58.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.057 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.058 * Background saving started by pid 79
authing-server-redis-1     | 79:C 10 May 2023 09:16:59.083 * DB saved on disk
authing-server-redis-1     | 79:C 10 May 2023 09:16:59.084 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.158 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.086 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.086 * Background saving started by pid 80
authing-server-redis-1     | 80:C 10 May 2023 09:22:00.122 * DB saved on disk
authing-server-redis-1     | 80:C 10 May 2023 09:22:00.122 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.187 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.017 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.017 * Background saving started by pid 81
authing-server-redis-1     | 81:C 10 May 2023 09:27:01.057 * DB saved on disk
authing-server-redis-1     | 81:C 10 May 2023 09:27:01.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.118 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.070 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.071 * Background saving started by pid 82
authing-server-redis-1     | 82:C 10 May 2023 09:32:02.097 * DB saved on disk
authing-server-redis-1     | 82:C 10 May 2023 09:32:02.098 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.171 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.025 * Background saving started by pid 83
authing-server-redis-1     | 83:C 10 May 2023 09:37:03.068 * DB saved on disk
authing-server-redis-1     | 83:C 10 May 2023 09:37:03.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.080 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.081 * Background saving started by pid 84
authing-server-redis-1     | 84:C 10 May 2023 09:42:04.117 * DB saved on disk
authing-server-redis-1     | 84:C 10 May 2023 09:42:04.118 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.182 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.056 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.057 * Background saving started by pid 85
authing-server-redis-1     | 85:C 10 May 2023 09:47:05.087 * DB saved on disk
authing-server-redis-1     | 85:C 10 May 2023 09:47:05.087 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.014 * Background saving started by pid 86
authing-server-redis-1     | 86:C 10 May 2023 09:52:06.048 * DB saved on disk
authing-server-redis-1     | 86:C 10 May 2023 09:52:06.048 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.090 * Background saving started by pid 87
authing-server-redis-1     | 87:C 10 May 2023 09:57:07.115 * DB saved on disk
authing-server-redis-1     | 87:C 10 May 2023 09:57:07.116 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.068 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.069 * Background saving started by pid 88
authing-server-redis-1     | 88:C 10 May 2023 10:02:08.094 * DB saved on disk
authing-server-redis-1     | 88:C 10 May 2023 10:02:08.094 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.169 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.502 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.503 * Background saving started by pid 89
authing-server-redis-1     | 89:C 10 May 2023 10:13:44.539 * DB saved on disk
authing-server-redis-1     | 89:C 10 May 2023 10:13:44.540 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.603 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.327 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.327 * Background saving started by pid 90
authing-server-redis-1     | 90:C 10 May 2023 10:50:52.365 * DB saved on disk
authing-server-redis-1     | 90:C 10 May 2023 10:50:52.366 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.429 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.029 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.030 * Background saving started by pid 91
authing-server-redis-1     | 91:C 10 May 2023 10:55:53.068 * DB saved on disk
authing-server-redis-1     | 91:C 10 May 2023 10:55:53.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.131 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.026 * Background saving started by pid 92
authing-server-redis-1     | 92:C 10 May 2023 11:00:54.053 * DB saved on disk
authing-server-redis-1     | 92:C 10 May 2023 11:00:54.053 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.002 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.003 * Background saving started by pid 93
authing-server-redis-1     | 93:C 10 May 2023 11:05:55.032 * DB saved on disk
authing-server-redis-1     | 93:C 10 May 2023 11:05:55.033 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.103 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.091 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.091 * Background saving started by pid 94
authing-server-redis-1     | 94:C 10 May 2023 11:10:56.133 * DB saved on disk
authing-server-redis-1     | 94:C 10 May 2023 11:10:56.133 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.192 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.075 * Background saving started by pid 95
authing-server-redis-1     | 95:C 10 May 2023 11:15:57.145 * DB saved on disk
authing-server-redis-1     | 95:C 10 May 2023 11:15:57.146 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.096 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.097 * Background saving started by pid 96
authing-server-redis-1     | 96:C 10 May 2023 11:20:58.130 * DB saved on disk
authing-server-redis-1     | 96:C 10 May 2023 11:20:58.130 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.197 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.005 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.006 * Background saving started by pid 97
authing-server-redis-1     | 97:C 10 May 2023 11:25:59.034 * DB saved on disk
authing-server-redis-1     | 97:C 10 May 2023 11:25:59.034 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.106 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.090 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.091 * Background saving started by pid 98
authing-server-redis-1     | 98:C 10 May 2023 11:31:00.122 * DB saved on disk
authing-server-redis-1     | 98:C 10 May 2023 11:31:00.122 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.191 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.038 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.039 * Background saving started by pid 99
authing-server-redis-1     | 99:C 10 May 2023 11:36:01.061 * DB saved on disk
authing-server-redis-1     | 99:C 10 May 2023 11:36:01.061 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.032 * Background saving started by pid 100
authing-server-redis-1     | 100:C 10 May 2023 11:41:02.073 * DB saved on disk
authing-server-redis-1     | 100:C 10 May 2023 11:41:02.073 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.098 * Background saving started by pid 101
authing-server-redis-1     | 101:C 10 May 2023 11:46:03.129 * DB saved on disk
authing-server-redis-1     | 101:C 10 May 2023 11:46:03.129 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.064 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.065 * Background saving started by pid 102
authing-server-redis-1     | 102:C 10 May 2023 11:51:04.196 * DB saved on disk
authing-server-redis-1     | 102:C 10 May 2023 11:51:04.197 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.267 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.030 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.031 * Background saving started by pid 103
authing-server-redis-1     | 103:C 10 May 2023 11:56:05.067 * DB saved on disk
authing-server-redis-1     | 103:C 10 May 2023 11:56:05.067 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.131 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.099 * Background saving started by pid 104
authing-server-redis-1     | 104:C 10 May 2023 12:01:06.119 * DB saved on disk
authing-server-redis-1     | 104:C 10 May 2023 12:01:06.119 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.200 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.034 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.035 * Background saving started by pid 105
authing-server-redis-1     | 105:C 10 May 2023 12:06:07.057 * DB saved on disk
authing-server-redis-1     | 105:C 10 May 2023 12:06:07.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.135 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.079 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.079 * Background saving started by pid 106
authing-server-redis-1     | 106:C 10 May 2023 12:11:08.120 * DB saved on disk
authing-server-redis-1     | 106:C 10 May 2023 12:11:08.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.180 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.024 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.024 * Background saving started by pid 107
authing-server-redis-1     | 107:C 10 May 2023 12:16:09.052 * DB saved on disk
authing-server-redis-1     | 107:C 10 May 2023 12:16:09.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.125 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.098 * Background saving started by pid 108
authing-server-redis-1     | 108:C 10 May 2023 12:21:10.136 * DB saved on disk
authing-server-redis-1     | 108:C 10 May 2023 12:21:10.136 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.042 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.043 * Background saving started by pid 109
authing-server-redis-1     | 109:C 10 May 2023 12:26:11.080 * DB saved on disk
authing-server-redis-1     | 109:C 10 May 2023 12:26:11.081 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.143 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.076 * Background saving started by pid 110
authing-server-redis-1     | 110:C 10 May 2023 12:31:12.109 * DB saved on disk
authing-server-redis-1     | 110:C 10 May 2023 12:31:12.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.177 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.001 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.001 * Background saving started by pid 111
authing-server-redis-1     | 111:C 10 May 2023 12:36:13.045 * DB saved on disk
authing-server-redis-1     | 111:C 10 May 2023 12:36:13.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.102 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.033 * Background saving started by pid 112
authing-server-redis-1     | 112:C 10 May 2023 12:41:14.136 * DB saved on disk
authing-server-redis-1     | 112:C 10 May 2023 12:41:14.137 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.234 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.067 * Background saving started by pid 113
authing-server-redis-1     | 113:C 10 May 2023 12:46:15.108 * DB saved on disk
authing-server-redis-1     | 113:C 10 May 2023 12:46:15.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.083 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.084 * Background saving started by pid 114
authing-server-redis-1     | 114:C 10 May 2023 12:51:16.117 * DB saved on disk
authing-server-redis-1     | 114:C 10 May 2023 12:51:16.117 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.184 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.086 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.086 * Background saving started by pid 115
authing-server-redis-1     | 115:C 10 May 2023 12:56:17.118 * DB saved on disk
authing-server-redis-1     | 115:C 10 May 2023 12:56:17.118 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.187 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.097 * Background saving started by pid 116
authing-server-redis-1     | 116:C 10 May 2023 13:01:18.143 * DB saved on disk
authing-server-redis-1     | 116:C 10 May 2023 13:01:18.144 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.198 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.013 * Background saving started by pid 117
authing-server-redis-1     | 117:C 10 May 2023 13:06:19.051 * DB saved on disk
authing-server-redis-1     | 117:C 10 May 2023 13:06:19.051 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.040 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.040 * Background saving started by pid 118
authing-server-redis-1     | 118:C 10 May 2023 13:11:20.065 * DB saved on disk
authing-server-redis-1     | 118:C 10 May 2023 13:11:20.065 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.141 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.076 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.076 * Background saving started by pid 119
authing-server-redis-1     | 119:C 10 May 2023 13:16:21.102 * DB saved on disk
authing-server-redis-1     | 119:C 10 May 2023 13:16:21.102 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.177 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.011 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.011 * Background saving started by pid 120
authing-server-redis-1     | 120:C 10 May 2023 13:21:22.054 * DB saved on disk
authing-server-redis-1     | 120:C 10 May 2023 13:21:22.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.112 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.021 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.021 * Background saving started by pid 121
authing-server-redis-1     | 121:C 10 May 2023 13:26:23.060 * DB saved on disk
authing-server-redis-1     | 121:C 10 May 2023 13:26:23.061 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.122 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.055 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.056 * Background saving started by pid 122
authing-server-redis-1     | 122:C 10 May 2023 13:31:24.082 * DB saved on disk
authing-server-redis-1     | 122:C 10 May 2023 13:31:24.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.085 * Background saving started by pid 123
authing-server-redis-1     | 123:C 10 May 2023 13:36:25.119 * DB saved on disk
authing-server-redis-1     | 123:C 10 May 2023 13:36:25.119 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.026 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.027 * Background saving started by pid 124
authing-server-redis-1     | 124:C 10 May 2023 13:41:26.054 * DB saved on disk
authing-server-redis-1     | 124:C 10 May 2023 13:41:26.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.127 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.031 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.032 * Background saving started by pid 125
authing-server-redis-1     | 125:C 10 May 2023 13:46:27.064 * DB saved on disk
authing-server-redis-1     | 125:C 10 May 2023 13:46:27.065 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.132 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.048 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.049 * Background saving started by pid 126
authing-server-redis-1     | 126:C 10 May 2023 13:51:28.071 * DB saved on disk
authing-server-redis-1     | 126:C 10 May 2023 13:51:28.071 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.150 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.075 * Background saving started by pid 127
authing-server-redis-1     | 127:C 10 May 2023 13:56:29.108 * DB saved on disk
authing-server-redis-1     | 127:C 10 May 2023 13:56:29.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.079 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.080 * Background saving started by pid 128
authing-server-redis-1     | 128:C 10 May 2023 14:01:30.112 * DB saved on disk
authing-server-redis-1     | 128:C 10 May 2023 14:01:30.113 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.181 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.011 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.012 * Background saving started by pid 129
authing-server-redis-1     | 129:C 10 May 2023 14:06:31.049 * DB saved on disk
authing-server-redis-1     | 129:C 10 May 2023 14:06:31.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.112 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.024 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.025 * Background saving started by pid 130
authing-server-redis-1     | 130:C 10 May 2023 14:11:32.057 * DB saved on disk
authing-server-redis-1     | 130:C 10 May 2023 14:11:32.058 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.125 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.053 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.053 * Background saving started by pid 131
authing-server-redis-1     | 131:C 10 May 2023 14:16:33.087 * DB saved on disk
authing-server-redis-1     | 131:C 10 May 2023 14:16:33.088 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.154 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.087 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.087 * Background saving started by pid 132
authing-server-redis-1     | 132:C 10 May 2023 14:21:34.109 * DB saved on disk
authing-server-redis-1     | 132:C 10 May 2023 14:21:34.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.189 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.026 * Background saving started by pid 133
authing-server-redis-1     | 133:C 10 May 2023 14:26:35.046 * DB saved on disk
authing-server-redis-1     | 133:C 10 May 2023 14:26:35.047 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.064 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.065 * Background saving started by pid 134
authing-server-redis-1     | 134:C 10 May 2023 14:31:36.096 * DB saved on disk
authing-server-redis-1     | 134:C 10 May 2023 14:31:36.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.167 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.095 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.095 * Background saving started by pid 135
authing-server-redis-1     | 135:C 10 May 2023 14:36:37.120 * DB saved on disk
authing-server-redis-1     | 135:C 10 May 2023 14:36:37.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.196 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.037 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.038 * Background saving started by pid 136
authing-server-redis-1     | 136:C 10 May 2023 14:41:38.104 * DB saved on disk
authing-server-redis-1     | 136:C 10 May 2023 14:41:38.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.074 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.075 * Background saving started by pid 137
authing-server-redis-1     | 137:C 10 May 2023 14:46:39.153 * DB saved on disk
authing-server-redis-1     | 137:C 10 May 2023 14:46:39.153 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.175 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.006 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.006 * Background saving started by pid 138
authing-server-redis-1     | 138:C 10 May 2023 14:51:40.096 * DB saved on disk
authing-server-redis-1     | 138:C 10 May 2023 14:51:40.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.107 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.001 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.002 * Background saving started by pid 139
authing-server-redis-1     | 139:C 10 May 2023 14:56:41.028 * DB saved on disk
authing-server-redis-1     | 139:C 10 May 2023 14:56:41.028 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.102 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.025 * Background saving started by pid 140
authing-server-redis-1     | 140:C 10 May 2023 15:01:42.053 * DB saved on disk
authing-server-redis-1     | 140:C 10 May 2023 15:01:42.053 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.028 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.028 * Background saving started by pid 141
authing-server-redis-1     | 141:C 10 May 2023 15:06:43.049 * DB saved on disk
authing-server-redis-1     | 141:C 10 May 2023 15:06:43.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.129 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.050 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.051 * Background saving started by pid 142
authing-server-redis-1     | 142:C 10 May 2023 15:11:44.072 * DB saved on disk
authing-server-redis-1     | 142:C 10 May 2023 15:11:44.072 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.151 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.062 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.063 * Background saving started by pid 143
authing-server-redis-1     | 143:C 10 May 2023 15:16:45.078 * DB saved on disk
authing-server-redis-1     | 143:C 10 May 2023 15:16:45.079 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.163 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.000 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.000 * Background saving started by pid 144
authing-server-redis-1     | 144:C 10 May 2023 15:21:46.049 * DB saved on disk
authing-server-redis-1     | 144:C 10 May 2023 15:21:46.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.101 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.035 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.035 * Background saving started by pid 145
authing-server-redis-1     | 145:C 10 May 2023 15:26:47.062 * DB saved on disk
authing-server-redis-1     | 145:C 10 May 2023 15:26:47.063 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.136 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.070 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.070 * Background saving started by pid 146
authing-server-redis-1     | 146:C 10 May 2023 15:31:48.108 * DB saved on disk
authing-server-redis-1     | 146:C 10 May 2023 15:31:48.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.172 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.004 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.004 * Background saving started by pid 147
authing-server-redis-1     | 147:C 10 May 2023 15:36:49.034 * DB saved on disk
authing-server-redis-1     | 147:C 10 May 2023 15:36:49.035 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.105 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.048 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.049 * Background saving started by pid 148
authing-server-redis-1     | 148:C 10 May 2023 15:41:50.074 * DB saved on disk
authing-server-redis-1     | 148:C 10 May 2023 15:41:50.074 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.150 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.080 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.081 * Background saving started by pid 149
authing-server-redis-1     | 149:C 10 May 2023 15:46:51.138 * DB saved on disk
authing-server-redis-1     | 149:C 10 May 2023 15:46:51.138 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.181 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.009 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.009 * Background saving started by pid 150
authing-server-redis-1     | 150:C 10 May 2023 15:51:52.027 * DB saved on disk
authing-server-redis-1     | 150:C 10 May 2023 15:51:52.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.111 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.052 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.053 * Background saving started by pid 151
authing-server-redis-1     | 151:C 10 May 2023 15:56:53.094 * DB saved on disk
authing-server-redis-1     | 151:C 10 May 2023 15:56:53.094 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.154 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.007 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.008 * Background saving started by pid 152
authing-server-redis-1     | 152:C 10 May 2023 16:01:54.027 * DB saved on disk
authing-server-redis-1     | 152:C 10 May 2023 16:01:54.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.108 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.060 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.061 * Background saving started by pid 153
authing-server-redis-1     | 153:C 10 May 2023 17:01:55.104 * DB saved on disk
authing-server-redis-1     | 153:C 10 May 2023 17:01:55.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.162 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.001 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.002 * Background saving started by pid 154
authing-server-redis-1     | 154:C 10 May 2023 18:01:56.038 * DB saved on disk
authing-server-redis-1     | 154:C 10 May 2023 18:01:56.039 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.103 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.082 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.083 * Background saving started by pid 155
authing-server-redis-1     | 155:C 10 May 2023 19:01:57.114 * DB saved on disk
authing-server-redis-1     | 155:C 10 May 2023 19:01:57.114 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.183 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.061 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.062 * Background saving started by pid 156
authing-server-redis-1     | 156:C 10 May 2023 20:01:58.101 * DB saved on disk
authing-server-redis-1     | 156:C 10 May 2023 20:01:58.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.162 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.069 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.069 * Background saving started by pid 157
authing-server-redis-1     | 157:C 10 May 2023 21:01:59.103 * DB saved on disk
authing-server-redis-1     | 157:C 10 May 2023 21:01:59.103 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.170 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.020 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.021 * Background saving started by pid 158
authing-server-redis-1     | 158:C 10 May 2023 22:02:00.050 * DB saved on disk
authing-server-redis-1     | 158:C 10 May 2023 22:02:00.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.121 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.032 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.033 * Background saving started by pid 159
authing-server-redis-1     | 159:C 10 May 2023 23:02:01.093 * DB saved on disk
authing-server-redis-1     | 159:C 10 May 2023 23:02:01.093 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.775 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.776 * Background saving started by pid 160
authing-server-redis-1     | 160:C 11 May 2023 00:38:34.846 * DB saved on disk
authing-server-redis-1     | 160:C 11 May 2023 00:38:34.847 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.877 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.096 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.097 * Background saving started by pid 161
authing-server-redis-1     | 161:C 11 May 2023 01:38:35.123 * DB saved on disk
authing-server-redis-1     | 161:C 11 May 2023 01:38:35.123 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.197 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.067 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.068 * Background saving started by pid 162
authing-server-redis-1     | 162:C 11 May 2023 02:38:36.082 * DB saved on disk
authing-server-redis-1     | 162:C 11 May 2023 02:38:36.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.374 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.375 * Background saving started by pid 163
authing-server-redis-1     | 163:C 11 May 2023 02:58:12.414 * DB saved on disk
authing-server-redis-1     | 163:C 11 May 2023 02:58:12.414 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.475 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.043 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.044 * Background saving started by pid 164
authing-server-redis-1     | 164:C 11 May 2023 03:03:13.083 * DB saved on disk
authing-server-redis-1     | 164:C 11 May 2023 03:03:13.084 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.144 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.015 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.016 * Background saving started by pid 165
authing-server-redis-1     | 165:C 11 May 2023 03:08:14.035 * DB saved on disk
authing-server-redis-1     | 165:C 11 May 2023 03:08:14.036 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.116 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.050 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.050 * Background saving started by pid 166
authing-server-redis-1     | 166:C 11 May 2023 03:13:15.075 * DB saved on disk
authing-server-redis-1     | 166:C 11 May 2023 03:13:15.075 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.151 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.038 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.039 * Background saving started by pid 167
authing-server-redis-1     | 167:C 11 May 2023 03:18:16.069 * DB saved on disk
authing-server-redis-1     | 167:C 11 May 2023 03:18:16.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.086 * Background saving started by pid 168
authing-server-redis-1     | 168:C 11 May 2023 03:23:17.110 * DB saved on disk
authing-server-redis-1     | 168:C 11 May 2023 03:23:17.110 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.037 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.038 * Background saving started by pid 169
authing-server-redis-1     | 169:C 11 May 2023 03:28:18.073 * DB saved on disk
authing-server-redis-1     | 169:C 11 May 2023 03:28:18.074 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.138 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.012 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.013 * Background saving started by pid 170
authing-server-redis-1     | 170:C 11 May 2023 03:33:19.048 * DB saved on disk
authing-server-redis-1     | 170:C 11 May 2023 03:33:19.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.113 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.036 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.036 * Background saving started by pid 171
authing-server-redis-1     | 171:C 11 May 2023 03:38:20.078 * DB saved on disk
authing-server-redis-1     | 171:C 11 May 2023 03:38:20.078 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.137 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.425 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.426 * Background saving started by pid 172
authing-server-redis-1     | 172:C 22 May 2023 05:52:51.502 * DB saved on disk
authing-server-redis-1     | 172:C 22 May 2023 05:52:51.502 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.526 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.072 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.073 * Background saving started by pid 173
authing-server-redis-1     | 173:C 22 May 2023 05:57:52.106 * DB saved on disk
authing-server-redis-1     | 173:C 22 May 2023 05:57:52.106 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.173 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.316 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.316 * Background saving started by pid 174
authing-server-redis-1     | 174:C 22 May 2023 06:05:20.354 * DB saved on disk
authing-server-redis-1     | 174:C 22 May 2023 06:05:20.354 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.417 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.356 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.356 * Background saving started by pid 175
authing-server-redis-1     | 175:C 22 May 2023 06:18:15.383 * DB saved on disk
authing-server-redis-1     | 175:C 22 May 2023 06:18:15.383 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.457 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.703 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.703 * Background saving started by pid 176
authing-server-redis-1     | 176:C 22 May 2023 06:29:16.736 * DB saved on disk
authing-server-redis-1     | 176:C 22 May 2023 06:29:16.736 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.805 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.345 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.346 * Background saving started by pid 177
authing-server-redis-1     | 177:C 22 May 2023 06:41:30.394 * DB saved on disk
authing-server-redis-1     | 177:C 22 May 2023 06:41:30.394 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.447 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.337 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.338 * Background saving started by pid 178
authing-server-redis-1     | 178:C 22 May 2023 06:54:00.378 * DB saved on disk
authing-server-redis-1     | 178:C 22 May 2023 06:54:00.379 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.416 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.417 * Background saving started by pid 179
authing-server-redis-1     | 179:C 22 May 2023 07:06:30.434 * DB saved on disk
authing-server-redis-1     | 179:C 22 May 2023 07:06:30.435 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.517 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.397 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.397 * Background saving started by pid 180
authing-server-redis-1     | 180:C 22 May 2023 07:19:00.425 * DB saved on disk
authing-server-redis-1     | 180:C 22 May 2023 07:19:00.426 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.498 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.356 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.356 * Background saving started by pid 181
authing-server-redis-1     | 181:C 22 May 2023 07:31:30.402 * DB saved on disk
authing-server-redis-1     | 181:C 22 May 2023 07:31:30.402 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.457 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.506 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.507 * Background saving started by pid 182
authing-server-redis-1     | 182:C 22 May 2023 07:44:00.550 * DB saved on disk
authing-server-redis-1     | 182:C 22 May 2023 07:44:00.551 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.607 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.178 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.179 * Background saving started by pid 183
authing-server-redis-1     | 183:C 22 May 2023 07:51:42.216 * DB saved on disk
authing-server-redis-1     | 183:C 22 May 2023 07:51:42.216 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.279 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.259 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.260 * Background saving started by pid 184
authing-server-redis-1     | 184:C 22 May 2023 08:03:46.298 * DB saved on disk
authing-server-redis-1     | 184:C 22 May 2023 08:03:46.298 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.360 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.327 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.327 * Background saving started by pid 185
authing-server-redis-1     | 185:C 22 May 2023 08:16:16.358 * DB saved on disk
authing-server-redis-1     | 185:C 22 May 2023 08:16:16.358 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.428 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.323 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.323 * Background saving started by pid 186
authing-server-redis-1     | 186:C 22 May 2023 08:28:46.351 * DB saved on disk
authing-server-redis-1     | 186:C 22 May 2023 08:28:46.351 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.424 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.196 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.197 * Background saving started by pid 187
authing-server-redis-1     | 187:C 22 May 2023 08:41:16.227 * DB saved on disk
authing-server-redis-1     | 187:C 22 May 2023 08:41:16.228 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.297 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.882 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.883 * Background saving started by pid 188
authing-server-redis-1     | 188:C 22 May 2023 08:48:05.903 * DB saved on disk
authing-server-redis-1     | 188:C 22 May 2023 08:48:05.904 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.983 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.045 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.046 * Background saving started by pid 189
authing-server-redis-1     | 189:C 22 May 2023 08:53:06.080 * DB saved on disk
authing-server-redis-1     | 189:C 22 May 2023 08:53:06.081 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.146 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.081 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.081 * Background saving started by pid 190
authing-server-redis-1     | 190:C 22 May 2023 08:58:07.103 * DB saved on disk
authing-server-redis-1     | 190:C 22 May 2023 08:58:07.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.182 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.086 * Background saving started by pid 191
authing-server-redis-1     | 191:C 22 May 2023 09:03:08.267 * DB saved on disk
authing-server-redis-1     | 191:C 22 May 2023 09:03:08.268 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.287 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.312 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.312 * Background saving started by pid 192
authing-server-redis-1     | 192:C 22 May 2023 09:41:46.329 * DB saved on disk
authing-server-redis-1     | 192:C 22 May 2023 09:41:46.330 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.413 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:50:34.972 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:50:34.973 * Background saving started by pid 193
authing-server-redis-1     | 193:C 22 May 2023 09:50:35.008 * DB saved on disk
authing-server-redis-1     | 193:C 22 May 2023 09:50:35.008 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:50:35.073 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.162 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.163 * Background saving started by pid 194
authing-server-redis-1     | 194:C 22 May 2023 10:00:31.199 * DB saved on disk
authing-server-redis-1     | 194:C 22 May 2023 10:00:31.200 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.264 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.412 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.412 * Background saving started by pid 195
authing-server-redis-1     | 195:C 22 May 2023 10:13:46.447 * DB saved on disk
authing-server-redis-1     | 195:C 22 May 2023 10:13:46.447 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.513 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.477 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.478 * Background saving started by pid 196
authing-server-redis-1     | 196:C 22 May 2023 10:27:31.507 * DB saved on disk
authing-server-redis-1     | 196:C 22 May 2023 10:27:31.507 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.578 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.057 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.057 * Background saving started by pid 197
authing-server-redis-1     | 197:C 22 May 2023 10:37:17.076 * DB saved on disk
authing-server-redis-1     | 197:C 22 May 2023 10:37:17.076 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.203 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.203 * Background saving started by pid 198
authing-server-redis-1     | 198:C 22 May 2023 10:50:45.245 * DB saved on disk
authing-server-redis-1     | 198:C 22 May 2023 10:50:45.246 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.304 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.094 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.095 * Background saving started by pid 199
authing-server-redis-1     | 199:C 22 May 2023 10:56:17.174 * DB saved on disk
authing-server-redis-1     | 199:C 22 May 2023 10:56:17.175 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.195 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.077 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.078 * Background saving started by pid 200
authing-server-redis-1     | 200:C 22 May 2023 11:01:18.104 * DB saved on disk
authing-server-redis-1     | 200:C 22 May 2023 11:01:18.105 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.178 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.067 * Background saving started by pid 201
authing-server-redis-1     | 201:C 22 May 2023 11:06:19.098 * DB saved on disk
authing-server-redis-1     | 201:C 22 May 2023 11:06:19.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.073 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.073 * Background saving started by pid 202
authing-server-redis-1     | 202:C 22 May 2023 11:11:20.097 * DB saved on disk
authing-server-redis-1     | 202:C 22 May 2023 11:11:20.097 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.174 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.041 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.041 * Background saving started by pid 203
authing-server-redis-1     | 203:C 22 May 2023 11:16:21.064 * DB saved on disk
authing-server-redis-1     | 203:C 22 May 2023 11:16:21.064 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.142 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.028 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.029 * Background saving started by pid 204
authing-server-redis-1     | 204:C 22 May 2023 11:21:22.057 * DB saved on disk
authing-server-redis-1     | 204:C 22 May 2023 11:21:22.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.129 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.036 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.036 * Background saving started by pid 205
authing-server-redis-1     | 205:C 22 May 2023 11:26:23.060 * DB saved on disk
authing-server-redis-1     | 205:C 22 May 2023 11:26:23.060 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.137 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.032 * Background saving started by pid 206
authing-server-redis-1     | 206:C 22 May 2023 11:31:24.052 * DB saved on disk
authing-server-redis-1     | 206:C 22 May 2023 11:31:24.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.132 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.066 * Background saving started by pid 207
authing-server-redis-1     | 207:C 22 May 2023 11:36:25.095 * DB saved on disk
authing-server-redis-1     | 207:C 22 May 2023 11:36:25.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.099 * Background saving started by pid 208
authing-server-redis-1     | 208:C 22 May 2023 11:41:26.152 * DB saved on disk
authing-server-redis-1     | 208:C 22 May 2023 11:41:26.153 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.004 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.004 * Background saving started by pid 209
authing-server-redis-1     | 209:C 22 May 2023 11:46:27.040 * DB saved on disk
authing-server-redis-1     | 209:C 22 May 2023 11:46:27.041 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.105 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.089 * Background saving started by pid 210
authing-server-redis-1     | 210:C 22 May 2023 11:51:28.123 * DB saved on disk
authing-server-redis-1     | 210:C 22 May 2023 11:51:28.123 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.042 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.042 * Background saving started by pid 211
authing-server-redis-1     | 211:C 22 May 2023 11:56:29.071 * DB saved on disk
authing-server-redis-1     | 211:C 22 May 2023 11:56:29.072 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.143 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.046 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.046 * Background saving started by pid 212
authing-server-redis-1     | 212:C 22 May 2023 12:01:30.077 * DB saved on disk
authing-server-redis-1     | 212:C 22 May 2023 12:01:30.077 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.147 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.065 * Background saving started by pid 213
authing-server-redis-1     | 213:C 22 May 2023 12:06:31.098 * DB saved on disk
authing-server-redis-1     | 213:C 22 May 2023 12:06:31.098 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.071 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.072 * Background saving started by pid 214
authing-server-redis-1     | 214:C 22 May 2023 12:11:32.112 * DB saved on disk
authing-server-redis-1     | 214:C 22 May 2023 12:11:32.112 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.173 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.043 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.044 * Background saving started by pid 215
authing-server-redis-1     | 215:C 22 May 2023 12:16:33.082 * DB saved on disk
authing-server-redis-1     | 215:C 22 May 2023 12:16:33.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.145 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.055 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.056 * Background saving started by pid 216
authing-server-redis-1     | 216:C 22 May 2023 12:21:34.080 * DB saved on disk
authing-server-redis-1     | 216:C 22 May 2023 12:21:34.080 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.156 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.090 * Background saving started by pid 217
authing-server-redis-1     | 217:C 22 May 2023 12:26:35.114 * DB saved on disk
authing-server-redis-1     | 217:C 22 May 2023 12:26:35.114 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.085 * Background saving started by pid 218
authing-server-redis-1     | 218:C 22 May 2023 12:31:36.116 * DB saved on disk
authing-server-redis-1     | 218:C 22 May 2023 12:31:36.116 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.724 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.725 * Background saving started by pid 219
authing-server-redis-1     | 219:C 22 May 2023 12:36:43.769 * DB saved on disk
authing-server-redis-1     | 219:C 22 May 2023 12:36:43.770 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.825 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.012 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.012 * Background saving started by pid 220
authing-server-redis-1     | 220:C 22 May 2023 12:41:44.048 * DB saved on disk
authing-server-redis-1     | 220:C 22 May 2023 12:41:44.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.113 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.044 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.044 * Background saving started by pid 221
authing-server-redis-1     | 221:C 22 May 2023 12:46:45.092 * DB saved on disk
authing-server-redis-1     | 221:C 22 May 2023 12:46:45.092 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.145 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.785 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.785 * Background saving started by pid 222
authing-server-redis-1     | 222:C 22 May 2023 12:57:10.809 * DB saved on disk
authing-server-redis-1     | 222:C 22 May 2023 12:57:10.809 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.886 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.764 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.765 * Background saving started by pid 223
authing-server-redis-1     | 223:C 22 May 2023 13:03:49.779 * DB saved on disk
authing-server-redis-1     | 223:C 22 May 2023 13:03:49.779 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.865 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.063 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.064 * Background saving started by pid 224
authing-server-redis-1     | 224:C 22 May 2023 14:03:50.099 * DB saved on disk
authing-server-redis-1     | 224:C 22 May 2023 14:03:50.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.164 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.293 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.294 * Background saving started by pid 225
authing-server-redis-1     | 225:C 22 May 2023 17:21:43.308 * DB saved on disk
authing-server-redis-1     | 225:C 22 May 2023 17:21:43.309 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.395 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.075 * Background saving started by pid 226
authing-server-redis-1     | 226:C 22 May 2023 17:26:44.089 * DB saved on disk
authing-server-redis-1     | 226:C 22 May 2023 17:26:44.089 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.220 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.220 * Background saving started by pid 227
authing-server-redis-1     | 227:C 22 May 2023 17:39:02.250 * DB saved on disk
authing-server-redis-1     | 227:C 22 May 2023 17:39:02.251 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.320 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.082 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.083 * Background saving started by pid 228
authing-server-redis-1     | 228:C 22 May 2023 18:39:03.107 * DB saved on disk
authing-server-redis-1     | 228:C 22 May 2023 18:39:03.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.183 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.014 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.015 * Background saving started by pid 229
authing-server-redis-1     | 229:C 22 May 2023 19:39:04.045 * DB saved on disk
authing-server-redis-1     | 229:C 22 May 2023 19:39:04.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.115 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.337 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.338 * Background saving started by pid 230
authing-server-redis-1     | 230:C 22 May 2023 22:56:37.358 * DB saved on disk
authing-server-redis-1     | 230:C 22 May 2023 22:56:37.358 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.087 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.087 * Background saving started by pid 231
authing-server-redis-1     | 231:C 22 May 2023 23:56:38.104 * DB saved on disk
authing-server-redis-1     | 231:C 22 May 2023 23:56:38.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.188 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 23:58:28.415 # Possible SECURITY ATTACK detected. It looks like somebody is sending POST or Host: commands to Redis. This is likely due to an attacker attempting to use Cross Protocol Scripting to compromise your Redis instance. Connection aborted.
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.014 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.015 * Background saving started by pid 232
authing-server-redis-1     | 232:C 23 May 2023 00:56:39.059 * DB saved on disk
authing-server-redis-1     | 232:C 23 May 2023 00:56:39.059 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.116 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.397 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.398 * Background saving started by pid 233
authing-server-redis-1     | 233:C 23 May 2023 03:31:59.427 * DB saved on disk
authing-server-redis-1     | 233:C 23 May 2023 03:31:59.428 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.498 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.576 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.576 * Background saving started by pid 234
authing-server-redis-1     | 234:C 23 May 2023 14:27:15.610 * DB saved on disk
authing-server-redis-1     | 234:C 23 May 2023 14:27:15.610 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.677 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.253 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.253 * Background saving started by pid 235
authing-server-redis-1     | 235:C 23 May 2023 14:41:15.288 * DB saved on disk
authing-server-redis-1     | 235:C 23 May 2023 14:41:15.288 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.354 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.334 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.335 * Background saving started by pid 236
authing-server-redis-1     | 236:C 23 May 2023 14:53:45.378 * DB saved on disk
authing-server-redis-1     | 236:C 23 May 2023 14:53:45.379 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.436 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.398 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.399 * Background saving started by pid 237
authing-server-redis-1     | 237:C 23 May 2023 15:06:15.432 * DB saved on disk
authing-server-redis-1     | 237:C 23 May 2023 15:06:15.432 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.500 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.378 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.378 * Background saving started by pid 238
authing-server-redis-1     | 238:C 23 May 2023 15:18:45.401 * DB saved on disk
authing-server-redis-1     | 238:C 23 May 2023 15:18:45.402 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.479 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.312 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.313 * Background saving started by pid 239
authing-server-redis-1     | 239:C 23 May 2023 15:31:15.345 * DB saved on disk
authing-server-redis-1     | 239:C 23 May 2023 15:31:15.345 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.414 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.274 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.275 * Background saving started by pid 240
authing-server-redis-1     | 240:C 23 May 2023 15:43:45.308 * DB saved on disk
authing-server-redis-1     | 240:C 23 May 2023 15:43:45.308 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.375 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.247 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.248 * Background saving started by pid 241
authing-server-redis-1     | 241:C 23 May 2023 15:56:15.269 * DB saved on disk
authing-server-redis-1     | 241:C 23 May 2023 15:56:15.270 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.349 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.212 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.212 * Background saving started by pid 242
authing-server-redis-1     | 242:C 23 May 2023 16:08:45.256 * DB saved on disk
authing-server-redis-1     | 242:C 23 May 2023 16:08:45.257 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.314 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.185 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.185 * Background saving started by pid 243
authing-server-redis-1     | 243:C 23 May 2023 16:21:15.224 * DB saved on disk
authing-server-redis-1     | 243:C 23 May 2023 16:21:15.224 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.287 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.172 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.173 * Background saving started by pid 244
authing-server-redis-1     | 244:C 23 May 2023 16:33:45.207 * DB saved on disk
authing-server-redis-1     | 244:C 23 May 2023 16:33:45.208 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.274 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.170 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.170 * Background saving started by pid 245
authing-server-redis-1     | 245:C 23 May 2023 16:46:15.205 * DB saved on disk
authing-server-redis-1     | 245:C 23 May 2023 16:46:15.206 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.270 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.070 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.071 * Background saving started by pid 246
authing-server-redis-1     | 246:C 23 May 2023 17:46:16.100 * DB saved on disk
authing-server-redis-1     | 246:C 23 May 2023 17:46:16.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.171 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.247 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.248 * Background saving started by pid 247
authing-server-redis-1     | 247:C 23 May 2023 19:44:30.279 * DB saved on disk
authing-server-redis-1     | 247:C 23 May 2023 19:44:30.279 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.348 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.025 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.025 * Background saving started by pid 248
authing-server-redis-1     | 248:C 23 May 2023 20:44:31.048 * DB saved on disk
authing-server-redis-1     | 248:C 23 May 2023 20:44:31.048 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.066 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.067 * Background saving started by pid 249
authing-server-redis-1     | 249:C 23 May 2023 21:44:32.096 * DB saved on disk
authing-server-redis-1     | 249:C 23 May 2023 21:44:32.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.215 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.216 * Background saving started by pid 250
authing-server-redis-1     | 250:C 23 May 2023 23:38:30.246 * DB saved on disk
authing-server-redis-1     | 250:C 23 May 2023 23:38:30.246 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.317 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.313 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.313 * Background saving started by pid 251
authing-server-redis-1     | 251:C 23 May 2023 23:51:00.340 * DB saved on disk
authing-server-redis-1     | 251:C 23 May 2023 23:51:00.341 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.414 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.292 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.292 * Background saving started by pid 252
authing-server-redis-1     | 252:C 24 May 2023 00:03:30.312 * DB saved on disk
authing-server-redis-1     | 252:C 24 May 2023 00:03:30.313 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.394 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.377 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.377 * Background saving started by pid 253
authing-server-redis-1     | 253:C 24 May 2023 00:16:00.415 * DB saved on disk
authing-server-redis-1     | 253:C 24 May 2023 00:16:00.415 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.479 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.354 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.355 * Background saving started by pid 254
authing-server-redis-1     | 254:C 24 May 2023 00:28:30.384 * DB saved on disk
authing-server-redis-1     | 254:C 24 May 2023 00:28:30.385 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.456 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.337 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.337 * Background saving started by pid 255
authing-server-redis-1     | 255:C 24 May 2023 00:41:00.380 * DB saved on disk
authing-server-redis-1     | 255:C 24 May 2023 00:41:00.381 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.316 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.317 * Background saving started by pid 256
authing-server-redis-1     | 256:C 24 May 2023 01:35:45.334 * DB saved on disk
authing-server-redis-1     | 256:C 24 May 2023 01:35:45.334 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.418 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.235 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.235 * Background saving started by pid 257
authing-server-redis-1     | 257:C 24 May 2023 01:48:15.267 * DB saved on disk
authing-server-redis-1     | 257:C 24 May 2023 01:48:15.267 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.337 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.237 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.237 * Background saving started by pid 258
authing-server-redis-1     | 258:C 24 May 2023 02:00:45.255 * DB saved on disk
authing-server-redis-1     | 258:C 24 May 2023 02:00:45.255 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.338 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.149 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.149 * Background saving started by pid 259
authing-server-redis-1     | 259:C 24 May 2023 02:13:15.175 * DB saved on disk
authing-server-redis-1     | 259:C 24 May 2023 02:13:15.175 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.250 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.235 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.236 * Background saving started by pid 260
authing-server-redis-1     | 260:C 24 May 2023 02:25:45.266 * DB saved on disk
authing-server-redis-1     | 260:C 24 May 2023 02:25:45.267 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.337 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.151 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.151 * Background saving started by pid 261
authing-server-redis-1     | 261:C 24 May 2023 02:44:00.171 * DB saved on disk
authing-server-redis-1     | 261:C 24 May 2023 02:44:00.172 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.253 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.201 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.202 * Background saving started by pid 262
authing-server-redis-1     | 262:C 24 May 2023 02:56:30.221 * DB saved on disk
authing-server-redis-1     | 262:C 24 May 2023 02:56:30.221 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.303 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.244 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.244 * Background saving started by pid 263
authing-server-redis-1     | 263:C 24 May 2023 03:12:30.286 * DB saved on disk
authing-server-redis-1     | 263:C 24 May 2023 03:12:30.286 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.345 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.196 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.196 * Background saving started by pid 264
authing-server-redis-1     | 264:C 24 May 2023 03:25:00.221 * DB saved on disk
authing-server-redis-1     | 264:C 24 May 2023 03:25:00.222 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.297 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.205 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.206 * Background saving started by pid 265
authing-server-redis-1     | 265:C 24 May 2023 03:37:30.234 * DB saved on disk
authing-server-redis-1     | 265:C 24 May 2023 03:37:30.235 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.307 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.222 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.222 * Background saving started by pid 266
authing-server-redis-1     | 266:C 24 May 2023 03:50:00.259 * DB saved on disk
authing-server-redis-1     | 266:C 24 May 2023 03:50:00.260 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.323 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.561 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.562 * Background saving started by pid 267
authing-server-redis-1     | 267:C 24 May 2023 04:36:45.586 * DB saved on disk
authing-server-redis-1     | 267:C 24 May 2023 04:36:45.587 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.662 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.691 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.692 * Background saving started by pid 268
authing-server-redis-1     | 268:C 24 May 2023 05:09:00.719 * DB saved on disk
authing-server-redis-1     | 268:C 24 May 2023 05:09:00.719 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.792 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:21:30.913 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:21:30.914 * Background saving started by pid 269
authing-server-redis-1     | 269:C 24 May 2023 05:21:30.966 * DB saved on disk
authing-server-redis-1     | 269:C 24 May 2023 05:21:30.966 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:21:31.014 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:34:00.952 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:34:00.952 * Background saving started by pid 270
authing-server-redis-1     | 270:C 24 May 2023 05:34:00.981 * DB saved on disk
authing-server-redis-1     | 270:C 24 May 2023 05:34:00.981 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:34:01.053 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.591 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.591 * Background saving started by pid 271
authing-server-redis-1     | 271:C 24 May 2023 05:46:30.624 * DB saved on disk
authing-server-redis-1     | 271:C 24 May 2023 05:46:30.625 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.692 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.525 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.525 * Background saving started by pid 272
authing-server-redis-1     | 272:C 24 May 2023 05:59:30.554 * DB saved on disk
authing-server-redis-1     | 272:C 24 May 2023 05:59:30.555 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.626 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.541 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.541 * Background saving started by pid 273
authing-server-redis-1     | 273:C 24 May 2023 06:12:00.566 * DB saved on disk
authing-server-redis-1     | 273:C 24 May 2023 06:12:00.566 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.641 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.573 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.573 * Background saving started by pid 274
authing-server-redis-1     | 274:C 24 May 2023 06:24:30.610 * DB saved on disk
authing-server-redis-1     | 274:C 24 May 2023 06:24:30.611 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.674 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.566 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.566 * Background saving started by pid 275
authing-server-redis-1     | 275:C 24 May 2023 06:37:00.590 * DB saved on disk
authing-server-redis-1     | 275:C 24 May 2023 06:37:00.591 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.667 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.561 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.561 * Background saving started by pid 276
authing-server-redis-1     | 276:C 24 May 2023 06:49:30.590 * DB saved on disk
authing-server-redis-1     | 276:C 24 May 2023 06:49:30.591 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.662 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.649 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.649 * Background saving started by pid 277
authing-server-redis-1     | 277:C 24 May 2023 07:02:00.678 * DB saved on disk
authing-server-redis-1     | 277:C 24 May 2023 07:02:00.678 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.749 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.022 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.022 * Background saving started by pid 278
authing-server-redis-1     | 278:C 24 May 2023 08:02:01.048 * DB saved on disk
authing-server-redis-1     | 278:C 24 May 2023 08:02:01.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.123 * Background saving terminated with success
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.811 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.811 * Background saving started by pid 279
authing-server-redis-1     | 279:C 25 May 2023 11:50:45.836 * DB saved on disk
authing-server-redis-1     | 279:C 25 May 2023 11:50:45.836 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.912 * Background saving terminated with success
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.317 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.318 * Background saving started by pid 280
authing-server-redis-1     | 280:C 25 May 2023 12:03:15.348 * DB saved on disk
authing-server-redis-1     | 280:C 25 May 2023 12:03:15.348 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.419 * Background saving terminated with success
root@debian:~/projects/authing-server# docker compose logs -f
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.990 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-db-1        | 
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.991 # Redis version=6.2.6, bits=64, commit=00000000, modified=0, pid=1, just started
authing-server-db-1        | PostgreSQL Database directory appears to contain a database; Skipping initialization
authing-server-db-1        | 
authing-server-db-1        | LOG:  database system was shut down at 2023-05-05 11:09:16 UTC
authing-server-db-1        | LOG:  MultiXact member wraparound protections are now enabled
authing-server-db-1        | LOG:  autovacuum launcher started
authing-server-db-1        | LOG:  database system is ready to accept connections
authing-server-db-1        | LOG:  incomplete startup packet
authing-server-db-1        | FATAL:  password authentication failed for user "postgres"
authing-server-db-1        | DETAIL:  Password does not match for user "postgres".
authing-server-db-1        | 	Connection matched pg_hba.conf line 95: "host all all all md5"
authing-server-db-1        | FATAL:  database "flow-engine" does not exist
authing-server-redis-1     | 1:C 05 May 2023 11:21:03.991 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.991 * monotonic clock: POSIX clock_gettime
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 * Running mode=standalone, port=6379.
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 # Server initialized
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
authing-server-redis-1     | 1:M 05 May 2023 11:21:03.992 * Ready to accept connections
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.055 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.055 * Background saving started by pid 19
authing-server-redis-1     | 19:C 05 May 2023 12:21:04.086 * DB saved on disk
authing-server-redis-1     | 19:C 05 May 2023 12:21:04.086 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 12:21:04.156 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.347 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.348 * Background saving started by pid 20
authing-server-redis-1     | 20:C 05 May 2023 13:17:17.368 * DB saved on disk
authing-server-redis-1     | 20:C 05 May 2023 13:17:17.368 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:17:17.448 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.743 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.744 * Background saving started by pid 21
authing-server-redis-1     | 21:C 05 May 2023 13:23:35.779 * DB saved on disk
authing-server-redis-1     | 21:C 05 May 2023 13:23:35.779 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:23:35.844 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.684 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.684 * Background saving started by pid 22
authing-server-redis-1     | 22:C 05 May 2023 13:32:10.716 * DB saved on disk
authing-server-redis-1     | 22:C 05 May 2023 13:32:10.716 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:32:10.786 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.726 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.726 * Background saving started by pid 23
authing-server-redis-1     | 23:C 05 May 2023 13:57:16.749 * DB saved on disk
authing-server-redis-1     | 23:C 05 May 2023 13:57:16.749 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 13:57:16.827 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.700 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.700 * Background saving started by pid 49
authing-server-redis-1     | 49:C 05 May 2023 14:08:31.743 * DB saved on disk
authing-server-redis-1     | 49:C 05 May 2023 14:08:31.744 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:08:31.801 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.067 * Background saving started by pid 50
authing-server-redis-1     | 50:C 05 May 2023 14:13:32.100 * DB saved on disk
authing-server-redis-1     | 50:C 05 May 2023 14:13:32.100 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:13:32.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.073 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.073 * Background saving started by pid 51
authing-server-redis-1     | 51:C 05 May 2023 14:18:33.106 * DB saved on disk
authing-server-redis-1     | 51:C 05 May 2023 14:18:33.107 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:18:33.174 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.188 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.189 * Background saving started by pid 52
authing-server-redis-1     | 52:C 05 May 2023 14:26:00.227 * DB saved on disk
authing-server-redis-1     | 52:C 05 May 2023 14:26:00.228 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:26:00.290 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.089 * Background saving started by pid 53
authing-server-redis-1     | 53:C 05 May 2023 14:31:01.160 * DB saved on disk
authing-server-redis-1     | 53:C 05 May 2023 14:31:01.160 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:31:01.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.092 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.093 * Background saving started by pid 54
authing-server-redis-1     | 54:C 05 May 2023 14:36:02.134 * DB saved on disk
authing-server-redis-1     | 54:C 05 May 2023 14:36:02.135 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:36:02.193 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.098 * Background saving started by pid 55
authing-server-redis-1     | 55:C 05 May 2023 14:41:03.144 * DB saved on disk
authing-server-redis-1     | 55:C 05 May 2023 14:41:03.145 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:41:03.198 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.598 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.599 * Background saving started by pid 56
authing-server-redis-1     | 56:C 05 May 2023 14:48:00.629 * DB saved on disk
authing-server-redis-1     | 56:C 05 May 2023 14:48:00.629 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:48:00.699 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.032 * Background saving started by pid 57
authing-server-redis-1     | 57:C 05 May 2023 14:53:01.063 * DB saved on disk
authing-server-redis-1     | 57:C 05 May 2023 14:53:01.063 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 14:53:01.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.395 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.396 * Background saving started by pid 58
authing-server-redis-1     | 58:C 05 May 2023 15:09:24.423 * DB saved on disk
authing-server-redis-1     | 58:C 05 May 2023 15:09:24.424 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 15:09:24.497 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.084 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.085 * Background saving started by pid 59
authing-server-redis-1     | 59:C 05 May 2023 15:14:25.120 * DB saved on disk
authing-server-redis-1     | 59:C 05 May 2023 15:14:25.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 15:14:25.185 * Background saving terminated with success
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.029 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.029 * Background saving started by pid 60
authing-server-redis-1     | 60:C 05 May 2023 16:14:26.055 * DB saved on disk
authing-server-redis-1     | 60:C 05 May 2023 16:14:26.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 05 May 2023 16:14:26.130 * Background saving terminated with success
authing-server-redis-1     | 1:M 06 May 2023 05:49:25.947 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 06 May 2023 05:49:25.948 * Background saving started by pid 61
authing-server-redis-1     | 61:C 06 May 2023 05:49:25.986 * DB saved on disk
authing-server-redis-1     | 61:C 06 May 2023 05:49:25.987 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 06 May 2023 05:49:26.049 * Background saving terminated with success
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.018 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.019 * Background saving started by pid 62
authing-server-redis-1     | 62:C 06 May 2023 05:54:27.052 * DB saved on disk
authing-server-redis-1     | 62:C 06 May 2023 05:54:27.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 06 May 2023 05:54:27.119 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.182 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.183 * Background saving started by pid 63
authing-server-redis-1     | 63:C 08 May 2023 15:12:49.211 * DB saved on disk
authing-server-redis-1     | 63:C 08 May 2023 15:12:49.211 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:12:49.284 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:20:25.982 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:20:25.983 * Background saving started by pid 64
authing-server-redis-1     | 64:C 08 May 2023 15:20:26.016 * DB saved on disk
authing-server-redis-1     | 64:C 08 May 2023 15:20:26.017 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:20:26.084 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.029 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.030 * Background saving started by pid 65
authing-server-redis-1     | 65:C 08 May 2023 15:25:27.068 * DB saved on disk
authing-server-redis-1     | 65:C 08 May 2023 15:25:27.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:25:27.130 * Background saving terminated with success
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.046 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.046 * Background saving started by pid 66
authing-server-redis-1     | 66:C 08 May 2023 15:30:28.079 * DB saved on disk
authing-server-redis-1     | 66:C 08 May 2023 15:30:28.080 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 08 May 2023 15:30:28.147 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.432 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.432 * Background saving started by pid 67
authing-server-redis-1     | 67:C 09 May 2023 14:46:15.448 * DB saved on disk
authing-server-redis-1     | 67:C 09 May 2023 14:46:15.449 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:46:15.534 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.065 * Background saving started by pid 68
authing-server-redis-1     | 68:C 09 May 2023 14:51:16.098 * DB saved on disk
authing-server-redis-1     | 68:C 09 May 2023 14:51:16.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:51:16.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.089 * Background saving started by pid 69
authing-server-redis-1     | 69:C 09 May 2023 14:56:17.144 * DB saved on disk
authing-server-redis-1     | 69:C 09 May 2023 14:56:17.144 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 14:56:17.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.016 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.016 * Background saving started by pid 70
authing-server-redis-1     | 70:C 09 May 2023 15:01:18.046 * DB saved on disk
authing-server-redis-1     | 70:C 09 May 2023 15:01:18.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:01:18.117 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.047 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.048 * Background saving started by pid 71
authing-server-redis-1     | 71:C 09 May 2023 15:06:19.078 * DB saved on disk
authing-server-redis-1     | 71:C 09 May 2023 15:06:19.078 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:06:19.149 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.013 * Background saving started by pid 72
authing-server-redis-1     | 72:C 09 May 2023 15:11:20.040 * DB saved on disk
authing-server-redis-1     | 72:C 09 May 2023 15:11:20.041 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 15:11:20.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.002 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.003 * Background saving started by pid 73
authing-server-redis-1     | 73:C 09 May 2023 16:11:21.027 * DB saved on disk
authing-server-redis-1     | 73:C 09 May 2023 16:11:21.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 09 May 2023 16:11:21.104 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.695 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.696 * Background saving started by pid 74
authing-server-redis-1     | 74:C 10 May 2023 08:48:15.735 * DB saved on disk
authing-server-redis-1     | 74:C 10 May 2023 08:48:15.735 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 08:48:15.797 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.741 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.742 * Background saving started by pid 75
authing-server-redis-1     | 75:C 10 May 2023 08:56:55.781 * DB saved on disk
authing-server-redis-1     | 75:C 10 May 2023 08:56:55.782 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 08:56:55.843 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.008 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.009 * Background saving started by pid 76
authing-server-redis-1     | 76:C 10 May 2023 09:01:56.047 * DB saved on disk
authing-server-redis-1     | 76:C 10 May 2023 09:01:56.047 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:01:56.109 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.005 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.006 * Background saving started by pid 77
authing-server-redis-1     | 77:C 10 May 2023 09:06:57.031 * DB saved on disk
authing-server-redis-1     | 77:C 10 May 2023 09:06:57.032 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:06:57.106 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.056 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.056 * Background saving started by pid 78
authing-server-redis-1     | 78:C 10 May 2023 09:11:58.101 * DB saved on disk
authing-server-redis-1     | 78:C 10 May 2023 09:11:58.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:11:58.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.057 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.058 * Background saving started by pid 79
authing-server-redis-1     | 79:C 10 May 2023 09:16:59.083 * DB saved on disk
authing-server-redis-1     | 79:C 10 May 2023 09:16:59.084 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:16:59.158 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.086 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.086 * Background saving started by pid 80
authing-server-redis-1     | 80:C 10 May 2023 09:22:00.122 * DB saved on disk
authing-server-redis-1     | 80:C 10 May 2023 09:22:00.122 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:22:00.187 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.017 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.017 * Background saving started by pid 81
authing-server-redis-1     | 81:C 10 May 2023 09:27:01.057 * DB saved on disk
authing-server-redis-1     | 81:C 10 May 2023 09:27:01.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:27:01.118 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.070 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.071 * Background saving started by pid 82
authing-server-redis-1     | 82:C 10 May 2023 09:32:02.097 * DB saved on disk
authing-server-redis-1     | 82:C 10 May 2023 09:32:02.098 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:32:02.171 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.025 * Background saving started by pid 83
authing-server-redis-1     | 83:C 10 May 2023 09:37:03.068 * DB saved on disk
authing-server-redis-1     | 83:C 10 May 2023 09:37:03.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:37:03.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.080 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.081 * Background saving started by pid 84
authing-server-redis-1     | 84:C 10 May 2023 09:42:04.117 * DB saved on disk
authing-server-redis-1     | 84:C 10 May 2023 09:42:04.118 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:42:04.182 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.056 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.057 * Background saving started by pid 85
authing-server-redis-1     | 85:C 10 May 2023 09:47:05.087 * DB saved on disk
authing-server-redis-1     | 85:C 10 May 2023 09:47:05.087 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:47:05.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.014 * Background saving started by pid 86
authing-server-redis-1     | 86:C 10 May 2023 09:52:06.048 * DB saved on disk
authing-server-redis-1     | 86:C 10 May 2023 09:52:06.048 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:52:06.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.090 * Background saving started by pid 87
authing-server-redis-1     | 87:C 10 May 2023 09:57:07.115 * DB saved on disk
authing-server-redis-1     | 87:C 10 May 2023 09:57:07.116 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 09:57:07.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.068 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.069 * Background saving started by pid 88
authing-server-redis-1     | 88:C 10 May 2023 10:02:08.094 * DB saved on disk
authing-server-redis-1     | 88:C 10 May 2023 10:02:08.094 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:02:08.169 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.502 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.503 * Background saving started by pid 89
authing-server-redis-1     | 89:C 10 May 2023 10:13:44.539 * DB saved on disk
authing-server-redis-1     | 89:C 10 May 2023 10:13:44.540 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:13:44.603 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.327 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.327 * Background saving started by pid 90
authing-server-redis-1     | 90:C 10 May 2023 10:50:52.365 * DB saved on disk
authing-server-redis-1     | 90:C 10 May 2023 10:50:52.366 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:50:52.429 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.029 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.030 * Background saving started by pid 91
authing-server-redis-1     | 91:C 10 May 2023 10:55:53.068 * DB saved on disk
authing-server-redis-1     | 91:C 10 May 2023 10:55:53.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 10:55:53.131 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.026 * Background saving started by pid 92
authing-server-redis-1     | 92:C 10 May 2023 11:00:54.053 * DB saved on disk
authing-server-redis-1     | 92:C 10 May 2023 11:00:54.053 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:00:54.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.002 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.003 * Background saving started by pid 93
authing-server-redis-1     | 93:C 10 May 2023 11:05:55.032 * DB saved on disk
authing-server-redis-1     | 93:C 10 May 2023 11:05:55.033 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:05:55.103 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.091 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.091 * Background saving started by pid 94
authing-server-redis-1     | 94:C 10 May 2023 11:10:56.133 * DB saved on disk
authing-server-redis-1     | 94:C 10 May 2023 11:10:56.133 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:10:56.192 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.075 * Background saving started by pid 95
authing-server-redis-1     | 95:C 10 May 2023 11:15:57.145 * DB saved on disk
authing-server-redis-1     | 95:C 10 May 2023 11:15:57.146 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:15:57.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.096 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.097 * Background saving started by pid 96
authing-server-redis-1     | 96:C 10 May 2023 11:20:58.130 * DB saved on disk
authing-server-redis-1     | 96:C 10 May 2023 11:20:58.130 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:20:58.197 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.005 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.006 * Background saving started by pid 97
authing-server-redis-1     | 97:C 10 May 2023 11:25:59.034 * DB saved on disk
authing-server-redis-1     | 97:C 10 May 2023 11:25:59.034 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:25:59.106 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.090 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.091 * Background saving started by pid 98
authing-server-redis-1     | 98:C 10 May 2023 11:31:00.122 * DB saved on disk
authing-server-redis-1     | 98:C 10 May 2023 11:31:00.122 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:31:00.191 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.038 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.039 * Background saving started by pid 99
authing-server-redis-1     | 99:C 10 May 2023 11:36:01.061 * DB saved on disk
authing-server-redis-1     | 99:C 10 May 2023 11:36:01.061 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:36:01.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.032 * Background saving started by pid 100
authing-server-redis-1     | 100:C 10 May 2023 11:41:02.073 * DB saved on disk
authing-server-redis-1     | 100:C 10 May 2023 11:41:02.073 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:41:02.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.098 * Background saving started by pid 101
authing-server-redis-1     | 101:C 10 May 2023 11:46:03.129 * DB saved on disk
authing-server-redis-1     | 101:C 10 May 2023 11:46:03.129 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:46:03.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.064 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.065 * Background saving started by pid 102
authing-server-redis-1     | 102:C 10 May 2023 11:51:04.196 * DB saved on disk
authing-server-redis-1     | 102:C 10 May 2023 11:51:04.197 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:51:04.267 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.030 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.031 * Background saving started by pid 103
authing-server-redis-1     | 103:C 10 May 2023 11:56:05.067 * DB saved on disk
authing-server-redis-1     | 103:C 10 May 2023 11:56:05.067 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 11:56:05.131 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.099 * Background saving started by pid 104
authing-server-redis-1     | 104:C 10 May 2023 12:01:06.119 * DB saved on disk
authing-server-redis-1     | 104:C 10 May 2023 12:01:06.119 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:01:06.200 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.034 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.035 * Background saving started by pid 105
authing-server-redis-1     | 105:C 10 May 2023 12:06:07.057 * DB saved on disk
authing-server-redis-1     | 105:C 10 May 2023 12:06:07.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:06:07.135 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.079 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.079 * Background saving started by pid 106
authing-server-redis-1     | 106:C 10 May 2023 12:11:08.120 * DB saved on disk
authing-server-redis-1     | 106:C 10 May 2023 12:11:08.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:11:08.180 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.024 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.024 * Background saving started by pid 107
authing-server-redis-1     | 107:C 10 May 2023 12:16:09.052 * DB saved on disk
authing-server-redis-1     | 107:C 10 May 2023 12:16:09.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:16:09.125 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.098 * Background saving started by pid 108
authing-server-redis-1     | 108:C 10 May 2023 12:21:10.136 * DB saved on disk
authing-server-redis-1     | 108:C 10 May 2023 12:21:10.136 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:21:10.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.042 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.043 * Background saving started by pid 109
authing-server-redis-1     | 109:C 10 May 2023 12:26:11.080 * DB saved on disk
authing-server-redis-1     | 109:C 10 May 2023 12:26:11.081 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:26:11.143 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.076 * Background saving started by pid 110
authing-server-redis-1     | 110:C 10 May 2023 12:31:12.109 * DB saved on disk
authing-server-redis-1     | 110:C 10 May 2023 12:31:12.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:31:12.177 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.001 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.001 * Background saving started by pid 111
authing-server-redis-1     | 111:C 10 May 2023 12:36:13.045 * DB saved on disk
authing-server-redis-1     | 111:C 10 May 2023 12:36:13.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:36:13.102 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.033 * Background saving started by pid 112
authing-server-redis-1     | 112:C 10 May 2023 12:41:14.136 * DB saved on disk
authing-server-redis-1     | 112:C 10 May 2023 12:41:14.137 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:41:14.234 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.067 * Background saving started by pid 113
authing-server-redis-1     | 113:C 10 May 2023 12:46:15.108 * DB saved on disk
authing-server-redis-1     | 113:C 10 May 2023 12:46:15.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:46:15.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.083 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.084 * Background saving started by pid 114
authing-server-redis-1     | 114:C 10 May 2023 12:51:16.117 * DB saved on disk
authing-server-redis-1     | 114:C 10 May 2023 12:51:16.117 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:51:16.184 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.086 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.086 * Background saving started by pid 115
authing-server-redis-1     | 115:C 10 May 2023 12:56:17.118 * DB saved on disk
authing-server-redis-1     | 115:C 10 May 2023 12:56:17.118 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 12:56:17.187 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.097 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.097 * Background saving started by pid 116
authing-server-redis-1     | 116:C 10 May 2023 13:01:18.143 * DB saved on disk
authing-server-redis-1     | 116:C 10 May 2023 13:01:18.144 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:01:18.198 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.013 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.013 * Background saving started by pid 117
authing-server-redis-1     | 117:C 10 May 2023 13:06:19.051 * DB saved on disk
authing-server-redis-1     | 117:C 10 May 2023 13:06:19.051 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:06:19.114 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.040 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.040 * Background saving started by pid 118
authing-server-redis-1     | 118:C 10 May 2023 13:11:20.065 * DB saved on disk
authing-server-redis-1     | 118:C 10 May 2023 13:11:20.065 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:11:20.141 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.076 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.076 * Background saving started by pid 119
authing-server-redis-1     | 119:C 10 May 2023 13:16:21.102 * DB saved on disk
authing-server-redis-1     | 119:C 10 May 2023 13:16:21.102 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:16:21.177 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.011 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.011 * Background saving started by pid 120
authing-server-redis-1     | 120:C 10 May 2023 13:21:22.054 * DB saved on disk
authing-server-redis-1     | 120:C 10 May 2023 13:21:22.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:21:22.112 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.021 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.021 * Background saving started by pid 121
authing-server-redis-1     | 121:C 10 May 2023 13:26:23.060 * DB saved on disk
authing-server-redis-1     | 121:C 10 May 2023 13:26:23.061 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:26:23.122 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.055 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.056 * Background saving started by pid 122
authing-server-redis-1     | 122:C 10 May 2023 13:31:24.082 * DB saved on disk
authing-server-redis-1     | 122:C 10 May 2023 13:31:24.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:31:24.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.085 * Background saving started by pid 123
authing-server-redis-1     | 123:C 10 May 2023 13:36:25.119 * DB saved on disk
authing-server-redis-1     | 123:C 10 May 2023 13:36:25.119 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:36:25.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.026 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.027 * Background saving started by pid 124
authing-server-redis-1     | 124:C 10 May 2023 13:41:26.054 * DB saved on disk
authing-server-redis-1     | 124:C 10 May 2023 13:41:26.055 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:41:26.127 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.031 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.032 * Background saving started by pid 125
authing-server-redis-1     | 125:C 10 May 2023 13:46:27.064 * DB saved on disk
authing-server-redis-1     | 125:C 10 May 2023 13:46:27.065 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:46:27.132 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.048 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.049 * Background saving started by pid 126
authing-server-redis-1     | 126:C 10 May 2023 13:51:28.071 * DB saved on disk
authing-server-redis-1     | 126:C 10 May 2023 13:51:28.071 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:51:28.150 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.075 * Background saving started by pid 127
authing-server-redis-1     | 127:C 10 May 2023 13:56:29.108 * DB saved on disk
authing-server-redis-1     | 127:C 10 May 2023 13:56:29.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 13:56:29.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.079 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.080 * Background saving started by pid 128
authing-server-redis-1     | 128:C 10 May 2023 14:01:30.112 * DB saved on disk
authing-server-redis-1     | 128:C 10 May 2023 14:01:30.113 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:01:30.181 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.011 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.012 * Background saving started by pid 129
authing-server-redis-1     | 129:C 10 May 2023 14:06:31.049 * DB saved on disk
authing-server-redis-1     | 129:C 10 May 2023 14:06:31.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:06:31.112 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.024 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.025 * Background saving started by pid 130
authing-server-redis-1     | 130:C 10 May 2023 14:11:32.057 * DB saved on disk
authing-server-redis-1     | 130:C 10 May 2023 14:11:32.058 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:11:32.125 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.053 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.053 * Background saving started by pid 131
authing-server-redis-1     | 131:C 10 May 2023 14:16:33.087 * DB saved on disk
authing-server-redis-1     | 131:C 10 May 2023 14:16:33.088 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:16:33.154 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.087 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.087 * Background saving started by pid 132
authing-server-redis-1     | 132:C 10 May 2023 14:21:34.109 * DB saved on disk
authing-server-redis-1     | 132:C 10 May 2023 14:21:34.109 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:21:34.189 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.026 * Background saving started by pid 133
authing-server-redis-1     | 133:C 10 May 2023 14:26:35.046 * DB saved on disk
authing-server-redis-1     | 133:C 10 May 2023 14:26:35.047 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:26:35.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.064 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.065 * Background saving started by pid 134
authing-server-redis-1     | 134:C 10 May 2023 14:31:36.096 * DB saved on disk
authing-server-redis-1     | 134:C 10 May 2023 14:31:36.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:31:36.167 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.095 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.095 * Background saving started by pid 135
authing-server-redis-1     | 135:C 10 May 2023 14:36:37.120 * DB saved on disk
authing-server-redis-1     | 135:C 10 May 2023 14:36:37.120 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:36:37.196 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.037 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.038 * Background saving started by pid 136
authing-server-redis-1     | 136:C 10 May 2023 14:41:38.104 * DB saved on disk
authing-server-redis-1     | 136:C 10 May 2023 14:41:38.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:41:38.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.074 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.075 * Background saving started by pid 137
authing-server-redis-1     | 137:C 10 May 2023 14:46:39.153 * DB saved on disk
authing-server-redis-1     | 137:C 10 May 2023 14:46:39.153 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:46:39.175 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.006 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.006 * Background saving started by pid 138
authing-server-redis-1     | 138:C 10 May 2023 14:51:40.096 * DB saved on disk
authing-server-redis-1     | 138:C 10 May 2023 14:51:40.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:51:40.107 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.001 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.002 * Background saving started by pid 139
authing-server-redis-1     | 139:C 10 May 2023 14:56:41.028 * DB saved on disk
authing-server-redis-1     | 139:C 10 May 2023 14:56:41.028 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 14:56:41.102 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.025 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.025 * Background saving started by pid 140
authing-server-redis-1     | 140:C 10 May 2023 15:01:42.053 * DB saved on disk
authing-server-redis-1     | 140:C 10 May 2023 15:01:42.053 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:01:42.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.028 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.028 * Background saving started by pid 141
authing-server-redis-1     | 141:C 10 May 2023 15:06:43.049 * DB saved on disk
authing-server-redis-1     | 141:C 10 May 2023 15:06:43.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:06:43.129 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.050 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.051 * Background saving started by pid 142
authing-server-redis-1     | 142:C 10 May 2023 15:11:44.072 * DB saved on disk
authing-server-redis-1     | 142:C 10 May 2023 15:11:44.072 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:11:44.151 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.062 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.063 * Background saving started by pid 143
authing-server-redis-1     | 143:C 10 May 2023 15:16:45.078 * DB saved on disk
authing-server-redis-1     | 143:C 10 May 2023 15:16:45.079 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:16:45.163 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.000 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.000 * Background saving started by pid 144
authing-server-redis-1     | 144:C 10 May 2023 15:21:46.049 * DB saved on disk
authing-server-redis-1     | 144:C 10 May 2023 15:21:46.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:21:46.101 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.035 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.035 * Background saving started by pid 145
authing-server-redis-1     | 145:C 10 May 2023 15:26:47.062 * DB saved on disk
authing-server-redis-1     | 145:C 10 May 2023 15:26:47.063 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:26:47.136 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.070 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.070 * Background saving started by pid 146
authing-server-redis-1     | 146:C 10 May 2023 15:31:48.108 * DB saved on disk
authing-server-redis-1     | 146:C 10 May 2023 15:31:48.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:31:48.172 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.004 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.004 * Background saving started by pid 147
authing-server-redis-1     | 147:C 10 May 2023 15:36:49.034 * DB saved on disk
authing-server-redis-1     | 147:C 10 May 2023 15:36:49.035 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:36:49.105 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.048 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.049 * Background saving started by pid 148
authing-server-redis-1     | 148:C 10 May 2023 15:41:50.074 * DB saved on disk
authing-server-redis-1     | 148:C 10 May 2023 15:41:50.074 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:41:50.150 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.080 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.081 * Background saving started by pid 149
authing-server-redis-1     | 149:C 10 May 2023 15:46:51.138 * DB saved on disk
authing-server-redis-1     | 149:C 10 May 2023 15:46:51.138 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:46:51.181 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.009 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.009 * Background saving started by pid 150
authing-server-redis-1     | 150:C 10 May 2023 15:51:52.027 * DB saved on disk
authing-server-redis-1     | 150:C 10 May 2023 15:51:52.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:51:52.111 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.052 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.053 * Background saving started by pid 151
authing-server-redis-1     | 151:C 10 May 2023 15:56:53.094 * DB saved on disk
authing-server-redis-1     | 151:C 10 May 2023 15:56:53.094 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 15:56:53.154 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.007 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.008 * Background saving started by pid 152
authing-server-redis-1     | 152:C 10 May 2023 16:01:54.027 * DB saved on disk
authing-server-redis-1     | 152:C 10 May 2023 16:01:54.027 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 16:01:54.108 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.060 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.061 * Background saving started by pid 153
authing-server-redis-1     | 153:C 10 May 2023 17:01:55.104 * DB saved on disk
authing-server-redis-1     | 153:C 10 May 2023 17:01:55.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 17:01:55.162 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.001 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.002 * Background saving started by pid 154
authing-server-redis-1     | 154:C 10 May 2023 18:01:56.038 * DB saved on disk
authing-server-redis-1     | 154:C 10 May 2023 18:01:56.039 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 18:01:56.103 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.082 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.083 * Background saving started by pid 155
authing-server-redis-1     | 155:C 10 May 2023 19:01:57.114 * DB saved on disk
authing-server-redis-1     | 155:C 10 May 2023 19:01:57.114 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 19:01:57.183 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.061 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.062 * Background saving started by pid 156
authing-server-redis-1     | 156:C 10 May 2023 20:01:58.101 * DB saved on disk
authing-server-redis-1     | 156:C 10 May 2023 20:01:58.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 20:01:58.162 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.069 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.069 * Background saving started by pid 157
authing-server-redis-1     | 157:C 10 May 2023 21:01:59.103 * DB saved on disk
authing-server-redis-1     | 157:C 10 May 2023 21:01:59.103 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 21:01:59.170 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.020 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.021 * Background saving started by pid 158
authing-server-redis-1     | 158:C 10 May 2023 22:02:00.050 * DB saved on disk
authing-server-redis-1     | 158:C 10 May 2023 22:02:00.050 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 22:02:00.121 * Background saving terminated with success
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.032 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.033 * Background saving started by pid 159
authing-server-redis-1     | 159:C 10 May 2023 23:02:01.093 * DB saved on disk
authing-server-redis-1     | 159:C 10 May 2023 23:02:01.093 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 10 May 2023 23:02:01.133 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.775 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.776 * Background saving started by pid 160
authing-server-redis-1     | 160:C 11 May 2023 00:38:34.846 * DB saved on disk
authing-server-redis-1     | 160:C 11 May 2023 00:38:34.847 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 00:38:34.877 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.096 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.097 * Background saving started by pid 161
authing-server-redis-1     | 161:C 11 May 2023 01:38:35.123 * DB saved on disk
authing-server-redis-1     | 161:C 11 May 2023 01:38:35.123 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 01:38:35.197 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.067 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.068 * Background saving started by pid 162
authing-server-redis-1     | 162:C 11 May 2023 02:38:36.082 * DB saved on disk
authing-server-redis-1     | 162:C 11 May 2023 02:38:36.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 02:38:36.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.374 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.375 * Background saving started by pid 163
authing-server-redis-1     | 163:C 11 May 2023 02:58:12.414 * DB saved on disk
authing-server-redis-1     | 163:C 11 May 2023 02:58:12.414 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 02:58:12.475 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.043 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.044 * Background saving started by pid 164
authing-server-redis-1     | 164:C 11 May 2023 03:03:13.083 * DB saved on disk
authing-server-redis-1     | 164:C 11 May 2023 03:03:13.084 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:03:13.144 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.015 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.016 * Background saving started by pid 165
authing-server-redis-1     | 165:C 11 May 2023 03:08:14.035 * DB saved on disk
authing-server-redis-1     | 165:C 11 May 2023 03:08:14.036 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:08:14.116 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.050 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.050 * Background saving started by pid 166
authing-server-redis-1     | 166:C 11 May 2023 03:13:15.075 * DB saved on disk
authing-server-redis-1     | 166:C 11 May 2023 03:13:15.075 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:13:15.151 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.038 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.039 * Background saving started by pid 167
authing-server-redis-1     | 167:C 11 May 2023 03:18:16.069 * DB saved on disk
authing-server-redis-1     | 167:C 11 May 2023 03:18:16.069 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:18:16.139 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.086 * Background saving started by pid 168
authing-server-redis-1     | 168:C 11 May 2023 03:23:17.110 * DB saved on disk
authing-server-redis-1     | 168:C 11 May 2023 03:23:17.110 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:23:17.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.037 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.038 * Background saving started by pid 169
authing-server-redis-1     | 169:C 11 May 2023 03:28:18.073 * DB saved on disk
authing-server-redis-1     | 169:C 11 May 2023 03:28:18.074 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:28:18.138 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.012 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.013 * Background saving started by pid 170
authing-server-redis-1     | 170:C 11 May 2023 03:33:19.048 * DB saved on disk
authing-server-redis-1     | 170:C 11 May 2023 03:33:19.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:33:19.113 * Background saving terminated with success
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.036 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.036 * Background saving started by pid 171
authing-server-redis-1     | 171:C 11 May 2023 03:38:20.078 * DB saved on disk
authing-server-redis-1     | 171:C 11 May 2023 03:38:20.078 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 11 May 2023 03:38:20.137 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.425 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.426 * Background saving started by pid 172
authing-server-redis-1     | 172:C 22 May 2023 05:52:51.502 * DB saved on disk
authing-server-redis-1     | 172:C 22 May 2023 05:52:51.502 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 05:52:51.526 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.072 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.073 * Background saving started by pid 173
authing-server-redis-1     | 173:C 22 May 2023 05:57:52.106 * DB saved on disk
authing-server-redis-1     | 173:C 22 May 2023 05:57:52.106 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 05:57:52.173 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.316 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.316 * Background saving started by pid 174
authing-server-redis-1     | 174:C 22 May 2023 06:05:20.354 * DB saved on disk
authing-server-redis-1     | 174:C 22 May 2023 06:05:20.354 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:05:20.417 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.356 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.356 * Background saving started by pid 175
authing-server-redis-1     | 175:C 22 May 2023 06:18:15.383 * DB saved on disk
authing-server-redis-1     | 175:C 22 May 2023 06:18:15.383 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:18:15.457 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.703 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.703 * Background saving started by pid 176
authing-server-redis-1     | 176:C 22 May 2023 06:29:16.736 * DB saved on disk
authing-server-redis-1     | 176:C 22 May 2023 06:29:16.736 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:29:16.805 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.345 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.346 * Background saving started by pid 177
authing-server-redis-1     | 177:C 22 May 2023 06:41:30.394 * DB saved on disk
authing-server-redis-1     | 177:C 22 May 2023 06:41:30.394 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:41:30.447 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.337 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.338 * Background saving started by pid 178
authing-server-redis-1     | 178:C 22 May 2023 06:54:00.378 * DB saved on disk
authing-server-redis-1     | 178:C 22 May 2023 06:54:00.379 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 06:54:00.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.416 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.417 * Background saving started by pid 179
authing-server-redis-1     | 179:C 22 May 2023 07:06:30.434 * DB saved on disk
authing-server-redis-1     | 179:C 22 May 2023 07:06:30.435 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:06:30.517 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.397 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.397 * Background saving started by pid 180
authing-server-redis-1     | 180:C 22 May 2023 07:19:00.425 * DB saved on disk
authing-server-redis-1     | 180:C 22 May 2023 07:19:00.426 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:19:00.498 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.356 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.356 * Background saving started by pid 181
authing-server-redis-1     | 181:C 22 May 2023 07:31:30.402 * DB saved on disk
authing-server-redis-1     | 181:C 22 May 2023 07:31:30.402 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:31:30.457 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.506 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.507 * Background saving started by pid 182
authing-server-redis-1     | 182:C 22 May 2023 07:44:00.550 * DB saved on disk
authing-server-redis-1     | 182:C 22 May 2023 07:44:00.551 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:44:00.607 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.178 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.179 * Background saving started by pid 183
authing-server-redis-1     | 183:C 22 May 2023 07:51:42.216 * DB saved on disk
authing-server-redis-1     | 183:C 22 May 2023 07:51:42.216 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 07:51:42.279 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.259 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.260 * Background saving started by pid 184
authing-server-redis-1     | 184:C 22 May 2023 08:03:46.298 * DB saved on disk
authing-server-redis-1     | 184:C 22 May 2023 08:03:46.298 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:03:46.360 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.327 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.327 * Background saving started by pid 185
authing-server-redis-1     | 185:C 22 May 2023 08:16:16.358 * DB saved on disk
authing-server-redis-1     | 185:C 22 May 2023 08:16:16.358 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:16:16.428 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.323 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.323 * Background saving started by pid 186
authing-server-redis-1     | 186:C 22 May 2023 08:28:46.351 * DB saved on disk
authing-server-redis-1     | 186:C 22 May 2023 08:28:46.351 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:28:46.424 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.196 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.197 * Background saving started by pid 187
authing-server-redis-1     | 187:C 22 May 2023 08:41:16.227 * DB saved on disk
authing-server-redis-1     | 187:C 22 May 2023 08:41:16.228 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:41:16.297 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.882 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.883 * Background saving started by pid 188
authing-server-redis-1     | 188:C 22 May 2023 08:48:05.903 * DB saved on disk
authing-server-redis-1     | 188:C 22 May 2023 08:48:05.904 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:48:05.983 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.045 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.046 * Background saving started by pid 189
authing-server-redis-1     | 189:C 22 May 2023 08:53:06.080 * DB saved on disk
authing-server-redis-1     | 189:C 22 May 2023 08:53:06.081 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:53:06.146 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.081 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.081 * Background saving started by pid 190
authing-server-redis-1     | 190:C 22 May 2023 08:58:07.103 * DB saved on disk
authing-server-redis-1     | 190:C 22 May 2023 08:58:07.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 08:58:07.182 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.086 * Background saving started by pid 191
authing-server-redis-1     | 191:C 22 May 2023 09:03:08.267 * DB saved on disk
authing-server-redis-1     | 191:C 22 May 2023 09:03:08.268 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:03:08.287 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.312 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.312 * Background saving started by pid 192
authing-server-redis-1     | 192:C 22 May 2023 09:41:46.329 * DB saved on disk
authing-server-redis-1     | 192:C 22 May 2023 09:41:46.330 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:41:46.413 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 09:50:34.972 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 09:50:34.973 * Background saving started by pid 193
authing-server-redis-1     | 193:C 22 May 2023 09:50:35.008 * DB saved on disk
authing-server-redis-1     | 193:C 22 May 2023 09:50:35.008 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 09:50:35.073 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.162 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.163 * Background saving started by pid 194
authing-server-redis-1     | 194:C 22 May 2023 10:00:31.199 * DB saved on disk
authing-server-redis-1     | 194:C 22 May 2023 10:00:31.200 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:00:31.264 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.412 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.412 * Background saving started by pid 195
authing-server-redis-1     | 195:C 22 May 2023 10:13:46.447 * DB saved on disk
authing-server-redis-1     | 195:C 22 May 2023 10:13:46.447 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:13:46.513 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.477 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.478 * Background saving started by pid 196
authing-server-redis-1     | 196:C 22 May 2023 10:27:31.507 * DB saved on disk
authing-server-redis-1     | 196:C 22 May 2023 10:27:31.507 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:27:31.578 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.057 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.057 * Background saving started by pid 197
authing-server-redis-1     | 197:C 22 May 2023 10:37:17.076 * DB saved on disk
authing-server-redis-1     | 197:C 22 May 2023 10:37:17.076 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:37:17.157 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.203 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.203 * Background saving started by pid 198
authing-server-redis-1     | 198:C 22 May 2023 10:50:45.245 * DB saved on disk
authing-server-redis-1     | 198:C 22 May 2023 10:50:45.246 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:50:45.304 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.094 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.095 * Background saving started by pid 199
authing-server-redis-1     | 199:C 22 May 2023 10:56:17.174 * DB saved on disk
authing-server-redis-1     | 199:C 22 May 2023 10:56:17.175 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 10:56:17.195 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.077 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.078 * Background saving started by pid 200
authing-server-redis-1     | 200:C 22 May 2023 11:01:18.104 * DB saved on disk
authing-server-redis-1     | 200:C 22 May 2023 11:01:18.105 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:01:18.178 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.067 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.067 * Background saving started by pid 201
authing-server-redis-1     | 201:C 22 May 2023 11:06:19.098 * DB saved on disk
authing-server-redis-1     | 201:C 22 May 2023 11:06:19.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:06:19.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.073 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.073 * Background saving started by pid 202
authing-server-redis-1     | 202:C 22 May 2023 11:11:20.097 * DB saved on disk
authing-server-redis-1     | 202:C 22 May 2023 11:11:20.097 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:11:20.174 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.041 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.041 * Background saving started by pid 203
authing-server-redis-1     | 203:C 22 May 2023 11:16:21.064 * DB saved on disk
authing-server-redis-1     | 203:C 22 May 2023 11:16:21.064 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:16:21.142 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.028 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.029 * Background saving started by pid 204
authing-server-redis-1     | 204:C 22 May 2023 11:21:22.057 * DB saved on disk
authing-server-redis-1     | 204:C 22 May 2023 11:21:22.057 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:21:22.129 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.036 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.036 * Background saving started by pid 205
authing-server-redis-1     | 205:C 22 May 2023 11:26:23.060 * DB saved on disk
authing-server-redis-1     | 205:C 22 May 2023 11:26:23.060 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:26:23.137 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.032 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.032 * Background saving started by pid 206
authing-server-redis-1     | 206:C 22 May 2023 11:31:24.052 * DB saved on disk
authing-server-redis-1     | 206:C 22 May 2023 11:31:24.052 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:31:24.132 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.066 * Background saving started by pid 207
authing-server-redis-1     | 207:C 22 May 2023 11:36:25.095 * DB saved on disk
authing-server-redis-1     | 207:C 22 May 2023 11:36:25.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:36:25.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.098 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.099 * Background saving started by pid 208
authing-server-redis-1     | 208:C 22 May 2023 11:41:26.152 * DB saved on disk
authing-server-redis-1     | 208:C 22 May 2023 11:41:26.153 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:41:26.199 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.004 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.004 * Background saving started by pid 209
authing-server-redis-1     | 209:C 22 May 2023 11:46:27.040 * DB saved on disk
authing-server-redis-1     | 209:C 22 May 2023 11:46:27.041 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:46:27.105 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.089 * Background saving started by pid 210
authing-server-redis-1     | 210:C 22 May 2023 11:51:28.123 * DB saved on disk
authing-server-redis-1     | 210:C 22 May 2023 11:51:28.123 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:51:28.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.042 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.042 * Background saving started by pid 211
authing-server-redis-1     | 211:C 22 May 2023 11:56:29.071 * DB saved on disk
authing-server-redis-1     | 211:C 22 May 2023 11:56:29.072 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 11:56:29.143 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.046 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.046 * Background saving started by pid 212
authing-server-redis-1     | 212:C 22 May 2023 12:01:30.077 * DB saved on disk
authing-server-redis-1     | 212:C 22 May 2023 12:01:30.077 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:01:30.147 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.065 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.065 * Background saving started by pid 213
authing-server-redis-1     | 213:C 22 May 2023 12:06:31.098 * DB saved on disk
authing-server-redis-1     | 213:C 22 May 2023 12:06:31.098 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:06:31.166 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.071 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.072 * Background saving started by pid 214
authing-server-redis-1     | 214:C 22 May 2023 12:11:32.112 * DB saved on disk
authing-server-redis-1     | 214:C 22 May 2023 12:11:32.112 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:11:32.173 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.043 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.044 * Background saving started by pid 215
authing-server-redis-1     | 215:C 22 May 2023 12:16:33.082 * DB saved on disk
authing-server-redis-1     | 215:C 22 May 2023 12:16:33.083 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:16:33.145 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.055 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.056 * Background saving started by pid 216
authing-server-redis-1     | 216:C 22 May 2023 12:21:34.080 * DB saved on disk
authing-server-redis-1     | 216:C 22 May 2023 12:21:34.080 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:21:34.156 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.089 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.090 * Background saving started by pid 217
authing-server-redis-1     | 217:C 22 May 2023 12:26:35.114 * DB saved on disk
authing-server-redis-1     | 217:C 22 May 2023 12:26:35.114 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:26:35.190 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.085 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.085 * Background saving started by pid 218
authing-server-redis-1     | 218:C 22 May 2023 12:31:36.116 * DB saved on disk
authing-server-redis-1     | 218:C 22 May 2023 12:31:36.116 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:31:36.186 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.724 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.725 * Background saving started by pid 219
authing-server-redis-1     | 219:C 22 May 2023 12:36:43.769 * DB saved on disk
authing-server-redis-1     | 219:C 22 May 2023 12:36:43.770 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:36:43.825 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.012 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.012 * Background saving started by pid 220
authing-server-redis-1     | 220:C 22 May 2023 12:41:44.048 * DB saved on disk
authing-server-redis-1     | 220:C 22 May 2023 12:41:44.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:41:44.113 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.044 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.044 * Background saving started by pid 221
authing-server-redis-1     | 221:C 22 May 2023 12:46:45.092 * DB saved on disk
authing-server-redis-1     | 221:C 22 May 2023 12:46:45.092 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:46:45.145 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.785 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.785 * Background saving started by pid 222
authing-server-redis-1     | 222:C 22 May 2023 12:57:10.809 * DB saved on disk
authing-server-redis-1     | 222:C 22 May 2023 12:57:10.809 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 12:57:10.886 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.764 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.765 * Background saving started by pid 223
authing-server-redis-1     | 223:C 22 May 2023 13:03:49.779 * DB saved on disk
authing-server-redis-1     | 223:C 22 May 2023 13:03:49.779 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 13:03:49.865 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.063 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.064 * Background saving started by pid 224
authing-server-redis-1     | 224:C 22 May 2023 14:03:50.099 * DB saved on disk
authing-server-redis-1     | 224:C 22 May 2023 14:03:50.099 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 14:03:50.164 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.293 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.294 * Background saving started by pid 225
authing-server-redis-1     | 225:C 22 May 2023 17:21:43.308 * DB saved on disk
authing-server-redis-1     | 225:C 22 May 2023 17:21:43.309 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:21:43.395 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.075 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.075 * Background saving started by pid 226
authing-server-redis-1     | 226:C 22 May 2023 17:26:44.089 * DB saved on disk
authing-server-redis-1     | 226:C 22 May 2023 17:26:44.089 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:26:44.176 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.220 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.220 * Background saving started by pid 227
authing-server-redis-1     | 227:C 22 May 2023 17:39:02.250 * DB saved on disk
authing-server-redis-1     | 227:C 22 May 2023 17:39:02.251 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 17:39:02.320 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.082 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.083 * Background saving started by pid 228
authing-server-redis-1     | 228:C 22 May 2023 18:39:03.107 * DB saved on disk
authing-server-redis-1     | 228:C 22 May 2023 18:39:03.108 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 18:39:03.183 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.014 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.015 * Background saving started by pid 229
authing-server-redis-1     | 229:C 22 May 2023 19:39:04.045 * DB saved on disk
authing-server-redis-1     | 229:C 22 May 2023 19:39:04.046 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 19:39:04.115 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.337 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.338 * Background saving started by pid 230
authing-server-redis-1     | 230:C 22 May 2023 22:56:37.358 * DB saved on disk
authing-server-redis-1     | 230:C 22 May 2023 22:56:37.358 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 22:56:37.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.087 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.087 * Background saving started by pid 231
authing-server-redis-1     | 231:C 22 May 2023 23:56:38.104 * DB saved on disk
authing-server-redis-1     | 231:C 22 May 2023 23:56:38.104 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 22 May 2023 23:56:38.188 * Background saving terminated with success
authing-server-redis-1     | 1:M 22 May 2023 23:58:28.415 # Possible SECURITY ATTACK detected. It looks like somebody is sending POST or Host: commands to Redis. This is likely due to an attacker attempting to use Cross Protocol Scripting to compromise your Redis instance. Connection aborted.
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.014 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.015 * Background saving started by pid 232
authing-server-redis-1     | 232:C 23 May 2023 00:56:39.059 * DB saved on disk
authing-server-redis-1     | 232:C 23 May 2023 00:56:39.059 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 00:56:39.116 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.397 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.398 * Background saving started by pid 233
authing-server-redis-1     | 233:C 23 May 2023 03:31:59.427 * DB saved on disk
authing-server-redis-1     | 233:C 23 May 2023 03:31:59.428 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 03:31:59.498 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.576 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.576 * Background saving started by pid 234
authing-server-redis-1     | 234:C 23 May 2023 14:27:15.610 * DB saved on disk
authing-server-redis-1     | 234:C 23 May 2023 14:27:15.610 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:27:15.677 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.253 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.253 * Background saving started by pid 235
authing-server-redis-1     | 235:C 23 May 2023 14:41:15.288 * DB saved on disk
authing-server-redis-1     | 235:C 23 May 2023 14:41:15.288 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:41:15.354 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.334 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.335 * Background saving started by pid 236
authing-server-redis-1     | 236:C 23 May 2023 14:53:45.378 * DB saved on disk
authing-server-redis-1     | 236:C 23 May 2023 14:53:45.379 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 14:53:45.436 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.398 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.399 * Background saving started by pid 237
authing-server-redis-1     | 237:C 23 May 2023 15:06:15.432 * DB saved on disk
authing-server-redis-1     | 237:C 23 May 2023 15:06:15.432 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:06:15.500 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.378 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.378 * Background saving started by pid 238
authing-server-redis-1     | 238:C 23 May 2023 15:18:45.401 * DB saved on disk
authing-server-redis-1     | 238:C 23 May 2023 15:18:45.402 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:18:45.479 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.312 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.313 * Background saving started by pid 239
authing-server-redis-1     | 239:C 23 May 2023 15:31:15.345 * DB saved on disk
authing-server-redis-1     | 239:C 23 May 2023 15:31:15.345 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:31:15.414 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.274 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.275 * Background saving started by pid 240
authing-server-redis-1     | 240:C 23 May 2023 15:43:45.308 * DB saved on disk
authing-server-redis-1     | 240:C 23 May 2023 15:43:45.308 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:43:45.375 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.247 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.248 * Background saving started by pid 241
authing-server-redis-1     | 241:C 23 May 2023 15:56:15.269 * DB saved on disk
authing-server-redis-1     | 241:C 23 May 2023 15:56:15.270 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 15:56:15.349 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.212 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.212 * Background saving started by pid 242
authing-server-redis-1     | 242:C 23 May 2023 16:08:45.256 * DB saved on disk
authing-server-redis-1     | 242:C 23 May 2023 16:08:45.257 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:08:45.314 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.185 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.185 * Background saving started by pid 243
authing-server-redis-1     | 243:C 23 May 2023 16:21:15.224 * DB saved on disk
authing-server-redis-1     | 243:C 23 May 2023 16:21:15.224 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:21:15.287 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.172 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.173 * Background saving started by pid 244
authing-server-redis-1     | 244:C 23 May 2023 16:33:45.207 * DB saved on disk
authing-server-redis-1     | 244:C 23 May 2023 16:33:45.208 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:33:45.274 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.170 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.170 * Background saving started by pid 245
authing-server-redis-1     | 245:C 23 May 2023 16:46:15.205 * DB saved on disk
authing-server-redis-1     | 245:C 23 May 2023 16:46:15.206 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 16:46:15.270 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.070 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.071 * Background saving started by pid 246
authing-server-redis-1     | 246:C 23 May 2023 17:46:16.100 * DB saved on disk
authing-server-redis-1     | 246:C 23 May 2023 17:46:16.101 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 17:46:16.171 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.247 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.248 * Background saving started by pid 247
authing-server-redis-1     | 247:C 23 May 2023 19:44:30.279 * DB saved on disk
authing-server-redis-1     | 247:C 23 May 2023 19:44:30.279 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 19:44:30.348 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.025 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.025 * Background saving started by pid 248
authing-server-redis-1     | 248:C 23 May 2023 20:44:31.048 * DB saved on disk
authing-server-redis-1     | 248:C 23 May 2023 20:44:31.048 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 20:44:31.126 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.066 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.067 * Background saving started by pid 249
authing-server-redis-1     | 249:C 23 May 2023 21:44:32.096 * DB saved on disk
authing-server-redis-1     | 249:C 23 May 2023 21:44:32.096 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 21:44:32.168 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.215 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.216 * Background saving started by pid 250
authing-server-redis-1     | 250:C 23 May 2023 23:38:30.246 * DB saved on disk
authing-server-redis-1     | 250:C 23 May 2023 23:38:30.246 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 23:38:30.317 * Background saving terminated with success
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.313 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.313 * Background saving started by pid 251
authing-server-redis-1     | 251:C 23 May 2023 23:51:00.340 * DB saved on disk
authing-server-redis-1     | 251:C 23 May 2023 23:51:00.341 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 23 May 2023 23:51:00.414 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.292 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.292 * Background saving started by pid 252
authing-server-redis-1     | 252:C 24 May 2023 00:03:30.312 * DB saved on disk
authing-server-redis-1     | 252:C 24 May 2023 00:03:30.313 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:03:30.394 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.377 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.377 * Background saving started by pid 253
authing-server-redis-1     | 253:C 24 May 2023 00:16:00.415 * DB saved on disk
authing-server-redis-1     | 253:C 24 May 2023 00:16:00.415 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:16:00.479 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.354 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.355 * Background saving started by pid 254
authing-server-redis-1     | 254:C 24 May 2023 00:28:30.384 * DB saved on disk
authing-server-redis-1     | 254:C 24 May 2023 00:28:30.385 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:28:30.456 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.337 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.337 * Background saving started by pid 255
authing-server-redis-1     | 255:C 24 May 2023 00:41:00.380 * DB saved on disk
authing-server-redis-1     | 255:C 24 May 2023 00:41:00.381 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 00:41:00.438 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.316 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.317 * Background saving started by pid 256
authing-server-redis-1     | 256:C 24 May 2023 01:35:45.334 * DB saved on disk
authing-server-redis-1     | 256:C 24 May 2023 01:35:45.334 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 01:35:45.418 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.235 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.235 * Background saving started by pid 257
authing-server-redis-1     | 257:C 24 May 2023 01:48:15.267 * DB saved on disk
authing-server-redis-1     | 257:C 24 May 2023 01:48:15.267 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 01:48:15.337 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.237 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.237 * Background saving started by pid 258
authing-server-redis-1     | 258:C 24 May 2023 02:00:45.255 * DB saved on disk
authing-server-redis-1     | 258:C 24 May 2023 02:00:45.255 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:00:45.338 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.149 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.149 * Background saving started by pid 259
authing-server-redis-1     | 259:C 24 May 2023 02:13:15.175 * DB saved on disk
authing-server-redis-1     | 259:C 24 May 2023 02:13:15.175 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:13:15.250 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.235 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.236 * Background saving started by pid 260
authing-server-redis-1     | 260:C 24 May 2023 02:25:45.266 * DB saved on disk
authing-server-redis-1     | 260:C 24 May 2023 02:25:45.267 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:25:45.337 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.151 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.151 * Background saving started by pid 261
authing-server-redis-1     | 261:C 24 May 2023 02:44:00.171 * DB saved on disk
authing-server-redis-1     | 261:C 24 May 2023 02:44:00.172 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:44:00.253 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.201 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.202 * Background saving started by pid 262
authing-server-redis-1     | 262:C 24 May 2023 02:56:30.221 * DB saved on disk
authing-server-redis-1     | 262:C 24 May 2023 02:56:30.221 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 02:56:30.303 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.244 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.244 * Background saving started by pid 263
authing-server-redis-1     | 263:C 24 May 2023 03:12:30.286 * DB saved on disk
authing-server-redis-1     | 263:C 24 May 2023 03:12:30.286 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:12:30.345 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.196 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.196 * Background saving started by pid 264
authing-server-redis-1     | 264:C 24 May 2023 03:25:00.221 * DB saved on disk
authing-server-redis-1     | 264:C 24 May 2023 03:25:00.222 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:25:00.297 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.205 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.206 * Background saving started by pid 265
authing-server-redis-1     | 265:C 24 May 2023 03:37:30.234 * DB saved on disk
authing-server-redis-1     | 265:C 24 May 2023 03:37:30.235 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:37:30.307 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.222 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.222 * Background saving started by pid 266
authing-server-redis-1     | 266:C 24 May 2023 03:50:00.259 * DB saved on disk
authing-server-redis-1     | 266:C 24 May 2023 03:50:00.260 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 03:50:00.323 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.561 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.562 * Background saving started by pid 267
authing-server-redis-1     | 267:C 24 May 2023 04:36:45.586 * DB saved on disk
authing-server-redis-1     | 267:C 24 May 2023 04:36:45.587 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 04:36:45.662 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.691 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.692 * Background saving started by pid 268
authing-server-redis-1     | 268:C 24 May 2023 05:09:00.719 * DB saved on disk
authing-server-redis-1     | 268:C 24 May 2023 05:09:00.719 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:09:00.792 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:21:30.913 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:21:30.914 * Background saving started by pid 269
authing-server-redis-1     | 269:C 24 May 2023 05:21:30.966 * DB saved on disk
authing-server-redis-1     | 269:C 24 May 2023 05:21:30.966 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:21:31.014 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:34:00.952 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:34:00.952 * Background saving started by pid 270
authing-server-redis-1     | 270:C 24 May 2023 05:34:00.981 * DB saved on disk
authing-server-redis-1     | 270:C 24 May 2023 05:34:00.981 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:34:01.053 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.591 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.591 * Background saving started by pid 271
authing-server-redis-1     | 271:C 24 May 2023 05:46:30.624 * DB saved on disk
authing-server-redis-1     | 271:C 24 May 2023 05:46:30.625 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:46:30.692 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.525 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.525 * Background saving started by pid 272
authing-server-redis-1     | 272:C 24 May 2023 05:59:30.554 * DB saved on disk
authing-server-redis-1     | 272:C 24 May 2023 05:59:30.555 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 05:59:30.626 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.541 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.541 * Background saving started by pid 273
authing-server-redis-1     | 273:C 24 May 2023 06:12:00.566 * DB saved on disk
authing-server-redis-1     | 273:C 24 May 2023 06:12:00.566 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:12:00.641 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.573 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.573 * Background saving started by pid 274
authing-server-redis-1     | 274:C 24 May 2023 06:24:30.610 * DB saved on disk
authing-server-redis-1     | 274:C 24 May 2023 06:24:30.611 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:24:30.674 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.566 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.566 * Background saving started by pid 275
authing-server-redis-1     | 275:C 24 May 2023 06:37:00.590 * DB saved on disk
authing-server-redis-1     | 275:C 24 May 2023 06:37:00.591 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:37:00.667 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.561 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.561 * Background saving started by pid 276
authing-server-redis-1     | 276:C 24 May 2023 06:49:30.590 * DB saved on disk
authing-server-redis-1     | 276:C 24 May 2023 06:49:30.591 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 06:49:30.662 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.649 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.649 * Background saving started by pid 277
authing-server-redis-1     | 277:C 24 May 2023 07:02:00.678 * DB saved on disk
authing-server-redis-1     | 277:C 24 May 2023 07:02:00.678 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 07:02:00.749 * Background saving terminated with success
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.022 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.022 * Background saving started by pid 278
authing-server-redis-1     | 278:C 24 May 2023 08:02:01.048 * DB saved on disk
authing-server-redis-1     | 278:C 24 May 2023 08:02:01.049 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 24 May 2023 08:02:01.123 * Background saving terminated with success
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.811 * 1 changes in 3600 seconds. Saving...
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.811 * Background saving started by pid 279
authing-server-redis-1     | 279:C 25 May 2023 11:50:45.836 * DB saved on disk
authing-server-redis-1     | 279:C 25 May 2023 11:50:45.836 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 25 May 2023 11:50:45.912 * Background saving terminated with success
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.317 * 100 changes in 300 seconds. Saving...
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.318 * Background saving started by pid 280
authing-server-redis-1     | 280:C 25 May 2023 12:03:15.348 * DB saved on disk
authing-server-redis-1     | 280:C 25 May 2023 12:03:15.348 * RDB: 0 MB of memory used by copy-on-write
authing-server-redis-1     | 1:M 25 May 2023 12:03:15.419 * Background saving terminated with success
^Ccanceled
root@debian:~/projects/authing-server# docker compose ps
NAME                        IMAGE               COMMAND                  SERVICE             CREATED              STATUS                         PORTS
authing-server-db-1         postgres:9.6.24     "docker-entrypoint.s…"   db                  2 weeks ago          Up 2 weeks                     0.0.0.0:30302->5432/tcp, :::30302->5432/tcp
authing-server-pgadmin4-1   dpage/pgadmin4      "/entrypoint.sh"         pgadmin4            About a minute ago   Restarting (1) 2 seconds ago   
authing-server-redis-1      redis:6.2.6         "docker-entrypoint.s…"   redis               2 weeks ago          Up 2 weeks                     0.0.0.0:30301->6379/tcp, :::30301->6379/tcp
root@debian:~/projects/authing-server# docker compose logs authing-server-pgadmin4-1
no such service: authing-server-pgadmin4-1
root@debian:~/projects/authing-server# docker compose logs authing-server-pgadmin4-1^C
root@debian:~/projects/authing-server# docker compose logs pgadmin4
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
authing-server-pgadmin4-1  | You need to define the PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD environment variables.
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# docker compose up -d
[+] Running 1/1
 ⠿ Network authing-server_default        Created                                                                                                                                                         0.1s
[+] Running 5/5ing-server_pgadmin-data"  Creating                                                                                                                                                        0.0s
 ⠿ Network authing-server_default        Created                                                                                                                                                         0.1se ⠿ Volume "authing-server_pgadmin-data"  Created                                                                                                                                                         0.0s
 ⠿ Container authing-server-db-1         Running                                                                                                                                                         0.0s
 ⠿ Container authing-server-pgadmin-1    Started                                                                                                                                                         1.0s
 ⠿ Container authing-server-redis-1      Running                                                                                                                                                         0.0s
root@debian:~/projects/authing-server# docker compose ps
NAME                        IMAGE               COMMAND                  SERVICE             CREATED             STATUS                                  PORTS
authing-server-db-1         postgres:9.6.24     "docker-entrypoint.s…"   db                  2 weeks ago         Up 2 weeks                              0.0.0.0:30302->5432/tcp, :::30302->5432/tcp
authing-server-pgadmin-1    dpage/pgadmin4      "/entrypoint.sh"         pgadmin             5 seconds ago       Restarting (1) Less than a second ago   
authing-server-pgadmin4-1   dpage/pgadmin4      "/entrypoint.sh"         pgadmin4            5 minutes ago       Restarting (1) 43 seconds ago           
authing-server-redis-1      redis:6.2.6         "docker-entrypoint.s…"   redis               2 weeks ago         Up 2 weeks                              0.0.0.0:30301->6379/tcp, :::30301->6379/tcp
root@debian:~/projects/authing-server# docker compose down
[+] Running 5/5
 ⠿ Container authing-server-redis-1    Removed                                                                                                                                                           1.0s
 ⠿ Container authing-server-pgadmin-1  Removed                                                                                                                                                           0.2s
 ⠿ Container authing-server-db-1       Removed                                                                                                                                                           1.2s
 ⠿ Network authing-server_default      Removed                                                                                                                                                           0.3s
 ⠿ Network authing-server_authing      Removed                                                                                                                                                           0.2s
root@debian:~/projects/authing-server# docker compose up -d
[+] Running 1/1
 ⠿ Network authing-server_authing  Created                                                                                                                                                               0.1s
[+] Running 5/5ing-server_default  Creating                                                                                                                                                              0.1s
 ⠿ Network authing-server_authing      Created                                                                                                                                                           0.1se ⠿ Network authing-server_default      Created                                                                                                                                                           0.1s
 ⠿ Container authing-server-redis-1    Started                                                                                                                                                           2.5s
 ⠿ Container authing-server-db-1       Started                                                                                                                                                           2.3s
 ⠿ Container authing-server-pgadmin-1  Started                                                                                                                                                           2.4s
root@debian:~/projects/authing-server# docker compose up ps
no such service: ps
root@debian:~/projects/authing-server# docker compose ps
NAME                       IMAGE               COMMAND                  SERVICE             CREATED             STATUS                        PORTS
authing-server-db-1        postgres:9.6.24     "docker-entrypoint.s…"   db                  11 seconds ago      Up 8 seconds                  0.0.0.0:30302->5432/tcp, :::30302->5432/tcp
authing-server-pgadmin-1   dpage/pgadmin4      "/entrypoint.sh"         pgadmin             10 seconds ago      Restarting (1) 1 second ago   
authing-server-redis-1     redis:6.2.6         "docker-entrypoint.s…"   redis               11 seconds ago      Up 8 seconds                  0.0.0.0:30301->6379/tcp, :::30301->6379/tcp
root@debian:~/projects/authing-server# docker compose logs pgadmin
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
authing-server-pgadmin-1  | 'your_email' does not appear to be a valid email address. Please reset the PGADMIN_DEFAULT_EMAIL environment variable and try again.
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# docker compose up pgadmin
WARN[0000] Found orphan containers ([authing-server-pgadmin4-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up. 
[+] Running 2/2
 ⠿ Container authing-server-db-1       Running                                                                                                                                                           0.0s
 ⠿ Container authing-server-pgadmin-1  Recreated                                                                                                                                                         0.5s
Attaching to authing-server-pgadmin-1
authing-server-pgadmin-1  | NOTE: Configuring authentication for SERVER mode.
authing-server-pgadmin-1  | 
authing-server-pgadmin-1  | [2023-05-25 12:52:43 +0000] [1] [INFO] Starting gunicorn 20.1.0
authing-server-pgadmin-1  | [2023-05-25 12:52:43 +0000] [1] [INFO] Listening at: http://[::]:80 (1)
authing-server-pgadmin-1  | [2023-05-25 12:52:43 +0000] [1] [INFO] Using worker: gthread
authing-server-pgadmin-1  | [2023-05-25 12:52:43 +0000] [88] [INFO] Booting worker with pid: 88
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET / HTTP/1.1" 302 236 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET /login?next=%2F HTTP/1.1" 200 1593 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET /static/js/generated/pgadmin.style.css?ver=60300 HTTP/1.1" 200 44894 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET /static/js/generated/pgadmin.css?ver=60300 HTTP/1.1" 200 57221 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET /static/js/generated/style.css?ver=60300 HTTP/1.1" 200 101262 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:18 +0000] "GET /static/img/login.svg?ver=60300 HTTP/1.1" 200 0 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:19 +0000] "GET /static/js/generated/fonts/Roboto-Regular..ttf HTTP/1.1" 200 0 "http://192.168.0.143:30303/static/js/generated/pgadmin.style.css?ver=60300" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:19 +0000] "GET /favicon.ico?ver=60300 HTTP/1.1" 302 264 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:19 +0000] "GET /static/favicon.ico?ver=60300 HTTP/1.1" 200 0 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | An email address cannot have a period immediately after the @-sign.
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:32 +0000] "POST /authenticate/login HTTP/1.1" 302 208 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:32 +0000] "GET / HTTP/1.1" 302 236 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:53:32 +0000] "GET /login?next=%2F HTTP/1.1" 200 1857 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
^CGracefully stopping... (press Ctrl+C again to force)
Aborting on container exit...
[+] Running 0/1
 ⠦ Container authing-server-pgadmin-1  Stopping                                                                                                                                                          3.7s
[+] Running 1/1
 ⠿ Container authing-server-pgadmin-1  Stopped                                                                                                                                                           4.2s
canceled
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# docker compose up -d pgadmin
WARN[0000] Found orphan containers ([authing-server-pgadmin4-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up. 
[+] Running 2/2
 ⠿ Container authing-server-db-1       Running                                                                                                                                                           0.0s
 ⠿ Container authing-server-pgadmin-1  Started                                                                                                                                                           1.2s
root@debian:~/projects/authing-server# docker compose logs pgadmin
root@debian:~/projects/authing-server# docker compose logs pgadmin -f
authing-server-pgadmin-1  | [2023-05-25 12:54:44 +0000] [1] [INFO] Starting gunicorn 20.1.0
authing-server-pgadmin-1  | [2023-05-25 12:54:44 +0000] [1] [INFO] Listening at: http://[::]:80 (1)
authing-server-pgadmin-1  | [2023-05-25 12:54:44 +0000] [1] [INFO] Using worker: gthread
authing-server-pgadmin-1  | [2023-05-25 12:54:44 +0000] [85] [INFO] Booting worker with pid: 85
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:54:54 +0000] "GET /login?next=%2F HTTP/1.1" 200 1854 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:54:54 +0000] "GET /favicon.ico?ver=60300 HTTP/1.1" 302 264 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:55:05 +0000] "POST /authenticate/login HTTP/1.1" 302 208 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:55:05 +0000] "GET / HTTP/1.1" 302 236 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
authing-server-pgadmin-1  | ::ffff:192.168.0.161 - - [25/May/2023:12:55:05 +0000] "GET /login?next=%2F HTTP/1.1" 200 1861 "http://192.168.0.143:30303/login?next=%2F" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58"
^Ccanceled
root@debian:~/projects/authing-server# cat docker-compose.yml 
version: '3.7'
services:
  redis:
    image: redis:6.2.6
    ports:
      - 30301:6379
    networks:
      - authing
    restart: always

  db:
    image: postgres:9.6.24
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    networks:
      - authing
    restart: always
    ports:
      - 30302:5432

  pgadmin:
    image: dpage/pgadmin4
    depends_on:
      - db
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: 'sxy996@qq.com'
      PGADMIN_DEFAULT_PASSWORD: 'postgres'
    ports:
      - "30303:80"
    volumes:
      - pgadmin-data:/var/lib/pgadmin


networks:
  authing:
volumes:
  db-data:
  pgadmin-data:
root@debian:~/projects/authing-server# nano docker-compose.yml 
root@debian:~/projects/authing-server# nano docker-compose.yml 

                                                                                                nano 主帮助文档                                                                                               
^H     (Bsp)     删除游标左侧的字符
^D     (Del)     删除游标之下的字符
M-Bsp  (Sh-^Del) 从游标向单词起始位置向后删除
^Del             从游标向下一个单词起始位置向前删除
M-T              从游标位置剪切至文件结尾

M-J              对齐整个文件
M-D              计算字数、行数与字符数
M-V              插入下一按键原型

^L               重新显示当前画面
^Z               挂起编辑器（如果启用了挂起功能）

M-}    (Tab)     缩进当前行（或者标记的行）
M-{    (Sh-Tab)  取消缩进当前行（或者标记的行）

M-3              注释/反注释当前行（或者标记的行）
^]               尝试补全当前单词

M-:              开始/停止录制宏
M-;              运行最近录制的宏

M-Ins            在当前行放置或移除锚点
M-PgUp           向上跳转至最近的锚点
M-PgDn           向下跳转至最近的锚点

M-Del            去除当前行（或者标记的行）

F12              尝试运行拼写检查
M-B              尝试运行代码语法检查
M-F              调用其它程序来格式化/修改/操作缓冲区

^L               将游标所在的行居中

^S               不提示而保存文件

M-X              辅助模式 启用/关闭
M-C              持续显示游标位置 启用/关闭
M-S              为过长行进行软折行 启用/关闭
M-N              行编号 启用/关闭
M-P              显示空格 启用/关闭
M-Y              语法色彩高亮 启用/关闭

M-H              智能HOME键 启用/关闭
M-I              自动缩进 启用/关闭
M-K              剪切至行尾 启用/关闭
M-L              为过长行强制换行 启用/关闭
M-O              已输入制表符至空白的转换 启用/关闭

M-M              鼠标支持 启用/关闭
M-Z              挂起 启用/关闭
