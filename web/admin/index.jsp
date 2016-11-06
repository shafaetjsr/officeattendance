<%-- 
    Document   : index
    Created on : Oct 28, 2016, 11:24:29 PM
    Author     : MS Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="../CSS/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
    </head>
    <body style="background-color: green" >
        
        <form action="/OTA/AdminLogin" method="POST" name="frm" >
            <h3 align="center"><font color="Yellow">${err}</font></h3>
            <table border="1" align="center">
                <tr>
                    <th colspan="2">Admin Login</th>
                </tr>
                <tr>
                    <td>Admin User: </td>
                    <td><input type="text" name="adminid"></td>
                </tr>
                <tr>
                    <td>Admin Password: </td>
                    <td><input type="password" name="adminpass"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
