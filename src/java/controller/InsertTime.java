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
import model.OfficeTimeInsert;

/**
 *
 * @author MS Hossain
 */
public class InsertTime extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        String sterTime=request.getParameter("starttime");
        String endTime=request.getParameter("endtime");
        
        OfficeTimeInsert m=new OfficeTimeInsert();
        m.setStrtime(sterTime);
        m.setEndtime(endTime);
        
        String sql="update office_time set start=? , end=? where id=1";
        double i=DAO.timeInsert(m,sql);
        
        if(i!=0){
            response.sendRedirect("admin/officetimeset.jsp");
        }else{
            out.print("Failed");
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
