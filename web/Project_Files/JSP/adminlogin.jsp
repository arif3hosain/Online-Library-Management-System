<%-- 
    Document   : adminlogin
    Created on : May 9, 2015, 12:09:22 PM
    Author     : Arif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>Admin Login</title>
       <jsp:include page="../html/reference.html" flush="true"></jsp:include>
    </head>
    <body style="background-color: #8A4B08;">
        <div id="adminLoginBody">
            <form  name="loginform"  class="adminLoginForm" >
                <div class="form-group">
                    <center><p id="loginresult" style="color:darkred ; font-weight: bold;">&nbsp;</p></center>
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
                    <input type="button" onclick="sendInfo()" id="btn-login" class="btn btn-success" value="Login"  >
                </div>                        
            </form>
        </div>
        
        
        <script>
    
    var request;  
    function sendInfo(){
        
    var email=document.loginform.email.value;  
    var pass=document.loginform.password.value;  
    
    
    var url="adminlogin?email="+email+"&pass="+pass+"";  
      
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
      location.href='adminhome.jsp';  
    }else{
            document.getElementById('loginresult').innerHTML=val;  
    }
     
    }   
    }  
      
    </script> 
    </body>
</html>
