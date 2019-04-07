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

@WebServlet(name = "student_active")
public class student_active extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = myConnection.getConnection();
        PreparedStatement ps;

            try {
                ps = con.prepareStatement("UPDATE studentDB SET active=? WHERE id = ?");
                if (request.getParameter("studentActive").equals("false")) {
                    ps.setBoolean(1,true);
                    ps.setInt(2, Integer.parseInt(request.getParameter("studentId")));
                } else {
                    ps.setBoolean(1,false);
                    ps.setInt(2, Integer.parseInt(request.getParameter("studentId")));
                }
                if (ps.executeUpdate() != 0) {
                    System.out.println("Item active changed in DB");
                } else {
                    System.out.println("Something wrong with active in itemDB");
                }
            } catch (SQLException e) {
                System.out.println("problem in class issueDB: " + e);
                e.printStackTrace();
            }

        request.setAttribute("myVar", request.getParameter("studentSearch"));
        request.getRequestDispatcher(request.getParameter("previousPage")).forward(request, response);

//            response.sendRedirect("student-view.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
