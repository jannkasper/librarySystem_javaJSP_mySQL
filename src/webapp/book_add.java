package webapp;

import database.book;
import database.workOnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "book_add")
public class book_add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        book bookNewDB;
        bookNewDB = new book (request.getParameter("bookTitle"), request.getParameter("bookCategory"), request.getParameter("bookAuthor"));
        workOnDB temporaryObjectDB = new workOnDB();
        temporaryObjectDB.addBook(bookNewDB);

        response.sendRedirect("book-add.jsp");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
