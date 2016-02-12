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
    String nom = "", apel = "", foto = "";
    int id = Integer.parseInt(request.getParameter("id"));

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
                            <!--inicio de contenido-->
            <section id="main-content">
                <section class="wrapper">
                    <br>
                    <center><h4><i class="fa fa-refresh"></i>Modificando Registro</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <form  id="mperfil" name="mperfil" action="" method="POST">
                                    <%rs = con.consulta("select * from perfiles where idperfil=" + id + "");
                                        while (rs.next()) {
                                    %>
                                    <div class="form-group">
                                        <input type="text" disabled="true" value="<%out.print(rs.getString("idperfil"));%>" class="form-control" id="codigoper" name="codigoper" placeholder="Ingrese el codigo unico de Perfil">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<%out.print(rs.getString("nomperfil"));%>" required class="form-control" id="nombreper" name="nombreper" placeholder="Ingrese el nombre de perfil">
                                    </div>
                                    <br>
                                    <center> <h4><i class='fa fa-list'></i> Seleccione los privilegios a asignar al perfil  </h4></center>
                                    <br><%}%>
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
                                                out.print("    <td >" + rs.getString("nombre") + "</td>");
                                                ResultSet rs2 = con.consulta("select count(*) from privilegios  where idperfil='" + id + "' and idmenu='" + rs.getString("idmenu") + "'");
                                                while (rs2.next()) {
                                                    if (rs2.getString("count").equals("1")) {
                                                        rs2 = con.consulta("select * from privilegios p where idperfil='" + id + "' and idmenu='" + rs.getString("idmenu") + "'");
                                                        while (rs2.next()) {
                                                            if (rs2.getString("estado").equals("t")) {
                                                                out.print("    <td ><input type='checkbox' checked='checked'  name='ch_" + rs.getString("idmenu") + "' id='ch_" + rs.getString("idmenu") + "'></td>");
                                                            } else if (rs2.getString("estado").equals("f")) {
                                                                out.print("    <td ><input type='checkbox' name='ch_" + rs.getString("idmenu") + "' id='ch_" + rs.getString("idmenu") + "'></td>");
                                                            }
                                                        }
                                                    } else {
                                                        out.print("    <td ><input type='checkbox' name='ch_" + rs.getString("idmenu") + "' id='ch_" + rs.getString("idmenu") + "'></td>");
                                                    }
                                                }

                                                out.print(" </tr>");
                                                ResultSet rs1 = con.consulta("select * from menup where estado='true' and relacion='" + rs.getString("idmenu") + "'");
                                                while (rs1.next()) {
                                                    out.print("   <tr>");
                                                    out.print("  <td>-" + rs1.getString("idmenu") + "</td>");
                                                    out.print("    <td >" + rs1.getString("nombre") + "</td>");
                                                    rs2 = con.consulta("select count(*) from privilegios  where idperfil='" + id + "' and idmenu='" + rs1.getString("idmenu") + "'");
                                                    while (rs2.next()) {
                                                        if (rs2.getString("count").equals("1")) {
                                                            rs2 = con.consulta("select * from privilegios p where idperfil='" + id + "' and idmenu='" + rs1.getString("idmenu") + "'");
                                                            while (rs2.next()) {
                                                                if (rs2.getString("estado").equals("t")) {
                                                                    out.print("    <td ><input type='checkbox' checked='checked'  name='ch_" + rs1.getString("idmenu") + "' id='ch_" + rs1.getString("idmenu") + "'></td>");
                                                                } else if (rs2.getString("estado").equals("f")) {
                                                                    out.print("    <td ><input type='checkbox' name='ch_" + rs1.getString("idmenu") + "' id='ch_" + rs1.getString("idmenu") + "'></td>");
                                                                }
                                                            }
                                                        } else {
                                                            out.print("    <td ><input type='checkbox' name='ch_" + rs1.getString("idmenu") + "' id='ch_" + rs1.getString("idmenu") + "'></td>");
                                                        }
                                                    }
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
                                        con.consulta("delete from privilegios where idperfil='" + id + "'");
                                        String nombre = request.getParameter("nombreper");
                                        String codigo = request.getParameter("codigoper");
                                        contador = 0;
                                        rs = con.consulta("select count(*) from perfiles where idperfil=" + codigo + "");
                                        while (rs.next()) {
                                            contador = rs.getInt("count");
                                        }
                                        if (contador == 0) {
                                            con.consulta("update perfiles set nomperfil='" + nombre + "' where idperfil=" + id + ";");
                                            for (int a = 0; a < codigos.length; a++) {
                                                String per = request.getParameter("ch_" + codigos[a] + "");
                                                if (per == null) {
                                                    per = "false";
                                                } else {
                                                    per = "true";
                                                }
                                                con.consulta("INSERT INTO privilegios(idperfil,idmenu,estado)VALUES ('" + id + "','" + codigos[a] + "','" + per + "');");

                                            }
                                            out.print("<script>alert('Registro Actualizado');</script>");
                                            out.println("<script language='javascript'>window.location='../administracion/perfiles.jsp'</script>;");

                                        } else {
                                            out.print("<script>alert('Codigo ya registrado');</script>");
                                        }

                                    }


                                %>
                                <br> 
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


