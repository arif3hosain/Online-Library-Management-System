<!DOCTYPE html>
<html>
    <head>
        <title>Login page..</title>
        <jsp:include page="../html/reference.html" flush="true"></jsp:include>
    </head>
    <body style="background-color: #8A4B08;">
    	<div class="mainHeader">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 col-md-8 col-lg-8 " id="title">
                            <p class="supHeading">Online Library Management System</p>
                    </div>
                    <div class="col-sm-4 col-md-4 col-lg-4" id="registration-login">
                            <p class="log-reg"><b><a href="registration.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></b>&nbsp; &nbsp; <b><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></b></p>
                    </div>
                </div>
            </div>
    	</div>
        <div id="enterEmail-body">

            <div class="container" id="enterEmail-form-div">
                <form action="sendPassword" method="post">
                  <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required="required">
                  </div>
                  <input type="submit" id="btn-change" class="btn btn-primary btn-sm" value="Submit">
                </form>
            </div>      
        </div> 
         <footer class="bottomFooter">             
         </footer>
 	<script type="text/javascript">
    $('.handle').on('click', function(){
        $('nav ul').toggleClass('showing');
    });
</script>
    </body>
</html>
