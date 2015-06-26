<%@page import="models.Admin"%>
<%@page import="models.Book"%>
<%@page import="java.util.List"%>


<%
  Admin admin=(Admin)session.getAttribute("admin");
  if(admin==null){
      response.sendRedirect("adminlogin.jsp");
  }else{
  Book query=new Book();
  List<Book> list=query.booksQuery();
   
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
    <title>Book page..</title>
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
              <li class="active"><a href="adminhome.jsp">All Book</a></li>
              <li ><a href="allMembers.jsp">Members</a> </li>
              <li><a href="addBook.jsp">Add Book</a></li>
              <li><a href="searchReturnBooks.jsp">Book Return</a></li>
              <li><a href="bookIssued.jsp">Book Issued</a></li>
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
                    <center><h3>A list of all library books</h3></center>
                    <tr>
                        <th >Book ID</th>
                        <th >Title</th>
                        <th >ISBN</th>        
                        <th >Author Name</th>
                        <th >Publisher</th>
                        <th >Pages</th> 
                        <th>Read By</th>
                         <th>Copies</th>
                        <th>Book Issue</th>
                        <th >Edit</th>
                        <th>Delete</th>
                    </tr>                 
                     <tbody>
                        <%                       
                        for(Book book: list){
                         Object copy=book.getCopy();
                        String visibility="";
                        if(copy ==null || copy.equals("")){
                            visibility="hidden";
                        }else{
                            int i=book.getCopy();
                            if(i==0){
                                visibility="hidden";
                            }else{
                                visibility="visible";
                            }
                            
                        }
                        %>
                     <tr>
                        <td><%out.print(book.getBookId());%></td>
                        <td><a href="bookDetails.jsp?id=<%=book.getBookId() %>" title="View about this book" target="_blank"><% out.print(book.getBookTitle());%></a></td>
                        <td><% out.print(book.getIsbn());%></td> 
                        <td><% out.print(book.getAuthorName());%></td>    
                        <td><% out.print(book.getPublisher());%></td>  
                        <td><% out.print(book.getTotalPage());%></td>
                        <td><% out.print(book.getReadBy());%></td>
                        <td><% out.print(book.getCopy());%></td>
                        <td><a href="bookIssueAdmin.jsp?id=<%=book.getBookId()%>" class="btn btn-info" title="Issue This Book" style="visibility:<%out.print(visibility);%>">Issue</a></td>
                         <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit<%out.print(book.getBookId());%>" ><span class="glyphicon glyphicon-pencil"></span></button></p>
                             <form action="updateBookInformation" method="post"><div class="modal fade" area-hidden="true" id="edit<%out.print(book.getBookId());%>" role="dialog">
                            <div class="modal-dialog">   
                              <!-- Modal content-->
                              <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  <h4 class="modal-title">Update Book Information</h4>
                                </div><!--header-->
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="form-group" >
                                          <label for="bookId">Book ID</label>
                                          <input type="text" name="bookId"  id="bookId" value="<%out.print(book.getBookId());%>" class="form-control" placeholder="Book title" required="required" readonly>
                                     </div> 
                                        <div class="form-group">
                                          <label for="bookTitle">Book Title</label>
                                          <input type="text" name="bookTitle"  id="bookTitle<%out.print(book.getBookId());%>" value="<%out.print(book.getBookTitle());%>" class="form-control" placeholder="Book title" required="required">
                                     </div>              
                                                <div class="form-group">
                                                      <label for="isbn">ISBN</label>
                                                      <input type="text" name="isbn"  id="isbn<%out.print(book.getBookId());%>" value="<%out.print(book.getIsbn());%>" class="form-control" placeholder="ISBN" required="required">
                                                 </div>
                                                 <div class="form-group">
                                                      <label for="authorName">Author name</label>
                                                      <input type="text" name="authorName" id="authorName<%out.print(book.getBookId());%>" value="<%out.print(book.getAuthorName());%>" value="<% out.print(book.getAuthorName());%>" class="form-control" placeholder="Author name" required="required">
                                                 </div>  
                                                 <div class="form-group">
                                                    <label for="publisher">Publisher</label>
                                                    <input type="text" name="publisher" id="publisher<%out.print(book.getBookId());%>" value="<%out.print(book.getPublisher());%>" class="form-control" placeholder="Publisher" required="required">
                                               </div>
                                                 <div class="form-group">
                                                      <label for="totalPage">Total Page</label>
                                                      <input type="text" name="totalPage" id="totalPage<%out.print(book.getBookId());%>" value="<%out.print(book.getTotalPage());%>" class="form-control" placeholder="How many pages?" required="required">
                                                 </div>
                                    </div><!--container-fluid-->
                                </div><!--body-->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" onclick="updatedata('<%out.print(book.getBookId());%>')">Update</button>
                                    <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
                                </div><!--footer-->
                              </div>
                            </div>
                                 </div></form>
                        </td>
                        <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete<%out.print(book.getBookId());%>" ><span class="glyphicon glyphicon-trash"></span></button></p>
                            <form action="deleteBook" class="form-horizontal" method="post">    
                            <div class="modal fade" id="delete<%out.print(book.getBookId());%>" role="dialog">
                            <div class="modal-dialog">

                              <!-- Modal content-->
                              <div class="modal-content">
                                <div class="modal-body">
                                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                                     <p>Are you sure, You want to delete this book?</p>
                                      <input type="text" name="id" readonly value="<%out.print(book.getBookId());%>" class="form-control" style="width: 10%;"/>  
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" >Delete</button>
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                              </div>

                            </div>
                          </div>   <!--delete-->  
                            </form>
                        </td>
                     </tr>  
                        <%}%>
                   </tbody>
                </table>                        
            </div><!--display-data-->
 
<script>
    function updatedata(id){
        var id=id;
        var title=document.getElementById('bookTitle'+id).value;
        var isbn=document.getElementById('isbn'+id).value;
        var authorName=document.getElementById('authorName'+id).value;
        var publisher=document.getElementById('publisher'+id).value;
        var page=document.getElementById('totalPage'+id).value;

        var datas="id="+id+"&title="+title+"&isbn="+isbn+"&authorName="+authorName+"&publisher="+publisher+"&page="+page;
        $.ajax({
            type:"POST",
            url:"update.jsp?id="+id,
            data:datas            
        }).done(function(data){
            $("#info").html(data);
            viewdata();           
        });       
    }

</script>  
</body>
</html>
<%}%>
