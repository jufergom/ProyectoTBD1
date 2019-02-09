<%-- 
    Document   : menu1
    Created on : 12-01-2018, 08:06:38 PM
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

    <title>Proyecto Teoria 1</title>

    <!-- Bootstrap core CSS -->
    <link href="menu/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="menu/css/simple-sidebar.css" rel="stylesheet">

    <style>
        h4 {
            text-align: center;
            color: red;
            margin-bottom: 50px;
        }
        
        .portada {
            margin: auto;
        }
        
        div.portada p {
            text-align: center;
            font-size: 24px;
        }
        
        div.portada img {
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 50px;
            width: 40%;
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
                <h4 class="display-4">Sistema de gestion de proyectos</h4>
                <div class="portada">
                    <img src="images/logo_unitec.png">
                    <p>Proyecto de clase Teoria de Base de Datos I</p>
                    <p>Realizado por:</p>
                    <p>•Boris Guevara</p>
                    <p>•Julio Gomez</p>
                </div>
                
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
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
