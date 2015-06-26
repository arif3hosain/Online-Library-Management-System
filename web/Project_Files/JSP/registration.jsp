<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
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
                                    <p class="log-reg"><b><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Login</a></b></p>
    				</div>
    			</div>
    		</div>
    	</div>
        <div id="registration-body">
 
            <div class="container" id="reg-form-div"><!--onsubmit="return checkRegistrationValidation()"-->
                <form action="../../registration" method="post"  name="registrationForm" class="registration-form" onsubmit="return checkRegistrationValidation()">
                  <p></p>
                        <div class="form-group">
                              <label for="firstName">First Name</label>
                              <input type="text" name="firstName"  id="firstName" class="form-control" placeholder="First name" required="required">
                         </div>
                         <div class="form-group">
                              <label for="lastName">Last Name</label>
                              <input type="text" name="lastName"  id="lastName" class="form-control" placeholder="Last name" required="required">
                         </div>
                         <div class="form-group">
                              <label for="email">Email</label>
                              <input type="email" name="email" id="email" class="form-control" placeholder="somebody@example.com" required="required">
                         </div>
                        <div class="form-group">
                              <label for="createPassword">Create Password</label>
                              <input type="password" name="createPassword" data-minlength="6" id="createPassword" minlength="8" class="form-control" placeholder="Password" required="required">
                         <!--<span class="help-block">Minimum of 6 characters</span>-->
                        </div>
                         <div class="form-group">
                              <label for="confirmPassword">Confirm Password</label>
                              <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                         </div>
                         <div class="form-group">
                              <label for="dob">Birth Date</label>
                              <input type="date" id="datepicker" name="dob" class="form-control" placeholder="mm/dd/yyyy" required="required"/>
                         </div>
                         <div class="form-group">
                              <label for="gender">Gender</label>
                              <input type="radio" name="gender" value="male"  id="gender" required> Male
                              <input type="radio" name="gender" value="female" id="gender" required> Female
                         </div>
                         <div class="form-group">
                              <label for="mobile">Mobile Number</label>
                              <input type="text" name="mobile" id="mobile" class="form-control" placeholder="Mobile number" required="required">
                         </div>
                         <div class="form-group">
                              <label for="location">Location</label>
                              <select class="form-control" name="country">
                                 <option value="Bangladesh">Bangladesh</option>
                                 <option value="India">India</option>
                               </select>
                         </div>
                         <input type="submit" id="btn-registration" class="btn btn-primary" value="
                                Register">
                         <div class="form-group">
                             <a href="login.jsp" style="font-size: .9em">Already registered?</a>
                          </div>
              </form>
            </div>      
        </div>
         <footer class="bottomFooter">             
         </footer>
 	<script type="text/javascript">
            $(function(){
                $('#datepicker').datepicker();
            });
  var xmlObject;
    function checkRegistrationValidation(){
        var firstName=document.registrationForm.firstName.value;
        var lastName=document.registrationForm.lastName.value;
        var email=document.registrationForm.email.value;
        var createPassword=document.registrationForm.createPassword.value;
        var confirmPassword=document.registrationForm.confirmPassword.value;
        var dob=document.registrationForm.dob.value;
        var gender=document.registrationForm.gender.value;
        var mobile=document.registrationForm.mobile.value;
        var country=document.registrationForm.country.value;
            var exp=/^[a-zA-Z]+$/;
            var tDate=new Date();
            var date=new Date(document.getElementById('datepicker').value);
            var diff=Math.abs(date.getTime()-tDate.getTime());
            var age=Math.ceil(diff/(1000*(24*3600)));          
            var year=Math.ceil(age/365);
         
        if(isNaN(firstName)==false){
            alert("First Name must be only letters");
            return false;
        }else if(isNaN(lastName)==false){
            alert("Last Name must be only letters");
            return false;
        }else if(createPassword.length <8){
            alert("Password must be more than 8 digits");
            document.registrationForm.createPassword.value="";
            
            return false;
        }else if(createPassword != confirmPassword){          
            document.registrationForm.confirmPassword.value="";
             alert("Password does not matched");
             document.getElementById('confirmPassword').autofocus;
            return false;
        }else if(year<=15){
            alert("Age must be more than 15");
            return false;
        } 
        
        else if(isNaN(mobile)){
            alert("Mobile number must be only numbers");
            return false;
        }else if(mobile.length <5){
            alert("Mobile number must more than 5 digits");
            return false;
        }
        else{/*
            alert('okey go to ajax');
           
            if(window.XMLHttpRequest){
                xmlObject=new XMLHttpRequest();
            }else if(window.ActiveXObject){
                xmlObject=new ActiveXObject("Microsoft.XMLHTTP");
            }
            var url="../../registration?firstName="+firstName+"&lastName="+lastName+"&email="+email+"&password="+createPassword+
                    "&dob="+dob+"&gender="+gender+"&mobile="+mobile+"&location="+location+"";
          try{   
                alert('state change');
            xmlObject.onreadystatechange=getRegister;
            xmlObject.open("POST", url, true);
            xmlObject.send();
              alert('send');
           } catch(e){
               alert("Unable to connect to the server");
           }//end try
           
        }*///end of else

    }
       function getRegister(){ 
             alert('get register');
    if(xmlObject.readyState==4){  
    var val=xmlObject.responseText;  
    if(val=='true'){
        location.href="index.jsp";
    }else{
        document.getElementById('regStatus').innerHTML=val; 
    }
    }   
    } 
</script>
<p id="regStatus"></p>
    </body>
</html>
