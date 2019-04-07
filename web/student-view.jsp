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
    <h2 style="background-color: #b97579"><a style="padding-left: 16px" href="start.jsp">LIBRARY CC</a></h2>
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
            <li style="margin-left:50px;"><p>View All Students</p></li>
        </div>
        <div class="column" style=" width: 70%; background-color: #33b5b9;">
            <li><a href="student-add.jsp">Add Student</a></li>
            <li><a href="student-search.jsp">Search Student</a></li>
            <li><a href="student-view.jsp">View All Students</a></li>
        </div>
    </ul>
</div>
</br>
<div class="main row">
    <div class="column" style="width:100%;">
        <h2 style="margin-left: 50px">All Students</h2>
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
                    SELECT * FROM studentDB;
                </sql:query>
                    <table style="width: 100%" >
                        <tr >
                            <th>#</th>
                            <th>Admission No.</th>
                            <th>Name</th>
                            <th>Grade</th>
                            <th>Section</th>
                            <th>Description</th>
                            <th>active</th>
                        </tr>
                        <c:forEach var="user" items="${listUsers.rows}">
                            <tr>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.admissionNo}" /></td>
                                <td style="padding: 5px 15px 5px 15px;display: inline-block; border-radius: 5px; background-color: #33b5b9; color: white"><c:out value="${user.name}" /></td>
                                <td><c:out value="${user.grade}" /></td>
                                <td><c:out value="${user.section}" /></td>
                                <td><c:out value="${user.description}" /></td>
                                <td style="border-color: red;">
                                    <c:if test = "${user.active == true}">
                                    <form method="post" action="/library/student_active">
                                        <input type="hidden" name="studentId" value="${user.id}">
                                        <input type="hidden" name="studentActive" value="${user.active}">
                                        <input type="hidden" name="previousPage" value="student-view.jsp" >
                                        <input class="button"style="background-color: #33b5b9;" type="SUBMIT" value="Active">
                                    </form>
                                    </c:if>
                                    <c:if test = "${user.active == false}">
                                        <form method="post" action="/library/student_active">
                                            <input type="hidden" name="studentId" value="${user.id}">
                                            <input type="hidden" name="studentActive" value="${user.active}">
                                            <input type="hidden" name="previousPage" value="student-view.jsp" >
                                            <input class="button"style="background-color: #b97579;" type="SUBMIT" value="Inactive">
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>


    </div>
    </div>
</div>

</body>
</html>
