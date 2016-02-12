<%@page import="clases.MailSender"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%
    conexion con = new conexion();
    ResultSet rs = null;
    String nom = "", apel = "", foto = "", id = "", pri = "", idno = "";//variables de usuario
    String empresa = "";//variable de empresa
    String user = (String) session.getAttribute("varUsuario");//variable que contiene la sesion activa
    String url = request.getRequestURI();//varible que extrae url de pagina
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        //DATOS DEL USUARIO
        rs = con.consulta("select * from personas where correo='" + user + "'");
        while (rs.next()) {
            pri = rs.getString("tpersona");
            idno = rs.getString("dni");
            nom = rs.getString("nombres");
            apel = rs.getString("apellidos");
            foto = rs.getString("fotpersona");
        }
        id = request.getParameter("id");
    }
%>
<html>
    <head>
        <title>ADMINISTRACION</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>

    <body class="homepage">
        <div id="page-wrapper">

            <!-- Header -->
            <!--

<header id="header">
    <div class="logo container">
            <div>
                    <h1><a href="index.html" id="logo">UNIMODA</a></h1>
            </div>
    </div>
</header>

            <!-- Nav -->








            <!-- Nav -->

            <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>
                    <span class="hidden-xs"> usuario : <% out.print(nom + " " + apel);%></span>
                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                </ul>
            </nav>
            <!-- Banner -->


            <!-- acceso -->  
            <br>
            <br>
            <br>


            <div class="container content">
                <div class="row"></div>
            </div>

            <!-- acceso --> 




            <!-- Main -->

            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="row 200%">
                        <div class="12u">

                            <!-- Highlight -->
                            <section id="main-content">
                                <section class="wrapper">
                                    <h3><i class="fa fa-angle-right"></i>Actualizar Imagen</h3>
                                    <div class="row mt">

                                        <div class="col-lg-12">
                                            <div class="form-panel">
                                               <section id="main-content">
               <!--inicio de contenido-->
            <section id="main-content">
                <section class="wrapper">
                    <center><h4><i class="fa fa-refresh"></i>Modificando Registro</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <br>
                                <center><h5><i class="fa fa-refresh"></i>Cambiar contraseña mediante correo</h5></center>
                                <br>
                                <form  id="clave" name="clave" action="" method="POST">
                                    <button type="submit" class="btn btn-default btn-lg btn-block" name="cambio" id="cambio">Generar Enlace</button>
                                </form>
                                <br>
                                <center><h5><i class="fa fa-refresh"></i>Cambiar contraseña Manualmente</h5></center>
                                <br>
                                <form  id="clave" name="clave" action="" method="POST">
                                    <div class="form-group">
                                        <input type="password" required class="form-control" id="nueva" name="nueva" placeholder="Ingrese su nueva contraseña" onchange="validarp(this.value, clave)">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" required class="form-control" id="rnueva" name="rnueva" placeholder="Repita su nueva contraseña" onchange="validarp(this.value, clave)">
                                    </div>
                                    <button type="submit" class="btn btn-default btn-lg btn-block" name="enviar" id="enviar">Guardar Cambios</button>

                                </form>
                                <%
                                    if (request.getParameter("enviar") != null) {
                                        String n = request.getParameter("nueva");
                                        String rn = request.getParameter("rnueva");
                                        if (n.equals(rn)) {
                                            con.consulta("update personas set clave=md5('" + n + "'), estactivo='true' where dni='" + id + "';");
                                            out.print("<script>alert('Contraseña Actualizada');</script>");
                                            out.println("<script language='javascript'>window.location='../administracion/listar.jsp'</script>;");
                                        } else {
                                            out.print("<script>alert('Claves nuevas no coinciden');</script>");
                                        }

                                    }
                                %>
                                <%
                                    if (request.getParameter("cambio") != null) {
                                        con.consulta("update personas set  estactivo='false' where dni='" + id + "';");
                                        MailSender ms = new MailSender();
                                        ms.mensaje("http://localhost:8080/clinica/procesos/cambiocon.jsp?id=" + id + "");
                                        rs = con.consulta("select * from personas where dni='" + id + "'");
                                        String envio = "";
                                        while (rs.next()) {
                                            envio = rs.getString("correo");
                                        }
                                        ms.para(envio);
                                        ms.SendMail();
                                        out.print("<script>alert('Enlace enviado exitosamente');</script>");
                                        out.println("<script language='javascript'>window.location='../administracion/listar.jsp'</script>;");
                                    }
                                %>
                            </div>
                        </div>
                    </div>  
                </section>
            </section>


        </section>
                                            </div>      	
                                        </div>
                                </section>
                            </section>



                            <!--inicio de pie de pagina-->

                        </div>
                    </div>
                    </section>

                </div>


                <!-- Highlight -->



            </div>
        </div>
    </section>

</div>
</div>
<div class="row 200%"></div>
</div>
</div>

<!-- Footer -->
<footer id="footer" class="container">
    <div class="row 200%"></div>

    <!-- Copyright -->
    <div id="copyright">
        <ul class="menu">
            PANEL DE ADMINISTRACION 
            <li></li>
            <li>UNIMODA<a href="http://html5up.net"></a></li>
        </ul>
    </div>

</footer>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/skel-viewport.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>


