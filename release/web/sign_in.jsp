
<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/sign_in.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="module" src="js/jsonResolver.js"></script>
    <script type="module">
        import {SignIn} from "./js/DOM.js";
        window.onload = () => {
            new SignIn();
        }
    </script>
</head>
<body>
<div class="signin_box">
    <p class="sign-title">
        <span>欢迎进入啦啦博客网，请登录</span>
    </p>

        <p class="input-area">
            <label for="username" class="username-label"> 请输入用户名： </label>
            <input id="username" name="username" required="required" type="text" placeholder="例：王小明" />
        </p>
        <p class="input-area">
            <label for="password" class="password-label"> 请输入密码： </label>
            <input id="password" name="password" required="required" type="password" />
        </p>
        <button type="submit" id="submitbutton">登 录</button>
    <p class="change_link">
        还没有账号？
        <a href="sign_up.jsp" class="to-register">去注册</a>
    </p>
</div>
</body>
<footer>&copy;2019-2030 啦啦啦</footer>

</html>

