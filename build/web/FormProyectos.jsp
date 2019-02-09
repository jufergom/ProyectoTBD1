<%-- 
    Document   : FormProyectos
    Created on : 12-05-2018, 12:10:39 AM
    Author     : jufer
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

    <style>
        h4 {
            text-align: center;
            margin-bottom: 50px;
        }
        .formulario {
            /*margin-top: 10px;*/
            padding: 5%;
        }
    </style>

</head>

<body>

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
                <h4 class="display-4">Crear Proyecto</h4>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
                <div class="formulario">
                    <form method="POST" action="InsertProyecto">
                        <div class="form-group">
                            <label for="selectOrden">Seleccionar orden de desarrollo</label>
                            <select name="ordenes" id="ordenes" class="form-control form-control-lg">
                                <%
                                    Conexion c = new Conexion();
                                    c.prenderConexion();
                                    ResultSet rs = c.getQueryResult("SELECT * FROM Ordenes_Des");
                                    while(rs.next()) {
                                        out.println("<option value=\""+rs.getString("codigo_Orden")+"\">"+rs.getString("Nombre_Proyecto")+"</option>");
                                    }
                                    c.apagarConexion();
                                %>
                            </select>
                        <div class="form-group">
                            <label for="codigo-proyecto">Codigo Proyecto</label>
                            <input type="text" class="form-control" name="codigo-proyecto" placeholder="PRJ-######">
                        </div>
                        <div class="form-group">
                            <label for="ubicacion">Ubicacion</label>
                            <input type="text" class="form-control" name="ubicacion" placeholder="Ubicacion">
                        </div>
                        <div class="form-group">
                            <label for="tipo-proyecto">Tipo proyecto</label>
                            <select name="tipo-proyecto" id="tipo-proyecto" class="form-control form-control-lg">
                                <!--Colocar los id de las ordenes de desarrollo con un ciclo-->
                                <option value="interno">Interno (compañia)</option>
                                <option value="externo">Externo (cliente)</option>
                            </select>
                        </div>  
                        <div class="form-group">
                            <label for="url-github">URL github</label>
                            <input type="text" class="form-control" name="url-github" placeholder="URL GitHub">
                        </div>
                        <div class="form-group">
                            <label for="url-trello">URL Trello</label>
                            <input type="text" class="form-control" name="url-trello" placeholder="URL Trello">
                        </div>
                        <!--Hace falta colocar la fecha de inicio, y fecha de fin, no los he colocado porque no se que formato usa sybase-->
                        <div class="form-group">
                            <label for="fecha-inicio">Fecha de inicio/label>
                            <input type="text" class="form-control" name="fecha-inicio" placeholder="day/month/year">
                        </div>
                        <div class="form-group">
                            <label for="fecha-fin">Fecha de fin/label>
                            <input type="text" class="form-control" name="fecha-fin" placeholder="day/month/year">
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar proyecto</button>
                    </form>
                </div>
                <br>
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
