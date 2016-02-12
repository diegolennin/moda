<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!doctype html>
<!DOCTYPE HTML>
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

    }
%>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <title>REPORTES</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="index.html" id="logo">REPORTES </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
             <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>
                    <span class="hidden-xs"> usuario : <% out.print(nom + " " + apel);%></span>
                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar sesión</a></li>
                </ul>
            </nav>
<a href="javascript:window.history.back();">&laquo; Volver atrás </a>
  &nbsp;
  &nbsp;
    <a href="../admin/admin.jsp">&laquo; Inicio </a>
            <!-- Inicio de informacion -->

            <!-- fin de informacion -->
            <br>
            <br>
            <!-- inicio de formulario -->

            <div align="center">
                <img src="../img/pdf.png">

                <ul>
                    <a href="../reportes/vfactura.jsp">Los Clientes que mas compras realizan en nuestro establesimiento.!
</a>
                    <br>
                    <a href="../reportes/vclientes.jsp">top 10 de los productos mas vendidos en UNIMODA</a>
                    <br>
                    <a href="../reportes/vproveedor.jsp">Los proveedores que mas ventas realizan a los clientes...!
</a>
                    <br>
                    <a href="../reportes/vvendedor.jsp">El Vendedor que mas ventas Realiza..
</a>
                    <br>
                    <a href="../reportes/vegresos.jsp">Egresos Totales de Ventas (compras realizadas..)</a>
                    <br>
                    <a href="../reportes/control.jsp">Ingresos Totales de Ventas.. </a> 
                    <br>
                    <a href="../reportes/controlcont.jsp">Reporte Consolidado ToTal..</a>
                    <br>
                    <a href="../reportes/controconp.jsp">Reporte Consolidado por Producto..</a>
                    
                </ul>
            </div>

            <!-- fin del formulario -->

            <!-- Pie de pagina inicio -->

            <!-- termina pie de pagina -->



            <!-- Javascript plugins -->
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