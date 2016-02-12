<%
    String nom = "", apel = "", foto = "", id = "";
    conexion con = new conexion();
    ResultSet rs;
    String user = (String) session.getAttribute("varUsuario");
    String niv = (String) session.getAttribute("nivel");
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        if (niv.equals("A1") || niv.equals("P1")) {
            rs = con.consulta("select * from personas where correo='" + user + "'");
            while (rs.next()) {
                nom = rs.getString("nombres");
                nom = rs.getString("apellidos");
                foto = rs.getString("fotpersona");
            }
        } else {
            out.println("<script>No puede ingresar a este panel administrativo</script>");
            out.println("<script language='javascript'>window.location='../administracion/logina.jsp'</script>;");

        }
    }
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<script type="text/javascript" src="../js/validar.js"></script>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
    <head>
        <title>MODIFICAR CONTRASEÒA</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="./../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="../index.jsp" id="logo"> MODIFICAR CONTRASEÒA </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>

                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="col-md-9">

                        <h3><i class="fa fa-angle-right"> </i> CAMBIO DE CONTRASEÒA </h3>
                        <div class="row mt">

                            <div class="col-lg-12">
                                <div class="form-panel">
                                    <form  id="clave" name="clave" action="contraseÒa.jsp" method="POST">

                                        <div class="form-group">
                                            <input type="password" required class="form-control" id="anterior" name="anterior" placeholder="Ingrese su contraseÒa Actual" >
                                        </div>
                                        <div class="form-group">
                                            <input type="password" required class="form-control" id="nueva" name="nueva" placeholder="Ingrese su nueva contraseÒa" onchange="validarp(this.value, clave)">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" required class="form-control" id="rnueva" name="rnueva" placeholder="Repita su nueva contraseÒa" onchange="validarp(this.value, clave)">
                                        </div>
                                        <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Guardar Cambios</button>
                                    </form>
                                    <%
                                        if (request.getParameter("enviar") != null) {
                                            String conteo = "";
                                            String a = request.getParameter("anterior");
                                            String n = request.getParameter("nueva");
                                            String rn = request.getParameter("rnueva");
                                            rs = con.consulta("select count(*) from personas where correo='" + user + "' and clave=md5('" + a + "');");
                                            while (rs.next()) {
                                                conteo = rs.getString("count");
                                            }
                                            if (!conteo.equals("0")) {
                                                if (n.equals(rn)) {
                                                    con.consulta("update personas set clave=md5('" + n + "') where correo='" + user + "';");
                                                    out.print("<script>alert('ContraseÒa Actualizada');</script>");
                                                } else {
                                                    out.print("<script>alert('Claves nuevas no coinciden');</script>");
                                                }
                                            } else {
                                                out.print("<script>alert('Clave anterior Incorrecta');</script>");
                                            }
                                        }
                                    %>
                                </div>
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

    </body>
</html>