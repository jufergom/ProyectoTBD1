/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProyectoTeoria1.models;
import java.sql.*;
import java.util.Properties;

import javax.management.openmbean.OpenDataException;
import com.sybase.jdbc3.jdbc.SybDriver;

/**
 *
 * @author bgera
 */
public class Conexion {
    
    Connection conexion;
    SybDriver syDriver;
    Properties properties;
    String url;
    
    public Conexion() {
        try {
        
            Class.forName("com.sybase.jdbc3.jdbc.SybDriver").newInstance();
            //lo de arriba lo podemos igualar a sydriver
            properties = new Properties();
            properties.put("user", "sa");
            properties.put("password", "maximo1135");
            url = "jdbc:sybase:Tds:BGGUEVARA:5001/Teoria1";
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public void prenderConexion() {
        try {
            conexion = DriverManager.getConnection(url, properties);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public ResultSet getQueryResult(String sqlStatement) {
        try {
            Statement st = conexion.createStatement();
            //PASO 3, EJECUTAR SQL
            ResultSet rs = st.executeQuery(sqlStatement);
            return rs;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void actualizar(String sqlStatement) {
        try {
            Statement st = conexion.createStatement();
            st.executeUpdate(sqlStatement);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public void apagarConexion() {
        try {
            conexion.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
