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
    					<p class="log-reg"><b><a href="registration.jsp">Registration</a>&nbsp; or &nbsp;<a href="login.jsp">Login</a></b></p>
    				</div>
    			</div>
    		</div>
    	</div>
        <div id="changePassword-body">

            <div class="container" id="changePassword-form-div">
                <form action="changePassword" method="post">
                  <div class="form-group">
                      <label for="CreatePassword" class="changePassword">Create password</label>
                     <input type="password" name="createPassword" id="CreatePassword" class="form-control" placeholder="Create password" required="required"/>
                  </div>
                    <div class="form-group">
                       <label for="confirmPassword" class="changePassword">Confirm password</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required"/>
                        </div>
                  <input type="submit" id="btn-change" class="btn btn-default" value="Submit">
                  <input type="reset" id="btn-reset" class="btn btn-default" value="Reset">
                </form>
            </div>      
        </div>
    </body>
</html>
