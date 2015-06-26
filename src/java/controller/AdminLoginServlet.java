package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;

/**
 *
 * @author Arif
 */
public class AdminLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
         
        String username=request.getParameter("email");
        String password=request.getParameter("pass");
        Admin login=new Admin();
        Admin loginResult=login.authenticate(username, password);
  
            if(loginResult !=null){    
              
                HttpSession session=request.getSession();
                session.setAttribute("admin", loginResult);
                out.print("true"); 
            }    
            else{    
                out.print("Wrong username or password");    
 
            }          
              out.close();
    }
}
