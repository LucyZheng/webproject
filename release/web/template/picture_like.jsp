<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String notification = "error";
    String pictureID = request.getParameter("pictureID");
    String action = request.getParameter("action");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    if (action.equals("like"))
        stmt.execute("update Picture set likeCount = likeCount + 1 where pictureID = " + pictureID);
    else if (action.equals("cancel"))
        stmt.execute("update Picture set likeCount = likeCount - 1 where pictureID = " + pictureID);
    notification = "success";
%>
{"status": "<%=notification%>"}
