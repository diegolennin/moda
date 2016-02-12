<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%
    conexion con = new conexion();
    String id = request.getParameter("id");
    ResultSet rs = con.consulta("select * from personas where dni='" + id + "'");
    String ver = "";
    while (rs.next()) {
        ver = rs.getString("estactivo");
    }
    if (ver.equals("t")) {
        out.print("<script>alert('Este usuario no ha requerido un cambio de contraseña');</script>");
        out.println("<script language='javascript'>window.location='../acesso.jsp'</script>;");
    }

%>

<!doctype html>
<html>
    <head>
        <title>Cambio Contraseña...</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <script type="text/javascript" src="../js/validar.js"></script>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="index.jsp" id="logo">Cambio de Contraseña.. </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li class="current"><a href="index.jsp">Inicio</a></li>
                    <li><a href="misionvision.html">Mision-Vision</a></li>
                    <li><a href="contactos.html">Contactos</a></li>
                    <li><a href="servicios.html">Servicios</a></li>
                    <li><a href="sugerencias.html">Sugerencias</a></li>
                    <li><a href="nosotros.html">Nosotros</a></li>

                </ul>
                <div style="float: right;" >
                    <!-- inicio de ayuda -->

                    <a aling="left" class="dropdown-toggle" href="./reportes/ayuda.jsp?id=/pdf/moda-manual.pdf">
                        <i aling="left" class="fa fa-question fa-3x"></i>
                    </a>

                    <!-- fin de ayuda -->
                </div>
            </nav>
            <!-- Navigacion del menu final -->

            <br>
            <br>
            <br>
            <br>

            <!-- inicio de Services -->
            <div class="rehome">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 centered">
                            <form  id="registro" name="registro" action="" method="POST">
                                <div class="form-group">
                                    <input type="password" required class="form-control" id="clave" name="clave" placeholder="Ingrese su nueva contraseña" onchange="validarp(this.value, registro);">
                                </div>
                                <div class="form-group">
                                    <input type="password" required class="form-control" id="claves" name="claves" placeholder="Vuelva a Ingresar la Contraseña" onchange="validarp(this.value, registro);">
                                </div>
                                <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Cambiar contraseña </button>
                            </form>
                            <%                            if (request.getParameter("enviar") != null) {
                                    String una = request.getParameter("clave");
                                    String dos = request.getParameter("claves");
                                    if (una.equals(dos)) {
                                        con.consulta("update personas set clave=md5('" + una + "') where dni='" + id + "'");
                                        out.print("<script>alert('Clave Actualizada correctamente')</script>");
                                        out.println("<script language='javascript'>window.location='../procesos/final.jsp?id=" + id + "'</script>;");

                                    } else {
                                        out.print("<script>alert('Las claves no coinciden');</script>");
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <!--fin de Servicios -->

            <!-- Pie de pagina inicio -->
            <footer id="footer" class="container">
                <div class="row 200%">
                    <div class="12u">

                        <!-- Contact -->
                        <section>
                            <h2 class="major"><span>Contactenos</span></h2>
                            <ul class="contact">
                                <li><a class="icon fa-facebook" href="https://www.facebook.com/unimoda.catalogo/"><span class="label">Facebook</span></a></li>
                                <li><a class="icon fa-twitter" href="https://twitter.com/UNIMODACATALOGO"><span class="label">Twitter</span></a></li>
                                <li><a class="icon fa-instagram" href="https://www.instagram.com/unimodasc/"><span class="label">Instagram</span></a></li>
                                <li><a class="icon fa-dribbble" href="https://es.pinterest.com/matrizatuntaqui/"><span class="label">Dribbble</span></a></li>
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