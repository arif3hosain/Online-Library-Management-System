<%@page import="models.Bookissue"%>
<%@page import="models.Admin"%>
<%@page import="java.util.List"%>
<%@page import="models.Member" %>

 
<%
  Admin admin=(Admin)session.getAttribute("admin");
  if(admin==null){
      response.sendRedirect("adminlogin.jsp");
  }else{
    
   Member memberList=new Member();
   List<Member> allmember=memberList.getMembers();
   
   Admin bookIssued=new Admin();
   List<Bookissue> bookList=bookIssued.unreturnedBooks();
 
%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <jsp:include page="../html/reference.html" flush="true"></jsp:include>
</head>
<body style="background-color:  #8A4B08;">
<nav class="navbar navbar-inverse" style="background-color: #3B0B0B;">
    <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Library Management</a>
        </div>
    <div>
        <ul class="nav navbar-nav">
            <li ><a href="adminhome.jsp">All Book</a></li>
            <li class="active"><a href="allMembers.jsp">Members</a> </li>
            <li><a href="addBook.jsp">Add Book</a></li>
            <li><a href="searchReturnBooks.jsp">Book Return</a></li>
            <li><a href="bookIssued.jsp">Book Issued</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">Welcome &nbsp;<b>Admin</b></a></li>
          <li><a href="logoutAdmin.jsp"><span class="glyphicon  glyphicon-log-out"></span><b>Log Out</b></a></li>
        </ul>
    </div>
   </div>
</nav>
        <div id="display-allbooks" class="table-responsive">               
            <table class="table table-bordered table-striped table-hover">
                 <tr>
                    <th >First Name</th>
                    <th >Last Name</th>
                    <th >Email</th>        
                    <th >Password</th>
                    <th >Birth Date</th>
                    <th >Gender</th>                        
                    <th >Mobile</th>
                    <th>Delete</th>
                </tr>
         <tbody>
            <%

            for(Member member: allmember){
               int unreturnedbook=0; 
               String unreturnedBookDescription="";
                 for(Bookissue member2: bookList){

                     if(member2.getEmail().equals(member.getEmail())){
                           unreturnedbook++;
                           unreturnedBookDescription="This user issued "+unreturnedbook+" books with unreturned.<br>";
                     }
                 }

            %>                  
             <tr>
                <td><%out.print(member.getFirstName());%></td>
                <td><%out.print(member.getLastName());%></td>
                <td><% out.print(member.getEmail());%></td> 
                <td><% out.print(member.getUserPassword());%></td>    
                 <td><% out.print(member.getBirthDate());%></td>  
                  <td><% out.print(member.getGender());%></td>
                   <td><% out.print(member.getMobile());%></td>
                <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete<%out.print(member.getId());%>" ><span class="glyphicon glyphicon-trash"></span></button></p>
                    <form action="memberDelete" class="form-horizontal" method="post"><div class="modal fade" id="delete<%out.print(member.getId());%>" role="dialog">
                    <div class="modal-dialog">

                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-body">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <p><%out.print(unreturnedBookDescription);%> Are you sure, you want to delete this member of following ID?</p>
                          <input type="text" name="id" readonly value="<%out.print(member.getId());%>" class="form-control" style="width: 10%;"/>
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