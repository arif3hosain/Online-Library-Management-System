
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Member;
import models.UserLogin;
/**
 *
 * @author Arif
 */
public class LoginServlet extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        String username=request.getParameter("email");
        String password=request.getParameter("pass");
        UserLogin login=new UserLogin();
        Member reg=login.authenticate(username, password);
  
            if(reg !=null){    
                HttpSession session=request.getSession();
                session.setAttribute("user", reg);
                out.print("true");
             }    
            else{    
            out.print("Wrong username or password! ");  
            }          
    }    
}   //end of servlet 









