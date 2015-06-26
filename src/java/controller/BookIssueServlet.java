
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
import models.Member;
/**
 *
 * @author Arif
 */
public class BookIssueServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
 
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
           processRequest(request, response);
           String email=request.getParameter("email");
           int bookId=Integer.parseInt(request.getParameter("bookId"));
           String issueDate=request.getParameter("issueDate");
           String dueDate=request.getParameter("dueDate");  
           
           
            Member m=new Member();
            m.setEmail(email);
          Member m2=  m.isExitsUser(m);
            if(m2 !=null){
                 models.Bookissue issue=new models.Bookissue(null, new Date(), new Date(), email, "false");
           Admin admin=new Admin();
           boolean b= admin.bookIssue(issue);
           Book bookIssue=new Book();
           boolean result=bookIssue.reducBookCopy(bookId);
           
           if(b){
               response.sendRedirect("adminhome.jsp");
           } 
            }else{
                response.sendRedirect("mailError.jsp");
            }
            

           

       
           

        
        
    }
}
