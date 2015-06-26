 <%@page import="models.Member" %> 
<%
Member registration=(Member)session.getAttribute("user");
   if(registration==null){
    response.sendRedirect("login.jsp");
   }else{
   
 %> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.omg.CORBA.BAD_CONTEXT"%>


<%
  String pages=request.getParameter("page");    //get data from page url
  String searchByKeyWork=request.getParameter("keyWord");
  String category=request.getParameter("category");
  String type=request.getParameter("type");
 
  
  if(type == null){
      type="title";
  }
 
  int pageIndex=0;
  if(pages == null ){
     pageIndex=Integer.parseInt(pages="0");
  }else{
      pageIndex=Integer.parseInt(pages);
  }
  int displayItemsPerPage=4;
       if(pageIndex>1){
         pageIndex=(pageIndex*displayItemsPerPage)-displayItemsPerPage;
     }else if(pageIndex==1){
         pageIndex=0;
     }
       //get a selected category
      // String category=request.getParameter("category");
       
       
       //create database connection
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olms","root","");  
Statement state=con.createStatement();

  int rowCount=0;
    //create ResultSet object for retrieving row data
 ResultSet rs=null;
 ResultSet rows=null;
 boolean queryResult=false;
 
if(category !=null && category !="" && searchByKeyWork.equals("") && type.equals("title")){
             rows=state.executeQuery("select * from books where BookCategory='"+category+"'");
         while(rows.next()){
             queryResult=true;
         rowCount++;
       }rows.close();
   rs=state.executeQuery("select * from books where BookCategory='"+category+"'"); 
   
  }
else if( category!=null && category.equals("")&& searchByKeyWork !=null  && type.toString().equalsIgnoreCase("isbn")){
          String sql="select * from books where ISBN='"+searchByKeyWork+"'";
          rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery("select * from books where ISBN='"+searchByKeyWork+"'");             
  }else if( category!=null && !category.equals("")&& searchByKeyWork !=null  && type.toString().equalsIgnoreCase("isbn")){
          String sql="select * from books where BookCategory='"+category+"' and ISBN='"+searchByKeyWork+"'";
          rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery(sql);             
  }//***************
  else if( category!=null && category.equals("")&& searchByKeyWork !=null  && type.toString().equalsIgnoreCase("author")){
          String sql="select * from books where AuthorName='"+searchByKeyWork+"'";
          rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery(sql);             
  }else if( category!=null && !category.equals("")&& searchByKeyWork !=null  && type.toString().equalsIgnoreCase("author")){
          String sql="select * from books where BookCategory='"+category+"' and AuthorName='"+searchByKeyWork+"'";
          rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery(sql);             
  }
 else if(searchByKeyWork !=null && !searchByKeyWork.equals("") && category !=null && !category.equals("")){
        String sql="select * from books where BookCategory='"+category+"' and BookTitle like '"+searchByKeyWork+"%' limit 0,4";
        rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery(sql);   
            
 }else if(searchByKeyWork !=null && !searchByKeyWork.equals("") && category !=null && category.equals("")){
        String sql="select * from books where BookTitle like '"+searchByKeyWork+"%' limit 0,2";
        rows=state.executeQuery(sql);
          while(rows.next()){
           queryResult=true;   
          }rows.close();
          rs=state.executeQuery(sql);   
            
 }//((searchByKeyWork == null ) && type.toString().equalsIgnoreCase("title") && category ==null)
  else {
       rows=state.executeQuery("select * from books");
         while(rows.next()){
             queryResult=true;
         rowCount++;
       }rows.close();//select * from books where BookTitle like '%programming%' limit 2, 2
   rs=state.executeQuery("select * from books limit "+pageIndex+","+displayItemsPerPage+"");    
  }


%> 


<!DOCTYPE html>
<html>
    <head>
        <title>Query a book..</title>
        <jsp:include page="../html/reference.html" flush="true"></jsp:include>
        <script type="text/javascript">
            $(function(){
                 $("#datepicker").datepicker();
            });
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
        <div id="book-search-body">
           <div class="container" id="search">
             <div class="row">
               <div class="col-xs-12 col-sm-4 col-md-5 col-lg-4">
                   <h4 style="color: white; font-weight: bold;" class="search-ebook">Search Library eBook</h4>
               </div>
               <div class="col-xs-12 col-sm-8 col-md-7 col-lg-8">
                   <form action="bookSearch.jsp?"  method="get" name="searchForm">
                  <select class="form-control" name="category" id="book-categories" onchange="onchangeValue(this.value)">
                                <option value="">All categories</option>
                                <option value="Java programming">Java programming</option>
                                <option value="SQL database">SQL database</option>
                                <option value="NoSQL database">NoSQL database</option>
                                <option value="PHP programming">PHP programming</option>
                                <option value="Microsoft languages">Microsoft languages</option>
                                <option value="Microsoft office programms">Microsoft office programms</option>
                  </select><br>
                  <div class="input-group">
                      <input type="text" class="form-control"  name="keyWord" placeholder="Search by Title" id="searchBox">
                      <span class="input-group-btn">
                          <button class="btn btn-default" type="submit" onclick="">Search</button> </span>                        
                  </div><!-- /input-group -->
                  <div class="input-group" style="color: white;">
                          <table>
                          <tr>
                              <td width="10"><input type="radio" id="radioTitle" name="type" value="title" checked ></td>
                              <td width="50">Title</td>
                              <td width="20"><input type="radio" id="radioISBN" name="type" value="ISBN" ></td>
                              <td width="50">ISBN</td>
                              <td width="20"><input type="radio" id="radioAuthor" name="type" value="author" ></td>
                              <td width="50">Author</td>
                          </tr>
                      </table>
                      </div>

                  </form>
               </div>
             </div>
           </div> 
           <hr> 
        <div id="searching-book" class="container">
            <% 
           
            while(rs.next()){%>
             <div class="row"  id="row-div">
                 <div class="col-lg-3" id="image-div"><center><img id="dynamicDivImages" src="<%out.print(rs.getString(10)); %>" alt="Book Image" 
                    onClick="parent.location='bookDetails.jsp?id=<%=rs.getInt(1)%>'" style="cursor: pointer;"/></center></div>
                    <div class="col-lg-9" id="dynamicDivDes"><h4 onClick="parent.location='bookDetails.jsp?id=<%=rs.getInt(1)%>'" style="color: blue; cursor: pointer;"><% out.print(rs.getString(2)); 
               %></h4><p><% out.print(rs.getString(13)); %></p></div>
            </div><!--row-->                         
            <%}
            if(queryResult==false){%>
            <div class="queryFalse" style="width: 100%; height: 300px;">
                <center><p style="color: white;"><b>Query result could not found!!</b></p></center>
            </div>           
            <%}%>
          </div><!--search-result-->
          <div class="container" id="pagination-div">
              <center><ul class="pagination">
                  <%
                     int pager=(int)rowCount/displayItemsPerPage;                   
                      for(int i=1; i<=pager; i++){%>
                          <li><a href="?page=<%=i %>"><%=i%></a></li>                                 
                  <%} %>
              </ul></center>
          </div>                     
        </div><!-- book-search-body-->

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
    function onchangeValue(){
        var x=document.getElementById("book-categories").value;
        alert("You selected: "+x);
        
    }
</script>
 <script>  
            var request;  
            function onchangeValue(value){  
           
            
            var url="serverPage.jsp?val="+value;

            if(window.XMLHttpRequest){  
            request=new XMLHttpRequest();  
            }  
            else if(window.ActiveXObject){  
            request=new ActiveXObject("Microsoft.XMLHTTP");  
            }  

            try{  
            request.onreadystatechange=getInfo;  
            request.open("GET",url,true);  
            request.send();  
            }catch(e){alert("Unable to connect to server");}  
            }  

            function getInfo(){  
            if(request.readyState==4){  
            var val=request.responseText;  
            document.getElementById('amit').innerHTML=val;  
            }  
            }  

    </script>  
    <script>
        
         $(document).ready(function(){
             $("#radioTitle").click(function(){
                $("#searchBox").attr("placeholder", "Search by Title");
             });
         });
         
         $(document).ready(function(){
             $("#radioISBN").click(function(){
                $("#searchBox").attr("placeholder", "Search by ISBN");
             });
         });
         
         $(document).ready(function(){
             $("#radioAuthor").click(function(){
                $("#searchBox").attr("placeholder", "Search by Author");
             });
         });
    
    </script>
    </body>
</html>

<%}%>