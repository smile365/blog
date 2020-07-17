---
title:  golang-and-python
heading: 用python语言调用Go语言函数
date: 2020-07-16T02:03:51.425Z
categories: ["code"]
tags: 
description: 
---

c语言几乎是所有高级语言的桥梁，通过c语言编译的动态链接库(.so文件)，其他高级语言即可调用c语言实现的功能，以便提高性能。

一般情况下，高级语言都实现了对动态链接库的调用支持。

比如用golang实现一个aes加密解密的功能，提供给python语言或者其他语言调用。

因为c的数据类型和golang不一致，因此在方法的参数和返回值上就需要做一层转换。否则golang实现的方法，C语言无法识别参数和返回值的类型。golang提供`C`模块处理这样的对应关系，也提供[cgo](https://golang.google.cn/cmd/cgo/)这样的工具转换golang代码。

假设现在有个需求是：用python语言调用Go语言函数。

实现这样的功能需要以下几个步骤：
- 1、使用纯golang实现所需要的函数或功能
- 2、导入`C`模块，使用c语言支持的参数类型和返回值类型，包装一层需要导出的函数。
- 3、在上述需要导出的函数前面增加导出的注释`//export yourfunc`

举例，用golang实现一个字符串加密解密的功能，然后编译成静态链接库，供python调用。

1、go语言实现的加密解密：`mycrypto.go`
```golang
package main

func AESEncrypt(src string) (encrypted string) {
    // your code
	return encrypted
}

func AESDecrypt(encrypted string) (decrypted string) {
    //your code 
	return decrypted
}

func main(){
    //test
}
```

2、导入`C`模块，并包装需要导出的函数，并增加`export encrypt`注释
```golang
package main

import "C"

func AESEncrypt(src string) (encrypted string) {
    // your code
	return encrypted
}

func AESDecrypt(encrypted string) (decrypted string) {
    //your code 
	return decrypted
}

//export encrypt
func encrypt(endata *C.char) *C.char {
	ens := C.GoString(endata)
	encrypted := AESEncrypt(ens)
	return C.CString(encodedStr)
}

//export decypt
func decypt(dedata *C.char) *C.char{
	des := C.GoString(dedata)
	decrypted := AESDecrypt(des)
	return C.CString(decrypted)	
}

func main(){
    //test
}
```

3、编译
```bash
go build -buildmode=c-shared -o mycrypto.so mycrypto.go
mkdir -p ./lib/linux-amd64
mv mycrypto.so mycrypto.so.h ./lib/linux-amd64
```

此时会生成mycrypto.so、mycrypto.h文件。

> 不同计算机平台编译的.so文件不能在其他平台使用，如linux编译的.so不能在windows下使用。


4、python调用动态链接库

为了把c语言的各种数据类型转换成python支持的类型，需要用到[ctypes](https://docs.python.org/3/library/ctypes.html#ctypes.c_wchar)

```python
import ctypes

lib = ctypes.cdll.LoadLibrary("./lib/linux-amd64/mycrypto.so")

lib.encrypt.restype = ctypes.c_char_p
lib.encrypt.argtype = ctypes.c_char_p

lib.decypt.restype = ctypes.c_char_p
lib.decypt.argtype = ctypes.c_char_p

def encrypt(txt):
	res = lib.encrypt(txt.encode("utf-8"))
	return res.decode()

def decypt(code):
	res = lib.decypt(code.encode("utf-8"))
	return res.decode()
```

到此大功告成，其他语言如R、Java、php等也可调用.so，大家可自行搜索实现。

注意点：
- 编写c语言支持的导出函数需要处理参数和返回值类型，必须是c支持的类型。
- 其他语言调用的时候，如string类型必须序列化（如：python的str.encode()），不可直接调用。


参考文献：
- [用Golang为Python编写模块](https://studygolang.com/articles/12002)
- [python-str-to-c-char](https://stackoverflow.com/questions/27127413/converting-python-string-object-to-c-char-using-ctypes)
- [Go and Python or R](https://opendatagroup.github.io/development/2019/06/13/go-ffi.html)
- [Calling Go Functions from Other Languages](https://medium.com/learning-the-go-programming-language/calling-go-functions-from-other-languages-4c7d8bcc69bf)
- [构建 C 的静态 + 动态链接库](https://ijayer.github.io/post/tech/code/golang/20180625-go_cmd_01_3_go-build_c-archive_c-shared_go-shared/)
- [使用 Python 调用 Go 程序](https://www.yuyang.io/post/python-go-dynamic/)
- 