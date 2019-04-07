package webapp;

import database.myConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "book_issue")
public class book_issue extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = myConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("INSERT INTO `rentDB` (`idItem`,`idStudent`,`startDate`,`endDate`) VALUES (?,?,?,?)");
            ps.setInt(1,Integer.parseInt(request.getParameter("bookItemId")));
            ps.setInt(2,Integer.parseInt(request.getParameter("bookStudentId")));
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dateStart = sdf1.parse(request.getParameter("bookStartDate"));
            ps.setDate(3, new java.sql.Date(dateStart.getTime()));

            java.util.Date dateEnd = sdf1.parse(request.getParameter("bookEndDate"));
            ps.setDate(4, new java.sql.Date(dateEnd.getTime()));

            if (ps.executeUpdate() != 0) {
                System.out.println("New issue in DB");
            } else {
                System.out.println("Something wrong with issueDB");
            }
        } catch (SQLException | ParseException e) {
            System.out.println("problem in class issueDB: " + e);
            e.printStackTrace();
        }

        try {
            ps = con.prepareStatement("UPDATE bookItemDB SET active=0 WHERE id = ?");
            ps.setInt(1,Integer.parseInt(request.getParameter("bookItemId")));

            if (ps.executeUpdate() != 0) {
                System.out.println("Item active changed in DB");
            } else {
                System.out.println("Something wrong with active in itemDB");
            }
        } catch (SQLException e) {
            System.out.println("problem in class issueDB: " + e);
            e.printStackTrace();
        }


        String text = "book-details.jsp?bookId=" + request.getParameter("bookTitleId");
        response.sendRedirect( text );
//        response.sendRedirect("book-view.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
