package sql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Kmitle
 */
public class sqlBean {
    private String driver = "org.apache.derby.jdbc.ClientDriver";
    private String url = "jdbc:derby://localhost:1527/sample";
    private Connection conn = null;
    private Statement stmt = null;
    public sqlBean() {
        try {
                Class.forName(driver); 
        }
        catch(ClassNotFoundException ex) {
                System.out.println(ex.getMessage());
        }
    }
    public ResultSet executeQuery(String sql) 
    {
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(url,"app","app"); 
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } 
        catch(SQLException ex) { 
            System.out.println(ex.getMessage());
        }
        return rs;
    }
    public int executeUpdate(String sql)
    {
        int result=0;
        try{
            conn = DriverManager.getConnection(url,"app","app");
            stmt = conn.createStatement();
            result = stmt.executeUpdate(sql);
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return result;
    }
    public void close()
    {
        try{
            stmt.close();
            conn.close();
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void setDriver(String dstr)
    {
        this.driver=dstr;
    }
    public void setUrl(String cstr)
    {
        this.url=cstr;
    }
}
