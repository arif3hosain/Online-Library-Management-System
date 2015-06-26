<%@page import="model.Member" %> 
<%
Member registration=(Member)session.getAttribute("user");
   if(registration==null){
    response.sendRedirect("login.jsp");
   }else{
   
 %>  

<!DOCTYPE html>
<html>
    <head>
        <title>Have a contact.</title>
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
                 +"&nbsp; <a href=logout.jsp title=Logout style='color:orange;'><b>Logout</b></a>"  


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
        <div id="contact-body" class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-5">
            <article>
                 <header><h3>Daffodil Institute of IT</h3></header>
                 <footer>Daffodil academy library</footer>
                 <address>
                     <p>9/1,Panthapath,Dhaka-1205, Bangladesh <br><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp; librarysupport@diit.info</p><p><span class="glyphicon glyphicon-earphone"></span> &nbsp;&nbsp;&nbsp;+8801365874569 
                     <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+8801754258963</p>
                </address>
             </article>

        </div>
        <div class="col-xs-12 col-sm-12 col-md-7" class="map-div">
             <div id="googleMap">
                 
             </div>
        </div>
    </div>
             
             <div id="contact-div" class="container">
             <p class="form-title">What's on your mind?</p>
             <form action="leaveAComment" name="contact-form" role="form" class="contact-form" >
                         <div class="form-group">
                              <label for="fullName">Full Name</label>
                              <input type="text" name="fullName"  id="fullName" class="form-control" placeholder="Full Name" required="required">
                         </div>
                          <div class="form-group">
                              <label for="email">Email</label>
                              <input type="email" name="email"  id="email" class="form-control" value="<%=registration.getEmail()  %>" disabled="">
                         </div>
                         <div class="form-group">
                              <label for="subject">Subject</label>
                              <input type="text" name="subject"  id="subject"  class="form-control" placeholder="What about?" required="required">
                         </div> 
                        <div class="form-group">
                              <label for="comment">Comment</label>
                              <textarea name="comment" class="form-control" rows="5" id="comment" placeholder="Write your comments here.." onkeyup="countChar(this)" required="required"></textarea><div class="feedback">500 characters remaining</div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default">Send comment</button>
                            
                        </div>
                 </form>
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