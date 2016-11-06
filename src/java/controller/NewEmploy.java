/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NewEmpAdd;
import javax.servlet.http.HttpSession;
/**
 *
 * @author MS Hossain
 */
public class NewEmploy extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String empid=request.getParameter("empid");
        String empname=request.getParameter("empname");
        String empdeg=request.getParameter("empdeg");
        String gender=request.getParameter("gender");
        String emppass=request.getParameter("emppass");
        
        if(empid.equals(null)||empid=="" ||empname.equals(null)||empname=="" ||empdeg.equals(null)||empdeg==""
                ||emppass.equals(null)||emppass==""){
            
            request.setAttribute("err", "Must be filup all field");
            //getServletContext().getRequestDispatcher("/admin/empadd.jsp").forward(request, response);
            response.sendRedirect("admin/empadd.jsp");
        }else{
            NewEmpAdd m=new NewEmpAdd();
        m.setEmpID(empid);
        m.setEmpName(empname);
        m.setEmpdeg(empdeg);
        m.setGender(gender);
        m.setEmppass(emppass);
        
        String sql="insert into emp_info(emp_id, name, designation, gender, pass) values(?,?,?,?,?)";
        int i=DAO.newEmp(m,sql);
        
        if(i!=0){
            request.setAttribute("err", "Data Insert Successfully done.");
           //getServletContext().getRequestDispatcher("/admin/empadd.jsp").forward(request, response);
           response.sendRedirect("admin/empadd.jsp");
        }else{
            System.out.print("Data Insert Failed");
            response.sendRedirect("admin/failed.jsp");
        }
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
