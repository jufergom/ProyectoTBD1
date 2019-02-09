/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProyectoTeoria1.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ProyectoTeoria1.models.Conexion;
import ProyectoTeoria1.models.EncryptionDemo;
import java.sql.ResultSet;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author jufer
 */
public class LoginCheckServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static String currentUser = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //crear conexion con la base de datps
        Conexion c = new Conexion();
        c.prenderConexion();
        //para la encriptacion
        String k = "Bar12345Bar12345";
        SecretKey key = new SecretKeySpec(k.getBytes(), "AES");
        String username, password, message, encriptedPassword;
        message = "aaa";
        try {
            EncryptionDemo encrypter = new EncryptionDemo(key);
            //obtener el username y el password ingresados
            
            username = request.getParameter("username");
            password = request.getParameter("pass");
            encriptedPassword = encrypter.encrypt(password); //encriptamos la contraseña
            ResultSet rs = c.getQueryResult("SELECT Nombre_usr FROM Usuarios "
                    + "WHERE Nombre_usr = \'"+username+"\' AND Contraseña = \'"+encriptedPassword+"\'");
        
            if(rs != null) {
                currentUser = username;
                c.apagarConexion();
                response.sendRedirect("menu1.jsp");
            }
            else
                message = "Usuario y/o contraseña incorrectas, intenta de nuevo";
            }
        
        catch(Exception e) {}
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Informacion de inicio de sesion</h1>");
            out.println("<p>"+message+"</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
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
