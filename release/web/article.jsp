<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" tagdir="/WEB-INF/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: williamzheng
  Date: 19-6-17
  Time: 下午1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%
    String userID = (String) session.getAttribute("userID");
    String bloggerID = "";
    String headTitle = "游呢娃子的博客";
    String headSignature = "这个人很懒，什么都没有说。";
    String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
    int id = Integer.parseInt(request.getParameter("id"));
    if (id < 0)
        id = 0;
    String sign = "";
    String title = "";
    String content = "";
    String time = "";
    String readCount = "";
    String commentCount = "";
    String fabulousCount = "";
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //获取文章的篇数
    int blogCount = 0;
    ResultSet resultCount = stmt.executeQuery("select count(*) from Blog where userID = \"" + bloggerID + "\"") ;
    while (resultCount.next()){
        blogCount = resultCount.getInt(1);
    }
    if (id >= blogCount)
        id = blogCount - 1;
    ResultSet result = stmt.executeQuery("select * from Blog where blogID = " + id);
    while (result.next()){
        int sqlSign = result.getInt("sign");
        if (sqlSign == 0 || sqlSign == 2){
            sign = "原创";
        }
        else{
            sign = "转载";
        }
        bloggerID = result.getString("userID");
        headTitle = bloggerID + "的博客";
        title = result.getString("title");
        content = result.getString("content");
        time = result.getString("time");
        readCount = result.getString("pageviews");
        commentCount = result.getString("commentCount");
        fabulousCount = result.getString("likeCount");
    }
    List<Map<String, String>> comment = new ArrayList<>();
    result = stmt.executeQuery("select * from BlogComment, User where BlogComment.userID = User.userID and blogID = " + id);
    int tempi = 1;
    while (result.next()){
        Map<String, String> map = new HashMap<>();
        map.put("userIcon", result.getString("profilePhoto"));
        map.put("userName", result.getString("userID"));
        map.put("floor", String.valueOf(tempi));
        map.put("time", result.getString("time"));
        map.put("content", result.getString("content"));
        comment.add(map);
        tempi ++;
    }
    pageContext.setAttribute("comment", comment);
    //取出个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;
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
    <link rel="stylesheet" type="text/css" href="css/articlecontent.css">
    <meta name="description" content="666的博客,心随你动!" />

</head>
<body>

<div id="wrapper">
    <header>
        <div id="header-text">
            <h1><%=headTitle%></h1>
            <div id="signature"><%=headSignature%></div>
        </div>
        <div class="login">
            <c:if test="${userID == null}">您好，请 <a href="sign_in.jsp">登录</a></c:if>
            <c:if test="${userID != null}">欢迎，<%=userID%></c:if>
        </div>
    </header>
    <nav>
        <ul>
            <li class="first-page"><a href="/?blogger=<%=bloggerID%>">主页</a></li>
            <li><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
            <li><a href="/album_list.jsp?blogger=<%=bloggerID%>">相册</a></li>
            <li><a href="#">留言板</a></li>
            <li><a href="#">我的访客</a></li>
            <input type="text" id="search" value="文章搜索..." onfocus="if (value =='文章搜索...'){value =''}" onblur="if (value ==''){value='文章搜索...'}" >
            <button type="button" id="search-btn"></button>
        </ul>

    </nav>
    <div id="container">
        <div class="flytext">
            <img src="img/widespread.png" />
            <marquee behavior="scroll" direction="left">
                <%=flybyText%>
            </marquee>
        </div>
        <div class="subcontent-aricle">
            <div class="title">
                <span>日志</span>
            </div>
            <div class="article-title">
                <div class="sign">
                    <span id="sign1"><%=sign%></span>
                </div>
                <h3><%=title%></h3>
            </div>
            <div class="button-list">
                <div class="like">
                    <img src="img/good.png" ><span>赞</span>
                </div>
                <div class="comment">
                    <img src="img/comment.png" ><span>评论</span>
                </div>
                <div class="last-article">
                    <a href="article.jsp?id=<%=id - 1%>"><img src="img/left.png" ><span>上一篇</span></a>
                </div>
                <div class="next-article">
                    <a href="article.jsp?id=<%=id + 1%>"><span>下一篇</span><img src="img/right.png" ></a>
                </div>
            </div>
            <div class="article-content">
                <%=content%>
            </div>
            <div class="comment">
                <div class="comment-title">
                    <span>评论</span>
                </div>
                <div class="comment-content">
                    <c:forEach items="${comment}" var="i">
                        <article:Comment
                                userIcon="${i.get(\"userIcon\")}"
                                userName="${i.get(\"userName\")}"
                                floor="${i.get(\"floor\")}"
                                time="${i.get(\"time\")}"
                                content="${i.get(\"content\")}"></article:Comment>
                    </c:forEach>

                </div>
            </div>
            <div class="write-comment">
                <div class="title">
                    发表评论
                </div>
                <div class="my-comment">
                    <img class="personal-icon" src="img/lengtu.jpg">
                    <div class="write-block">
                        富文本编辑框todo（不会啊，懵逼）
                        <button type="submit">发表</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>

</body>
</html>

