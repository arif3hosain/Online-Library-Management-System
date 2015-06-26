<%-- 
    Document   : profile
    Created on : May 5, 2015, 10:25:03 AM
    Author     : Arif
--%>
<%@page import="models.Admin"%>
<%@page import="java.util.List"%>
<%@page import="models.Bookissue"%>
<%@page import="models.Member" %> 
<%
Member registration=(Member)session.getAttribute("user");
   if(registration==null){
    response.sendRedirect("login.jsp");
   }else{
       
       Admin issuedBooks=new Admin();
       List<Bookissue> list= issuedBooks.searchByEmail(registration.getEmail());
        
 %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <meta charset="UTF-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>  
          <script src="http://maps.googleapis.com/maps/api/js"></script> 
          <script type="text/javascript" src="script.js"></script>
		  <link rel="stylesheet" type="text/css" href="largeDevice.css">   
          <link rel="stylesheet" type="text/css" href="middleDevice.css">
          <link rel="stylesheet" type="text/css" href="smallDevice.css"> 
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
                                     </b></p>    				</div>
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
        <div id="profile-body">
            <div id="profile" class="table-responsive">
                <table id="profile-table">
                    <tbody>
                        <tr>
                            <td><label>Full Name</label></td>
                            <td><%out.print(registration.getFirstName()+" "+registration.getLastName());%></td>
                        </tr>
                         <tr>
                            <td><label>Email</label></td>
                            <td><%out.print(registration.getEmail());%></td>
                        </tr>
                        <tr>
                            <td><label>Mobile</label></td>
                            <td><%out.print(registration.getMobile());%></td>
                        </tr>
                        <tr>
                            <td><label>Gender</label></td>
                            <td><%out.print(registration.getGender());%></td>
                        </tr>
                         <tr>
                            <td><label>Birth Date</label></td>
                            <td><%out.print(registration.getBirthDate());%></td>
                        </tr> 
                         <tr>
                            <td><label>Country</label></td>
                            <td><%out.print(registration.getLocation());%></td>
                        </tr>                        
                        <tr>
                            <td><label>Member from</label></td>
                            <td><%out.print(registration.getRegistrationDate());%></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2"><a class="btn btn-primary" data-title="Update profile" data-toggle="modal" data-target="#updateProfile">Update Profile</a></td>

                            
                            
                            
                            
                            
                        </tr>
                    </tfoot>
                </table>
            </div><!--class profile-->
            <div id="issued-books" class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Issue ID</th>
                            <th>Book ID</th>
                            <th>Issue Date</th>
                            <th>Return Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                           for(Bookissue issue: list){%>
                           <tr>
                               <td><%out.print(issue.getIssueId());%></td>   
                            <td><% out.print(issue.getBookId());%></td>
                            <td><% out.print(issue.getIssueDate());%></td>
                            <td><% out.print(issue.getDueDate());%></td>                       
                           </tr>
                           <%}%>
                    </tbody>
                </table>
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

<div class="modal fade" id="updateProfile" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Update Profile</h4>
            </div>

            <div class="modal-body">
                <!-- The form is placed inside the body of modal -->
                <form action="updateprofile" id="profileForm" method="post" class="form-horizontal" style="width: 80%; margin: 0 auto;">
                    <div class="form-group">
                        <label for="id">Member ID</label>                   
                        <input type="text" readonly value="<%out.print(registration.getId());%>" class="form-control" name="id" id="id" />                    
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name</label>                   
                        <input type="text" value="<%out.print(registration.getFirstName());%>" class="form-control" name="firstName" id="firstName" />                    
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name</label>                   
                        <input type="text" value="<%out.print(registration.getLastName());%>" class="form-control" name="lastName" id="lastName" />                    
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>                   
                        <input type="text" readonly value="<%out.print(registration.getEmail());%>" class="form-control" name="email" id="email" />                    
                    </div>

                    <div class="form-group">
                        <label for="mobile">Mobile</label>                   
                        <input type="text" value="<%out.print(registration.getMobile());%>" class="form-control" name="mobile" id="mobile" />                    
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>                   
                        <input type="text" value="<%out.print(registration.getUserPassword());%>" class="form-control" name="password" id="password" />                    
                    </div>



                    <div class="form-group">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> 

<script>
 
</script>
    </body>
</html>
<%
   }                      
%>