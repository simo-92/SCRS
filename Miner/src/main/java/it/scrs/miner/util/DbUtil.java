package it.scrs.miner.util;

import java.util.*;
import java.io.*;
import java.sql.*;

public class DbUtil {
   
    private static DbUtil istance = null;
    private final String utente; 
    private final String password;
    private final String dbUrl;
    private Connection conn;
    private Statement stmt;
    private ResultSet ris;
    
    private DbUtil(){
        
        Properties prop = new Properties();
        InputStream in = this.getClass().getResourceAsStream("/conf/jdbc.properties");
        try {
            prop.load(in);
        } catch (IOException ex) {
            System.out.println(ex.toString());
        }
        this.dbUrl = prop.getProperty("databaseurl");
        this.utente = prop.getProperty("username");
        this.password = prop.getProperty("password");
           
       }
    
    
    public static DbUtil getIstance(){
        if(istance == null){
            istance = new DbUtil();
        }
        return istance;
    }
    
    public ResultSet eseguiQuery(String query){
        
        try{
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection(this.dbUrl,utente,password);
          stmt = conn.createStatement();
          ris = stmt.executeQuery(query);
        }catch(Exception e){
            e.printStackTrace();
        }
        return ris;     
    }
    
    
    public int eseguiUpdate(String query){
         
         int righeAggiornate = 0;
         //int lastIndex = -1;
         try{
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(this.dbUrl,utente,password);       
           stmt = conn.createStatement();
           righeAggiornate = stmt.executeUpdate(query);//,Statement.RETURN_GENERATED_KEYS);
           /*ResultSet r = stmt.getGeneratedKeys();        
           while(r.next()){
               lastIndex = r.getInt(1);
           }*/
         }catch(Exception e){
             e.printStackTrace();
             righeAggiornate = 0;
           //  lastIndex = -1;
         }
       //  InsertResult ret = new InsertResult();
        // ret.setLastIndex(lastIndex);
       //  ret.setNumberOfUpdatedRow(righeAggiornate);
         return righeAggiornate; 
    }
    
    public void chiudiConnessioni(){
        try{
            if(this.ris != null)
                conn.close();
        }catch(Exception e){}
        try{
            if(this.stmt != null)
                conn.close();
        }catch(Exception e){}
        try{
            if(this.conn != null)
                conn.close();
        }catch(Exception e){}       
    }
    
    /* FORSE CI TORNA UTILE 
    public class InsertResult{
        private int numberOfUpdatedRow;
        private int lastIndex;

        public int getNumberOfUpdatedRow() {
            return numberOfUpdatedRow;
        }

        public void setNumberOfUpdatedRow(int numberOfUpdatedRow) {
            this.numberOfUpdatedRow = numberOfUpdatedRow;
        }

        public int getLastIndex() {
            return lastIndex;
        }

        public void setLastIndex(int lastIndex) {
            this.lastIndex = lastIndex;
        }
           
    } */
}
