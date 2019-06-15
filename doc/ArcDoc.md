---
typora-copy-images-to: ./img
---

# 接口文档

## 整体架构

### 架构图

![](img/HTML.png)

### 页面结构

![](img/Screenshot_20190614_152701.png)

- 红框：动态加载(填入HTML)
- 绿框：静态加载(预编写HTML，填写内容)

### 架构与接口说明

#### 前后端分离

结构遵循前后端分离逻辑，HTML和JSP分开，JSP仅提供数据接口作用，不具备任何实体化的DOM结构。

#### RESTful接口

- 使用URI指代资源
- 使用HTTP方法指代动作
  - GET：读取
  - POST：新建
  - PUT：更新
  - DELETE：删除
- 使用查询字符串指代过滤条件

#### 类封装

每个页面的接口封装到一个类中，页面加载时需要执行的工作放在类的constructor中，并在页面加载完成后初始化这个类。

###　命名规范

#### HTML/CSS

全部小写，单词之间使用-连接

例：col-mid-8

#### JavaScript变量

驼峰命名，例：articleObj



## 前端接口定义

### DOM(DOM.js)

#### 主页(class Mainpage)

##### loadMore()

获取更多日志

##### goShare(s)

s：enum{"qzone","sina","qq"}

分享方法

#### 日志列表



#### 日志



#### 相册列表



#### 相册





### 获取



### 上传



## 后端接口定义

### 提供



### 接收

## 数据库定义



## 附录：URI集合

 