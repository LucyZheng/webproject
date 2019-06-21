<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    String userID = (String) session.getAttribute("userID");
    String bloggerID = request.getParameter("blogger");
    String headTitle = bloggerID + "的博客";
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
    int currentPage = 1;
    if (request.getParameter("page") != null){
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //获取个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;

    //获取相册详情
    Map<String, String> albumInfo = new HashMap<>();
    resultSet = stmt.executeQuery("select * from Album where albumID = \"" + id + "\"");
    while (resultSet.next()){
        albumInfo.put("name", resultSet.getString("name"));
        albumInfo.put("description", resultSet.getString("description"));
        albumInfo.put("date", resultSet.getString("time"));
    }
    //获取相片的个数
    int blogCount = 0;
    ResultSet resultCount = stmt.executeQuery("select count(*) from Picture where albumID = \"" + id + "\"");
    while (resultCount.next()){
        blogCount = resultCount.getInt(1);
    }
    if (id >= blogCount)
        id = blogCount - 1;
    ResultSet result;
    //每页显示10个
    int pageCount = (int)Math.ceil(blogCount / 10.0);
    if (pageCount == 0)
        pageCount = 1;
    if (currentPage <= 0)
        currentPage = 1;
    else if (currentPage > pageCount)
        currentPage = pageCount;
    pageContext.setAttribute("currentPage", currentPage);
    pageContext.setAttribute("pageCount", pageCount);
    //获取赞数
    resultSet = stmt.executeQuery("select * from Picture where albumID = \"" + id + "\"");
    while (resultSet.next()){
        fabulousCount += resultSet.getInt("likeCount");
    }

    //获取图片
    //取出10个图
    int tempi = 0;
    List<Map<String, String> > pictures = new ArrayList<>();
    result = stmt.executeQuery("select * from Picture where albumID = \"" + id + "\" limit " + (currentPage - 1) * 10 + ", 10");
    while (result.next()) {
        Map<String, String> map = new HashMap<>();
        map.put("num", Integer.toString(tempi));
        map.put("pictureID", result.getString("pictureID"));
        map.put("name", result.getString("name"));
        map.put("pictureSrc", result.getString("content"));
        map.put("fabulousCount", result.getString("likeCount"));
        ++ tempi;
        pictures.add(map);
    }
    pageContext.setAttribute("pictures", pictures);

    //获取评论
    Map<String, List<Map<String, String> > > photoComment = new HashMap<>();
    result = stmt.executeQuery("select * from PictureComment, Picture where PictureComment.pictureID = Picture.pictureID and albumID = " + id);
    tempi = 1;
    while (result.next()){

    }
    pageContext.setAttribute("photoComment", photoComment);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>相册详情</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/album.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="text/javascript">
        function popBox() {
            var popBox = document.getElementById('popBox');
            var popLayer = document.getElementById('popLayer');

            document.getElementById("pop-img").src = this.src;
            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            popLayer.style.display = "block";
            popBox.style.display = "block";
        }
        function popCommentBox() {
            var popBox = document.getElementById('popBox-comment');
            var popLayer = document.getElementById('popLayer');

            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            popLayer.style.display = "block";
            popBox.style.display = "block";
        }

        function closeBox() {
            var popBox = document.getElementById('popBox');
            var popLayer = document.getElementById('popLayer');

            popLayer.style.display = "none";
            popBox.style.display = "none";

        }
        function closeCommentBox() {
            var popBox = document.getElementById('popBox-comment');
            var popLayer = document.getElementById('popLayer');

            popLayer.style.display = "none";
            popBox.style.display = "none";

        }
    </script>
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
            <c:if test="${userID != null}">欢迎，<a href="setting.jsp"><%=userID%></a></c:if>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="/?blogger=<%=bloggerID%>">主页</a></li>
            <li><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
            <li class="first-page"><a href="/album_list.jsp?blogger=<%=bloggerID%>">相册</a></li>
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
        <div class="subalbum">
            <div class="title">
                <span>相册详情</span>
            </div>
            <div class="album-content">
                <div class="album-header">
                    <div class="cover"><img src="img/lengtu3.jpg" class="cover"></div>
                    <div class="album-inf">
                        <div class="album-title"><%=albumInfo.get("name")%></div>
                        <button type="button" class="add-photos">
                            添加照片
                        </button>
                    </div>
                    <div class="album-stat">
                        <div class="album-comment">
                            <div class="comment-title">评论</div>
                            <div class="comment-count">0</div>
                        </div>
                        <div class="album-like">
                            <div class="like-title">赞</div>
                            <div class="like-count">0</div>
                        </div>
                    </div>
                </div>
                <ul class="photo-list">
                    <c:forEach items="${pictures}" var="i">
                        <mainpage:Photo
                                num="${i.get(\"num\")}"
                                name="${i.get(\"name\")}"
                                pictureSrc="${i.get(\"pictureSrc\")}"
                                ></mainpage:Photo>
                    </c:forEach>
                </ul>
            </div>
            <!-- 换页 -->
            <div class="pagi">
                <ul class="pagination">
                    <li><a href="album.jsp?blogger=<%=bloggerID%>&page=${currentPage - 1}">«</a></li>
                    <c:forEach var="i" begin="1" end="${pageCount}">
                        <li><a href="album.jsp?page=${i}" class="<c:if test="${i == currentPage}">active</c:if>">${i}</a></li>
                    </c:forEach>
                    <li><a href="album.jsp?blogger=<%=bloggerID%>&page=${currentPage + 1}">»</a></li>
                </ul>
            </div>
        </div>

    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>
<div id="popLayer">
</div>
<div id="popBox-comment">
    <div class="close2"><a href="javascript:void(0)" onclick="closeCommentBox()"><img src="img/close-popbox.png"></a></div>
    <div class="title"><span>添加评论</span></div>
    <div class="write-comment">
        评论框todo
    </div>
    <button type="submit" class="photo-comment-button">评论</button>
</div>
<div id="popBox">
    <div class="close"><a href="javascript:void(0)" onclick="closeBox()"><img src="img/close-popbox.png"></a></div>
    <div class="photoinf">
        <img id="pop-img" src="img/lengtu.jpg">
        <div class="photo-comment-list">
            <div class="title">
                评论列表
            </div>
            <div class="single-comment" id="single-comment-0">
                <div class="personal-commentinf">
                    <img class="personal-icon" src="img/lengtu3.jpg">
                    <div class="personal-name">
                        <a href="#">鲲鲲</a>
                    </div>
                </div>
                <div class="personal-comment">
                    <div class="floor">
                        <span id="floor-count"><span>1</span>楼</span>
                        <span id="comment-time">评论时间：<span>2019-6-15 15:43:24</span></span>
                    </div>
                    <div class="comment-time-content">
                        鸡你太美！
                    </div>
                </div>
                <div class="comment-opration">
                    <div class="reply">
                        <span>回复</span>
                    </div>
                    <div class="delete">
                        <span>删除</span>
                    </div>
                </div>
            </div>
            <div class="more">
                <button type="button" id="moreclick">点击加载更多...</button>
            </div>
        </div>

    </div>

</div>
</body>
<script type="text/javascript">
    function over(id) {
        var index = id.substr(id.length - 1, 1);
        document.getElementById("photo-operation-" + index).style.visibility = "visible";
    }

    function out(id) {
        var index = id.substr(id.length - 1, 1);
        document.getElementById("photo-operation-" + index).style.visibility = "hidden";
    }
</script>
</html>

