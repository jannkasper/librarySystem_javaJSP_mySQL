package webapp;

import database.bookItem;
import database.workOnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "book_details")
public class book_details extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        bookItem bookItemNewDB;
        bookItemNewDB = new bookItem (Integer.parseInt(request.getParameter("bookBarCode")), true, Integer.parseInt(request.getParameter("bookShelf")), Integer.parseInt(request.getParameter("bookRack")), Integer.parseInt(request.getParameter("bookIdTitle")));
        workOnDB temporaryObjectDB = new workOnDB();
        temporaryObjectDB.addBookItem(bookItemNewDB);
//        request.setAttribute("bookId", request.getParameter("bookIdTitle"));

        String text = "book-details.jsp?bookId=" + request.getParameter("bookIdTitle");
        response.sendRedirect( text );

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
