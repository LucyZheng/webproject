<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: williamzheng
  Date: 19-6-15
  Time: 下午11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
  String headTitle = "游呢娃子的博客";
  String headSignature = "这个人很懒，什么都没有说。";
  String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
  //TODO: Acquire top articles from database

  //TODO: Acquire tag clouds from database

  //TODO: Acquire article list from database
  List<Map<String, String> > mainArticle = new ArrayList<>();
  for (int i = 0;i < 4;i ++) {
    Map<String, String> stringMap = new HashMap<>();
    stringMap.put("sign", "置顶");
    stringMap.put("title", "测试" + i);
    stringMap.put("img", "img/lengtu.jpg");
    stringMap.put("article", "这是第" + i + "篇文章");
    stringMap.put("time", "2019-06-01 23:00");
    stringMap.put("readCount", Integer.toString(i));
    stringMap.put("commentCount", Integer.toString(i));
    stringMap.put("fabulousCount", Integer.toString(i));
    mainArticle.add(stringMap);
  }
  pageContext.setAttribute("mainArticle", mainArticle);
  //TODO: Acquire comment from database

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <title>游呢娃子的博客</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_article.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_aside.css">
  <meta name="description" content="666的博客,心随你动!"/>
  <script src="js/DOM.js" type="text/javascript" charset="utf-8"></script>
  <script>
    var mainpage;
    window.onload = function(){mainpage = new MainPage();}
  </script>
</head>
<body>
<div id="wrapper">
  <!-- 头部 -->
  <header>
    <div id="header-text">
      <h1><%=headTitle%></h1>
      <div id="signature"><%=headSignature%></div>
    </div>
  </header>
  <!-- 导航条 -->
  <nav>
    <ul>
      <li class="first-page"><a href="#">主页</a></li>
      <li><a href="#">日志</a></li>
      <li><a href="#">相册</a></li>
      <li><a href="#">留言板</a></li>
      <li><a href="#">我的访客</a></li>
      <button type="button"></button>
    </ul>

  </nav>
  <div id="container">
    <!-- 浮动横幅 -->
    <div class="flytext">
      <img src="img/widespread.png" />
      <marquee behavior="scroll" direction="left">
        <%=flybyText%>
      </marquee>
    </div>
    <!-- 主内容区 -->
    <div class="content">
      <section>
        <!-- 置顶文章 -->
        <div class="top-article">
          <div class="top-title">
            <div class="text-title">置顶文章</div>
          </div>
          <div class="cont">

          </div>
        </div>
        <!-- 文章列表 -->
        <div class="article-list">
          <c:forEach items="${mainArticle}" var="i">
            <mainpage:ArticleListItem
              sign="${i.get(\"sign\")}"
              title="${i.get(\"title\")}"
              img="${i.get(\"img\")}"
              article="${i.get(\"article\")}"
              time="${i.get(\"time\")}"
              readCount="${i.get(\"readCount\")}"
              commentCount="${i.get(\"commentCount\")}"
              fabulousCount="${i.get(\"fabulousCount\")}"
            ></mainpage:ArticleListItem>
          </c:forEach>
        </div>
        <div class="more">
          <button type="button" id="moreclick" onclick="mainpage.loadMore()">点击加载更多...</button>
        </div>
      </section>
      <!-- 右边栏 -->
      <aside>
        <div class="shareclick">
          <img alt="qq" src="img/qq.png" />
          <img alt="qzone" src="img/qqzone.png" />
          <img alt="sina" src="img/weibo.png" />
        </div>
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
        <div class="lately-comment">
          <div class="title">
            <span>最新留言</span>
          </div>
          <div class="content">

          </div>
        </div>
        <div class="album">
          <div class="title">
            <span>相册</span>
          </div>
          <div class="content">
            <img src="img/lengtu2.jfif">
          </div>
        </div>
      </aside>
    </div>

  </div>
  <footer>&copy;2019-2030 啦啦啦</footer>
</div>



</body>
</html>

