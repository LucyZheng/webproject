<%--
  Created by IntelliJ IDEA.
  User: williamzheng
  Date: 19-6-16
  Time: 上午10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String headTitle = "游呢娃子的博客";
    String headSignature = "这个人很懒，什么都没有说。";
    String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>日志详情</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_aside.css">
    <link rel="stylesheet" type="text/css" href="css/articlelist.css">
    <meta name="description" content="666的博客,心随你动!" />
    <script src="js/DOM.js"></script>
</head>
<body>
<div id="wrapper">
    <header>
        <div id="header-text">
            <h1><%=headTitle%></h1>
            <div id="signature"><%=headSignature%></div>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="/">主页</a></li>
            <li class="first-page"><a href="#">日志</a></li>
            <li><a href="#">相册</a></li>
            <li><a href="#">留言板</a></li>
            <li><a href="#">我的访客</a></li>
            <button type="button"></button>
        </ul>

    </nav>
    <div id="container">
        <div class="flytext">
            <img src="img/widespread.png" />
            <marquee behavior="scroll" direction="left">
                <%=flybyText%>
            </marquee>
        </div>
        <div class="content">
            <section>
                <!-- 日志列表 -->
                <div class="title">
                    <span>日志列表</span>
                </div>
                <button type="button" id="write-article">写日志</button>
                <ul class="article-list">
                    <li class="single-article">
                        <div class="article-title">小朋友要有小朋友的亚子</div>
                        <div class="article-date">2019-6-16</div>
                        <div class="article-stat">
                            (<span class="comment-count">2</span>/<span class="read-count">10</span>)
                        </div>
                        <div class="article-operation">
                            <span class="article-delete">删除</span>
                            <span class="article-ontop">置顶</span>
                        </div>
                    </li>
                    <li class="single-article">
                        <div class="article-title">好好读术</div>
                        <div class="article-date">2019-6-19</div>
                        <div class="article-stat">
                            (<span class="comment-count">3</span>/<span class="read-count">11</span>)
                        </div>
                        <div class="article-operation">
                            <span class="article-delete">删除</span>
                            <span class="article-ontop">置顶</span>
                        </div>
                    </li>
                    <li class="single-article">
                        <div class="article-title">补药多管闲事</div>
                        <div class="article-date">2019-6-20</div>
                        <div class="article-stat">
                            (<span class="comment-count">4</span>/<span class="read-count">12</span>)
                        </div>
                        <div class="article-operation">
                            <span class="article-delete">删除</span>
                            <span class="article-ontop">置顶</span>
                        </div>
                    </li>
                </ul>
                <!-- 换页 -->
                <div class="pagi">
                    <ul class="pagination">
                        <li><a href="#">«</a></li>
                        <li><a href="#"class="active">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                </div>

            </section>
            <!-- 右边栏 -->
            <aside>
                <div class="label-cloud">
                    <div class="title">
                        <span>标签云</span>
                    </div>
                    <div class="content">
                        <div class="labels">
                            <span>#打码好难</span>
                        </div>
                        <div class="labels">
                            <span>#不想打了</span>
                        </div>
                        <div class="labels">
                            <span>#什么时候才能做完鸭</span>
                        </div>

                    </div>
                </div>
            </aside>
        </div>
    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>

</body>
</html>

