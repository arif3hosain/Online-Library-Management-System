<%@page import="models.Bookissue"%>
<%@page import="models.Admin"%>
<%@page import="models.Book"%>
<%@page import="java.util.List"%>


<%
  Admin admin=(Admin)session.getAttribute("admin");
  if(admin==null){
      response.sendRedirect("adminlogin.jsp");
  }else{

   
%>
<%-- 
    Document   : adminhome
    Created on : May 9, 2015, 12:40:59 PM
    Author     : Arif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Case</title>
    <jsp:include page="../html/reference.html" flush="true"></jsp:include>
</head>
<body  style="background-color:  #8A4B08;">
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
                    <li class="active"> <a href="bookIssued.jsp">Book Issued</a></li>
                </ul>
              <ul class="nav navbar-nav navbar-right">
                  <li><a href="#">Welcome &nbsp; <b>Admin</b></a></li>
                  <li><a href="logoutAdmin.jsp"><span class="glyphicon  glyphicon-log-out"></span><b>Log Out</b></a></li>
              </ul>
            </div>
        </div>
    </nav>
    <div id="display-allbooks" class="table-responsive">              
        <table class="table table-bordered table-striped table-hover">
            <center><h3>All Issued books</h3></center>
            <thead>
                <tr>
                    <th >Issue ID</th>
                    <th >Book ID</th>
                    <th >Issue Date</th>        
                    <th >Return Date</th>
                    <th >Return Status</th>
               </tr>
            </thead>
             <tbody>
                 <%
                 Admin issuedBooks=new Admin();
                 List<Bookissue> list=issuedBooks.unreturnedBooks();
                 for(Bookissue book: list){%>
                 <tr>
                     <td><%out.print(book.getIssueId()); %></td>
                     <td><%out.print(book.getBook()); %></td>
                     <td><%out.print(book.getIssueDate()); %></td>
                     <td><%out.print(book.getDueDate()); %></td>
                     <td><%out.print(book.getStatus()); %></td>
                 </tr>                                                    
                 <%}%>
            </tbody>
        </table>
        <table class="table table-bordered table-striped table-hover">
            <center><h3>All returned books</h3></center>
            <thead>
                <tr>
                        <th >Issue ID</th>
                        <th >Book ID</th>
                        <th >Issue Date</th>        
                        <th >Return Date</th>
                        <th >Return Status</th>
               </tr>
            </thead>
             <tbody>
                 <%
                 Bookissue returnedBooks=new Bookissue();
                 List<Bookissue> returnedList=issuedBooks.returnedBooks();
                 for(Bookissue book: returnedList){%>
                 <tr>
                     <td><%out.print(book.getIssueId()); %></td>
                     <td><%out.print(book.getBook()); %></td>
                     <td><%out.print(book.getIssueDate()); %></td>
                     <td><%out.print(book.getDueDate()); %></td>
                     <td><%out.print(book.getStatus()); %></td>
                 </tr>                                                    
                 <%}%>
            </tbody>
        </table>  
            </div><!--display-data-->
</body>
</html>
<%}%>
