<%-- 
    Document   : FormEmpleados
    Created on : 12-05-2018, 12:13:31 AM
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

<body></body>
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
                <h4 class="display-4">Nuevo empleado</h4>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
                <div class="formulario">
                    <form method="POST" action="InsertClientes">
                        <div class="form-group">
                            <label for="primer-nombre">Codigo</label>
                            <input type="text" class="form-control" name="codigo-empleado" placeholder="EMP-####">
                        </div>
                        <div class="form-group">
                            <label for="primer-nombre">Primer nombre</label>
                            <input type="text" class="form-control" name="primer-nombre" placeholder="Primer nombre">
                        </div>
                        <div class="form-group">
                            <label for="segundo-nombre">Segundo nombre</label>
                            <input type="text" class="form-control" name="segundo-nombre" placeholder="Segundo nombre">
                        </div>
                        <div class="form-group">
                            <label for="primer-apellido">Primer apellido</label>
                            <input type="text" class="form-control" name="primer-apellido" placeholder="Primer apellido">
                        </div>
                        <div class="form-group">
                            <label for="segundo-apellido">Segundo apellido</label>
                            <input type="text" class="form-control" name="segundo-apellido" placeholder="Segundo apellido">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" name="telefono" placeholder="Telefono">
                        </div>
                        <div class="form-group">
                            <label for="calle">Calle</label>
                            <input type="text" class="form-control" name="calle" placeholder="Calle">
                        </div>
                        <div class="form-group">
                            <label for="avenida">avenida</label>
                            <input type="text" class="form-control" name="avenida" placeholder="Avenida">
                        </div>
                        <div class="form-group">
                            <label for="numero-casa">Numero de casa</label>
                            <input type="text" class="form-control" name="numero-casa" placeholder="Numero de casa">
                        </div>
                        <div class="form-group">
                            <label for="ciudad">Ciudad</label>
                            <input type="text" class="form-control" name="ciudad" placeholder="Ciudad">
                        </div>
                        <div class="form-group">
                            <label for="departamento">Departamento</label>
                            <input type="text" class="form-control" name="departamento" placeholder="Departamento">
                        </div>
                        <div class="form-group">
                            <label for="referencia">Referencia</label>
                            <input type="text" class="form-control" name="referencia" placeholder="Referencias">
                        </div>
                        <div class="form-group">
                            <label for="fecha-nacimieneto">Fecha de nacimiento</label>
                            <input type="text" class="form-control" name="fecha-nacimieneto" placeholder="Fecha de nacimiento">
                        </div>
                        <div class="form-group">
                            <label for="fecha-contratacion">Fecha de contratacion</label>
                            <input type="text" class="form-control" name="fecha-contratacion" placeholder="Fecha de contratacion">
                        </div>
                        <div class="form-group">
                            <label for="salario">Salario</label>
                            <input type="text" class="form-control" name="salario" placeholder="Salario">
                        </div>
                        <div class="form-group">
                            <label for="equipo-trabajo">Equipo</label>
                            <select name="equipo" id="equipo" class="form-control form-control-lg">
                                <!--Colocar los id de los equipos de trabajo con un ciclo-->
                                <%
                                    Conexion c = new Conexion();
                                    c.prenderConexion();
                                    ResultSet rs = c.getQueryResult("SELECT * FROM Equipos");
                                    while(rs.next()) {
                                        out.println("<option value=\""+rs.getString("codigo_equipo")+"\">"+rs.getString("nombre")+"</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="supervisor">Supervisor</label>
                            <select name="supervisor" id="supervisor" class="form-control form-control-lg">
                                <%
                                    
                                    rs = c.getQueryResult("SELECT Primer_Nombre, Codigo_empleado FROM Empleados");
                                    while(rs.next()) {
                                        out.println("<option value=\""+rs.getString("Codigo_empleado")+"\">"+rs.getString("Primer_Nombre")+"</option>");
                                    }
                                    c.apagarConexion();
                                %>
                            </select>
                        </div> 
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" name="usuario" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <label for="pass">Contraseña</label>
                            <input type="password" class="form-control" name="pass" placeholder="Contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar empleado</button>
                    </form>
                </div>
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