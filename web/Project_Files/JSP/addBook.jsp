<%@page import="models.Admin" %>
<% 
   Admin admin=(Admin)session.getAttribute("admin");
  if(admin==null){
      response.sendRedirect("adminlogin.jsp");
  }else{   
   
 %>   
<!DOCTYPE html>
<html>
    <head>
        <title>Add book page..</title>
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
              <li class="active"><a href="addBook.jsp">Add Book</a></li>
              <li><a href="searchReturnBooks.jsp">Book Return</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Welcome &nbsp; <b>Admin</b></a></li>
                <li><a href="logoutAdmin.jsp"><span class="glyphicon  glyphicon-log-out"></span><b>Log Out</b></a></li>
            </ul>
          </div>
        </div>
    </nav>
        <div id="addBook-body">
            <div class="container" id="addBook-form-div" >
              <form action="../../addbook" name="addBook-form" role="form" class="addBook-form" method="post">
                 
                    <div class="form-group">
                          <label for="bookTitle">Book Title</label>
                          <input type="text" name="bookTitle"  id="bookTitle" class="form-control" placeholder="Book title" required="required">
                     </div>
                     <div class="form-group">
                          <label for="category">Select Category</label>
                                                                            <select class="form-control" name="category" id="book-categories">
                            <option value="All categories">All categories</option>
                            <option value="Java programming">Java programming</option>
                            <option value="SQL database">SQL database</option>
                            <option value="NoSQL database">NoSQL database</option>
                            <option value="PHP programming">PHP programming</option>
                            <option value="Microsoft languages">Microsoft languages</option>
                            <option value="Microsoft office programms">Microsoft office programms</option>
                            <option value="others">Others</option>
                          </select>
                     </div>
                     <div class="form-group">
                          <label for="isbn">ISBN</label>
                          <input type="text" name="isbn"  id="isbn" class="form-control" placeholder="ISBN" required="required">
                     </div>
                     <div class="form-group">
                          <label for="authorName">Author name</label>
                          <input type="text" name="authorName" id="authorName" class="form-control" placeholder="Author name" required="required">
                     </div>
                    <div class="form-group">
                          <label for="publisher">Publisher</label>
                          <input type="text" name="publisher" id="publisher" class="form-control" placeholder="Publisher" required="required">
                     </div>
                     <div class="form-group">
                          <label for="publishedDate">Published date</label>
                          <input type="date" name="publishedDate" id="publishedDate" class="form-control" placeholder="Published date" required="required">
                     </div>
                     <div class="form-group">
                          <label for="fileSize">File size</label>
                          <input type="text" name="fileSize" id="fileSize" class="form-control" placeholder="File size" required="required" >
                          <select name="sizetype" class="form-control"  id="fileSizeOption">
                              <option value="KB">KB</option>
                              <option value="MB">MB</option>
                              <option value="GB">GB</option>
                          </select>
                     </div>
                     <div class="form-group">
                          <label for="bookUrl">Book URL</label>
                          <input type="file" name="bookUrl" id="bookUrl">
                      </div>
                      <div class="form-group">
                          <label for="image">Book Image</label>
                          <input type="file" name="image" id="image" />

                     </div>
                      <div class="form-group">
                          <label for="readBy">Read By</label>
                          <select class="form-control" name="readBy" id="readBy" onchange="readsBy()">                                
                              <option value="Issue" selected>Issue</option>
                                <option value="download">Download</option>
                          </select>
                     </div>
                     <div class="form-group">
                          <label for="totalPage">Total Page</label>
                          <input type="text" name="totalPage" id="totalPage" class="form-control" placeholder="How many pages?" required="required">
                     </div>
                     <div class="form-group">
                          <label for="language">No of Copies</label>
                          <select id="fileCopy" class="form-control" name="copy"  >
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3" selected>3</option>
                              <option value="4">4</option>
                               <option value="5">5</option>
                              <option value="6">6</option>
                               <option value="7">7</option>
                              <option value="8">8</option>
                               <option value="9">9</option>
                              <option value="10">10</option>
                          </select>
                     </div>
                     <div class="form-group">
                          <label for="description">Book Description</label>
                          <textarea name="description" class="form-control" rows="5" id="description" placeholder="Write book description.." required="required" onkeyup="countChar(this)"></textarea><div class="feedback">300 characters remaining</div>
                    </div>
                     <input type="submit" id="btn-registration" class="btn btn-success" value="
                     Add Book">
              </form>
            </div><!--container-->
        </div>
<footer class="bottomFooter">      
 <div id="top-footer">
     <center><p>Reproduction of site books is authorized only for informative purposes and strictly for personal, private use.</p></center>
     <center><p>Online Direct Download for free and membership</p></center>
     <center><p><b>IT eBooks Group &COPY; 2014-2015</b></p></center>
 </div>
</footer>

 	<script type="text/javascript">
    function readsBy(){
        var read=document.getElementById("readBy").value;
        if(read == "download"){
          document.getElementById("fileCopy").disabled=true;         
        }else{
            document.getElementById("fileCopy").disabled=false;
        }
    }
    $('.handle').on('click', function(){
        $('nav ul').toggleClass('showing');
    });
    

    
</script>
    </body>
</html>

<%}%>