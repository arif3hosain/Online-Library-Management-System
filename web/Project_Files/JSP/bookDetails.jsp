<%@page import="models.Book"%>
<%@page import="models.Member" %> 
<%@page import="java.util.List" %>
            <%
                Member registration=(Member)session.getAttribute("user");
                if(registration==null){
                 response.sendRedirect("login.jsp");
                }else{
                
                
                int id=Integer.parseInt(request.getParameter("id"));
                Book query=new Book();
                Book bookList=query.getById(id);
                String readBy=bookList.getReadBy();
                String pointer="";
                String onlyissue="";
                if(readBy.equalsIgnoreCase("issue")){
                    pointer="pointer-events:none;";
                    onlyissue="This book is only for issue.";
                }
                
            %>          
            

<!DOCTYPE html>
<html>
    <head>
        <title >Details about book</title>   
        <jsp:include page="../html/reference.html" flush="true"></jsp:include>
          <script>       
              function initialize() {
              var mapProp = {
                center:new google.maps.LatLng(23.75251,90.38236),
                zoom:19,
                mapTypeId:google.maps.MapTypeId.ROADMAP
              };
              var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
            }
            google.maps.event.addDomListener(window, 'load', initialize);      
        </script>
    </head>
    <body>
    	<div class="mainHeader">
            <div class="container-fluid">
                    <div class="row">
                            <div class="col-sm-8 col-md-8 col-lg-8 " id="title">
                                <p class="supHeading">Online Library Management System</p>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4" id="registration-login">
                                                     <p class="log-reg"><b>Welcome &nbsp;<%=registration.getFirstName() + " "+registration.getLastName()
                         +"&nbsp; <a href=logout.jsp title=Logout >Logout</a>"  
                        %>
                                 </b></p>	
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
        <div id="bookdetails-body">            
            <div id="book-details-div"  class="controller">
                <div class="row">
                    <div class="col-lg-3" >
                        <img src="<%out.println(bookList.getBookImage());%>" alt="Book Image" width="140" height="180" />
                    </div>
                    <div class="col-lg-9">
                        <p><%out.println(bookList.getDescription());%></p>
                    </div>
                </div>
                    <center><table class="book-details" >

                 <tr>
                     <td>Book Title:</td>
                     <td><%out.println(bookList.getBookTitle());%></td>
                 </tr>
                 <tr>
                     <td>ISBN:</td>
                     <td><%out.println(bookList.getIsbn());%></td>
                 </tr>
                 <tr>
                     <td>Author Name:</td>
                     <td><%out.println(bookList.getAuthorName());%></td>
                 </tr>
                 <tr>
                     <td>Publisher:</td>
                     <td><%out.println(bookList.getPublisher());%></td>
                 </tr>
                 <tr>
                     <td>Published Date:</td>
                     <td><%out.println(bookList.getPublishedDate());%></td>
                 </tr>
                 <tr>
                     <td>File Size:</td>
                     <td><%out.println(bookList.getFileSize());%></td>
                 </tr>
                 <tr>
                     <td>Language:</td>
                     <td><%out.println(bookList.getReadBy());%></td>
                 </tr>
                 <tr>
                     <td>Total Page:</td>
                     <td><%out.println(bookList.getTotalPage());%>&nbsp;&nbsp;Pages</td>
                 </tr>
                 <tr>
                     <td>Take Book By:</td>
                     <td><a href="<% out.print(bookList.getBookUrl());%>" style="<%out.print(pointer);%>"class="btn btn-success btn-md" download> Download &nbsp;<span class="glyphicon glyphicon-save"></span></a> </td>
                 </tr>
                 <%if(pointer !="" ){%>
                 <tr>
                     <td colspan="2"><h4><% out.print(onlyissue);%></h4></td>
                 </tr>  
                 
                 <%}%>
             </table></center><!-- onclick="addDownload(<%out.println(bookList.getBookId());%>)"-->
                 
             </div>
        </div>
     <footer class="bottomFooter">     
         <div id="top-footer">
             <center><p class="footer-des">Reproduction of site books is authorized only for informative purposes and strictly for personal, private use.</p></center>
             <center><p>Online Direct Download for free and membership</p></center>
             <center><p><b>IT eBooks Group &COPY; 2014-2015</b></p></center>
         </div>
     </footer>
 	<script type="text/javascript">
    $('.handle').on('click', function(){
        $('nav ul').toggleClass('showing');
    });
</script>


    </body>
</html>
<%
   }                      
%>