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

@WebServlet(name = "issue_return")
public class issue_return extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = myConnection.getConnection();
        PreparedStatement ps;

        try {
            ps = con.prepareStatement("UPDATE bookItemDB SET active=1 WHERE barCode = ?");
            ps.setInt(1,Integer.parseInt(request.getParameter("itemBarCode")));

            if (ps.executeUpdate() != 0) {
                System.out.println("Item active changed in DB");
            } else {
                System.out.println("Something wrong with active in itemDB");
            }
        } catch (SQLException e) {
            System.out.println("problem in class issueDB: " + e);
            e.printStackTrace();
        }
//        try {
//            ps = con.prepareStatement("UPDATE returnDB SET endDate WHERE id = ?");
//            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//            java.util.Date dateStart = new Date();
//            ps.setDate(1, new java.sql.Date(dateStart.getTime()));
//            ps.setInt(2,Integer.parseInt(request.getParameter("rentId")));
//
//            if (ps.executeUpdate() != 0) {
//                System.out.println("Return endDate changed in DB");
//            } else {
//                System.out.println("Something wrong with endDate in rentDB");
//            }
//        } catch (SQLException e) {
//            System.out.println("problem in class rentDB: " + e);
//            e.printStackTrace();
//        }


        response.sendRedirect("issue-history.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
