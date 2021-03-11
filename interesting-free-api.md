---
title:  有哪些好玩的免费的API接口?
heading: 
date: 2021-03-11T03:42:43.170Z
categories: ["code"]
tags: 
description: interesting-free-api,golang自动发邮箱。
---

你缺的不是接口，而是一个好玩的 idea 。

来，出个考题。

假设只用这两个接口
- 发送邮箱接口
- 文本识别接口

能做出什么好玩的东西？

女朋友是文青，喜欢唯美的句子和壁纸。

刚好有一台闲置的 Windows ，锁屏后会自动播放锁屏画报。类似于这样：
![](https://gitee.com/smile365/blogimg/raw/master/sxy91/1615436033621.png)

能不能写个程序，每天截一张图用邮箱发给她呢？

来用 golang 语言,几行代码搞定截屏
```golang
func Capture2base64() string{
    rect := screenshot.GetDisplayBounds(0)
    if *scale != 1 {
        rect.Max = rect.Max.Mul(*scale)
    }

    var img image.Image
    img, err := screenshot.CaptureRect(rect)
    if err != nil {
        fmt.Printf("failed to capture display: %v\n", err)
        return ""
    }
    if *scale != 1 {
        img = resize.Resize(uint(img.Bounds().Dx()/(*scale)), 0, img, resize.Lanczos3)
    }

    buf := new(bytes.Buffer)
    err = jpeg.Encode(buf, img, nil)
    return base64.StdEncoding.EncodeToString(buf.Bytes())

}
```

对于一个追求完美的人，只发图片没有图上的文案怎么能行。

用文字识别 api 把唯美的句子提取出来，调用 api 这种事，Python 擅长：
```python
OCR_URL = "https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic"

def request(url, data):
    ''' 调用 OCR  api 
    '''
    req = Request(url, data.encode('utf-8'))
    has_error = False
    try:
        f = urlopen(req)
        result_str = f.read()
        if (IS_PY3):
            result_str = result_str.decode()
        return result_str
    except  URLError as err:
        print(err)

def getText(image64):
    '''从图片中识别出文字
    '''
    token = fetch_token()
    # 拼接通用文字识别高精度url
    image_url = OCR_URL + "?access_token=" + token

    text = ""
    # 调用文字识别服务
    result = request(image_url, urlencode({'image': image64}))
    # 解析返回结果
    result_json = json.loads(result)
    for words_result in result_json["words_result"]:
        text = text + words_result["words"]

    # 返回识别的文字
    return text
```

作为一个追求完美的人，把识别的出的文字和图片都存起来，避免把重复的图片发出去（其实怕被打）。

然后用各家都提供的邮件发送 api 发给了你的小可爱。
```golang
    m := gomail.NewMessage()
    m.SetHeader("From", "931918906@qq.com")
    m.SetHeader("To", *mailTo)
    m.SetHeader("Subject", filename)
    m.Embed(filename)
    m.SetBody("text/html", "<img src=\"cid:"+filename+"\" />")
    d := gomail.NewPlainDialer("smtp.qq.com", 587, "931918906@qq.com", "myPassword")

    if err := d.DialAndSend(m); err != nil {
        fmt.Printf("failed to send mail: %v\n", err)
    }

    if err := os.Remove(filename); err != nil {
        fmt.Printf("failed to remove %s: %v\n", filename, err)
    }
```


甚至，你还能每天发送一条不重复还创意慢慢的微博呢。比如这样：

![在这样一个电闪雷鸣的雨夜，希望你能睡的安稳，别被雷声打扰](https://gitee.com/smile365/blogimg/raw/master/sxy91/1615438325198.png)

![生活不可能像你想象得那么好,但也不会像你想象得那么糟](https://gitee.com/smile365/blogimg/raw/master/sxy91/1615438433368.png)

![世界以痛吻我,要我报之以歌](https://gitee.com/smile365/blogimg/raw/master/sxy91/1615438470300.png)


怎么样，好玩么？

