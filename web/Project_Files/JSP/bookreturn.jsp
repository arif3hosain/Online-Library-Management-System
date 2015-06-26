<%-- 
    Document   : bookreturn
    Created on : May 10, 2015, 3:06:19 PM
    Author     : Arif
--%>
<%@page import="java.util.Date"%>
<%@page import="models.Admin"%>
<%@page import="controller.BookIssueServlet"%>
<%@page import="models.Bookissue"%>
<%@page import="org.apache.tomcat.util.buf.B2CConverter"%>
<%@page import="java.util.List"%>
<%@page import="models.Book"%>
<%
  int id=Integer.parseInt(request.getParameter("id"));
  Admin book=new Admin();
  Bookissue issuedBook=book.getBooksByIssueId(id);   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <title>Return a book</title>
          <jsp:include page="../html/reference.html" flush="true"></jsp:include>
    </head>
    <body>
        <nav class="navbar navbar-inverse" style="background-color: #3B0B0B;">
              <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#">Library Management</a>
                </div>
                <div>
                  <ul class="nav navbar-nav">
                      <li ><a href="adminhome.jsp">All Book</a></li>
                    <li ><a href="allMembers.jsp">Members</a> </li>
                    <li><a href="addBook.jsp">Add Book</a></li>             
                    <li class="active"><a href="searchReturnBooks.jsps">Book Return</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">

                      <li><a href="#">Welcome &nbsp; <b>Admin</b></a></li>
                      <li><a href="logoutAdmin.jsp"><span class="glyphicon  glyphicon-log-out"></span><b>Log Out</b></a></li>
                  </ul>
                </div>
              </div>
      </nav>
         <div id="bookIssue-body">
 
            <div class="container" id="bookIssue-form-div">
              <form action="return" name="bookIsue-form" role="form" class="bookIssue-form" method="post">
                  <p></p>
                        <div class="form-group">
                              <label for="bookId">Book Id</label>
                              <input type="text" name="bookId" id="bookId" readonly class="form-control" value="<%out.print(issuedBook.getBook());%>" style="width: 30%;" />
                         </div>
                         <div class="form-group">
                              <label for="issueId">Issue ID</label>
                              <input type="text" name="issueId" id="issueId" readonly class="form-control" value="<%out.print(issuedBook.getIssueId());%>" style="width: 30%;" />
                         </div>
                         <div class="form-group">
                              <label for="email">Member Email</label>
                              <input type="text" name="email"  id="email" readonly  value="<%out.print(issuedBook.getEmail());%>" class="form-control" placeholder="Email" required="required">
                         </div>
                          <div class="form-group">
                              <label for="dueDate">Return Date</label>
                              <input type="date" name="dueDate" id="dueDate" value="<%out.print(new Date());%>" class="form-control" placeholder="mm/dd/yyyy" required="required"/>
                         </div>
                          <input type="submit" id="btn-registration" class="btn btn-primary" value="Return Book" >

              </form>
            </div>      
        </div>
    </body>
</html>
