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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <sql:setDataSource
                    var="myDS"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:8889/javaJSP_library"
                    user="root" password="root"
            />
            <sql:query dataSource="${myDS}"  var="sqlresult">
                SELECT * FROM bookTitleDB WHERE id = <%=request.getParameter("bookId")%>;
            </sql:query>
            <c:forEach var="item" items="${sqlresult.rows}">
                <li style="margin-left:50px;"><p><c:out value="${item.title}"/></p></li>
            </c:forEach>
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
    <div class="column" style="width:50%;">
        <h2 style="margin-left: 50px">Issue Form</h2>
        <hr>
        <form action="/library/book_issue" method="post">
            <div class="container">
                <label ><b>STUDENT ID</b></label>
                <input type="text" pattern="^[0-9]{0,10}$" placeholder="Enter Student ID" name="bookStudentId" required>

                <%--<fmt:formatDate var="fmtDate" value="${form.bean.dateProperty}" pattern="dd/MM/yyyy"/>--%>
                <%--<fmt:formatDate var="fmtDate" value="<%=new java.util.Date()%>" pattern="dd/MM/yyyy"/>--%>
                <label ><b>START DATE</b></label>
                <input type="date" value="${fmtDate}" placeholder="<%=new java.text.SimpleDateFormat() %>" name="bookStartDate" required>

                <label ><b>END DATE</b></label>
                <input type="date" placeholder="Enter End Date" name="bookEndDate" required>

                <input type="hidden" name="bookItemId" value="<%=request.getParameter("itemId")%>">
                <input type="hidden" name="bookTitleId" value="<%=request.getParameter("bookId")%>">
                <hr>
                <button type="submit" class="btnStyle" value="Login">Issue Book</button>
            </div>
        </form>
    </div>






    <div class="column " style="float: right; width:50%;">
        <div class="tableBorder" style="float: left; width: 100%">
            <h2 style="text-align: left; color: #98fffe; padding-left: 10px">Issue history</h2>
            <sql:setDataSource
                    var="myDS"
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:8889/javaJSP_library"
                    user="root" password="root"
            />
            <%--<%  int bookIdInt;--%>
            <%--if (request.getParameter("bookId") == null) {--%>
            <%--bookIdInt =0;--%>
            <%--} else {--%>
            <%--bookIdInt = Integer.parseInt(request.getParameter("bookId"));--%>
            <%--}--%>
            <%--%>--%>

            <sql:query dataSource="${myDS}" var="listUsers">
                SELECT * FROM rentDB WHERE idItem= <%=request.getParameter("itemId")%>;
            </sql:query>
            <table style="width: 100%;">
                <tr >
                    <th style="width: 10%;">#</th>
                    <th>Student ID</th>
                    <th >Start Date</th>
                    <th >End Date</th>
                    <th></th>
                </tr>

                <c:forEach var="user" items="${listUsers.rows}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.idStudent}" /></td>
                        <td><c:out value="${user.startDate}" /></td>
                        <td><c:out value="${user.endDate}" /></td>


                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>
</body>
</html>

