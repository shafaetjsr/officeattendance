/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.EmpLoginModel;

/**
 *
 * @author MS Hossain
 */
public class EmpLogin extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        
        String empid=request.getParameter("empid");
        String emppass=request.getParameter("emppass");
        
        EmpLoginModel m=new EmpLoginModel();
        m.setEmpid(empid);
        m.setEmppass(emppass);
        
        if(empid.equals(null)||empid=="" || emppass.equals(null) || emppass==""){
            
            request.setAttribute("err", "Must be filup All Field");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        
        String sql="select * from emp_info where emp_id=? and pass=?";
        HttpSession session=request.getSession();
        ResultSet rs=DAO.empLogin(m,sql);
        
        try {
            if(rs.next()){
                String String = rs.getString("name").toString();
                request.setAttribute("fulname", String);
                request.setAttribute("succcess", "You are login successfully.");
                request.setAttribute("empid", empid);
             getServletContext().getRequestDispatcher("/inserttime.jsp").forward(request, response);
                 
            }else{
                request.setAttribute("err", "User password not valid");
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpLogin.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception e){
            e.printStackTrace();
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
