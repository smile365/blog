---
title: vanas2
heading:  
date: 2023-04-06T00:51:11.503Z
categories: ["code"]
draft: true
tags: 
description:  
---


```bash
docker pull linkall.tencentcloudcr.com/vanus/all-in-one:latest

docker run -d --rm \
    --network vanus-quickstart \
    --pull always \
    -p 8080:8080 \
    -p 8081:8081 \
    --name vanus-all-in-one linkall.tencentcloudcr.com/vanus/all-in-one:latest

curl -O https://dl.vanus.ai/vsctl/latest/linux-amd64/vsctl
chmod ug+x vsctl
sudo mv vsctl /usr/local/bin

# Verify the installation
vsctl version
```

报错了，参考 [failed to query namespace id: rpc error vanus.core.proxy.ControllerProxy](https://github.com/vanus-labs/vanus/issues/591)





参考文档：
- [Quick Start](https://docs.vanus.ai/vanus-open-source/quick-start)