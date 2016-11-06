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
import model.AdminLoginModel;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MS Hossain
 */
public class AdminLogin extends HttpServlet {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        
        String user=request.getParameter("adminid");
        String pass=request.getParameter("adminpass");
        
        if(user.equals(null)||user==""||pass.equals(null)||pass==""){
            request.setAttribute("err", "Must be filup All Field");
            getServletContext().getRequestDispatcher("/admin/index.jsp").forward(request, response);
        }
        
        AdminLoginModel m=new AdminLoginModel();
        m.setAdminLogin(user);
        m.setAdminPass(pass);
        
       String sql="Select * from admin_login where userid=? and pass=?";
       HttpSession session=request.getSession();
        ResultSet rs=DAO.adminLogon(m,sql);
    
        try {
            if(rs.next()){
                session.setAttribute("user","success");
                session.setAttribute("fullname", rs.getString("name"));
               //response.sendRedirect("admin/adminhome.jsp");
                getServletContext().getRequestDispatcher("/admin/adminhome.jsp").forward(request, response);
            }else{
                session.setAttribute("err", "User Password not valid");
                getServletContext().getRequestDispatcher("/admin/index.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
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
