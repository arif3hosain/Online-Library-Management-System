 
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Admin;
import models.Book;
 
/**
 *
 * @author Arif
 */
public class AddBookServlet extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       
        
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String bookTitle=request.getParameter("bookTitle");
        String category=request.getParameter("category");
        String isbn=request.getParameter("isbn");
        String authorName=request.getParameter("authorName");
        String publisher=request.getParameter("publisher");
        String publishedDate=request.getParameter("publishedDate");
        String sizeType=request.getParameter("sizetype");
        String fileSize=request.getParameter("fileSize");   
        fileSize=fileSize+" "+sizeType;
        String bookUrl=request.getParameter("bookUrl");
        String image=request.getParameter("image");
        String readBy=request.getParameter("readBy");
        int totalPage=Integer.parseInt(request.getParameter("totalPage"));
        Object copy=request.getParameter("copy");
        String description=request.getParameter("description");
        int bookCopy=0;
        if(copy==null){
             bookCopy=0;
         }
 
        Book book=new Book(bookTitle, category, isbn, authorName, publisher, null, fileSize, bookUrl,image, 
                readBy, totalPage, description, bookCopy, null);
        Admin admin=new Admin();
        admin.addBook(book);
        response.sendRedirect("addBook.jsp");
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
