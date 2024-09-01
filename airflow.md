---
title: "airflow 开源工作流管理平台使用教程"
heading:  
date: 2023-03-21T02:21:54.378Z
categories: ["code"]
tags: 
description:  
---

## 前言

Apache [Airflow](https://airflow.apache.org/docs/apache-airflow/stable/index.html) 是用于数据工程管道的开源工作流管理平台。它于2014年10月在Airbnb启动，是管理公司日益复杂的工作流程的解决方案。通过创建Airflow，Airbnb可以通过编程方式编写和计划其工作流程，并通过内置的Airflow用户界面对其进行监控。

## 安装 airflow

**本次安装环境：**
参考 [prerequisites](https://airflow.apache.org/docs/apache-airflow/stable/installation/prerequisites.html):
- Python: 3.10
- PostgreSQL: 15
- Kubernetes: 1.24.0
- 机器内存：32G


**使用 docker 安装：**
基于 [docker-compose](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html) 安装
```bash
# 下载 docker-compose.yaml
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.5.2/docker-compose.yaml'
# 安装
mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env
docker compose up airflow-init
# 看到 User "airflow" created with role "Admin" 就是初始化成功
# 清理环境
# ocker compose down --volumes --remove-orphansdocker-compose.yaml
# 启动
# vi docker-compose.yaml 修改 airflow-webserver 的端口
docker compose up -d
```

[airflow-web](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html#accessing-the-web-interface) 默认端口 8080  账密为 airflow

## 使用

如何定义 task

如何定义 drag

参数如何传递

如何启动 drag



## 参考文档
- [Airflow 和 Azkaban的选型](https://blog.csdn.net/kyle0349/article/details/108947115)
- [为什么不是 Airflow](https://listen-lavender.gitbook.io/prefect-docs/gettingstarted/whynotairflow)