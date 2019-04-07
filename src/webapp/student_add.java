package webapp;

import database.student;
import database.workOnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "student_add")
public class student_add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        student studentNewDB;

        studentNewDB = new student(Integer.parseInt(request.getParameter("studentAdmission")),request.getParameter("studentName"),
                Integer.parseInt(request.getParameter("studentGrade")),request.getParameter("studentSection"),
                request.getParameter("studentDescription"), Boolean.parseBoolean(request.getParameter("studentActive")));

        workOnDB temporaryObjectDB = new workOnDB();
        temporaryObjectDB.addStudent(studentNewDB);

        response.sendRedirect("student-add.jsp");

//        request.setAttribute("studentAd", request.getParameter("studentAdmission"));
//        request.setAttribute("studentN", request.getParameter("studentName"));
//        request.setAttribute("studentG", request.getParameter("studentGrade"));
//        request.setAttribute("studentS", request.getParameter("studentSection"));
//        request.setAttribute("studentD", request.getParameter("studentDescription"));
//        request.setAttribute("studentAc", request.getParameter("studentActive"));



//        PrintWriter out = response.getWriter();
//        out.println("doPost-version: ");
//        out.print("Admission: " + request.getParameter("studentAdmission") + ", Name: " + request.getParameter("studentName"));






    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        PrintWriter out = response.getWriter();
//        out.println("login-name: " + request.getParameter("a") + ", password: " + request.getParameter("b"));
    }
}
