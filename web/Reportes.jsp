<%-- 
    Document   : Reportes
    Created on : 18/12/2018, 10:05:21 PM
    Author     : bgera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="ProyectoTeoria1.models.Conexion, java.sql.*;" %>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="menu/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="menu/css/simple-sidebar.css" rel="stylesheet">

</head>

<body>
    <%
        Conexion c = new Conexion();
        c.prenderConexion();
        ResultSet rs;
    %>
    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="menu1.jsp">
                        <%
                            out.println("Bienvenido, "+ProyectoTeoria1.servlets.LoginCheckServlet.currentUser);
                        %>
                    </a>
                </li>
                <li>
                    <a href="FormClientes.jsp">Nuevo cliente</a>
                </li>
                <li>
                    <a href="FormOrdenes.jsp">Nueva orden</a>
                </li>
                <li>
                    <a href="FormProyectos.jsp">Crear Proyecto</a>
                </li>
                <li>
                    <a href="FormStatus.jsp">Cambio de estado a proyecto</a>
                </li>
                <li>
                    <a href="FormEmpleados.jsp">Nuevo empleado</a>
                </li>
                <li>
                    <a href="FormEquipos.jsp">Nuevo equipo</a>
                </li>
                <li>
                    <a href="FormTeamProject.jsp">Nuevo equipo de trabajo</a>
                </li>
                <li>
                    <a href="FormActividades.jsp">Crear actividad</a>
                </li>
                <li>
                    <a href="Reportes.jsp">Reportes</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="container">
                    <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
                    <br>
                    <br>
                    <h3>Listado general de clientes</h3>
                    <!--Table-->
                    <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Telefono</th>
                            <th>Pagina Web</th>
                            <th>Correo Electronico</th>
                            <th>Pais</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                        
                            <%
                                rs = c.getQueryResult("SELECT * FROM Clientes");
                                while(rs.next()) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"row\">"+rs.getString("Codigo")+"</th>");
                                    out.println("<td>"+rs.getString("Nombre")+"</td>");
                                    out.println("<td>"+rs.getString("Telefono")+"</td>");
                                    out.println("<td>"+rs.getString("pagina_web")+"</td>");
                                    out.println("<td>"+rs.getString("Correo_electronico")+"</td>");
                                    out.println("<td>"+rs.getString("pais")+"</td>");
                                    out.println("<tr>");
                                }
                            %> 
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->

                <h3>Clientes sin ordenes de desarrollo</h3>
                <!--Table-->
                <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Telefono</th>
                            <th>Pagina Web</th>
                            <th>Correo Electronico</th>
                            <th>Pais</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                         <%
                                rs = c.getQueryResult("SELECT * "
                                        + "FROM Clientes c "
                                        + "LEFT JOIN Ordenes_Des o "
                                        + "ON c.Codigo = o.Codigo "
                                        + "WHERE o.codigo_Orden IS NULL");
                                while(rs.next()) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"row\">"+rs.getString("Codigo")+"</th>");
                                    out.println("<td>"+rs.getString("Nombre")+"</td>");
                                    out.println("<td>"+rs.getString("Telefono")+"</td>");
                                    out.println("<td>"+rs.getString("pagina_web")+"</td>");
                                    out.println("<td>"+rs.getString("Correo_electronico")+"</td>");
                                    out.println("<td>"+rs.getString("pais")+"</td>");
                                    out.println("<tr>");
                                }
                            %> 
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->

                <h3>Clientes con ordenes de desarrollo</h3>
                <!--Table-->
                <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo del cliente</th>
                            <th>Nombre del cliente</th>
                            <th>Codigo de orden</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                        <%
                                rs = c.getQueryResult("SELECT c.Codigo, c.Nombre, o.codigo_Orden "
                                        + "FROM Clientes c "
                                        + "INNER JOIN Ordenes_Des o "
                                        + "ON c.Codigo = o.Codigo");
                                while(rs.next()) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"row\">"+rs.getString("Codigo")+"</th>");
                                    out.println("<td>"+rs.getString("Nombre")+"</td>");
                                    out.println("<td>"+rs.getString("codigo_Orden")+"</td>");
                                    out.println("<tr>");
                                }
                            %> 
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->

                <h3>Clientes con proyectos por estado</h3>
                <!--Table-->
                <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo del cliente</th>
                            <th>Nombre del cliente</th>
                            <th>Nombre del proyecto</th>
                            <th>Estado del proyecto</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Julio</td>
                            <td>Wall Medical</td>
                            <td>On Hold</td>
                        </tr>
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->

                <h3>Listado general de equipos</h3>
                <!--Table-->
                <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo del equipo</th>
                            <th>Nombre del equipo</th>
                            <th>Supervisor</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                        <%
                                rs = c.getQueryResult("SELECT * FROM Equipos");
                                while(rs.next()) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"row\">"+rs.getString("codigo_equipo")+"</th>");
                                    out.println("<td>"+rs.getString("nombre")+"</td>");
                                    out.println("<td>"+rs.getString("supervisor")+"</td>");
                                    out.println("<tr>");
                                }
                            %> 
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->

                <h3>Listado general de empleados por equipo</h3>
                <!--Table-->
                <table class="table table-hover table-fixed">

                        <!--Table head-->
                        <thead>
                        <tr>
                            <th>Codigo del empleado</th>
                            <th>Nombre empleado</th>
                            <th>Nombre del equipo</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                    
                        <!--Table body-->
                        <tbody>
                        <%
                                rs = c.getQueryResult("SELECT em.Codigo_empleado, em.Primer_Nombre, eq.nombre "
                                        + "FROM Empleados em "
                                        + "INNER JOIN Equipos eq "
                                        + "ON em.codigo_equipo = eq.codigo_equipo");
                                while(rs.next()) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"row\">"+rs.getString("codigo_empleado")+"</th>");
                                    out.println("<td>"+rs.getString("Primer_Nombre")+"</td>");
                                    out.println("<td>"+rs.getString("nombre")+"</td>");
                                    out.println("<tr>");
                                }
                                c.apagarConexion();
                            %> 
                        
                        </tbody>
                        <!--Table body-->
  
                    </table>
                <!--Table-->
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="menu/vendor/jquery/jquery.min.js"></script>
    <script src="menu/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
