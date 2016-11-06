
package dao;

import database.DB_connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AdminLoginModel;
import model.EmpLoginModel;
import model.NewEmpAdd;
import model.OfficeTimeInsert;
import model.UpdateEmp;

public class DAO {
    
    static Connection con;
    private static Connection connection(){
        con=null;
        con=DB_connect.getCon();
        return con;
    }

    public static ResultSet adminLogon(AdminLoginModel m, String sql) {
        ResultSet rs=null;
         con=connection();
        try {
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, m.getAdminLogin());
            st.setString(2, m.getAdminPass());
            
            rs=st.executeQuery();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rs;
    }

    public static int newEmp(NewEmpAdd m, String sql) {
     int i=0;
     con=connection();
        try {
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, m.getEmpID());
            st.setString(2, m.getEmpName());
            st.setString(3, m.getEmpdeg());
            st.setString(4, m.getGender());
            st.setString(5, m.getEmppass());
            
            i=st.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
     
     return i;
    }

    public static int empUpdate(UpdateEmp m, String sql) {
       int i=0;
       con=connection();
        try {
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setString(2, m.getDeg());
            st.setString(3, m.getUpgender());
            st.setString(4, m.getPass());
            
            i=st.executeUpdate();
            
        } catch (Exception e) {
        }
       
       return i;
        
    }

    public static ResultSet empLogin(EmpLoginModel m, String sql) {
       ResultSet rs=null;
       con=connection();
       
        try {
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, m.getEmpid());
            st.setString(2, m.getEmppass());
            
            rs=st.executeQuery();
            
        } catch (Exception e) {
        }
       
       return rs;
        
    }

    public static int insertDate(String empid, String inert) {
       int i=0;
       con=connection();
        try {
            PreparedStatement st=con.prepareStatement(inert);
            st.setString(1, empid);
            st.setString(3, "1");
            
            i=st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
       return i; 
    }

    public static double timeInsert(OfficeTimeInsert m, String sql) {
        double i=0;
        con=connection();
        try {
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, m.getStrtime());
            st.setString(2, m.getEndtime());
            i=st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return i;
    }
    
}
