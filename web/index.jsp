<%-- 
    Document   : index
    Created on : Oct 28, 2016, 11:24:29 PM
    Author     : MS Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="../JS/date_time.js" ></script>
        <link href="../CSS/style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employ Attendance Login</title>
        <script>
            function date_time(id)
{
        date = new Date;
        year = date.getFullYear();
        month = date.getMonth();
        months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
        d = date.getDate();
        day = date.getDay();
        days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
        h = date.getHours();
        if(h<10)
        {
                h = "0"+h;
        }
        m = date.getMinutes();
        if(m<10)
        {
                m = "0"+m;
        }
        s = date.getSeconds();
        if(s<10)
        {
                s = "0"+s;
        }
        result = ''+days[day]+' '+d+' '+months[month]+' '+year+'<br><br> '+h+':'+m+':'+s;
        document.getElementById(id).innerHTML = result;
        setTimeout('date_time("'+id+'");','1000');
        return true;
}
            
        </script>
    </head>
    <body style="background-color: green" >
        
        
        
        <div style="margin-top: 100px; background-color: yellow; 
             width: 290px; height: 120px; align-content: center; margin-left: 530px; text-align: center;
             padding-top: 40px; font-size: 18px; font-weight: bold">
            
            <div>
            <span id="date_time"></span>
            <script type="text/javascript">window.onload = date_time('date_time');</script>
            
        </div>
        </div>
        <form action="/OTA/EmpLogin" method="POST" name="frm" >
            <h3 align="center"><font color="Yellow">${err}</font></h3>
            <h3 align="center"><font color="Yellow">${success}</font></h3>
            <table border="1" align="center">
                <tr>
                    <th colspan="2">Employ Login</th>
                </tr>
                <tr>
                    <td>Employ ID: </td>
                    <td><input type="text" name="empid"></td>
                </tr>
                <tr>
                    <td>Employ Password: </td>
                    <td><input type="password" name="emppass"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
