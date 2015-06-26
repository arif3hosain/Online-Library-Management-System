
package controller;

 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Arif
 */
public class SendPasswordServlet extends HttpServlet {

  @Override
        public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
//               String email=request.getParameter("email");
//        MailSender mail=new MailSender();   //service class        
//        models.Member reg=new models.Member("", "", email, "", "");
//        boolean  recoveredPassword=mail.isMailExist(reg);
//         
//        if(recoveredPassword){
//           response.sendRedirect("emailSent.jsp");
//        }else{
//            response.sendRedirect("mailError.jsp");
//        } 
    } //finished doPost method
}
