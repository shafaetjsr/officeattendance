<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                             url="jdbc:mysql://localhost:3306/office_attend" 
                                             user="root" password="811044"/>
                  
           <sql:update dataSource="${dbsource}" var="result">
		 DELETE from emp_info where emp_id='${param.emp_id}'
		</sql:update>
                
           <c:if test="${result>=1}">
	<font color="RED">Data deleted successfully done</font>
	<a href="listemp.jsp">Go Back</a> &nbsp;
	<a href="adminhome.jsp">Go Home</a>
	</c:if>
    </body>
</html>
