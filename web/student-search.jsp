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
            <li style="margin-left:50px;"><p>Search Student</p></li>
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
    <div class="column" style="width:60%;">
        <h2 style="margin-left: 50px">Search Student</h2>
        <hr>
        <form action="/library/student_search" method="post">
            <div class="container">
                <label ><b>STUDENT</b></label>
                <input type="text" placeholder="Student Search" name="studentSearch" required>


                <button type="submit" class="btnStyle" value="Login">Search Student</button>
            </div>
        </form>
    </div>
    <div class="column" style="width: 40%;">
        <p>INFO HERE</p>

    </div>
</div>
<%--<div>--%>
<%--Path <%= request.getParameter("studentSearch") %> <!-- works -->--%>
<%--<c:set var="myVar" value="${param.studentSearch}" />--%>
<%--<c:out value="${myVar}" />--%>
<%--</div>--%>
<div class="main row">
    <div class="column container" style="width:100%;">
        <div class="tableBorder" style="float: initial; width:100%;">
            <p style="text-align: left; color: #98fffe; padding-left: 10px">Table</p>
            <sql:setDataSource
                    var="myDS"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:8889/javaJSP_library"
                    user="root" password="root"
            />
            <sql:query dataSource="${myDS}" var="listUsers">
                <%--SELECT * FROM studentDB WHERE id= ${id};--%>
                <% String name = request.getParameter("studentSearch");
                    int admissionNo;
                    if (request.getParameter("studentSearch") == null) {
                        admissionNo =0;
                        name = "+_+_+_+";
                    } else {
                        boolean isNumeric = name.chars().allMatch( Character::isDigit );
                        if(isNumeric) {
                            admissionNo = Integer.parseInt(request.getParameter("studentSearch"));
                            name = "+_+_+_+";
                        } else {
                            admissionNo = 0;
                            name = request.getParameter("studentSearch");
                        }
                    };%>
                SELECT * FROM studentDB WHERE name LIKE "%<%= name%>%" OR admissionNo=<%= admissionNo%>;
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
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.grade}" /></td>
                        <td><c:out value="${user.section}" /></td>
                        <td><c:out value="${user.description}" /></td>
                        <td s>
                            <c:if test = "${user.active == true}">
                                <form method="post" action="/library/student_active">
                                    <input type="hidden" name="studentId" value="${user.id}">
                                    <input type="hidden" name="studentActive" value="${user.active}">
                                    <input type="hidden" name="studentSearch" value=<%=request.getParameter("studentSearch")%>>
                                    <input type="hidden" name="previousPage" value="student-search.jsp" >
                                    <input class="button"style="background-color: #33b5b9;" type="SUBMIT" value="Active">
                                </form>
                            </c:if>
                            <c:if test = "${user.active == false}">
                                <form method="post" action="/library/student_active">
                                    <input type="hidden" name="studentId" value="${user.id}">
                                    <input type="hidden" name="studentActive" value="${user.active}">
                                    <input type="hidden" name="studentSearch" value=<%=request.getParameter("studentSearch")%>>
                                    <input type="hidden" name="previousPage" value="student-search.jsp" >
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
