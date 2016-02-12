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
                         <a href="javascript:window.history.back();">&laquo; Volver atrás </a>
  &nbsp;
  &nbsp;
    <a href="../admin/admin.jsp">&laquo; Inicio </a>
                        <div class="12u">

                            <!-- Highlight -->
                            <section id="main-content">
                                <section class="wrapper">
                                    <h3><i class="fa fa-angle-right"></i>Actualizar Imagen</h3>
                                    <div class="row mt">

                                        <div class="col-lg-12">
                                            <div class="form-panel">
                                               <section id="main-content">
                <section class="wrapper">
                    <center><h3><i class="fa fa-list-alt"></i>Lista de registros</h3></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form  id="mregistrop" name="listar" action="listar.jsp" method="POST">
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="tdocumento" id="tdocumento">
                                            <option value="">Seleccione el tipo de busqueda que requiere</option>
                                            <option value="0">DNI</option>
                                            <option value="1">Apellidos</option>
                                            <option value="2">Tipo de perfil</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Ingrese lo que desea buscar">
                                    </div>
                                    <center><h5><i class="fa fa-user"></i>Selecione esta opcion si ha seleccionado tipo de perfil (opcional)</h5></center>
                                    <div class="form-group">
                                        <select class="form-control" name="perfil" id="perfil">
                                            <option value="">Seleccione el perfil requerido</option>
                                            <%
                                                rs = con.consulta("select * from perfiles where estado='true'");
                                                while (rs.next()) {
                                                    out.print("<option value='" + rs.getString("idperfil") + "'>" + rs.getString("nomperfil") + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>


                                    <button type="submit" class="btn btn-default btn-green" id="buscar" name="buscar">Buscar Registro</button>
                                </form>
                                <br>
                                <div class="form-group">

                                    <%
                                        String consulta = "select * from personas limit 100";
                                        if (request.getParameter("buscar") != null) {
                                            String valor = request.getParameter("tdocumento");
                                            String buscar = request.getParameter("busqueda");
                                            String perfil = request.getParameter("perfil");
                                            if (valor.equals("0")) {
                                                consulta = "select * from personas where dni like'%" + buscar + "%'";
                                            } else if (valor.equals("1")) {
                                                consulta = "select * from personas where apellidos like'%" + buscar + "%'";
                                            } else if (valor.equals("2")) {
                                                consulta = "select * from personas where tpersona like'%" + perfil + "%'";
                                            }

                                        }
                                        rs = con.consulta(consulta);
                                        out.print("<table class='table table-striped table-advance table-hover'>");
                                        out.print("   <center> <h4><i class='fa fa-list'></i> Listado de registros </h4></center>");
                                        out.print("  <hr>");
                                        out.print(" <thead>");
                                        out.print("  <tr>");
                                        out.print("    <th><i class='fa fa-barcode'></i> DNI</th>");
                                        out.print("    <th class='hidden-phone'> <i class='fa fa-list-alt'></i>Nombres</th>");
                                        out.print("   <th><i class='fa fa-list'></i> Apellidos</th>");
                                        out.print(" <th><i class='fa fa-check-square-o'></i> Estado</th>");
                                        out.print("    <th><i class='fa fa-cog'></i>Acciones</th>");
                                        out.print("</tr>");
                                        out.print(" </thead>");
                                        out.print("  <tbody>");
                                        while (rs.next()) {
                                            out.print("   <tr>");
                                            out.print("  <td>" + rs.getString("dni") + "</td>");
                                            out.print("    <td class='hidden-phone'>" + rs.getString("nombres") + "</td>");
                                            out.print("  <td>" + rs.getString("apellidos") + "</td>");
                                            if (rs.getString("estpersona").equals("t")) {
                                                out.print("   <td><span class='label label-info label-mini'>Activo</span></td>");

                                            } else {
                                                out.print("   <td><span class='label label-info label-mini'>Desactivado</span></td>");

                                            }
                                            out.print("    <td>");
                                            out.print("  <a href = '../administracion/mregistro.jsp?id=" + rs.getString("dni") + "' <button class='btn btn-primary btn-xs'><i class='fa fa-pencil'></i></button></a>");
                                            out.print("  <a href = '../procesos/aregistrop.jsp?id=" + rs.getString("dni") + "' <button class='btn btn-success btn-xs'><i class='fa fa-play'></i></button></a>");
                                            out.print("   <a href = '../procesos/eregistrop.jsp?id=" + rs.getString("dni") + "' <button class='btn btn-warning btn-xs'><i class='fa fa-stop'></i></button></a>");
                                            out.print("   <a href = '../procesos/elregistrop.jsp?id=" + rs.getString("dni") + "' <button class='btn btn-danger btn-xs'><i class='fa fa-eraser'></i></button></a>");
                                            out.print("   <a href = '../administracion/ccontrasena.jsp?id=" + rs.getString("dni") + "' <button class='btn btn-danger btn-xs'><i class='fa fa-key'></i></button></a>");
                                             out.print("   </td>");
                                            out.print(" </tr>");
                                        }
                                        out.print("  </tbody>");
                                        out.print(" </table>");

                                    %>

                                </div>
                            </div>      	
                        </div>
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