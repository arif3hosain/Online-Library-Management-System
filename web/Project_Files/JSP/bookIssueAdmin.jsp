<%-- 
    Document   : bookreturn
    Created on : May 10, 2015, 3:06:19 PM
    Author     : Arif
--%>
<%@page import="models.Admin"%>
<%@page import="java.util.Date"%>
<%@page import="models.Book"%>
<%
      Admin admin=(Admin)session.getAttribute("admin");
  if(admin==null){
      response.sendRedirect("adminlogin.jsp");
  }else{
      
    int id=Integer.parseInt(request.getParameter("id"));
    Book query=new Book();
    Book bookList=query.getById(id);  
    int copy=bookList.getCopy();
    String enable="";
    String available="";
    if(copy==0){
        enable="disabled";
        available="This book is not available";
    }


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
                        <li><a href="searchReturnBooks.jsp">Book Return</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Welcome &nbsp; <b>Admin</b></a></li>
                    </ul>
                </div>
            </div>
    </nav>
        <div id="bookIssue-body">
            <div class="container" id="bookIssue-form-div">
                <form action="bookIssue" name="bookIsue-form" role="form" class="bookIssue-form" method="post">
                  <p></p>
                     <div class="form-group">
                          <label for="bookId">Book ID</label>
                          <input type="text" name="bookId" readonly    id="bookId"  value="<%out.print(bookList.getBookId());%>" class="form-control" placeholder="ISBN" required="required">
                     </div>
                     <div class="form-group">
                          <label for="email">Your Email</label>
                          <input type="email" name="email"    id="email"   class="form-control" placeholder="Email" required="required">
                     </div>

                     <div class="form-group">
                          <label for="issueDate">Issue Date</label>
                          <input type="text" name="issueDate" readonly  id="issueDate" value="<%out.print(new Date());%>"  class="form-control">
                     </div>
                      <div class="form-group">
                          <label for="dueDate">Due Date</label>
                          <input type="date" name="dueDate" id="dueDate" class="form-control" s required="required"/>
                     </div>
                          <input type="submit" id="btn-registration" class="btn btn-primary" value="Book Issue" <% out.print(enable);%>><p><%out.print(available);%></p>
                </form>
            </div>      
        </div>
    </body>
</html>
<%}%>