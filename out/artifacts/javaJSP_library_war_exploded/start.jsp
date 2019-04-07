<%--
  Created by IntelliJ IDEA.
  User: jankasper
  Date: 2019-03-17
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="database.myConnection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
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
    <h2 style="background-color: #30c38b;"><a style="padding-left: 16px" href="start.jsp">LIBRARY CC</a></h2>
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
            <li style="margin-left:50px;"><p>.</p></li>
        </div>

    </ul>
</div>
</br>
<div class="main row">
    <div class="column" style="width:100%;">
        <h2 style="margin-left: 50px">Dashboard</h2>
    </div>
</div>
<hr>
<div class="main row container">
    </br>

    <div class="column" style="float: inside; width:100%;">
        <div style="text-align: center">


            <table >
                <tr>
                    <td><img style="float: left;" src="book1.png" height="70" width="70">
                        <div style=" overflow: auto">
                            <%
                                String bookAmount = null;
                                String studentAmount= null;
                                String rentAmount= null;
                                String bookRentAmount= null;
                                Connection con = myConnection.getConnection();
                                    Statement stmt3 = con.createStatement();

                                    ResultSet rs3 = stmt3.executeQuery("SELECT COUNT(*) AS totalBook FROM bookTitleDB;");
                                    if(rs3.next()) {
                                        bookAmount = rs3.getInt("totalBook") + "";
                                    }
                                rs3 = stmt3.executeQuery("SELECT COUNT(*) AS totalStudent FROM studentDB;");
                                if(rs3.next()) {
                                    studentAmount = rs3.getInt("totalStudent") + "";
                                }
                                rs3 = stmt3.executeQuery("SELECT COUNT(*) AS totalRent FROM rentDB;");
                                if(rs3.next()) {
                                    rentAmount = rs3.getInt("totalRent") + "";
                                }
                                rs3 = stmt3.executeQuery("SELECT COUNT(*) AS totalBookRent FROM bookItemDB WHERE active = 0 ;");
                                if(rs3.next()) {
                                    bookRentAmount = rs3.getInt("totalBookRent")+ "";
                                }


                            %>
                            <p style="margin-left: 20px;"><%= bookAmount%></p>
                            <p style="margin-left: 20px;">TOTAL BOOKS</p>
                        </div>
                    </td>
                    <td><img style="float: left;" src="man1.png" height="70" width="70">
                        <div style=" overflow: auto">
                            <p style="margin-left: 20px;"><%=studentAmount%></p>
                            <p style="margin-left: 20px;">TOTAL STUDENTS</p>
                        </div>
                    </td>
                    <td><img style="float: left;" src="man2.png" height="70" width="70">
                        <div style=" overflow: auto">
                            <p style="margin-left: 20px;"><%=rentAmount%></p>
                            <p style="margin-left: 20px;">TOTAL ISSUES</p>
                        </div>
                    </td>
                    <td><img style="float: left;" src="book2.png" height="70" width="70">
                        <div style=" overflow: auto">
                            <p style="margin-left: 20px;"><%=bookRentAmount%></p>
                            <p style="margin-left: 20px;">TOTAL BOOKS OUT</p>
                        </div>
                    </td>
                </tr>

            </table>


        </div>
    </div>
</div>

</body>
</html>
