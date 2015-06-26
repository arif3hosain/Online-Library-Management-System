package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Book;
/**
 *
 * @author Arif
 */
public class updateBookInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int bookId=Integer.parseInt(request.getParameter("bookId"));
        String bookTitle=request.getParameter("bookTitle");
        String isbn=request.getParameter("isbn");
        String authorName=request.getParameter("authorName");
        String publisher=request.getParameter("publisher");
        int totalPage=Integer.parseInt(request.getParameter("totalPage"));                  
    
        Book book=new Book();
       Book b= book.updateBook(bookId, bookTitle, isbn, authorName, publisher, totalPage);
       if(b!=null){
           response.sendRedirect("adminhome.jsp");
       }
   
    }

}
