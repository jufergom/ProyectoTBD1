<%-- 
    Document   : FormClientes
    Created on : 12-05-2018, 12:06:25 AM
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
                    <a href=FormProyectos.jsp">Crear Proyecto</a>
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
                <h4 class="display-4">Ingresar cliente</h4>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Desplegar menu</a>
                <div class="formulario">
                    <form method="POST" action="InsertClientes">
                        <div class="form-group">
                            <label for="codigo-cliente">Codigo del cliente</label>
                            <input type="text" class="form-control" name="codigo-cliente" placeholder="CUS-#####">
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre del cliente</label>
                            <input type="text" class="form-control" name="cliente" placeholder="Nombre cliente">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" name="telefono" placeholder="Telefono">
                        </div>  
                        <div class="form-group">
                            <label for="pagina-web">Pagina web</label>
                            <input type="text" class="form-control" name="pagina-web" placeholder="Pagina web">
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo electronico</label>
                            <input type="text" class="form-control" name="correo" placeholder="Correo electronico">
                        </div>
                        <div class="form-group">
                            <label for="pais">Pais</label>
                            <input type="text" class="form-control" name="pais" placeholder="Pais">
                        </div>
                        <div class="form-group">
                            <label for="calle">Calle</label>
                            <input type="text" class="form-control" name="calle" placeholder="Calle">
                        </div>
                        <div class="form-group">
                            <label for="avenida">Avenida</label>
                            <input type="text" class="form-control" name="avenida" placeholder="Avenida">
                        </div>
                        <div class="form-group">
                            <label for="ciudad">Ciudad</label>
                            <input type="text" class="form-control" name="ciudad" placeholder="Ciudad">
                        </div>
                        <div class="form-group">
                            <label for="codigo-postal">Codigo postal</label>
                            <input type="text" class="form-control" name="codigo-postal" placeholder="Codigo postal">
                        </div>
                        <div class="form-group">
                            <label for="estado">Estado/Departamento/Provincia</label>
                            <input type="text" class="form-control" name="estado" placeholder="Estado/Departamento/Provincia">
                        </div>
                        <div class="form-group">
                            <label for="referencia">Referencia</label>
                            <input type="text" class="form-control" name="referencia" placeholder="Referencias">
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar cliente</button>
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
