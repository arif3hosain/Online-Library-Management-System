<%@page import="models.Member" errorPage="../JSP/errorPage.jsp"%>

<%
Member registration=(Member)session.getAttribute("user");
   if(registration !=null){
    response.sendRedirect("index.jsp");
   }else{   
 %> 
<!DOCTYPE html>
<html>
    <head>
        <title>Login page..</title>
        <jsp:include page="../html/reference.html" flush="true"></jsp:include>
    </head>
    <body>
    	<div class="mainHeader">
    		<div class="container-fluid">
    			<div class="row">
    				<div class="col-sm-8 col-md-8 col-lg-8 " id="title">
    					<p class="supHeading">Online Library Management System</p>
    				</div>
    				<div class="col-sm-4 col-md-4 col-lg-4" id="registration-login">
                                    <p class="log-reg"><b><a href="registration.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></b>&nbsp; &nbsp; <b><a href="adminlogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Admin Login</a></b></p>
    				</div>
    			</div>
    		</div>
    	</div><!--mainHeader-->
        <div id="login-body">
            <div class="container" id="login-form-div">
                <form  name="loginform"  class="login-form">
                  <div class="form-group">
                      <center><p id="loginresult" style="color: white; font-weight: bold;">&nbsp;</p></center>                     
                  </div>
                  <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email" required="required">
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="required">
                        </div>

                        <div class="form-group">
                            <input type="button" onclick="sendInfo()"  id="btn-login" value="LOGIN" class="btn btn-custom btn-sm btn-block"   />

                        </div>
                        
                         <div class="form-group">
                         <p style="color:#0080FF"><a href="enterEmail.jsp">Forget password</a></p>
                        </div>                        
              </form>               
              <div>
                  <center><input type="button" class="btn btn-success" value="Create an account" onclick="window.location.href='registration.jsp'"></center>
              </div>
            </div>      
        </div>
 	<script type="text/javascript">
    $('.handle').on('click', function(){
        $('nav ul').toggleClass('showing');
    });
</script>
         <footer class="bottomFooter">      
             <div id="top-footer">
                 <center><p class="footer-des">Reproduction of site books is authorized only for informative purposes and strictly for personal, private use.</p></center>
                 <center><p>Online Direct Download for free and membership</p></center>
                 <center><p><b>IT eBooks Group &COPY; 2014-2015</b></p></center>
             </div>
         </footer> 
<script>
    
    var request;  
    function sendInfo(){
        
    var email=document.loginform.email.value;  
    var pass=document.loginform.password.value;  
    
    
    var url="../../login?email="+email+"&pass="+pass+"";  
      
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    
    try  
    {  
    request.onreadystatechange=getInfo;  
    request.open("POST",url,true);  
    request.send();  
    }  
    catch(e)  
    {  
    alert("Unable to connect to server");  
    }  
   }  
      
    function getInfo(){  
    if(request.readyState==4){  
    var val=request.responseText;  
    if(val=='true'){
        location.href="index.jsp";
    }else{
        document.getElementById('loginresult').innerHTML=val; 
    }
    }   
    }  
      
    </script> 
    </body>
</html>
<%
   }                      
%>