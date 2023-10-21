#!/bin/bash

# 列出 USB 存储设备信息
function list_usb(){
  usb_devices=$(lsblk -o NAME,SIZE,TRAN,VENDOR | grep -i "usb" | awk '{print $1,$2,$4}')
  if [ -z "$usb_devices" ]; then
    echo "无 USB 存储设备"
    exit 1
  fi
  echo "USB 存储设备列表："
  echo "序号 设备名称 大小 制造商"
  echo "-----------------------------"
  i=1
  while read -r line; do
    echo "$i $line"
    i=$((i+1))
  done <<< "$usb_devices"

  # 2. 选择 USB 设备
  echo "请选择要操作的 USB 设备序号："
  read selection
  selected_device=$(echo "$usb_devices" | sed -n "${selection}p" | awk '{print $1}')
  echo -e "选择的 USB 设备为：$selected_device\n" 
}


# 下载最新版本的 Ventoy 并制作 u 盘启动
function ventoy2usb(){
  API_ENDPOINT="https://gitee.com/api/v5/repos/longpanda/Ventoy/releases/latest"
  # https://gitee.com/longpanda/Ventoy/releases/download/v1.0.96/ventoy-1.0.96-linux.tar.gz
  ventoy_version=$(curl -s "$API_ENDPOINT" | grep -oP 'tag_name":"[\d\w\.]+' | cut -d 'v' -f 2)
  ventoy_file="ventoy-${ventoy_version}-linux.tar.gz"
  ventoy_download_url="https://gitee.com/longpanda/Ventoy/releases/download/v${ventoy_version}/$ventoy_file"
  if [ ! -d "ventoy-${ventoy_version}" ]; then
    if [ ! -f "$ventoy_file" ]; then
      echo "download $ventoy_file"
      wget $ventoy_download_url
    fi
    tar -xzf $ventoy_file
    cd ventoy-${ventoy_version}
    echo "Ventoy2Disk.sh -i /dev/$usb_devices"
    sudo /bin/bash Ventoy2Disk.sh -i "/dev/${usb_devices}"
    cd ..
  fi  
}

# 找出 u 盘最大分区并挂载 
function mount_usb(){
  max_partition=""
  max_size=0 
  for partition in /dev/${selected_device}*; do
    partition_size=$(lsblk -bno SIZE "$partition")
    if [ $partition_size -gt $max_size ]; then
      max_size=$partition_size
      max_partition=$partition
    fi
  done
  if [ -z "$max_partition" ]; then
    echo "无法找到最大分区"
    exit 1
  fi
  echo "最大分区为：$max_partition"
  # 3. 挂载最大分区到 /mnt/myusb
  
  mkdir -p $mount_point
  # 检查 /dev/sdb1 是否被挂载 
  if ! grep -qs "$max_partition" /proc/mounts ; then
    echo -e "mount $max_partition $mount_point \n"
    sudo mount "$max_partition" "$mount_point" 
  fi 
}


# 下载 ventoy_wimboot.img 到 u 盘
function download_bootimg(){
  if [ ! -f "$mount_point/ventoy/ventoy_wimboot.img" ]; then
    echo "download ventoy_wimboot.img "
    if [! -f "ventoy_wimboot.img" ]; then
      wget -O ventoy_wimboot.img https://pineapple.edgeless.top/api/v2/info/ventoy_plugin_addr
    fi 
    echo "cp ventoy_wimboot.img $mount_point/ventoy/ \n"
    mkdir -p $mount_point/ventoy
    mv ventoy_wimboot.img $mount_point/ventoy/
  fi
}

# 下载 iso 并处理文件
function download_iso(){
  url="https://pineapple.edgeless.top/api/v2/info/iso_addr"
  response=$(curl -s -I $url)
  location=$(echo "$response" | awk '/^location:/ { print $2 }' | tr -d '\r')
  # https://pineapple.edgeless.top/disk/Socket/Edgeless_Beta_4.1.0.iso
  file=$(echo $location | awk -F'/' '{print $NF}' )
  edgeless_version=$(echo $file | awk -F'_' '{print $NF}' | awk -F '.iso' '{print $1}')
  
  # 5. 下载 Edgeless ISO 文件到 u 盘里
  if [ ! -d "$mount_point/Edgeless" ]; then
    echo "download edgeless.iso"
    if [ ! -f "$file" ] ;then
      wget $location
    fi
    mkdir -p $iso_path
    mount -o loop $file $iso_path
    echo "cp $iso_path/sources/boot.wim $mount_point/Edgeless_$edgeless_version.wim"
    cp $iso_path/sources/boot.wim "$mount_point/Edgeless_$edgeless_version.wim"
    cp -r $iso_path/Edgeless "${mount_point}"
  fi
}

# 清理临时文件和挂载点
function cliear_tmp(){
  umount $iso_path
  #rm -rf $iso_path
  rm -f ventoy-$ventoy_version
  #rm $ventoy_file
  #rm $ventoy_file
  umount $mount_point
  # umount /mnt/myusb
}

mount_point="/mnt/myusb"
iso_path=/tmp/edgeless_iso

list_usb
ventoy2usb
mount_usb
download_bootimg
download_iso



