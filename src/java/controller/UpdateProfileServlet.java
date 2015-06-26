package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Member;

/**
 *
 * @author Arif
 */
public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String Password = request.getParameter("password");
        
       Member registration =new Member();
       Member result= registration.updateProfile(id, firstName, lastName, email, mobile, Password);
        
       
       if(result !=null){
           HttpSession session=request.getSession();
           session.setAttribute("user", result);
           response.sendRedirect("profile.jsp");
       }else{
           response.sendRedirect("test2.jsp");
       }
    }
}
