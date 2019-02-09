<%-- 
    Document   : FormStatus
    Created on : 12-15-2018, 03:18:58 PM
    Author     : jufer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

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
                <h4 class="display-4">Cambio de estado de proyectos</h4>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
                <div class="formulario">
                    <form method="POST" action="">
                        <div class="form-group">
                            <label for="proyecto">Elegir proyecto</label>
                            <select name="proyecto" id="proyecto" class="form-control form-control-lg">
                                <!--Colocar los id  de los proyectos con un ciclo-->
                                <option value="proyecto1">Proyecto 1</option>
                                <option value="proyecto2">Proyecto 2</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="supervisor">Nuevo estado</label>
                            <select name="tipo-proyecto" id="supervisor" class="form-control form-control-lg">
                                <option value="on-track">On track</option>
                                <option value="slipping">Slipping</option>
                                <option value="on-hold">On hold</option>
                                <option value="off-track">Off track</option>
                                <option value="done">Done</option>
                            </select>
                        </div>  
                        <button type="submit" class="btn btn-primary">Cambiar estado</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>

