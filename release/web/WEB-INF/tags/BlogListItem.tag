<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="sign" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="time" required="true" %>
<%@ attribute name="readCount" required="true" %>
<%@ attribute name="commentCount" required="true" %>
<%@ attribute name="fabulousCount" required="true" %>

<li class="single-article">
    <div class="article-title"><%=title%></div>
    <div class="article-date"><%=time%></div>
    <div class="article-stat">
        (<span class="comment-count"><%=commentCount%></span>/<span class="read-count"><%=readCount%></span>)
    </div>
    <div class="article-operation">
        <span class="article-delete">删除</span>
        <span class="article-ontop">置顶</span>
    </div>
</li>