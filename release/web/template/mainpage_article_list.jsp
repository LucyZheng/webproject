<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    int mode = Integer.parseInt(request.getParameter("mode"));
    //TODO: Acquire article list from database
    List<Map<String, String>> mainArticle = new ArrayList<>();
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
