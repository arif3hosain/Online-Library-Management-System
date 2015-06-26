<%@page import="models.Book"%>
<%@page import="java.util.List"%>
<%@page import="models.Member" %> 
<%
Member registration=(Member)session.getAttribute("user");
   if(registration==null){
    response.sendRedirect("login.jsp");
   }else{
  
 %> 
<!DOCTYPE html>
<html>
    <head>
        <title>Index page..</title>
        <jsp:include page="../html/reference.html" flush="true"></jsp:include>              
          <script>
                $("document").ready(function(){
                    $(".slideshow").cycle();
                });
          </script>
    </head>
    <body class="body">
    	<div class="mainHeader">
    		<div class="container-fluid">
    			<div class="row">
    				<div class="col-sm-8 col-md-8 col-lg-8 " id="title">
    					<p class="supHeading">Online Library Management System</p>
    				</div>
    				<div class="col-sm-4 col-md-4 col-lg-4" id="registration-login">
       
                                    <p class="log-reg" ><b>Welcome &nbsp;<%= registration.getFirstName() +
                         " "+registration.getLastName()+"&nbsp; <a href=logout.jsp title=Logout >Logout</a>" %></b></p> 
    				</div>
    			</div>
    		</div>
    	</div>
    	 <nav id="navigation">
            <ul class="showing">
                <a href="index.jsp"  class="visited"><li>Home</li></a>
                <a href="bookSearch.jsp"><li>Books</li></a>
                <a href="profile.jsp"><li>Profile</li></a>
                <a href="about.jsp"><li>About</li></a>
                <a href="contact.jsp"><li>Contact</li></a>
            </ul>
            <div class="handle">Menu</div>
        </nav>
        <div id="home-body">      
            <div class="container" id="video-tutorial-div">
                     <div class="row">
                         <div class="col-lg-5"></div>
                         <div class="col-lg-7">
                             <video  controls id="video-tutorial">
                                 <source src="" type="video/mp4"/>
                                 <source src="" type="video/ogg"/>
                                 Your browser does not support HTML5 video.
                             </video>
                             <!--</br><a href="#" class="btn btn-success btn-large"><i class="icon-white icon-download"></i> Download</a>-->
                         </div>
                     </div></br>
                     <div class="row">
                     <%
                          Book query=new Book();
                          List<Book> bookList=query.booksQuery();
                          int increment=0;
                          for(Book book: bookList){
                            
                              increment=increment+1;
                              if(increment==1){%>
                              <div class="col-lg-3" id="home-book">
                                  <center><h4 style="color: blue; cursor: pointer;" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"><% out.print(book.getBookTitle()); %></h4></center>
                                   <img style="color: blue; cursor: pointer;" id="dynamicDivImage" src="<%out.print(book.getBookImage()); %>" alt="Book Image" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"/>
                                   <p><% out.print(book.getDescription()); %></p>
                               </div>                                 
                              <%}else if(increment==2){%>
                                  <div class="col-lg-3" id="home-book">
                                   <h4 style="color: blue; cursor: pointer;" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"><% out.print(book.getBookTitle()); %></h4>
                                   <img style="color: blue; cursor: pointer;" id="dynamicDivImage" src="<%out.print(book.getBookImage()); %>" alt="Book Image" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"/>
                                   <p><% out.print(book.getDescription()); %></p>
                               </div> 
                              <%}else if(increment==3){%>
                                <div class="col-lg-3" id="home-book">
                                   <h4 style="color: blue; cursor: pointer;" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"><% out.print(book.getBookTitle()); %></h4>
                                   <img style="color: blue; cursor: pointer;" id="dynamicDivImage" src="<%out.print(book.getBookImage()); %>" alt="Book Image" onClick="parent.location='bookDetails.jsp?id=<%=book.getBookId()%>'"/>
                                   <p><% out.print(book.getDescription()); %></p>
                               </div>                                 
                              <%}
                              
                          }
                          
                          
                         %>
                

                    </div>
                </div>
        </div><!--home-body-->        
         <footer class="bottomFooter" id="footer">             
         </footer>
 	<script type="text/javascript">
    $('.handle').on('click', function(){
        $('nav ul').toggleClass('showing');
    });
</script>
         <footer class="bottomFooter">      
             <div id="top-footer">
                 <center><p>Reproduction of site books is authorized only for informative purposes and strictly for personal, private use.</p></center>
                 <center><p>Online Direct Download for free and membership</p></center>
                 <center><p><b>IT eBooks Group &COPY; 2014-2015</b></p></center>
             </div>
         </footer>
    </body>
</html>
<%}%>