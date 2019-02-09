/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProyectoTeoria1.servlets;

import ProyectoTeoria1.models.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bgera
 */
public class InsertProyecto extends HttpServlet {

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
        
        try {
        Conexion c = new Conexion();
        c.prenderConexion();
        
        
        String fechaFin, codigoProyecto, nombre, fechaInicio, estado, ubicacion, trello, github, tipoProyecto, codigoOrden, fechaSolicitud;
        fechaFin = request.getParameter("fecha-inicio");
        codigoProyecto = request.getParameter("codigo-proyecto");
        fechaInicio = request.getParameter("fecha-inicio");
        estado = request.getParameter("fecha-fin");
        ubicacion = request.getParameter("ubicacion");
        trello = request.getParameter("url-trello");
        github = request.getParameter("url-github");
        tipoProyecto = request.getParameter("tipo-proyecto");
        codigoOrden = request.getParameter("ordenes");
        fechaSolicitud = request.getParameter("fecha-solicitud");
        
        ResultSet result = c.getQueryResult("SELECT Nombre_Proyecto FROM Ordenes_Des o WHERE o.codigo_Orden = \'"+codigoOrden+"\'");
        nombre = result.getString("Nombre_Proyecto");
        
        
        
        c.actualizar("INSERT INTO Empleados "
                + "VALUES (\'"+fechaFin+"\', \'"+codigoProyecto+"\', "+nombre+", \'"+fechaInicio+"\', \'Not Started\', \'null\', \'"+ubicacion+"\', \'"+trello+"\', \'"+github+"\', \'"+tipoProyecto+"\', \'"+codigoOrden+"\', \'"+fechaSolicitud+"\', \'null\')");
        
        c.apagarConexion();
        
        } catch(Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("FormProyectos.jsp");
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
