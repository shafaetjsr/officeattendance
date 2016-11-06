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
import model.UpdateEmp;

/**
 *
 * @author MS Hossain
 */
public class EditEmp extends HttpServlet {


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String userid=request.getParameter("emp_id");
        
        String name=request.getParameter("name");
        String deg=request.getParameter("deg");
        String upgender=request.getParameter("upgender");
        String pass=request.getParameter("pass");
        
        UpdateEmp m=new UpdateEmp();
        m.setName(name);
        m.setDeg(deg);
        m.setUpgender(upgender);
        m.setPass(pass);
        
       String sql="update emp_info set name=?,designation=?,gender=?,pass=? where emp_id='"+userid+"'";
       
     int i=DAO.empUpdate(m, sql);
      if(i!=0){
            request.setAttribute("err", "Data Update Successfully done.");
         //getServletContext().getRequestDispatcher("/admin/empadd.jsp").forward(request, response);
           response.sendRedirect("admin/listemp.jsp");
        }else{
            System.out.print("Data Insert Failed");
            response.sendRedirect("admin/failed.jsp");
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
