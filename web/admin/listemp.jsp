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
                              select * from emp_info;
                          </sql:query>
                          <table border="1">
                              <tr>
                                  <th>Employ ID:</th>
                                  <th>Employ Name:</th>
                                  <th>Designation:</th>
                                  <th>Gender :</th>
                                  <th>Password :</th>
                                  <th colspan="2">Action </th>
                              </tr>
                              <c:forEach items="${result.rows}" var="row">
                                  <tr>
                                      <td><c:out value="${row.emp_id}"></c:out></td>
                                      <td><c:out value="${row.name}"></c:out></td>
                                      <td><c:out value="${row.designation}"></c:out></td>
                                      <td><c:out value="${row.gender}"></c:out></td>
                                      <td><c:out value="${row.pass}"></c:out></td>
                                      <td><a href="editemp.jsp?emp_id=<c:out value="${row.emp_id }"/>">Edit</a></td>
                                      <td><a href="javascript:confirmGo('Sure to delete this record?','deleteemp.jsp?emp_id=<c:out value="${row.emp_id }"/>')">Delete</a></td>
                                      
                                  </tr>
                              </c:forEach>
                          </table>
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