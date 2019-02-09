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
import ProyectoTeoria1.models.*;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author bgera
 */
public class InsertEmpleado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String primerN, segundoN, primerA, segundoA, codigo, fechaN, fechaC, supervisor, telefono, calle, referencia, avenida, ciudad, departamento, codigoEquipo, username, password;
        int casa, salario;
        String encryptedPass;
        
        primerN = request.getParameter("primer-nombre");
        segundoN = request.getParameter("segundo-nombre");
        primerA = request.getParameter("primer-apellido");
        segundoA = request.getParameter("segundo-apellido");
        codigo = request.getParameter("codigo-empleado");
        fechaN = request.getParameter("fecha-nacimiento");
        fechaC = request.getParameter("fecha-contratacion");
        supervisor = request.getParameter("supervisor");
        telefono = request.getParameter("telefono");
        calle = request.getParameter("calle");
        referencia = request.getParameter("referencia");
        avenida = request.getParameter("avenida");
        ciudad = request.getParameter("ciudad");
        casa = Integer.parseInt(request.getParameter("numero-casa"));
        departamento = request.getParameter("departamento");
        salario = Integer.parseInt(request.getParameter("salario"));
        codigoEquipo = request.getParameter("equipo");
        
        //usuario y contra
        username = request.getParameter("usuario");
        password = request.getParameter("pass");
        
        try {
            //encriptar contraseña
        String k = "Bar12345Bar12345";
        SecretKey key = new SecretKeySpec(k.getBytes(), "AES");
        EncryptionDemo encrypter = new EncryptionDemo(key);
        encryptedPass = encrypter.encrypt(password);
        
        Conexion c = new Conexion();
        c.prenderConexion();
        c.actualizar("INSERT INTO Empleados "
                + "VALUES (\'"+primerN+"\', \'"+segundoN+"\', "+primerA+", \'"+segundoA+"\', \'"+codigo+"\', \'"+fechaN+"\', \'"+fechaC+"\', \'"+supervisor+"\', \'"+telefono+"\', \'"+calle+"\', \'"+referencia+"\', \'"+avenida+"\'\'"+ciudad+"\', \'"+casa+"\', \'"+departamento+"\',\'"+salario+"\',\'"+codigoEquipo+"\')");
        c.actualizar("INSERT INTO Usuarios "
                + "VALUES (\'"+codigo+"\', \'"+encryptedPass+"\', 'Normal', \'"+username+"\')");
        c.apagarConexion();
        } catch(Exception e) {
            
        }
        
        
        response.sendRedirect("FormEmpleados.jsp");
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
