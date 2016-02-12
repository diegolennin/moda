<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <title>MODIFICAR PROVEEDOR</title>
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
                        <h1><a href="../index.jsp" id="logo">MODIFICAR PRODUCTO </a></h1>
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
                        <div>

                            <%
                                String id = request.getParameter("id");
                                String consulta = "select * from proveedor where ruc='" + id + "'";
                                conexion con = new conexion();
                                ResultSet rs = con.consulta(consulta);
                                while (rs.next()) {
                                    out.print("<form  id='registro' name='registro' action='' method='POST'>");

                                    out.print(" <div class='form-group'>");
                                    out.print("    <input type='text' disabled='disabled' value='" + rs.getString("ruc") + "' required class='form-control' id='dni' name='dni' placeholder='Ingrese su numero DNI de ciudadano' onkeydown='return evaluar(event)' onchange='evaluar(registro)'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input type='text' value='" + rs.getString("nombres") + "'  required class='form-control' id='nombres' name='nombres' placeholder='Ingrese sus nombres'>");
                                    out.print("</div>");
                                    out.print("<div class='form-group'>");
                                    out.print("    <input type='text' value='" + rs.getString("apellidos") + "'  required class='form-control' id='apellidos' name='apellidos' placeholder='Ingrese sus apellidos'>");
                                    out.print("</div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("     <input type='email' value='" + rs.getString("correo") + "'  required class='form-control' id='correo' name='correo' placeholder='Ingrese su correo electronico' onchange='validare(registro);'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input name='telefono' value='" + rs.getString("telefono") + "'  type='text' class='form-control' id='telefono'  placeholder='Ingrese su  numero de telefono' onkeydown='return numeros(event)' maxlength='15'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input name='celular' value='" + rs.getString("celular") + "'  type='text' class='form-control' id='celular' placeholder='Ingrese su numero de celular' onkeydown='return numeros(event)' maxlength='15'>");
                                    out.print("</div>");
                                    out.print("<div class='form-group'>");
                                    out.print("   <input type='text' value='" + rs.getString("direccion") + "'  required class='form-control' id='direccion' name='direccion' placeholder='Ingrese su direccion donde vive actualmente'>");
                                    out.print("</div>");
                                    out.print(" <div class='form-group'>");

                                    out.print("</div> <button type='submit' class='btn btn-default btn-green' name='enviar' id='enviar'>Registrar</button>");
                                    out.print(" </form>");
                                }
                            %>
                            <%
                                if (request.getParameter("enviar") != null) {
                                    String direccion = request.getParameter("direccion");
                                    String nombres = request.getParameter("nombres");
                                    String apellidos = request.getParameter("apellidos");
                                    String correo = request.getParameter("correo");
                                    String telefono = request.getParameter("telefono");
                                    String celular = request.getParameter("celular");
                                    con.consulta("UPDATE proveedor   SET  nombres='" + nombres + "', apellidos='" + apellidos + "', correo='" + correo + "', telefono='" + telefono + "', celular='" + celular + "',        direccion='" + direccion + "' WHERE ruc='" + id + "';");
                                    out.print("Se ha Actualizado el registro");
                                    out.println("<script language='javascript'>window.location='listapro.jsp'</script>;");
                                }
                            %>
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