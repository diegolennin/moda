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
                        <div class="12u">

                            <!-- Highlight -->
                            <section id="main-content">
                                <section class="wrapper">
                                     <a href="javascript:window.history.back();">&laquo; Volver atrás </a>
  &nbsp;
  &nbsp;
    <a href="../admin/admin.jsp">&laquo; Inicio </a>
                                    <br>
                                    <center><h4><i class="fa fa-plus"></i>Crear un Nuevo Perfil </h4></center>
                                    <div class="row mt">

                                        <div class="col-lg-12">
                                            <div class="form-panel">
                                                <form  id="perfiles" name="perfiles" action="perfiles.jsp" method="POST">

                                                    <div class="form-group">
                                                        <input type="text" required class="form-control" id="nombreper" name="nombreper" placeholder="Ingrese el nombre de perfil">
                                                    </div>
                                                    <br>
                                                    <center> <h4><i class='fa fa-list'></i> Seleccione los privilegios a asignar al perfil  </h4></center>
                                                    <br>
                                                    <div class="form-group">
                                                        <%

                                                            String consulta = "select count(*) from menup where estado='true'";
                                                            rs = con.consulta(consulta);
                                                            int contador = 0, i = 0;
                                                            while (rs.next()) {
                                                                contador = rs.getInt("count");
                                                            }
                                                            String codigos[] = new String[contador];
                                                            consulta = "select * from menup where estado='true'";
                                                            rs = con.consulta(consulta);
                                                            while (rs.next()) {
                                                                codigos[i] = rs.getString("idmenu");
                                                                i++;
                                                            }
                                                            rs = con.consulta("select * from menup where estado='true' and relacion='0'");
                                                            out.print("<table class='table table-striped table-advance table-hover'>");
                                                            out.print("  <hr>");
                                                            out.print(" <thead>");
                                                            out.print("  <tr>");
                                                            out.print("    <th><i class='fa fa-barcode'></i> Codigo</th>");
                                                            out.print("    <th><i class='fa fa-list-alt'></i> Privileo de enlace</th>");
                                                            out.print("    <th><i class='fa fa-cog'></i>Acciones</th>");
                                                            out.print("</tr>");
                                                            out.print(" </thead>");
                                                            out.print("  <tbody>");
                                                            while (rs.next()) {
                                                                out.print("   <tr>");
                                                                out.print("  <td>*" + rs.getString("idmenu") + "</td>");
                                                                out.print("    <td>" + rs.getString("nombre") + "</td>");
                                                                out.print("    <td><input type='checkbox' name='ch_" + rs.getString("idmenu") + "' id='ch_" + rs.getString("idmenu") + "'></td>");
                                                                out.print(" </tr>");
                                                                ResultSet rs1 = con.consulta("select * from menup where estado='true' and relacion='" + rs.getString("idmenu") + "'");
                                                                while (rs1.next()) {
                                                                    out.print("   <tr>");
                                                                    out.print("  <td>- -" + rs1.getString("idmenu") + "</td>");
                                                                    out.print("    <td>" + rs1.getString("nombre") + "</td>");
                                                                    out.print("    <td><input type='checkbox' name='ch_" + rs1.getString("idmenu") + "' id='ch_" + rs1.getString("idmenu") + "'></td>");
                                                                    out.print(" </tr>");
                                                                }
                                                            }
                                                            out.print("  </tbody>");
                                                            out.print(" </table>");
                                                        %>

                                                    </div>
                                                    <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Guardar Registro</button>
                                                </form>
                                                <%
                                                    if (request.getParameter("enviar") != null) {
                                                        String nombre = request.getParameter("nombreper");
                                                        contador = 0;
                                                        con.consulta("INSERT INTO perfiles(nomperfil)VALUES ('" + nombre + "');");
                                                        for (int a = 0; a < codigos.length; a++) {
                                                            String per = request.getParameter("ch_" + codigos[a] + "");
                                                            if (per == null) {
                                                                per = "false";
                                                            } else {
                                                                per = "true";
                                                            }
                                                            con.consulta("INSERT INTO privilegios(idperfil,idmenu,estado)VALUES ((select idperfil from perfiles order by desc limit 1),'" + codigos[a] + "','" + per + "');");

                                                           

                                                        } out.print("<script>alert('Registros Guardado');</script>");
                                                    }

                                                %>
                                                <br> 
                                                <center> <h4><i class='fa fa-list'></i> Listado de registros </h4></center>
                                                <br>

                                                <form  id="perfiles" name="perfiles" action="perfiles.jsp" method="POST">
                                                    <div class="form-group">
                                                        <input name="checkbox" type="checkbox" id="checkbox" checked="checked">
                                                        <label for="checkbox">Checkbox </label>
                                                        <select autofocus required class="form-control" name="tbuscar" id="tbuscar">
                                                            <option value="0">Busqueda por código</option>
                                                            <option value="1">Busqueda por nombre</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" required class="form-control" id="busqueda" name="busqueda" placeholder="Ingrese lo que desea buscar">
                                                    </div>

                                                    <button type="submit" class="btn btn-default btn-green" id="buscar" name="buscar">Buscar Registro</button>
                                                </form>
                                                <%  consulta = "select * from perfiles";

                                                    if (request.getParameter("buscar") != null) {
                                                        String valor = request.getParameter("tbuscar");
                                                        String buscar = request.getParameter("busqueda");
                                                        if (valor.equals("0")) {
                                                            consulta = "select * from perfiles where idperfil like'%" + buscar + "%'";
                                                        } else if (valor.equals("1")) {
                                                            consulta = "select * from perfiles where nomperfil like'%" + buscar + "%'";
                                                        }
                                                    }
                                                    rs = con.consulta(consulta);
                                                    out.print("<table class='table table-striped table-advance table-hover'>");
                                                    out.print("  <hr>");
                                                    out.print(" <thead>");
                                                    out.print("  <tr>");
                                                    out.print("    <th class='hidden-phone'><i class='fa fa-barcode'></i> Codigo</th>");
                                                    out.print("    <th><i class='fa fa-list-alt'></i> Nombre</th>");
                                                    out.print(" <th><i class='fa fa-check-square-o'></i> Estado</th>");
                                                    out.print("    <th><i class='fa fa-cog'></i>Acciones</th>");
                                                    out.print("</tr>");
                                                    out.print(" </thead>");
                                                    out.print("  <tbody>");
                                                    while (rs.next()) {
                                                        out.print("   <tr>");
                                                        out.print("  <td class='hidden-phone'>" + rs.getString("idperfil") + "</td>");
                                                        out.print("    <td >" + rs.getString("nomperfil") + "</td>");

                                                        if (rs.getString("estado").equals("t")) {
                                                            out.print("   <td><span class='label label-info label-mini'>Activo</span></td>");

                                                        } else {
                                                            out.print("   <td><span class='label label-info label-mini'>Desactivado</span></td>");

                                                        }
                                                        out.print("    <td>");
                                                        out.print("  <a href = '../administracion/mperfil.jsp?id=" + rs.getString("idperfil") + "' <button class='btn btn-primary btn-xs'><i class='fa fa-pencil'></i></button> </a>");
                                                        out.print("  <a href = '../procesos/aperfil.jsp?id=" + rs.getString("idperfil") + "' <button class='btn btn-success btn-xs'><i class='fa fa-play'></i></button></a>");
                                                        out.print("   <a href = '../procesos/dperfil.jsp?id=" + rs.getString("idperfil") + "' <button class='btn btn-warning btn-xs'><i class='fa fa-stop'></i></button></a>");
                                                        out.print("   <a href = '../procesos/eperfil.jsp?id=" + rs.getString("idperfil") + "'<button class='btn btn-danger btn-xs'><i class='fa fa-eraser'></i></button></a>");
                                                        out.print("   </td>");
                                                        out.print(" </tr>");
                                                    }
                                                    out.print("  </tbody>");
                                                    out.print(" </table>");
                                                %>
                                                <br>
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




