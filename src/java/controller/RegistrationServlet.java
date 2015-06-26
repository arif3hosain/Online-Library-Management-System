 
package controller;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import models.Member;
 
public class RegistrationServlet extends HttpServlet {
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String Password = request.getParameter("password");
        
////        Date date=null;
////        try {
////           date =new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
////        } catch (ParseException ex) {
////            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
////        }
        String gender;
        if(request.getParameter("gender").equalsIgnoreCase("male")){
            gender="Male";
        }else{
            gender="Female";
        }
        String mobile =request.getParameter("mobile"); 
        String location =request.getParameter("country");
       
        models.Member reg=new models.Member(firstName, lastName, email, Password, new Date(), gender, mobile,
                location, new Date(), "No");
        Member registration=new Member();
        boolean success=registration.register(reg);
        
        if(success){
             JOptionPane.showMessageDialog(null, "okey");
            HttpSession session=request.getSession();
            session.setAttribute("user", reg);
            response.sendRedirect("index.jsp");            
        }else{
            JOptionPane.showMessageDialog(null, "sorry");
        }
    }

}
