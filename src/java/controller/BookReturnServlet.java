
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Admin;
import models.Bookissue;
/**
 *
 * @author Arif
 */
public class BookReturnServlet extends HttpServlet {

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
           int issueId=Integer.parseInt(request.getParameter("issueId"));
           String email=request.getParameter("email");
           String dueDate=request.getParameter("dueDate");  
           
           Admin book=new Admin();
           book.bookReturn(bookId);
           Admin issue=new Admin();
           issue.changeStatus(issueId, dueDate);
           response.sendRedirect("adminhome.jsp");

    }

}
