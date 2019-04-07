<%--
  Created by IntelliJ IDEA.
  User: jankasper
  Date: 2019-03-17
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
<head>
    <title>add database.student</title>
</head>
<style>
    <%@include file="style_web.css"%>
</style>
<body>
<div class="sidenav">
    <h2><a style="padding-left: 16px" href="start.jsp">LIBRARY CC</a></h2>
    <table style="margin-left: 30px" class="ala">
        <tr>
            <td><img src="book.png" height="20" width="20"></td>
            <td><a href="book-view.jsp">Books</a></td>
        </tr>
        <tr>
            <td><img src="man.png" height="20" width="20"></td>
            <td><a href="student-view.jsp">Students</a></td>
        </tr>
        <tr>
            <td><img src="history.png" height="20" width="20"></td>
            <td><a href="issue-history.jsp">Issue History</a></td>
        </tr>
        <tr>
            <td><img src="contact.png" height="20" width="20"></td>
            <td><a href="start.jsp">Contact</a></td>
        </tr>
    </table>
</div>
<div class="headspace main">
    <p style="margin-left:50px;" class="info"><%= (new java.util.Date())%></p>
</div>
<div class="main bar-option row">
    <ul>
        <div class="column" style="width:30%;">
            <li style="margin-left:50px;"><p>Add Book</p></li>
        </div>
        <div class="column" style=" width: 70%; background-color: #33b5b9;">
            <li style="margin-left: 0px;"><a style="margin-left: 0px;" href="book-add.jsp">Add Book</a></li>
            <li><a href="book-search.jsp">Search Book</a></li>
            <li><a href="book-view.jsp">View All Books</a></li>
        </div>
    </ul>
</div>
</br>
<div class="main row">
    <div class="column" style="width:70%;">
        <h2 style="margin-left: 50px">Add Book Form</h2>
        <hr>
        <form action="/library/book_add" method="post">
            <div class="container">
                <label ><b>TITLE</b></label>
                <input type="text" placeholder="Enter TITLE" name="bookTitle" required>

                <label ><b>CATEGORY</b></label>
                <input type="text" pattern="^[a-z-A-Z\s]{0,50}$" placeholder="Enter Category" name="bookCategory" required>

                <label ><b>AUTHOR</b></label>
                <input type="text" pattern="^[a-z-A-Z\s]{0,50}$" placeholder="Enter Author" name="bookAuthor" required>

                <hr>
                <button type="submit" class="btnStyle" value="Login">Add Book</button>
            </div>
        </form>
    </div>






    <div class="column " style="float: right; width:30%;">
        <div class="tableBorder" style="float: left; width: 100%">
            <h2 style="text-align: left; color: #98fffe; padding-left: 10px">Recently Added Books</h2>
            <sql:setDataSource
                    var="myDS"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:8889/javaJSP_library"
                    user="root" password="root"
            />

            <sql:query dataSource="${myDS}" var="listUsers">
                SELECT * FROM bookTitleDB;
            </sql:query>
            <% int m = 1; m++;%>
            <table class="css-serial"style="width: 100%;" >
                <tr >
                    <th style="width: 15%;">#</th>
                    <th>Title</th>
                </tr>
                <c:forEach var="user" items="${listUsers.rows}">
                    <tr>
                        <td style="width: 15%;padding: 5px 0px 5px 0px;"></td>
                        <td style="padding: 5px 15px 5px 15px;display: inline-block; border-radius: 5px; background-color: #33b5b9; color: white"><c:out value="${user.title}" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>
</body>
</html>

