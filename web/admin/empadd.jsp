<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
     <script>
        function myFunction() {
        document.getElementById("myForm").reset();
         }
</script>
    

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
              <div class="rightheader"><button class="btnlogout"><a href="logout.jsp"> Logout</a></button></div>
          </div>
		  <div class="maincontain">
			<div class="leftcontain">
			<ul>
			<li><a href="empadd.jsp">Add New Employ</a></li>
			<li><a href="areport.jsp">Attendance Report</a></li>
			<li><a href="listemp.jsp">Employ List</a></li>
                        <li><a href="officetimeset.jsp">Office Time Setting</a></li>
			</ul>
			</div>
                      <div class="rightcontain">
                          <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                             url="jdbc:mysql://localhost:3306/office_attend" 
                                             user="root" password="811044"/>
                          <sql:query dataSource="${dbsource}" var="result">
                              SELECT emp_id FROM emp_info order by id desc limit 1;
                          </sql:query>
                          
                          <form action="/OTA/NewEmploy" method="POST" id="myForm">
                              <font color="black">   <% if(request.getAttribute("err")!=null){ %>
                              <%= request.getAttribute("err") %>
                              <% }%>
                              </font>
                              <table border="1">
                                  <tr>
                                      <th colspan="2">New Employ Add</th>
                                  </tr>
                                  <tr>
                                      <td>Employ ID:</td>
                                      <c:set var="id_number" value="${(result.rows[0].emp_id) +1}"></c:set>
                                      
                                      <td><input type="text" name="empid" value="${id_number}"></td>
                                      
                                  </tr>
                                  <tr>
                                      <td>Employ Name:</td>
                                      <td><input type="text" name="empname"></td>
                                  </tr>
                                  <tr>
                                      <td>Employ Designation: </td>
                                      <td><input type="text" name="empdeg"></td>
                                  </tr>
                                   <tr>
                                      <td>Gender: </td>
                                      <td>
                                          <select name="gender">
                                              <option value="male">Male</option>
                                              <option value="female">Female</option>
                                          </select>
                                      </td>
                                  </tr>
                                   <tr>
                                      <td>Employ Password</td>
                                      <td><input type="text" name="emppass"></td>
                                  </tr>
                                   <tr>
                                       <td align="center"> <input type="button" onclick="myFunction()" value="Reset"></td>
                                       <td align="center"><input type="submit" value="Insert Data"></td>
                                       
                                  </tr>
                                  
                              </table>
                          </form> </div>
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