---
title:  auto.js实现微信双向删除好友功能
heading: 
date: 2020-04-30T07:09:17.772Z
categories: ["code"]
tags: ["微信双向删除好友","微信检测僵尸粉源码"]
description: 批量删除微信好友,清粉源码,基于autojs开发的免root自动化脚本，微信批量删除朋友圈脚本,使用auto.js编写的免root运行。autojs微信群自动添加好友。
---


已经把autojs的代码脚本封装成了app，具体可以查看[这个链接](https://www.sxy91.com/posts/wechat-delete-user/)。


微信里有2000多个好友，我想知道谁拉黑了我，谁删除了我。目前有两种方式：

**检测是否是微信好友的方法:**
方法一：  
- 1. 给Ta发送一条消息。
- 2. 没有提示，则正常，还是好友。
- 3. 提示被拒收，那就是你拉黑了。
- 4. 提示需要加好友，那就是你被删除了。

方法二： 
- 1. 点击+，转账，输入0.01，点击转账。
- 2. 弹出“确认支付”或者“支付密码”等字样，证明还是好友。
- 3. 弹出“确认好友关系是否正常”，则被拉黑了。
- 4. 弹出“你不是收款方好友”，那就是你被删除了。

注意：使用微信的群发功能，即使被对方删除或者拉黑也不会有提示。


方法二的优点是对方无感知。

如果人数太多（像我这样2000人好友），那一个一个手动操作也太累了。刚好Android提供无障碍服务(AccessibilityService)，可以通过代码来模拟人的操作。借助autojs即可完成上述功能。


部分代码如下:
```javascript
/**
 * 微x工具箱
 * @author songxueyan (sxy9103@gmail.com)
 * @date    2020-04-30 14:12:36
 * @site https://sxy91.com
 */
var users = {};

function etit_msg(sbtn){
    // 编辑消息并发送
    sbtn.parent().parent().click();
    var et = className("EditText").findOne(2000);
    if(!et){
        desc("切换到键盘").findOne(1000).click();
        et = className("EditText").findOne(2000);
    }
    if(send_message){
        et.setText(send_message);
        sleep(200);
        text("发送").findOne(2000).click();
        sleep(200);
    } 
}

let mode = 1; // 1=mark_user,2=del_user
function send_fail(){
    // 找到重发按钮，并标记用户
    var btn = desc("重发").findOne(2000);
    if(!btn) return;
    desc("聊天信息").findOne(2000).click(); //右上角...按钮 
    desc("添加成员").findOne(2000).parent().parent().child(0).click(); //通过添加成员找到个人头像并点击
    if(mode == 1){
         mark_user(); //标记用户并回到
    }else{
        del_user(); // 直接删除用户
    }
    btn_back(); //在聊天界输入界面点返回，回到可看到“通讯录”按钮
}

function send_msg(s){
    //在查看联系人微信号的页面，点击发消息去发送消息
    var notuser = text("功能介绍").findOne(1000);
    if(notuser){
        log("非个人号👇");
        desc("返回").findOne().parent().click();
        return
    }
    var sbtn = text("发消息").findOne(2000);
    if(!sbtn){
        log("对方已经删除账号👇");
        mark_user();
        return
    }
    etit_msg(sbtn);
    send_fail(); //找到发送失败，并标记用户
    btn_back();//在聊天界输入界面点返回
    var btn = text("通讯录").findOne(2000); 
    btn.parent().parent().click(); //发送完回到通讯录    
}

var usersCache = {}; //记录发送状态
usersCache.get = function(name,defalt){
    if(usersCache[name]) return usersCache[name];
    return defalt;
}

usersCache.put = function(name,value){
    usersCache[name] = value;
    return value;
}

var send_message = "请关注微信「下课了」公众号，获取最新版";

function get_weid(){
    // 获取备注、昵称、微信号、地区
    var uinfo = {};
    eid = textStartsWith("微信号").findOne(2000);
    wid = name_id_address(eid);
    uinfo.id = wid;
    if(usersCache.get(wid,0)==1){
        log("已经发送过了👇");
        desc("返回").findOne().parent().click();
        return uinfo;
    }
    send_msg(send_message);
    usersCache.put(wid,1);
    var stime = Math.ceil(Math.random()*1000+500); //500~1500
    sleep(stime);
    return uinfo;
}

var from_user = null;//"叶青"; //从谁开始,设置为null关闭
//var find_flag = false; //是否找到
var lastname;
/**
 * 找到所有联系人
 * 使用备注，可能有重名，页面刷新后,lvc的元素后就没有了。
 */
function finduser(){
    // 先自行到联系人界面
    var lv = id(lvid).findOne(3000);//id会变，//联系人的listview
    var lvc = lv.children();
    var lvcsize = lvc.size();
    log("finduser size:"+lvcsize);
    for(var i = 0;i<lvcsize;i++){
        e = lvc.get(i);
        ename = e.findOne(className("android.view.View"));
        if(!ename) continue;
        name = ename.text(); //备注名或昵称
        if(from_user && !find_flag){ //是否要跳到特定联系人。断点继续
            if(from_user==name){
                find_flag = true;
            }else{
                log(i+"=="+name);
                continue;
            }
        }
        //log("i="+i+",name="+name);
        ename.parent().children()[0].click();
        sleep(700);
        uinfo = get_weid(); //点击联系人--发送信息--返回--点击联系人
        if(!uinfo.name){
            uinfo["name"] = name;
        }else{
            uinfo["memo"] = name;
        }
        users[uinfo["id"]] = uinfo;
        log(uinfo);
        lv = id(lvid).findOne(2000);//id会变，//联系人的listview
        lvc = lv.children();
    }
    return [lvc.get(0),lvc.get(lvc.size()-2)];//可能最后一个联系人被隐藏
}

var friends = {}
var lvid ;
var not_bottom = true;

function get_all_users(){
    btn = text("通讯录").findOne(2000);
    btn.parent().parent().click();
    sleep(500);
    lv = className("ListView").find(3000); //联系人的listview
    lvid = lv[1].id();
    log("ListView id= "+lvid);
    var bottom_num = 0;
    while(bottom_num<2){
        u = finduser();
        moveto(u[0],u[1]);
        var ele_bottom = textEndsWith("位联系人").findOne(1000);
        if(ele_bottom){
            bottom_num++;
            log(ele_bottom.text());
        }
    }
    
}

get_all_users();
```


