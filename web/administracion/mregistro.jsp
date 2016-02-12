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
                                                <%
                                                    rs = con.consulta("select p.*,pe.* from personas p,perfiles pe where pe.idperfil=p.tpersona and p.dni='" + id + "'");
                                                    while (rs.next()) {
                                                        out.print("<form  id='registro' name='registro' action='' method='POST'>");
                                                        out.print(" <div class='form-group'>");
                                                        out.print("    <input type='text' disabled  class='form-control' id='dni' name='dni' placeholder='Ingrese su DNI' value='" + rs.getString("dni") + "'>");
                                                        out.print("   </div>");
                                                        out.print(" <div class='form-group'>");
                                                        out.print("    <input type='text' required class='form-control' id='nombres' name='nombres' placeholder='Ingrese sus nombres' value='" + rs.getString("nombres") + "'>");
                                                        out.print("   </div>");
                                                        out.print("   <div class='form-group'>");
                                                        out.print("      <input type='text' required class='form-control' id='apellidos' name='apellidos' placeholder='Ingrese sus apellidos' value='" + rs.getString("apellidos") + "'>");
                                                        out.print("   </div>");
                                                        out.print("  <div class='form-group'>");
                                                        out.print("      <input type='email' required disabled class='form-control' id='correo' name='correo' placeholder='Ingrese su correo electronico' onchange='validare(registro);' value='" + rs.getString("correo") + "'>");
                                                        out.print("   </div>");
                                                        out.print("   <div class='form-group'>");
                                                        out.print("      <input name='telefono' type='text' class='form-control' id='telefono' placeholder='Ingrese su  numero de telefono' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("telefono") + "'>");
                                                        out.print(" </div>");
                                                        out.print("  <div class='form-group'>");
                                                        out.print("<input name='celular' type='text' class='form-control' id='celular' placeholder='Ingrese su numero de celular' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("celular") + "'>");
                                                        out.print("</div>");
                                                        out.print("  <div class='form-group'>");
                                                        out.print(" <input type='text' required class='form-control' id='direccion' name='direccion' placeholder='Ingrese su direccion donde vive actualmente' value='" + rs.getString("direccion") + "'>");
                                                        out.print("</div>");
                                                        out.print(" <div class='form-group'>");
                                                        out.print(" <select name='perfil' required class='form-control' id='perfil'>");
                                                        out.print("    <option value='" + rs.getString("idperfil") + "'>" + rs.getString("nomperfil") + "</option>");

                                                        ResultSet rs1 = con.consulta("select * from perfiles where estado='true'");
                                                        while (rs1.next()) {
                                                            out.print(" out.print('<option value='" + rs1.getString("idperfil") + "'>" + rs1.getString("nomperfil") + "</option>');");
                                                        }

                                                        out.print("  </select>");
                                                        out.print(" </div>");
                                                        out.print("  <button type='submit' class='btn btn-default btn-green' id='enviar' name='enviar'>Guardar Registro</button>");
                                                        out.print(" </form>");
                                                    }
                                                %>
                                                <% if (request.getParameter("enviar") != null) {

                                                        String nivel = (String) session.getAttribute("nivel");
                                                        String id1 = request.getParameter("ni");
                                                        String nombre = request.getParameter("nombres");
                                                        String apellido = request.getParameter("apellidos");
                                                        String telefono = request.getParameter("telefono");
                                                        String celular = request.getParameter("celular");
                                                        String direccion = request.getParameter("direccion");
                                                        String perfil = request.getParameter("perfil");
                                                        con.consulta("UPDATE personas SET nombres='" + nombre + "', apellidos='" + apellido + "', telefono='" + telefono + "',celular='" + celular + "', direccion='" + direccion + "', tpersona='" + perfil + "' WHERE dni='" + id + "';");
                                                        out.print("<script>alert('Registro Actualizado');</script>");
                                                        out.println("<script language='javascript'>window.location='../administracion/listar.jsp'</script>;");

                                                    }
                                                %>
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