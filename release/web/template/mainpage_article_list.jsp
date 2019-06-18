<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();

    int mode = Integer.parseInt(request.getParameter("mode"));
    int from = Integer.parseInt(request.getParameter("from"));
    int count = Integer.parseInt(request.getParameter("count"));
    //TODO: Acquire article list from database
    List<Map<String, String>> mainArticle = new ArrayList<>();
    ResultSet result = stmt.executeQuery("select * from Blog limit " + from + "," + count);
    while (result.next()) {
        Map<String, String> map = new HashMap<>();
        int sign = result.getInt("sign");
        if (sign == 0)
            map.put("sign", "置顶");
        map.put("title", result.getString("title"));
        map.put("img", result.getString("img"));
        map.put("article", result.getString("content"));
        map.put("time", result.getString("time"));
        map.put("readCount", result.getString("pageviews"));
        map.put("commentCount", result.getString("commentCount"));
        map.put("fabulousCount", result.getString("likeCount"));
        mainArticle.add(map);
    }
    /*for (int i = 0;i < 4;i ++) {
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
    }*/
    pageContext.setAttribute("mainArticle", mainArticle);
%>
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
