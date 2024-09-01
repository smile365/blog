---
title: 23-12-01
heading:  
date: 2023-12-01T06:59:09.760Z
categories: ["code"]
description:   ConnectException: Cannot assign requested address (connect failed)
---

## java 请求出现 Cannot assign requested address (connect failed) 异常

使用 OkHttpClient 多线程发起 http get 请求，代码如下：
```java
OkHttpClient httpClient = new OkHttpClient.Builder()
                .connectTimeout(request.getConnectionTimeout(), TimeUnit.MILLISECONDS)
                .readTimeout(request.getReadTimeout(), TimeUnit.MILLISECONDS)
                .build();

        HttpResponse response = new HttpResponse();
        Response resp = null;
try {
	resp = httpClient.newCall(builder.build()).execute();;
	response.setCode(resp.code());
	ResponseBody body = resp.body();
	if (Objects.nonNull(body)) {
		response.setBody(body.bytes());
	}
	String contentType = resp.header(Constants.HEADER_CONTENT_TYPE);
	response.setContentType(contentType);
} catch (IOException ex) {
	response.setCode(500);
	response.setBody(ExceptionUtil.getRootCauseMessage(ex).getBytes(StandardCharsets.UTF_8));
}finally {
	if(resp !=null){
		resp.close();
	}
}
return response;
```

一段时间后就会出现异常：
```
ConnectException: Cannot assign requested address (connect failed)
```

## 原因

这是 Java [JDK 11.0.2 至 JDK 13-ea](https://bugs.openjdk.org/browse/JDK-8221395) 版本出现的 bug，HTTP 连接即使完成也会一直处于CLOSE_WAIT 状态，关闭 Java 进程才能释放端口，否则当端口占用完后，新的请求无法建立连接。官方在 JDK 13 发行版中进行了修复。问题参考 [Connections leaking with state CLOSE_WAIT with HttpClient](https://stackoverflow.com/questions/55271192/connections-leaking-with-state-close-wait-with-httpclient)。

> 各个厂商构建的 JDK 略有不同，如果使用 docker 中的 openJDK 可能不会包含最新的安全补丁更新。

## 排查
出现异常时查看 time_wait
```bash
# apt install -y net-tools
netstat -a|grep time_wait

```

查看可用的端口范围
```bash
sysctl -a |grep ip_local_port_range
# net.ipv4.ip_local_port_range = 32768    60999
# 大约 2w8

```




## 解决办法

**升级 jdk**
推荐升级到 JDK17（2021 年发布），Spring Boot 3 目前最小依赖 Java17。JDK 17 也是目前最新的长期支持版本。


**使用连接池**
```java
import okhttp3.ConnectionPool;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class HttpClientExample {
    public static void main(String[] args) throws Exception {
        // 创建 OkHttpClient 并设置连接池
        ConnectionPool connectionPool = new ConnectionPool(5, 5, TimeUnit.MINUTES);
        OkHttpClient client = new OkHttpClient.Builder()
                .connectionPool(connectionPool)
                .build();

        // 创建请求
        Request request = new Request.Builder()
                .url("http://example.com")
                .build();

        // 发送请求并获取响应
        Response response = client.newCall(request).execute();

        // 处理响应
        System.out.println(response.body().string());

        // 关闭响应和连接
        response.close();
        client.connectionPool().evictAll();
    }
}

```



**修改系统参数**

```bash
sysctl -w net.ipv4.ip_local_port_range="1024 65535"
```

k8s 中如何修改，参考 [setting-sysctls-for-a-pod](https://kubernetes.io/docs/tasks/administer-cluster/sysctl-cluster/#setting-sysctls-for-a-pod)
```yaml
spec:
  securityContext:
    sysctls:
    - name: net.ipv4.ip_local_port_range
      value: "1024    65535"  
```






## 话外

linux 中其他比较重要的参数：
cat /etc/sysctl.conf 
```yaml
net.ipv4.tcp_timestamps = 1     #打开 TCP 时间戳的支持
net.ipv4.tcp_tw_reuse = 1       #支持将处于 TIME_WAIT 状态的 socket 用于新的 TCP 连接
net.ipv4.tcp_tw_recycle = 1     #启用处于 TIME-WAIT 状态的 socket 的快速回收
net.ipv4.tcp_syncookies=1       #表示开启 SYN Cookies。当出现 SYN 等待队列溢出时，启用 cookie 来处理，可防范少量的 SYN 攻击。默认为0
net.ipv4.tcp_fin_timeout = 10              #端口释放后的等待时间
net.ipv4.tcp_keepalive_time = 1200           #TCP 发送 KeepAlive 消息的频度。缺省是2小时，改为20分钟
net.ipv4.ip_local_port_range = 1024 65000    #对外连接的端口范围。默认是32768至61000，改为1024至65000
net.ipv4.tcp_max_tw_buckets = 10240          #TIME_WAIT 状态 Socket 的数量限制，如果超过了这个数量，新来的 TIME_WAIT 套接字会被直接释放，默认值是180000。适当地降低该参数可以减小处于 TIME_WAIT 状态 Socket 的数量
```

