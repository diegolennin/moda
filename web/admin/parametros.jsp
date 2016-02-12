
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<%
    String nom = "", apel = "", foto = "", id = "";
    conexion con = new conexion();
    ResultSet rs;
    String user = (String) session.getAttribute("varUsuario");
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        rs = con.consulta("select * from personas where correo='" + user + "'");
        while (rs.next()) {
            nom = rs.getString("nombres");
            apel = rs.getString("apellidos");
            foto = rs.getString("fotpersona");
        }
    }
%>
<html>
    <head>
        <title>PARAMETROS</title>
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
                            <!--inicio de contenido-->
         <section id="main-content">
                <section class="wrapper">
                    <br>
                    <center><h4><i class="fa fa-refresh"></i>Modificando Parametros</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <%rs = con.consulta("select * from parametros where idparametro=1");
                                    while (rs.next()) {
                                %>

                                <form  id="mmenu" name="mmenu" action="" method="POST">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="<%out.print(rs.getString("iva"));%>" id="codigoiva" name="codigoiva" placeholder="Ingrese el % de iva">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" value="<%out.print(rs.getString("ganancia"));%>" id="codigogan" name="codigogan" placeholder="Ingrese el % de Ganancia">
                                    </div>
                                     
                                    <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Actualizar Registro</button>
                                </form>
                                <%}%>
                                <%
                                    if (request.getParameter("enviar") != null) {
                                        String codigo = request.getParameter("codigoiva");
                                        String nombre = request.getParameter("codigogan");
                                        
                                          con.consulta("UPDATE parametros SET iva=" + codigo + ", ganancia=" + nombre + " WHERE idparametro=1;");
                                            out.print("<script>alert('Registro Actualizado');</script>");
                                            out.println("<script language='javascript'>window.location='../admin/parametros.jsp'</script>;");
                                        

                                    }


                                %>
                            </div>
                        </div>  
                    </div>     
                </section>
            </section>

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


