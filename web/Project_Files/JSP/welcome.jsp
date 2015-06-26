<!DOCTYPE html>
<html>
    <head>
        <title>Welcome page..</title>
        <jsp:include page="../html/reference.html" ></jsp:include>  <!--invoke codes of regerence.html-->     
    </head>
    <body style="background-color:  #8A4B08; ">
        <div class="welcomeHeader">
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
        </div><!--welcomeHeader-->
        <div id="welcome-body">
                <div class="slideshow">
                    <img src="../Images/font-image1.jpg" alt="slide-1">
                    <img src="../Images/font-image2.jpg" alt="slide-2">
                    <img src="../Images/font-image3.jpg" alt="slide-3">
                </div>
                <section class="features">
                    <p class="features-title">The integreted library management system for all</p>
                    <ul class="TickList">
                        <li>Create an account</li>
                        <li>Login into library</li>
                        <li>Library tutorial</li>
                        <li>Search required books</li>
                        <li>Search books by categories</li>
                        <li>Book issue</li>
                        <li>Download books</li>
                        <li>Be a member to download and read all type of books</li>
                        <li>Easy to access to the library and many more.</li>
                    </ul>
                </section>    <!--end features-->            
        </div>
    </body>
</html>
