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

    
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
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
			<li><a href="">Attendance Report</a></li>
			<li><a href="listemp.jsp">Employ List</a></li>
                        <li><a href="officetimeset.jsp">Office Time Setting</a></li>
			</ul>
			</div>
                      <div class="rightcontain">
                          <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                             url="jdbc:mysql://localhost:3306/office_attend" 
                                             user="root" password="811044"/>
                  
         <sql:query dataSource="${dbsource}" var="result">
          select * from emp_info where emp_id=?;
          <sql:param value="${param.emp_id}"></sql:param>
         </sql:query>
          <form action="/OTA/EditEmp" method="POST">
              <table border="1">
                  <tbody>
                  <tr>
                      <th colspan="5"> Edit Your Information</th>
                  </tr>
                  </tbody>
                  <c:forEach items="${result.rows}" var="row">
                       <tr>
                   <td>Employ ID: </td>
                   <td><input type="text" readonly="readonly" value="${param.emp_id}" name="emp_id"></td>
                  </tr>
                  <tr>
                   <td>Employ Name: </td>
                      <td><input type="text" value="${row.name}" name="name"></td>
                  </tr>
                  <tr>
                  <td>Employ Designation: </td>
                      <td><input type="text" value="${row.designation}" name="deg"></td>
                  </tr>
                  <tr>
                  <td>Employ Gender: </td>
                  <td>
                      <select name="upgender">
                          <option value="male">Male</option>
                          <option value="female">Female</option>
                      </select>
                  </td>
                      
                  </tr>
                  <tr>
                  <td>Employ Password: </td>
                      <td><input type="text" value="${row.pass}" name="pass"></td>
                  </tr>
                  <tr>
                      <td colspan="5"><input type="submit" value="Update"> </td>
                  </tr>
                  </c:forEach>
                 
              </table>
          </form>
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