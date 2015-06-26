
<%
   session.removeAttribute("admin");
   session.invalidate();  
   response.sendRedirect("welcome.jsp");
%>
