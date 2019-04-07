<%--
  Created by IntelliJ IDEA.
  User: jankasper
  Date: 2019-03-17
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Welcome, please login:</h1>

<form action="/library/login" method="post">
    login-name: <input type="text" name="loginname" />
    password: <input type="password" name="password" />
    <input type="submit" value="Login"/>
</form>
    <p style="color: red;" >${errorMessage}</p>
</body>
</html>
