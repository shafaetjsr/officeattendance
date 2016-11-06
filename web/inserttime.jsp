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
        <h1>hello ${user}</h1>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/office_attend" 
        user="root" password="811044"/>
        
        <sql:update dataSource="${ dbsource}" var="result">
		INSERT INTO `emp_attend_info`(emp_id,time,status,name) VALUES('${empid}',NOW(),1,'${fulname}');
		
	</sql:update>
	
	<c:if test="${result>=1}">
            <c:redirect url="success.jsp">
                <c:out value="done"></c:out>
            </c:redirect>
            
	</c:if>
    </body>
</html>
