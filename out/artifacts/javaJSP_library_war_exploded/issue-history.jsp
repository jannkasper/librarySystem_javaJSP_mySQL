<%--
  Created by IntelliJ IDEA.
  User: jankasper
  Date: 2019-03-17
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
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
    <h2 style="background-color: #a68ab9"><a style="padding-left: 16px" href="start.jsp">LIBRARY CC</a></h2>
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
            <li style="margin-left:50px;"><p>View All Issue</p></li>
        </div>
        <div class="column" style=" width: 70%; background-color: #33b5b9;">
            <li><a href="issue-student.jsp">Search by student</a></li>
            <li><a href="issue-book.jsp">Search by book</a></li>
            <li><a href="issue-history.jsp">VIew All Issues</a></li>
        </div>
    </ul>
</div>
</br>
<div class="main row">
    <div class="column" style="width:100%;">
        <h2 style="margin-left: 50px">All Issue</h2>
    </div>
</div>
<hr>
<div class="main row container">

    <div class="column" style="float: initial; width:100%;">
        <div class="tableBorder">
            <p style="text-align: left; color: #98fffe; padding-left: 10px">Table</p>
            <sql:setDataSource
                    var="myDS"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:8889/javaJSP_library"
                    user="root" password="root"
            />

            <sql:query dataSource="${myDS}" var="listUsers">
                SELECT rentDB.id, rentDB.idItem, rentDB.idStudent, rentDB.startDate, rentDB.endDate, bookItemDB.barCode, bookTitleDB.title, studentDB.name FROM rentDB
                INNER JOIN bookItemDB ON rentDB.idItem=bookItemDB.id
                INNER JOIN bookTitleDB ON bookTitleDB.id=bookItemDB.idTitle
                INNER JOIN studentDB ON studentDB.admissionNo=rentDB.idStudent
                ;
            </sql:query>
            <table style="width: 100%" >
                <tr >
                    <th style="width: 10%;">#</th>
                    <th>Title</th>
                    <th>Bar Code</th>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th >Start Date</th>
                    <th >End Date</th>
                    <th></th>
                </tr>
                <c:forEach var="user" items="${listUsers.rows}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.title}"/></td>
                        <td><c:out value="${user.barCode}"/></td>
                        <td><c:out value="${user.idStudent}" /></td>
                        <td style="padding: 5px 15px 5px 15px;display: inline-block; border-radius: 5px; background-color: #33b5b9; color: white"><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.startDate}" /></td>
                        <td><c:out value="${user.endDate}" /></td>

                        <sql:query dataSource="${myDS}" var="active">
                            SELECT bookItemDB.active, rentDB.id FROM bookItemDB
                            INNER JOIN rentDB ON rentDB.idItem=bookItemDB.id
                            WHERE rentDB.idItem = ${user.idItem}
                            ORDER BY ID DESC LIMIT 1
                            ;
                        </sql:query>
                        <c:forEach var="check" items="${active.rows}">
                            <c:if test = "${check.id == user.id && check.active == false}">
                                <td style="border-color: red;">
                                    <form style="box-sizing: border-box;" method="post" action="/library/issue_return">
                                        <input type="hidden" name="rentId" value="${user.id}">
                                        <input type="hidden" name="itemBarCode" value="${user.barCode}">
                                        <input class="button" type="SUBMIT" value="Return">
                                    </form>
                                </td>
                            </c:if>
                            <c:if test = "${check.id != user.id || check.active != false}">
                                <td style="">
                                    <form style="box-sizing: border-box;" method="post" action="/library/issue_return">
                                        <input style="background-color: #b97579;" class="button" type="button" value="Retured">
                                    </form>
                                </td>
                            </c:if>
                            <c:if test = "${check.id != user.id}">
                                <td style=""></td>
                            </c:if>
                        </c:forEach>


                    </tr>
                </c:forEach>
            </table>


        </div>
    </div>
</div>

</body>
</html>

