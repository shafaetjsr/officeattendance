<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Admin Home Page</title>

    
    
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/style.css">

  </head>
  <body>
      <%
      response.setHeader("Pragma","No-cache");
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
      response.setDateHeader("Expire", -1);
      %>
      <%
      if(session.getAttribute("fullname") !=null && session.getAttribute("fullname")!=""){
          
          String userr=session.getAttribute("fullname").toString();
          
          %> 
     
      
      <div class="main">
          <div class="header">
              <div class="leftheader">Welcome to <b><%= userr%></b></div>
              <div class="rightheader"><button class="btnlogout"><a href="admin/logout.jsp"> Logout</a></button></div>
          </div>
		  <div class="maincontain">
			<div class="leftcontain">
			<ul>
			<li><a href="admin/empadd.jsp">Add New Employ</a></li>
			<li><a href="areport.jsp">Attendance Report</a></li>
			<li><a href="admin/listemp.jsp">Employ List</a></li>
                        <li><a href="officetimeset.jsp">Office Time Setting</a></li>
			</ul>
			</div>
                      <div class="rightcontain">
                          <%
                              Date date = new Date();
                              out.print( "<h2 align=\"center\">" +date.toString()+"</h2>");
                           %>
                      </div>
		  </div>
		  <div class="footer">
		  &copy; All right reserve by Shafeat Hossain
		  </div>
      </div>
 <%
      }else{
          out.print("Please enter Correct user and password");
          out.print("<a href='logout.jsp'>Login Again</a>");
      }
      %>
  </body>
</html>