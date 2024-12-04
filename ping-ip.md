---
title:  Linux命令之多线程ping一个ip段
heading: Linux命令一次性批量多线程ping一个ip段所有ip
date: 2021-01-12T08:29:28.741Z
categories: ["code"]
tags: 
description: linux 一次性批量多线程ping一个ip段所有ip,ping-ip
---



vi ip_ping.sh
```bash
#!/bin/bash

# 获取所有网络接口的 IP 地址
get_network_interfaces() {
    # 在 Mac 上使用 ifconfig 获取网络接口信息
    ifconfig | grep -E "inet " | grep -v "127.0.0.1" | awk '{print $2 " "}'
}

# 端口扫描
scan_port() {
    echo "功能选择："
    echo "0: 仅ping扫描"
    echo "1: 扫描SSH端口(22)"
    echo "2: 扫描RDP端口(3389)"
    read -p "或直接输入端口号：: " port_choice
    local scan_port
		    
    # 端口选择逻辑
    case "$port_choice" in
        0)  # 仅ping
			scan_network "$network" "0"
            return
            ;;
        1)  # SSH端口
            scan_port="22"
            ;;
        2)  # RDP端口
            scan_port="3389"
            ;;
        [0-9]*)  # 直接输入的端口号
            scan_port="$port_choice"
            ;;
        *)  # 无效输入
            echo "无效的选择！使用方法："
            echo "0: 仅ping扫描"
            echo "1: 扫描SSH端口(22)"
            echo "3: 扫描RDP端口(3389)"
            echo "或直接输入端口号"
            return 1
            ;;
    esac
    scan_network "$network" "$scan_port"
}

# 主扫描函数
main_scan() {
    # 获取网络接口信息
    local interfaces=$(get_network_interfaces)
    # 检查是否有多个网络接口
    local interface_count=$(echo "$interfaces" | wc -l)
    
    if [ "$interface_count" -eq 0 ]; then
        echo "未找到可用的网络接口"
        exit 1
    fi
    # 多个接口时，让用户选择
    echo "当前电脑 ip："
    echo "$interfaces" | awk '{print NR ". " $1 ""}'
    read -p "请输入序号（或直接输入网段）: " choice
    if [[ "$choice" =~ ^[0-9]+$ ]]; then
    # 选择对应的 IP 
    	local selected_ip=$(echo "$interfaces" | sed -n "${choice}p" | awk '{print $1}')
		IFS=. read -r i1 i2 i3 i4 <<< "$selected_ip"
		local network="$i1.$i2.$i3"
    else
    	local network="$choice"
    fi
    echo "选择的 ip：$network"
    scan_port
}



# 网络扫描函数
scan_network() {
    local ip="$1"
    local port="$2"
    #echo "prot:$port"
    echo "开始扫描网段: $ip.0/24: $port"
	date
	for ((i=2;i<=254;i++))
		do
		{
	        if [ "$port" -gt 0 ]; then
			    ping $ip.$i -c 2 2>&1 | grep -q "ttl=" && nc -z -v -n -4 -w1 "$ip.$i" $port 2>&1 | grep -q "succeeded" && echo "$ip.$i:$port 端口开放"
			else
				ping $ip.$i -c 2 2>&1 | grep -q "ttl=" && echo "$ip.$i yes"	
			fi
	        #curl $ip.$i:$port -m 3 2>&1 | grep -q "SSH" && echo "$ip.$i:$port yes"
	        
		}&    
	done    
	wait 
	date
}

# 执行主扫描
main_scan

```

可以 ping ip 段，也可以测试端口是否可用，大约 3~6 秒即可全部测试完成。

