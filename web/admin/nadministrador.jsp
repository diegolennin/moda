<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
    <head>
        <title>NUEVO USUARIO</title>
        <meta charset="utf-8">
        <script src="../alertas/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../alertas/sweetalert.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="./../assets/css/main.css" />
        <script type="text/javascript" src="../js/validar.js"></script>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="../index.jsp" id="logo">NUEVO ADMINISTRADOR </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>

                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                </ul>

                <div style="float: right;">
                    <!-- inicio de ayuda -->

                    <a aling="left" class="dropdown-toggle" href="../reportes/ayuda.jsp?id=/pdf/nuevo-administrador.pdf">
                        <i aling="left" class="fa fa-question fa-3x"></i>
                    </a>

                    <!-- fin de ayuda -->
                </div> 
            </nav>
            <a href="javascript:window.history.back();">&laquo; Volver atrás </a>
            &nbsp;
            &nbsp;
            <a href="../admin/admin.jsp">&laquo; Inicio </a>
            <!-- Main -->
            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="col-md-9">
                        <div>
                            <form  id="registro" name="registro" action="../admin/nuevoa.jsp" method="POST">
                                <div class="form-group">
                                    <select autofocus required class="form-control" name="tdocumento" id="tdocumento">
                                        <option value="">Selecione de tipo de documento de DNI</option>
                                        <option value="true">Nacional</option>
                                        <option value="false">Extranjero</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" required class="form-control" id="dni" name="dni" placeholder="Ingrese su numero DNI de ciudadano" title="Ingrese su numero DNI de ciudadano" onkeydown="return evaluar(event)" onchange="evaluar(registro)">
                                </div>
                                <div class="form-group">
                                    <input type="text" required class="form-control" id="nombres" name="nombres" placeholder="Ingrese sus nombres" title="Ingrese sus nombres" >
                                </div>
                                <div class="form-group">
                                    <input type="text" required class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese sus apellidos" title="Ingrese sus apellidos">

                                    <input type="email" required class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electronico" title="Ingrese su correo electronico" onChange="validare(registro);">
                                </div>
                                <div class="form-group"></div>
                                <div class="form-group">
                                    <input name="telefono" type="text" class="form-control" id="telefono" placeholder="Ingrese su  numero de telefono" title="Ingrese su  numero de telefono" onkeydown="return numeros(event)" maxlength="15">
                                </div>
                                <div class="form-group">
                                    <input name="celular" type="text" class="form-control" id="celular" placeholder="Ingrese su numero de celular" title="Ingrese su numero de celular" onkeydown="return numeros(event)" maxlength="15">
                                </div>

                                <div class="form-group">
                                    <input type="text" required class="form-control" id="direccion" name="direccion" placeholder="Ingrese su direccion donde vive actualmente" title="Ingrese su direccion donde vive actualmente">
                                </div>
                                <div class="form-group">
                                    <select name="perfil" required class="form-control" id="perfil">
                                        <option value="">Seleccione un perfil</option>
                                        <%
                                            conexion con = new conexion();
                                            ResultSet rs = con.consulta("select * from perfiles where estado='true'");
                                            while (rs.next()) {
                                                out.print("<option value='" + rs.getString("idperfil") + "'>" + rs.getString("nomperfil") + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">

                                </div> <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Registrar</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer id="footer" class="container">
            <div class="row 200%">
                <div class="12u">

                    <!-- Contact -->
                    <section>
                        <h2 class="major"><span>Contactenos</span></h2>
                        <ul class="contact">
                            <li><a class="icon fa-facebook" href="#"><span class="label">Facebook</span></a></li>
                            <li><a class="icon fa-twitter" href="#"><span class="label">Twitter</span></a></li>
                            <li><a class="icon fa-instagram" href="#"><span class="label">Instagram</span></a></li>
                            <li><a class="icon fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
                            <li><a class="icon fa-google-plus" href="#"><span class="label">Google+</span></a></li>
                        </ul>
                    </section>

                </div>
            </div>

            <!-- Copyright -->
            <div id="copyright">
                <ul class="menu">
                    <li>&copy; Untitled. Uniandes</li><li>Design: <a href="http://html5up.net">Diego Chamorro - Daniel Ruano</a></li>
                </ul>
            </div>

        </footer>



        <!-- Scripts -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery.dropotron.min.js"></script>
        <script src="../assets/js/skel.min.js"></script>
        <script src="../assets/js/skel-viewport.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="../assets/js/main.js"></script>
        <script type="text/javascript" src="../js/validar.js"></script>

    </body>
</html>