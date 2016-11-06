package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_connect {

    public DB_connect() {
    }
    
    public static Connection con;
    
    static{
        try {
            Class.forName(Database_info.DRIVER);
            con=DriverManager.getConnection(Database_info.CON_STRING,Database_info.USER,Database_info.PASSWORD);
            
        } catch(ClassNotFoundException e){
           e.printStackTrace();
        }catch (Exception e) {
            System.out.println("Exception in goten");
        }
    }
    
    public static Connection getCon(){
        return con;
    }
    
    
}
