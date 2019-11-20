---
title:  词云系统设计
date: 2019-06-17T05:52:14.535Z
tags: 
 - 分词
 - InfluxDB
---

添加[influxdb源](https://docs.influxdata.com/influxdb/v1.7/introduction/installation/),然后安装  
```
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

yum -y install influxdb
systemctl start influxdb

pip install numpy pillow wordcloud jieba influxdb
```

测试  
```python
import jieba.analyse
text = "前一阵子有一篇热文，小学生用大数据分析苏轼，说的就是清华附小的学生用词频分析方法对苏轼的作品进行了分析"
tags = jieba.analyse.extract_tags(text,withWeight=True)
words = {}
for k,v in tags:
	words[k] = int(v*1000)

from influxdb import InfluxDBClient
data = {'measurement':'hotwords','fields':words}
client = InfluxDBClient('192.168.31.212',database='testDB')

result = client.query('select * from hotwords limit 1;')

p = list(result.get_points())[0]
print(p)
del p['time']

from wordcloud import WordCloud
font_path = 'PingFang.ttf'
wc = WordCloud(background_color="white",# 设置背景颜色
max_words=2000, # 词云显示的最大词数  
font_path=font_path, # 兼容中文字体，不然中文会显示乱码
)

#通过词频生成词云，p类似 [{'str':float},{'str':float}
wc.generate_from_frequencies(p)
wc.to_file('hotword.png')
```


参考  
- [WordCloud](https://amueller.github.io/word_cloud/generated/wordcloud.WordCloud.html)
- [jieba](https://github.com/fxsjy/jieba)
- [influxdb-handbook](https://xtutu.gitbooks.io/influxdb-handbook/content/an_zhuang_shi_yong.html)
- [influxdb](https://docs.influxdata.com/influxdb/v1.7/introduction/installation/)
- [influxdb-python](https://influxdb-python.readthedocs.io/en/latest/)